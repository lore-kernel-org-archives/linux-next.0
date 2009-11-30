From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: PATCH] staging: fix a silly typo
Date: Mon, 30 Nov 2009 17:09:43 +0000
Message-ID: <20091130170943.4ebed093@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53467 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753190AbZK3RHg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2009 12:07:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, greg@kroah.com

Can this either get applied or Rusty's tree dropped. This has been broken
for ages now, and at the point something like "sizeof" spelled wrongly
gets into a tree and doesn't get caught by the submitter or fixed for
weeks when pointed out something is badly wrong

--
staging: fix a silly typo

From: Alan Cox <alan@linux.intel.com>

Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/staging/rtl8187se/r8180_core.c  |    2 +-
 drivers/staging/rtl8192su/r8192U_core.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


diff --git a/drivers/staging/rtl8187se/r8180_core.c b/drivers/staging/rtl8187se/r8180_core.c
index 5a6cd60..d74bf70 100644
--- a/drivers/staging/rtl8187se/r8180_core.c
+++ b/drivers/staging/rtl8187se/r8180_core.c
@@ -79,7 +79,7 @@ MODULE_AUTHOR("Andrea Merello <andreamrl@tiscali.it>");
 MODULE_DESCRIPTION("Linux driver for Realtek RTL8180 / RTL8185 WiFi cards");
 
 
-module_param_string(ifname, ifname, sizef(ifname), S_IRUGO|S_IWUSR);
+module_param_string(ifname, ifname, sizeof(ifname), S_IRUGO|S_IWUSR);
 module_param(hwseqnum,int, S_IRUGO|S_IWUSR);
 module_param(hwwep,int, S_IRUGO|S_IWUSR);
 module_param(channels,int, S_IRUGO|S_IWUSR);
diff --git a/drivers/staging/rtl8192su/r8192U_core.c b/drivers/staging/rtl8192su/r8192U_core.c
index e24815f..0a052ea 100644
--- a/drivers/staging/rtl8192su/r8192U_core.c
+++ b/drivers/staging/rtl8192su/r8192U_core.c
@@ -142,7 +142,7 @@ static int channels = 0x3fff;
 
 
 
-module_param_string(ifname, ifname, sizef(ifname), S_IRUGO|S_IWUSR);
+module_param_string(ifname, ifname, sizeof(ifname), S_IRUGO|S_IWUSR);
 //module_param(hwseqnum,int, S_IRUGO|S_IWUSR);
 module_param(hwwep,int, S_IRUGO|S_IWUSR);
 module_param(channels,int, S_IRUGO|S_IWUSR);
