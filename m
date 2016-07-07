From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mac80211-next tree with the
 wireless-drivers-next tree
Date: Thu, 7 Jul 2016 11:56:28 +1000
Message-ID: <20160707115628.7fdac327@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50530 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754751AbcGGB4b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jul 2016 21:56:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xinming Hu <huxm@marvell.com>, Avraham Stern <avraham.stern@intel.com>, David Spinadel <david.spinadel@intel.com>, Assaf Krauss <assaf.krauss@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Amitkumar Karwar <akarwar@marvell.com>

Hi Johannes,

Today's linux-next merge of the mac80211-next tree got a conflict in:

  drivers/net/wireless/marvell/mwifiex/cmdevt.c

between commit:

  a9c790ba23eb ("mwifiex: factor out mwifiex_cancel_scan")

from the wireless-drivers-next tree and commit:

  1d76250bd34a ("nl80211: support beacon report scanning")

from the mac80211-next tree.

I fixed it up (I used the wireless-drivers-next tree version of this file
and then added the following merge fix patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Jul 2016 11:51:35 +1000
Subject: [PATCH] mwifiex: fixup for "nl80211: support beacon report scanning"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index 4d21ca9744c1..ed3de0754a08 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2026,9 +2026,13 @@ void mwifiex_cancel_scan(struct mwifiex_adapter *adapter)
 			if (!priv)
 				continue;
 			if (priv->scan_request) {
+				struct cfg80211_scan_info info = {
+					.aborted = true,
+				};
+
 				mwifiex_dbg(adapter, INFO,
 					    "info: aborting scan\n");
-				cfg80211_scan_done(priv->scan_request, 1);
+				cfg80211_scan_done(priv->scan_request, &info);
 				priv->scan_request = NULL;
 			}
 		}
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
