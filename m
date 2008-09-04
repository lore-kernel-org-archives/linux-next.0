From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] hid: fix gyration build error
Date: Wed, 3 Sep 2008 19:32:18 -0700
Message-ID: <20080903193218.d79e0f1a.randy.dunlap@oracle.com>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:43502 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752688AbYIDCck (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2008 22:32:40 -0400
In-Reply-To: <20080903191619.6b6b230e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jkosina@suse.cz, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix config symbol name in ifdef to fix build error:

ERROR: "hid_compat_gyration" [drivers/hid/hid-dummy.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-dummy.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20080903.orig/drivers/hid/hid-dummy.c
+++ linux-next-20080903/drivers/hid/hid-dummy.c
@@ -28,7 +28,7 @@ static int __init hid_dummy_init(void)
 #ifdef CONFIG_HID_EZKEY_MODULE
 	HID_COMPAT_CALL_DRIVER(ezkey);
 #endif
-#ifdef CONFIG_HID_EZKEY_MODULE
+#ifdef CONFIG_HID_GYRATION_MODULE
 	HID_COMPAT_CALL_DRIVER(gyration);
 #endif
 #ifdef CONFIG_HID_LOGITECH_MODULE
