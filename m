From: Bob Copeland <me@bobcopeland.com>
Subject: Re: linux-next: wireless tree build warning
Date: Fri, 1 May 2009 08:33:39 -0400
Message-ID: <20090501123339.GA4917@hash.localnet>
References: <20090501133539.5fc53f8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.deathmatch.net ([72.66.92.28]:3828 "EHLO
	mail.deathmatch.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869AbZEAMea (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 08:34:30 -0400
Content-Disposition: inline
In-Reply-To: <20090501133539.5fc53f8a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Kalle Valo <kalle.valo@nokia.com>

On Fri, May 01, 2009 at 01:35:39PM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:

Thanks -- John, this should fix:

>From 2c6ef7ec3a3b46601597615cf9e40b2a0c9f2f72 Mon Sep 17 00:00:00 2001
From: Bob Copeland <bob@hash.(none)>
Date: Fri, 1 May 2009 08:20:07 -0400
Subject: [PATCH] wl12xx: correct printk format warnings

Fixes warnings:
  drivers/net/wireless/wl12xx/main.c:87: warning: int format, different
    type arg (arg 2)
  drivers/net/wireless/wl12xx/main.c: In function `wl12xx_fetch_nvs':
  drivers/net/wireless/wl12xx/main.c:125: warning: int format, different
    type arg (arg 2)
  drivers/net/wireless/wl12xx/wl1251.c: In function 'wl1251_upload_firmware':
  drivers/net/wireless/wl12xx/wl1251.c:94: warning: int format, different
    type arg (arg 2)
  drivers/net/wireless/wl12xx/wl1251.c:141: warning: int format, different
    type arg (arg 2)

Signed-off-by: Bob Copeland <me@bobcopeland.com>
---
 drivers/net/wireless/wl12xx/main.c   |    4 ++--
 drivers/net/wireless/wl12xx/wl1251.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
index 744f4ce..603d611 100644
--- a/drivers/net/wireless/wl12xx/main.c
+++ b/drivers/net/wireless/wl12xx/main.c
@@ -84,7 +84,7 @@ static int wl12xx_fetch_firmware(struct wl12xx *wl)
 	}
 
 	if (fw->size % 4) {
-		wl12xx_error("firmware size is not multiple of 32 bits: %d",
+		wl12xx_error("firmware size is not multiple of 32 bits: %zu",
 			     fw->size);
 		ret = -EILSEQ;
 		goto out;
@@ -122,7 +122,7 @@ static int wl12xx_fetch_nvs(struct wl12xx *wl)
 	}
 
 	if (fw->size % 4) {
-		wl12xx_error("nvs size is not multiple of 32 bits: %d",
+		wl12xx_error("nvs size is not multiple of 32 bits: %zu",
 			     fw->size);
 		ret = -EILSEQ;
 		goto out;
diff --git a/drivers/net/wireless/wl12xx/wl1251.c b/drivers/net/wireless/wl12xx/wl1251.c
index bd0decd..ce1561a 100644
--- a/drivers/net/wireless/wl12xx/wl1251.c
+++ b/drivers/net/wireless/wl12xx/wl1251.c
@@ -91,7 +91,7 @@ static int wl1251_upload_firmware(struct wl12xx *wl)
 	fw_data_len =  (wl->fw[4] << 24) | (wl->fw[5] << 16) |
 		(wl->fw[6] << 8) | (wl->fw[7]);
 
-	wl12xx_debug(DEBUG_BOOT, "fw_data_len %d chunk_size %d", fw_data_len,
+	wl12xx_debug(DEBUG_BOOT, "fw_data_len %zu chunk_size %d", fw_data_len,
 		CHUNK_SIZE);
 
 	if ((fw_data_len % 4) != 0) {
@@ -138,7 +138,7 @@ static int wl1251_upload_firmware(struct wl12xx *wl)
 	/* 10.4 upload the last chunk */
 	addr = p_table[PART_DOWN].mem.start + chunk_num * CHUNK_SIZE;
 	p = wl->fw + FW_HDR_SIZE + chunk_num * CHUNK_SIZE;
-	wl12xx_debug(DEBUG_BOOT, "uploading fw last chunk (%d B) 0x%p to 0x%x",
+	wl12xx_debug(DEBUG_BOOT, "uploading fw last chunk (%zu B) 0x%p to 0x%x",
 		     fw_data_len % CHUNK_SIZE, p, addr);
 	wl12xx_spi_mem_write(wl, addr, p, fw_data_len % CHUNK_SIZE);
 
-- 
1.5.4.1
