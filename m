Return-Path: <SRS0=Xd6n=24=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FA6C33C9B
	for <linux-next@archiver.kernel.org>; Tue,  7 Jan 2020 08:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F5C7207FF
	for <linux-next@archiver.kernel.org>; Tue,  7 Jan 2020 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578384801;
	bh=HtmZmG2lwa9ETbqP7zabD9e9KA9KVJ75XZnfBiQ9TDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=jafBAefwpSyjHJ9fQy3IJNeIQEZLSAr2kalInoRO/xNoCR6PFOhZ08pkXjrQx/OLO
	 xJHdz96BgN4J6K3YRymehYll7kTRu0dMrbj+SABtI0MQIx7aa4wciKTY4gzUCNgFiJ
	 IXnptbZ6RrtePSweTsmr+8lGKcQOHYy1Upj8eoak=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgAGINR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 7 Jan 2020 03:13:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:56230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgAGINQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 03:13:16 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C846F20848;
        Tue,  7 Jan 2020 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578384796;
        bh=HtmZmG2lwa9ETbqP7zabD9e9KA9KVJ75XZnfBiQ9TDU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XHxHobOfx/9twR7bleEOjRm97hwq4ru4O4+Etzt+Jg0qsVGhB4rmufvTl4dkYzBar
         J00ZTuZqRsxRQO1Juwv12oK3HBuJg+dZdyXy5QbIeSMtvW85VJ/jYCg42VzOmxPRrQ
         9R6dfUXjgPW8KDYSDqoSBxLMLcdBezufk90PUDYY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/2] i2c: exynos: Update Kconfig documentation
Date:   Tue,  7 Jan 2020 09:12:59 +0100
Message-Id: <1578384779-15487-2-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578384779-15487-1-git-send-email-krzk@kernel.org>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Update the help text to reflect current support devices:
1. The Exynos high speed I2C driver supports Exynos5 (ARMv7), Exynos5433
   and Exynos7 (both ARMv8) SoCs,
2. The S3C I2C driver supports S3C, S5Pv210 and Exynos{3,4,5} SoCs.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/i2c/busses/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 132e6f374cd7..43984d5a7fad 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -612,12 +612,12 @@ config I2C_EMEV2
 	  I2C interface on the Renesas Electronics EM/EV family of processors.
 
 config I2C_EXYNOS5
-	tristate "Exynos5 high-speed I2C driver"
+	tristate "Exynos high-speed I2C driver"
 	depends on OF
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	default y if ARCH_EXYNOS
 	help
-	  High-speed I2C controller on Exynos5 based Samsung SoCs.
+	  High-speed I2C controller on Exynos5 and newer Samsung SoCs.
 
 config I2C_GPIO
 	tristate "GPIO-based bitbanging I2C"
@@ -936,11 +936,11 @@ config HAVE_S3C2410_I2C
 	  respective Kconfig file.
 
 config I2C_S3C2410
-	tristate "S3C2410 I2C Driver"
+	tristate "S3C/Exynos I2C Driver"
 	depends on HAVE_S3C2410_I2C || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
-	  Samsung SoCs.
+	  Samsung SoCs (S3C, S5Pv210, Exynos).
 
 config I2C_SH7760
 	tristate "Renesas SH7760 I2C Controller"
-- 
2.7.4

