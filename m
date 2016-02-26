From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Fri, 26 Feb 2016 12:53:34 +1100
Message-ID: <20160226125334.5ada867e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43369 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750789AbcBZBxh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Feb 2016 20:53:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/firmware/efi/libstub/arm64-stub.c

between commit:

  2b5fe07a78a0 ("arm64: efi: invoke EFI_RNG_PROTOCOL to supply KASLR randomness")

from the arm64 tree and commit:

  42b55734030c ("efi/arm64: Check for h/w support before booting a >4 KB granular kernel")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/firmware/efi/libstub/arm64-stub.c
index e0e6b74fef8f,047fc343665a..000000000000
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@@ -12,18 -12,34 +12,38 @@@
  #include <linux/efi.h>
  #include <asm/efi.h>
  #include <asm/sections.h>
+ #include <asm/sysreg.h>
  
 +#include "efistub.h"
 +
 +extern bool __nokaslr;
 +
- efi_status_t __init handle_kernel_image(efi_system_table_t *sys_table_arg,
- 					unsigned long *image_addr,
- 					unsigned long *image_size,
- 					unsigned long *reserve_addr,
- 					unsigned long *reserve_size,
- 					unsigned long dram_base,
- 					efi_loaded_image_t *image)
+ efi_status_t check_platform_features(efi_system_table_t *sys_table_arg)
+ {
+ 	u64 tg;
+ 
+ 	/* UEFI mandates support for 4 KB granularity, no need to check */
+ 	if (IS_ENABLED(CONFIG_ARM64_4K_PAGES))
+ 		return EFI_SUCCESS;
+ 
+ 	tg = (read_cpuid(ID_AA64MMFR0_EL1) >> ID_AA64MMFR0_TGRAN_SHIFT) & 0xf;
+ 	if (tg != ID_AA64MMFR0_TGRAN_SUPPORTED) {
+ 		if (IS_ENABLED(CONFIG_ARM64_64K_PAGES))
+ 			pr_efi_err(sys_table_arg, "This 64 KB granular kernel is not supported by your CPU\n");
+ 		else
+ 			pr_efi_err(sys_table_arg, "This 16 KB granular kernel is not supported by your CPU\n");
+ 		return EFI_UNSUPPORTED;
+ 	}
+ 	return EFI_SUCCESS;
+ }
+ 
+ efi_status_t handle_kernel_image(efi_system_table_t *sys_table_arg,
+ 				 unsigned long *image_addr,
+ 				 unsigned long *image_size,
+ 				 unsigned long *reserve_addr,
+ 				 unsigned long *reserve_size,
+ 				 unsigned long dram_base,
+ 				 efi_loaded_image_t *image)
  {
  	efi_status_t status;
  	unsigned long kernel_size, kernel_memsize = 0;
