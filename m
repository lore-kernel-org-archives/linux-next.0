From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Fri, 29 Apr 2016 14:20:20 +1000
Message-ID: <20160429142020.4499e185@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45968 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbcD2EUZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2016 00:20:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  drivers/firmware/efi/arm-runtime.c

between commit:

  14c43be60166 ("efi/arm*: Drop writable mapping of the UEFI System table")

from the tip tree and commit:

  21c8dfaa2327 ("Xen: EFI: Parse DT parameters for Xen specific UEFI")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/firmware/efi/arm-runtime.c
index 17ccf0a8787a,ac609b9f0b99..000000000000
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@@ -109,24 -90,41 +110,30 @@@ static int __init arm_enable_runtime_se
  
  	pr_info("Remapping and enabling EFI services.\n");
  
 -	mapsize = memmap.map_end - memmap.map;
 -	memmap.map = (__force void *)ioremap_cache(memmap.phys_map,
 -						   mapsize);
 -	if (!memmap.map) {
 -		pr_err("Failed to remap EFI memory map\n");
 -		return -ENOMEM;
 -	}
 -	memmap.map_end = memmap.map + mapsize;
 -	efi.memmap = &memmap;
 +	mapsize = efi.memmap.map_end - efi.memmap.map;
  
 -	efi.systab = (__force void *)ioremap_cache(efi_system_table,
 -						   sizeof(efi_system_table_t));
 -	if (!efi.systab) {
 -		pr_err("Failed to remap EFI System Table\n");
 +	efi.memmap.map = memremap(efi.memmap.phys_map, mapsize, MEMREMAP_WB);
 +	if (!efi.memmap.map) {
 +		pr_err("Failed to remap EFI memory map\n");
  		return -ENOMEM;
  	}
 -	set_bit(EFI_SYSTEM_TABLES, &efi.flags);
 +	efi.memmap.map_end = efi.memmap.map + mapsize;
  
- 	if (!efi_virtmap_init()) {
- 		pr_err("UEFI virtual mapping missing or invalid -- runtime services will not be available\n");
- 		return -ENOMEM;
+ 	if (IS_ENABLED(CONFIG_XEN_EFI) && efi_enabled(EFI_PARAVIRT)) {
+ 		/* Set up runtime services function pointers for Xen Dom0 */
+ 		xen_efi_runtime_setup();
+ 	} else {
+ 		if (!efi_virtmap_init()) {
 -			pr_err("No UEFI virtual mapping was installed -- runtime services will not be available\n");
++			pr_err("UEFI virtual mapping missing or invalid -- runtime services will not be available\n");
+ 			return -ENOMEM;
+ 		}
+ 
+ 		/* Set up runtime services function pointers */
+ 		efi_native_runtime_setup();
  	}
  
- 	/* Set up runtime services function pointers */
- 	efi_native_runtime_setup();
  	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
  
 -	efi.runtime_version = efi.systab->hdr.revision;
 -
  	return 0;
  }
  early_initcall(arm_enable_runtime_services);
