From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: ramster: depends on NET
Date: Thu, 11 Oct 2012 09:34:11 -0700
Message-ID: <5076F503.3070808@xenotime.net>
References: <20121011140604.f5093233badade406c3d06f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:34272 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758854Ab2JKQeX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Oct 2012 12:34:23 -0400
In-Reply-To: <20121011140604.f5093233badade406c3d06f7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dan.magenheimer@oracle.com, konrad.wilk@oracle.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

From: Randy Dunlap <rdunlap@xenotime.net>

ramster uses network interfaces that are only present when
CONFIG_NET is enabled, so it should depend on NET.

Fixes these build errors:

drivers/built-in.o: In function `sc_kref_release':
tcp.c:(.text+0x24b9af): undefined reference to `sock_release'
drivers/built-in.o: In function `r2net_open_listening_sock':
tcp.c:(.text+0x24ca2b): undefined reference to `sock_create'
tcp.c:(.text+0x24cb91): undefined reference to `sock_release'
drivers/built-in.o: In function `r2net_recv_tcp_msg':
tcp.c:(.text+0x24cdbd): undefined reference to `sock_recvmsg'
drivers/built-in.o: In function `r2net_send_tcp_msg':
tcp.c:(.text+0x24d341): undefined reference to `sock_sendmsg'
drivers/built-in.o: In function `r2net_start_connect':
tcp.c:(.text+0x24d8fa): undefined reference to `sock_create'
drivers/built-in.o: In function `r2net_shutdown_sc':
tcp.c:(.text+0x24e30c): undefined reference to `kernel_sock_shutdown'
drivers/built-in.o: In function `r2net_accept_one':
tcp.c:(.text+0x24f392): undefined reference to `sock_create_lite'
tcp.c:(.text+0x24f3c3): undefined reference to `sock_release'
drivers/built-in.o: In function `r2net_stop_listening':
(.text+0x250f63): undefined reference to `sock_release'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: dan.magenheimer@oracle.com
Cc: konrad.wilk@oracle.com
---
 drivers/staging/ramster/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20121011.orig/drivers/staging/ramster/Kconfig
+++ linux-next-20121011/drivers/staging/ramster/Kconfig
@@ -18,6 +18,7 @@ config ZCACHE2
 config RAMSTER
 	bool "Cross-machine RAM capacity sharing, aka peer-to-peer tmem"
 	depends on CONFIGFS_FS=y && SYSFS=y && !HIGHMEM && ZCACHE2=y
+	depends on NET
 	# must ensure struct page is 8-byte aligned
 	select HAVE_ALIGNED_STRUCT_PAGE if !64_BIT
 	default n
