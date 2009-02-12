From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: wireless tree build failure
Date: Thu, 12 Feb 2009 11:16:40 -0500
Message-ID: <20090212161639.GA4091@tuxdriver.com>
References: <20090212193517.3f393726.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:36735 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752359AbZBLQa5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Feb 2009 11:30:57 -0500
Content-Disposition: inline
In-Reply-To: <20090212193517.3f393726.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Kilroy <kilroyd@googlemail.com>

On Thu, Feb 12, 2009 at 07:35:17PM +1100, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> net/built-in.o: In function `michael_mic':
> (.opd+0x3ba78): multiple definition of `michael_mic'
> drivers/built-in.o:(.opd+0x552a8): first defined here
> net/built-in.o: In function `michael_mic':
> net/mac80211/michael.c:58: multiple definition of `.michael_mic'
> drivers/built-in.o:drivers/net/wireless/orinoco/mic.c:49: first defined here
> 
> Immediate cause is commit 84875201dd1150dc2c16780b944fe501d588ffba
> ("orinoco: Move MIC helpers into new file").
> 
> I have reverted that commit (and several following ones that conflicted
> with the revert - see below) for today.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> Created commit b6349c2: Revert "orinoco: Storage class should be before const qualifier"
> Created commit ed58c78: Revert "orinoco: hermes doesn't need to be a separate module"
> Created commit c52856e: Revert "orinoco: hermes_dld does not need to be a module"
> Created commit ee9a469: Revert "orinoco: Move WEXT handlers into a separate file"
> Created commit e668502: Revert "orinoco: Move hardware functions into separate file"
> Created commit d8d7390: Revert "orinoco: Add hardware function to set multicast mode"
> Created commit 6a4d487: Revert "orinoco: Use accessor functions for bitrate tables"
> Created commit ecac0c1: Revert "orinoco: Move firmware handling into a separate file"
> Created commit d2cf8c5: Revert "orinoco: Move MIC helpers into new file"

I'll fix this up with a patch like below...

John

diff --git a/drivers/net/wireless/orinoco/main.c b/drivers/net/wireless/orinoco/main.c
index 0cc1f05..f045444 100644
--- a/drivers/net/wireless/orinoco/main.c
+++ b/drivers/net/wireless/orinoco/main.c
@@ -931,7 +931,7 @@ static int orinoco_xmit(struct sk_buff *skb, struct net_device *dev)
 			len = MICHAEL_MIC_LEN;
 		}
 
-		michael_mic(priv->tx_tfm_mic,
+		orinoco_mic(priv->tx_tfm_mic,
 			    priv->tkip_key[priv->tx_key].tx_mic,
 			    eh->h_dest, eh->h_source, 0 /* priority */,
 			    skb->data + ETH_HLEN, skb->len - ETH_HLEN, mic);
@@ -1409,7 +1409,7 @@ static void orinoco_rx(struct net_device *dev,
 		skb_trim(skb, skb->len - MICHAEL_MIC_LEN);
 		length -= MICHAEL_MIC_LEN;
 
-		michael_mic(priv->rx_tfm_mic,
+		orinoco_mic(priv->rx_tfm_mic,
 			    priv->tkip_key[key_id].rx_mic,
 			    desc->addr1,
 			    src,
diff --git a/drivers/net/wireless/orinoco/mic.c b/drivers/net/wireless/orinoco/mic.c
index c39d9ea..8cdac75 100644
--- a/drivers/net/wireless/orinoco/mic.c
+++ b/drivers/net/wireless/orinoco/mic.c
@@ -16,18 +16,18 @@
 /********************************************************************/
 int orinoco_mic_init(struct orinoco_private *priv)
 {
-	priv->tx_tfm_mic = crypto_alloc_hash("michael_mic", 0, 0);
+	priv->tx_tfm_mic = crypto_alloc_hash("orinoco_mic", 0, 0);
 	if (IS_ERR(priv->tx_tfm_mic)) {
 		printk(KERN_DEBUG "orinoco_mic_init: could not allocate "
-		       "crypto API michael_mic\n");
+		       "crypto API orinoco_mic\n");
 		priv->tx_tfm_mic = NULL;
 		return -ENOMEM;
 	}
 
-	priv->rx_tfm_mic = crypto_alloc_hash("michael_mic", 0, 0);
+	priv->rx_tfm_mic = crypto_alloc_hash("orinoco_mic", 0, 0);
 	if (IS_ERR(priv->rx_tfm_mic)) {
 		printk(KERN_DEBUG "orinoco_mic_init: could not allocate "
-		       "crypto API michael_mic\n");
+		       "crypto API orinoco_mic\n");
 		priv->rx_tfm_mic = NULL;
 		return -ENOMEM;
 	}
@@ -43,7 +43,7 @@ void orinoco_mic_free(struct orinoco_private *priv)
 		crypto_free_hash(priv->rx_tfm_mic);
 }
 
-int michael_mic(struct crypto_hash *tfm_michael, u8 *key,
+int orinoco_mic(struct crypto_hash *tfm_michael, u8 *key,
 		u8 *da, u8 *sa, u8 priority,
 		u8 *data, size_t data_len, u8 *mic)
 {
@@ -52,7 +52,7 @@ int michael_mic(struct crypto_hash *tfm_michael, u8 *key,
 	u8 hdr[ETH_HLEN + 2]; /* size of header + padding */
 
 	if (tfm_michael == NULL) {
-		printk(KERN_WARNING "michael_mic: tfm_michael == NULL\n");
+		printk(KERN_WARNING "orinoco_mic: tfm_michael == NULL\n");
 		return -1;
 	}
 
diff --git a/drivers/net/wireless/orinoco/mic.h b/drivers/net/wireless/orinoco/mic.h
index bc1db16..04d05bc 100644
--- a/drivers/net/wireless/orinoco/mic.h
+++ b/drivers/net/wireless/orinoco/mic.h
@@ -15,7 +15,7 @@ struct crypto_hash;
 
 int orinoco_mic_init(struct orinoco_private *priv);
 void orinoco_mic_free(struct orinoco_private *priv);
-int michael_mic(struct crypto_hash *tfm_michael, u8 *key,
+int orinoco_mic(struct crypto_hash *tfm_michael, u8 *key,
 		u8 *da, u8 *sa, u8 priority,
 		u8 *data, size_t data_len, u8 *mic);
 

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
