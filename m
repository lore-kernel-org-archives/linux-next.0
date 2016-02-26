From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Fri, 26 Feb 2016 12:53:25 +1100
Message-ID: <20160226125325.2f04f294@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40335 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750754AbcBZBx2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Feb 2016 20:53:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/firmware/efi/libstub/efistub.h

between commits:

  e4fbf4767440 ("efi: stub: implement efi_get_random_bytes() based on EFI_RNG_PROTOCOL")
  2ddbfc81eac8 ("efi: stub: add implementation of efi_random_alloc()")

from the arm64 tree and commit:

  b9d6769b5678 ("efi/arm*: Perform hardware compatibility check")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/firmware/efi/libstub/efistub.h
index 5ed3d3f38166,981c6035ce09..000000000000
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@@ -43,11 -53,6 +53,13 @@@ void efi_get_virtmap(efi_memory_desc_t 
  		     unsigned long desc_size, efi_memory_desc_t *runtime_map,
  		     int *count);
  
 +efi_status_t efi_get_random_bytes(efi_system_table_t *sys_table,
 +				  unsigned long size, u8 *out);
 +
 +efi_status_t efi_random_alloc(efi_system_table_t *sys_table_arg,
 +			      unsigned long size, unsigned long align,
 +			      unsigned long *addr, unsigned long random_seed);
 +
+ efi_status_t check_platform_features(efi_system_table_t *sys_table_arg);
+ 
  #endif
