From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Mon, 2 May 2016 11:45:30 +0100
Message-ID: <20160502104530.GV2839@codeblueprint.co.uk>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
 <20160429143931.GG2839@codeblueprint.co.uk>
 <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com>
 <5724BDD2.5020600@linaro.org>
 <20160430204420.GM2839@codeblueprint.co.uk>
 <572576E2.7060508@linaro.org>
 <20160501132620.GT2839@codeblueprint.co.uk>
 <57261483.10500@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37620 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753378AbcEBKpe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 06:45:34 -0400
Received: by mail-wm0-f42.google.com with SMTP id a17so135782972wme.0
        for <linux-next@vger.kernel.org>; Mon, 02 May 2016 03:45:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <57261483.10500@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shannon Zhao <shannon.zhao@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>

On Sun, 01 May, at 10:36:51PM, Shannon Zhao wrote:
> So is there any other way you suggest?

Would this work (compile tested but not runtime tested)?

---

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 3a69ed5ecfcb..13d8be16447a 100644
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
+static __initdata struct params fdt_params[] = {
 	UEFI_PARAM("System Table", "linux,uefi-system-table", system_table),
 	UEFI_PARAM("MemMap Address", "linux,uefi-mmap-start", mmap),
 	UEFI_PARAM("MemMap Size", "linux,uefi-mmap-size", mmap_size),
@@ -482,44 +484,83 @@ static __initdata struct {
 	UEFI_PARAM("MemMap Desc. Version", "linux,uefi-mmap-desc-ver", desc_ver)
 };
 
+static __initdata struct params xen_fdt_params[] = {
+	UEFI_PARAM("System Table", "xen,uefi-system-table", system_table),
+	UEFI_PARAM("MemMap Address", "xen,uefi-mmap-start", mmap),
+	UEFI_PARAM("MemMap Size", "xen,uefi-mmap-size", mmap_size),
+	UEFI_PARAM("MemMap Desc. Size", "xen,uefi-mmap-desc-size", desc_size),
+	UEFI_PARAM("MemMap Desc. Version", "xen,uefi-mmap-desc-ver", desc_ver)
+};
+
+#define EFI_FDT_PARAMS_SIZE	ARRAY_SIZE(fdt_params)
+
+static __initdata struct {
+	const char *uname;
+	struct params *params;
+} dt_params[] = {
+	{ "hypervisor", xen_fdt_params },
+	{ "chosen", fdt_params },
+};
+
 struct param_info {
 	int found;
 	void *params;
+	const char *missing;
 };
 
-static int __init fdt_find_uefi_params(unsigned long node, const char *uname,
-				       int depth, void *data)
+static int __init __find_uefi_params(unsigned long node,
+				     struct param_info *info,
+				     struct params *params)
 {
-	struct param_info *info = data;
 	const void *prop;
 	void *dest;
 	u64 val;
 	int i, len;
 
-	if (depth != 1 || strcmp(uname, "chosen") != 0)
-		return 0;
-
-	for (i = 0; i < ARRAY_SIZE(dt_params); i++) {
-		prop = of_get_flat_dt_prop(node, dt_params[i].propname, &len);
-		if (!prop)
+	for (i = 0; i < EFI_FDT_PARAMS_SIZE; i++) {
+		prop = of_get_flat_dt_prop(node, params[i].propname, &len);
+		if (!prop) {
+			info->missing = params[i].name;
 			return 0;
-		dest = info->params + dt_params[i].offset;
+		}
+
+		dest = info->params + params[i].offset;
 		info->found++;
 
 		val = of_read_number(prop, len / sizeof(u32));
 
-		if (dt_params[i].size == sizeof(u32))
+		if (params[i].size == sizeof(u32))
 			*(u32 *)dest = val;
 		else
 			*(u64 *)dest = val;
 
 		if (efi_enabled(EFI_DBG))
-			pr_info("  %s: 0x%0*llx\n", dt_params[i].name,
-				dt_params[i].size * 2, val);
+			pr_info("  %s: 0x%0*llx\n", params[i].name,
+				params[i].size * 2, val);
 	}
+
 	return 1;
 }
 
+static int __init fdt_find_uefi_params(unsigned long node, const char *uname,
+				       int depth, void *data)
+{
+	struct param_info *info = data;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dt_params); i++) {
+
+		if (depth != 1 || strcmp(uname, dt_params[i].uname) != 0) {
+			info->missing = dt_params[i].params[0].name;
+			continue;
+		}
+
+		return __find_uefi_params(node, info, dt_params[i].params);
+	}
+
+	return 0;
+}
+
 int __init efi_get_fdt_params(struct efi_fdt_params *params)
 {
 	struct param_info info;
@@ -535,7 +576,7 @@ int __init efi_get_fdt_params(struct efi_fdt_params *params)
 		pr_info("UEFI not found.\n");
 	else if (!ret)
 		pr_err("Can't find '%s' in device tree!\n",
-		       dt_params[info.found].name);
+		       info.missing);
 
 	return ret;
 }
