From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/rtl8192x: fix printk formats
Date: Tue, 24 Nov 2009 12:13:55 -0800
Message-ID: <4B0C3E83.3060401@oracle.com>
References: <20091124212255.87e083ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934202AbZKXVOH@vger.kernel.org>
In-Reply-To: <20091124212255.87e083ce.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>, devel@driverdev.osuosl.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings in rtl8192[eu]:

drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c:979: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
drivers/staging/rtl8192e/ieee80211/rtl819x_BAProc.c:385: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'
drivers/staging/rtl8192e/ieee80211/rtl819x_BAProc.c:484: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'
drivers/staging/rtl8192e/ieee80211/rtl819x_BAProc.c:614: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'
drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c:848: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c:343: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'
drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c:442: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'
drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c:572: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c   |    2 +-
 drivers/staging/rtl8192e/ieee80211/rtl819x_BAProc.c |    6 +++---
 drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c   |    2 +-
 drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c |    6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

--- linux-next-20091124.orig/drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c
+++ linux-next-20091124/drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c
@@ -976,7 +976,7 @@ int ieee80211_wx_set_gen_ie(struct ieee8
 	{
 		if (len != ie[1]+2)
 		{
-			printk("len:%d, ie:%d\n", len, ie[1]);
+			printk("len:%zu, ie:%d\n", len, ie[1]);
 			return -EINVAL;
 		}
 		buf = kmalloc(len, GFP_KERNEL);
--- linux-next-20091124.orig/drivers/staging/rtl8192e/ieee80211/rtl819x_BAProc.c
+++ linux-next-20091124/drivers/staging/rtl8192e/ieee80211/rtl819x_BAProc.c
@@ -382,7 +382,7 @@ int ieee80211_rx_ADDBAReq( struct ieee80
 
 	if (skb->len < sizeof( struct ieee80211_hdr_3addr) + 9)
 	{
-		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BAREQ(%d / %d)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
+		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BAREQ(%d / %zu)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
 		return -1;
 	}
 
@@ -481,7 +481,7 @@ int ieee80211_rx_ADDBARsp( struct ieee80
 
 	if (skb->len < sizeof( struct ieee80211_hdr_3addr) + 9)
 	{
-		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BARSP(%d / %d)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
+		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BARSP(%d / %zu)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
 		return -1;
 	}
 	rsp = ( struct ieee80211_hdr_3addr*)skb->data;
@@ -611,7 +611,7 @@ int ieee80211_rx_DELBA(struct ieee80211_
 
 	if (skb->len < sizeof( struct ieee80211_hdr_3addr) + 6)
 	{
-		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in DELBA(%d / %d)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 6));
+		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in DELBA(%d / %zu)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 6));
 		return -1;
 	}
 
--- linux-next-20091124.orig/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
+++ linux-next-20091124/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
@@ -845,7 +845,7 @@ int ieee80211_wx_set_gen_ie(struct ieee8
 	{
 		if (len != ie[1]+2)
 		{
-			printk("len:%d, ie:%d\n", len, ie[1]);
+			printk("len:%zu, ie:%d\n", len, ie[1]);
 			return -EINVAL;
 		}
 		buf = kmalloc(len, GFP_KERNEL);
--- linux-next-20091124.orig/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
+++ linux-next-20091124/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
@@ -340,7 +340,7 @@ int ieee80211_rx_ADDBAReq( struct ieee80
 
 	if (skb->len < sizeof( struct ieee80211_hdr_3addr) + 9)
 	{
-		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BAREQ(%d / %d)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
+		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BAREQ(%d / %zu)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
 		return -1;
 	}
 
@@ -439,7 +439,7 @@ int ieee80211_rx_ADDBARsp( struct ieee80
 
 	if (skb->len < sizeof( struct ieee80211_hdr_3addr) + 9)
 	{
-		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BARSP(%d / %d)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
+		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in BARSP(%d / %zu)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 9));
 		return -1;
 	}
 	rsp = ( struct ieee80211_hdr_3addr*)skb->data;
@@ -569,7 +569,7 @@ int ieee80211_rx_DELBA(struct ieee80211_
 
 	if (skb->len < sizeof( struct ieee80211_hdr_3addr) + 6)
 	{
-		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in DELBA(%d / %d)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 6));
+		IEEE80211_DEBUG(IEEE80211_DL_ERR, " Invalid skb len in DELBA(%d / %zu)\n", skb->len, 	(sizeof( struct ieee80211_hdr_3addr) + 6));
 		return -1;
 	}
 
