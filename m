From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 31 Jan 2011 16:09:26 +1100
Message-ID: <20110131160926.27223d25.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39024 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750905Ab1AaFJ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Jan 2011 00:09:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arend van Spriel <arend@broadcom.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/brcm80211/brcmsmac/wl_mac80211.c,
drivers/staging/brcm80211/sys/wlc_mac80211.c and
drivers/staging/brcm80211/sys/wlc_mac80211.c (these three files names are
the same file, it has been renamed twice, I think ..) between
commit4032ec639af9b735fdd903fab09de567bd73eaa0 ("staging: brcm80211: fix
suspend/resume issue in brcmsmac") from the staging.current tree and
commit c836f77fdba3631e295e3da1718ab53a9038fdf2 ("staging: brcm80211: use
KBUILD_MODNAME as driver name in registration") from the staging tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/brcm80211/brcmsmac/wl_mac80211.c
index f123588,6505732..0000000
--- a/drivers/staging/brcm80211/brcmsmac/wl_mac80211.c
+++ b/drivers/staging/brcm80211/brcmsmac/wl_mac80211.c
@@@ -1187,11 -1154,13 +1157,11 @@@ static void wl_remove(struct pci_dev *p
  }
  
  static struct pci_driver wl_pci_driver = {
- 	.name = "brcm80211",
+ 	.name  = KBUILD_MODNAME,
  	.probe = wl_pci_probe,
 -#ifdef LINUXSTA_PS
  	.suspend = wl_suspend,
 -	.resume  = wl_resume,
 -#endif				/* LINUXSTA_PS */
 -	.remove   = __devexit_p(wl_remove),
 +	.resume = wl_resume,
 +	.remove = __devexit_p(wl_remove),
  	.id_table = wl_id_table,
  };
  
