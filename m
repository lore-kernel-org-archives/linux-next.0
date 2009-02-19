From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the wireless-current
 tree
Date: Thu, 19 Feb 2009 16:23:19 +1100
Message-ID: <20090219162319.414585ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40151 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750914AbZBSFXX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Feb 2009 00:23:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, David Kilroy <kilroyd@googlemail.com>, Andrey Borzenkov <arvidjaar@mail.ru>, "John W. Linville" <linville@tuxdriver.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/orinoco/orinoco.c between commit
f6af197dc4883176e5ba001b27efc02baaef56be ("orinoco: do not resgister NULL
pm_notifier function") from the wireless-current tree and commit
47445cb95015bef0d54ca799f31e454797378a71 ("orinoco: Rename orinoco.c")
from the net tree.

I removed orinoco.c and patched main.c (with the patch below) to match
John's supplied test merge.  I can carry this for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git b/drivers/net/wireless/orinoco/main.c a/drivers/net/wireless/orinoco/main.c
index 54dfc45..e9b1db7 100644
--- b/drivers/net/wireless/orinoco/main.c
+++ a/drivers/net/wireless/orinoco/main.c
@@ -2076,8 +2076,20 @@ static int orinoco_pm_notifier(struct notifier_block *notifier,
 
 	return NOTIFY_DONE;
 }
+
+static void orinoco_register_pm_notifier(struct orinoco_private *priv)
+{
+	priv->pm_notifier.notifier_call = orinoco_pm_notifier;
+	register_pm_notifier(&priv->pm_notifier);
+}
+
+static void orinoco_unregister_pm_notifier(struct orinoco_private *priv)
+{
+	unregister_pm_notifier(&priv->pm_notifier);
+}
 #else /* !PM_SLEEP || HERMES_CACHE_FW_ON_INIT */
-#define orinoco_pm_notifier NULL
+#define orinoco_register_pm_notifier(priv) do { } while(0)
+#define orinoco_unregister_pm_notifier(priv) do { } while(0)
 #endif
 
 /********************************************************************/
@@ -2572,8 +2584,7 @@ struct net_device
 	priv->cached_fw = NULL;
 
 	/* Register PM notifiers */
-	priv->pm_notifier.notifier_call = orinoco_pm_notifier;
-	register_pm_notifier(&priv->pm_notifier);
+	orinoco_register_pm_notifier(priv);
 
 	return dev;
 }
@@ -2598,7 +2609,7 @@ void free_orinocodev(struct net_device *dev)
 		kfree(rx_data);
 	}
 
-	unregister_pm_notifier(&priv->pm_notifier);
+	orinoco_unregister_pm_notifier(priv);
 	orinoco_uncache_fw(priv);
 
 	priv->wpa_ie_len = 0;
