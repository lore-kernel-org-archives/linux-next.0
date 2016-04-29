From: Ingo Molnar <mingo@kernel.org>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Fri, 29 Apr 2016 08:39:36 +0200
Message-ID: <20160429063936.GA28320@gmail.com>
References: <20160429142020.4499e185@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35827 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752656AbcD2Gjl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2016 02:39:41 -0400
Content-Disposition: inline
In-Reply-To: <20160429142020.4499e185@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Matt Fleming <matt@codeblueprint.co.uk>, Borislav Petkov <bp@alien8.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the xen-tip tree got a conflict in:
> 
>   drivers/firmware/efi/arm-runtime.c
> 
> between commit:
> 
>   14c43be60166 ("efi/arm*: Drop writable mapping of the UEFI System table")
> 
> from the tip tree and commit:
> 
>   21c8dfaa2327 ("Xen: EFI: Parse DT parameters for Xen specific UEFI")
> 
> from the xen-tip tree.

(I've attached 21c8dfaa2327 below, for reference.)

Argh:

With considerable pain we just got rid of paravirt_enabled() in the x86 tree, and 
Xen is now reintroducing it in the EFI code. Please don't: if you have to do 
capability flags then name the flag accordingly to what it does, don't use some 
generic catch-all naming that will inevitably cause the kind of problems 
paravirt_enabled() caused...

So: NAKed-by: Ingo Molnar <mingo@kernel.org>

Also, it would be nice to have all things EFI in a single tree, the conflicts are 
going to be painful! There's very little reason not to carry this kind of commit:

 arch/arm/xen/enlighten.c           |  6 +++++
 drivers/firmware/efi/arm-runtime.c | 17 +++++++++-----
 drivers/firmware/efi/efi.c         | 45 ++++++++++++++++++++++++++++++++------
 3 files changed, 56 insertions(+), 12 deletions(-)

in the EFI tree.

Thanks,

	Ingo

=======================>
>From 21c8dfaa23276be2ae6d580331d8d252cc41e8d9 Mon Sep 17 00:00:00 2001
From: Shannon Zhao <shannon.zhao@linaro.org>
Date: Thu, 7 Apr 2016 20:03:34 +0800
Subject: [PATCH] Xen: EFI: Parse DT parameters for Xen specific UEFI

Add a new function to parse DT parameters for Xen specific UEFI just
like the way for normal UEFI. Then it could reuse the existing codes.

If Xen supports EFI, initialize runtime services.

CC: Matt Fleming <matt@codeblueprint.co.uk>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Matt Fleming <matt@codeblueprint.co.uk>
Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Tested-by: Julien Grall <julien.grall@arm.com>
---
 arch/arm/xen/enlighten.c           |  6 +++++
 drivers/firmware/efi/arm-runtime.c | 17 +++++++++-----
 drivers/firmware/efi/efi.c         | 45 ++++++++++++++++++++++++++++++++------
 3 files changed, 56 insertions(+), 12 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 13e3e9f9b094..e130562d3283 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -261,6 +261,12 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
 		hyper_node.version = s + strlen(hyper_node.prefix);
 
+	if (IS_ENABLED(CONFIG_XEN_EFI)) {
+		/* Check if Xen supports EFI */
+		if (of_get_flat_dt_subnode_by_name(node, "uefi") > 0)
+			set_bit(EFI_PARAVIRT, &efi.flags);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 6ae21e41a429..ac609b9f0b99 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -27,6 +27,7 @@
 #include <asm/mmu.h>
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
+#include <asm/xen/xen-ops.h>
 
 extern u64 efi_system_table;
 
@@ -107,13 +108,19 @@ static int __init arm_enable_runtime_services(void)
 	}
 	set_bit(EFI_SYSTEM_TABLES, &efi.flags);
 
-	if (!efi_virtmap_init()) {
-		pr_err("No UEFI virtual mapping was installed -- runtime services will not be available\n");
-		return -ENOMEM;
+	if (IS_ENABLED(CONFIG_XEN_EFI) && efi_enabled(EFI_PARAVIRT)) {
+		/* Set up runtime services function pointers for Xen Dom0 */
+		xen_efi_runtime_setup();
+	} else {
+		if (!efi_virtmap_init()) {
+			pr_err("No UEFI virtual mapping was installed -- runtime services will not be available\n");
+			return -ENOMEM;
+		}
+
+		/* Set up runtime services function pointers */
+		efi_native_runtime_setup();
 	}
 
-	/* Set up runtime services function pointers */
-	efi_native_runtime_setup();
 	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
 
 	efi.runtime_version = efi.systab->hdr.revision;
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 3a69ed5ecfcb..519c096a7c33 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -469,12 +469,14 @@ device_initcall(efi_load_efivars);
 		FIELD_SIZEOF(struct efi_fdt_params, field) \
 	}
 
-static __initdata struct {
+struct params {
 	const char name[32];
 	const char propname[32];
 	int offset;
 	int size;
-} dt_params[] = {
+};
+
+static struct params fdt_params[] __initdata = {
 	UEFI_PARAM("System Table", "linux,uefi-system-table", system_table),
 	UEFI_PARAM("MemMap Address", "linux,uefi-mmap-start", mmap),
 	UEFI_PARAM("MemMap Size", "linux,uefi-mmap-size", mmap_size),
@@ -482,24 +484,45 @@ static __initdata struct {
 	UEFI_PARAM("MemMap Desc. Version", "linux,uefi-mmap-desc-ver", desc_ver)
 };
 
+static struct params xen_fdt_params[] __initdata = {
+	UEFI_PARAM("System Table", "xen,uefi-system-table", system_table),
+	UEFI_PARAM("MemMap Address", "xen,uefi-mmap-start", mmap),
+	UEFI_PARAM("MemMap Size", "xen,uefi-mmap-size", mmap_size),
+	UEFI_PARAM("MemMap Desc. Size", "xen,uefi-mmap-desc-size", desc_size),
+	UEFI_PARAM("MemMap Desc. Version", "xen,uefi-mmap-desc-ver", desc_ver)
+};
+
 struct param_info {
 	int found;
 	void *params;
+	struct params *dt_params;
+	int size;
 };
 
 static int __init fdt_find_uefi_params(unsigned long node, const char *uname,
 				       int depth, void *data)
 {
 	struct param_info *info = data;
+	struct params *dt_params = info->dt_params;
 	const void *prop;
 	void *dest;
 	u64 val;
-	int i, len;
+	int i, len, offset;
 
-	if (depth != 1 || strcmp(uname, "chosen") != 0)
-		return 0;
+	if (efi_enabled(EFI_PARAVIRT)) {
+		if (depth != 1 || strcmp(uname, "hypervisor") != 0)
+			return 0;
 
-	for (i = 0; i < ARRAY_SIZE(dt_params); i++) {
+		offset = of_get_flat_dt_subnode_by_name(node, "uefi");
+		if (offset < 0)
+			return 0;
+		node = offset;
+	} else {
+		if (depth != 1 || strcmp(uname, "chosen") != 0)
+			return 0;
+	}
+
+	for (i = 0; i < info->size; i++) {
 		prop = of_get_flat_dt_prop(node, dt_params[i].propname, &len);
 		if (!prop)
 			return 0;
@@ -530,12 +553,20 @@ int __init efi_get_fdt_params(struct efi_fdt_params *params)
 	info.found = 0;
 	info.params = params;
 
+	if (efi_enabled(EFI_PARAVIRT)) {
+		info.dt_params = xen_fdt_params;
+		info.size = ARRAY_SIZE(xen_fdt_params);
+	} else {
+		info.dt_params = fdt_params;
+		info.size = ARRAY_SIZE(fdt_params);
+	}
+
 	ret = of_scan_flat_dt(fdt_find_uefi_params, &info);
 	if (!info.found)
 		pr_info("UEFI not found.\n");
 	else if (!ret)
 		pr_err("Can't find '%s' in device tree!\n",
-		       dt_params[info.found].name);
+		       info.dt_params[info.found].name);
 
 	return ret;
 }
