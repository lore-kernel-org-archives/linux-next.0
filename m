From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] arm64/efi: Make strnlen() available to the EFI namespace
Date: Mon, 15 Feb 2016 20:17:36 +0100
Message-ID: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:33756 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752246AbcBOTRj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 14:17:39 -0500
Received: by mail-wm0-f49.google.com with SMTP id g62so161766021wme.0
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2016 11:17:38 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh@kernel.org>

From: Thierry Reding <treding@nvidia.com>

Changes introduced in the upstream version of libfdt pulled in by commit
91feabc2e224 ("scripts/dtc: Update to upstream commit b06e55c88b9b") use
the strnlen() function, which isn't currently available to the EFI name-
space. Add it to the EFI namespace to avoid a linker error.

Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/kernel/image.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
index c9c62cab25a4..8a1978f4a555 100644
--- a/arch/arm64/kernel/image.h
+++ b/arch/arm64/kernel/image.h
@@ -96,6 +96,8 @@ __efistub_strcmp		= KALLSYMS_HIDE(__pi_strcmp);
 __efistub_strncmp		= KALLSYMS_HIDE(__pi_strncmp);
 __efistub___flush_dcache_area	= KALLSYMS_HIDE(__pi___flush_dcache_area);
 
+__efistub_strnlen		= KALLSYMS_HIDE(strnlen);
+
 #ifdef CONFIG_KASAN
 __efistub___memcpy		= KALLSYMS_HIDE(__pi_memcpy);
 __efistub___memmove		= KALLSYMS_HIDE(__pi_memmove);
-- 
2.7.1
