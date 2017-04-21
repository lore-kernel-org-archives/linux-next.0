From: Mason <slash.tmp@free.fr>
Subject: [PATCH] dmaengine: sun4i: fix invalid argument
Date: Fri, 21 Apr 2017 10:06:10 +0200
Message-ID: <584a2c53-100b-945b-d665-cef3fa856526@free.fr>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:3334 "EHLO smtp2-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1036546AbdDUIGy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Apr 2017 04:06:54 -0400
In-Reply-To: <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King <rmk@armlinux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, Emilio Lopez <emilio@elopez.com.ar>, dmaengine@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>

The "pchans_used" field is an unsigned long array.

for_each_clear_bit_from() expects an unsigned long pointer,
not an array address.

$ make C=2 drivers/dma/sun4i-dma.o
  CHECK   drivers/dma/sun4i-dma.c
drivers/dma/sun4i-dma.c:241:9: warning: incorrect type in argument 1 (different base types)
drivers/dma/sun4i-dma.c:241:9:    expected unsigned long const *p
drivers/dma/sun4i-dma.c:241:9:    got unsigned long ( *<noident> )[1]

Signed-off-by: Mason <slash.tmp@free.fr>
---
 drivers/dma/sun4i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 57aa227bfadb..f4ed3f17607c 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -238,7 +238,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
 	}
 
 	spin_lock_irqsave(&priv->lock, flags);
-	for_each_clear_bit_from(i, &priv->pchans_used, max) {
+	for_each_clear_bit_from(i, priv->pchans_used, max) {
 		pchan = &pchans[i];
 		pchan->vchan = vchan;
 		set_bit(i, priv->pchans_used);
-- 
3.14159
