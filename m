From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] fs: fix compat_ioctl build for CONFIG_BLOCK=n
Date: Mon, 14 Dec 2009 09:10:05 -0800
Message-ID: <20091214091005.b4df65d9.randy.dunlap@oracle.com>
References: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:59650 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758013AbZLNRKP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 12:10:15 -0500
In-Reply-To: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build failure when CONFIG_BLOCK=n:

fs/compat_ioctl.c:1604: error: 'SG_SET_TRANSFORM' undeclared

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 fs/compat_ioctl.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20091214.orig/fs/compat_ioctl.c
+++ linux-next-20091214/fs/compat_ioctl.c
@@ -1600,8 +1600,10 @@ static long do_ioctl_trans(int fd, unsig
 	case KDSKBMETA:
 	case KDSKBLED:
 	case KDSETLED:
+#ifdef CONFIG_BLOCK
 	/* SG stuff */
 	case SG_SET_TRANSFORM:
+#endif
 	/* AUTOFS */
 	case AUTOFS_IOC_READY:
 	case AUTOFS_IOC_FAIL:
