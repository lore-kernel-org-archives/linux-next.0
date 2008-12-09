From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] staging: really fix up Kconfig automatic deselction
Date: Tue,  9 Dec 2008 04:10:51 +0300
Message-ID: <1228785051-12954-1-git-send-email-dbaryshkov@gmail.com>
References: <20081208150832.GB19711@kroah.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.186]:2083 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753639AbYLIBME (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 20:12:04 -0500
Received: by nf-out-0910.google.com with SMTP id d3so697287nfc.21
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2008 17:12:03 -0800 (PST)
In-Reply-To: <20081208150832.GB19711@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/staging/Kconfig |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 4089f14..1905919 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -39,6 +39,8 @@ config STAGING_EXCLUDE_BUILD
 	  when selecting 'make allyesconfg' and 'make allmodconfig' so
 	  don't be all that put off, your dog will be just fine.
 
+if !STAGING_EXCLUDE_BUILD
+
 source "drivers/staging/et131x/Kconfig"
 
 source "drivers/staging/slicoss/Kconfig"
@@ -62,3 +64,5 @@ source "drivers/staging/at76_usb/Kconfig"
 source "drivers/staging/poch/Kconfig"
 
 endif # !STAGING_EXCLUDE_BUILD
+
+endif # STAGING
-- 
1.5.6.5
