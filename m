From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 6.2/7] MMC: mmci: Enable Device Tree support for ux500
Date: Tue, 08 May 2012 13:59:38 +0100
Message-ID: <4FA918BA.3080303@linaro.org>
References: <1334325909-5779-1-git-send-email-lee.jones@linaro.org> <1334325909-5779-7-git-send-email-lee.jones@linaro.org> <CACRpkdYyP=V=aXtDuo_W4oDxH0UkQKq1x1HKG_z=zWHoWng6JQ@mail.gmail.com> <4F8BE5B0.4000900@linaro.org> <20120425185747.GC24211@n2100.arm.linux.org.uk> <4FA29E46.6040204@linaro.org> <20120503151253.GE897@n2100.arm.linux.org.uk> <4FA2A4A8.9010208@linaro.org> <20120503163008.GF897@n2100.arm.linux.org.uk> <4FA2B4A3.2040402@linaro.org> <20120503164501.GG897@n2100.arm.linux.org.uk> <8762cdur7o.fsf@laptop.org> <4FA3D720.7010004@linaro.org> <87mx5ot6vp.fsf@laptop.org> <4FA3DC27.6030204@linaro.org> <CAP=VYLoLgLmwWTWrJrMBCRLD_BjupjmfV2me6TDeej=ZS=W7hw@mail.gmail.com> <4FA90127.1050107@linaro.org> <878vh2rhlh.fsf@laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:36117 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753257Ab2EHM7n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 08:59:43 -0400
Received: by bkcji2 with SMTP id ji2so4577488bkc.19
        for <linux-next@vger.kernel.org>; Tue, 08 May 2012 05:59:42 -0700 (PDT)
In-Reply-To: <878vh2rhlh.fsf@laptop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Ball <cjb@laptop.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linus.walleij@stericsson.com, arnd@arndb.de, Linus Walleij <linus.walleij@linaro.org>, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

Here you go Chris.

From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 8 May 2012 13:40:02 +0100
Subject: [PATCH] MMC: mmci: Fix compiler error when CONFIG_OF is not set

error: implicit declaration of function 'mmci_dt_populate_generic_pdata'

This is due to the '#if CONFIG_OF' guards placed around
mmci_dt_populate_generic_pdata(), but not around the call to it. We
repair this by inserting a stub which elegantly returns when CONFIG_OF
is not set.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mmc/host/mmci.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 2303a16..efc822d 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1241,6 +1241,12 @@ static void mmci_dt_populate_generic_pdata(struct device_node *np,
 		pr_warn("%s: Unsupported bus width\n", np->full_name);
 	}
 }
+#else
+static void mmci_dt_populate_generic_pdata(struct device_node *np,
+					struct mmci_platform_data *pdata)
+{
+	return;
+}
 #endif
 
 static int __devinit mmci_probe(struct amba_device *dev,
-- 
1.7.9.5
