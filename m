From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH 1/1] Re: linux-next: net tree build warnings
Date: Fri, 16 Oct 2009 23:10:24 -0300
Message-ID: <20091017021024.GI25141@ghostprotocols.net>
References: <20091014152000.15312908.sfr@canb.auug.org.au> <20091014153450.3110e34c.sfr@canb.auug.org.au> <20091014.151137.30359959.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:26209 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751986AbZJQCK3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Oct 2009 22:10:29 -0400
Content-Disposition: inline
In-Reply-To: <20091014.151137.30359959.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em Wed, Oct 14, 2009 at 03:11:37PM -0700, David Miller escreveu:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 14 Oct 2009 15:34:50 +1100
> > On Wed, 14 Oct 2009 15:20:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> Today's linux-next build (powerpc ppc44x_defconfig) produced these
> >> warnings:
> >> In file included from net/socket.c:94:
> >> include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside parameter list
> >> CONFIG_COMPAT is not set.
> >> Caused by commit a2e2725541fad72416326798c2d7fa4dafb7d337 ("net:
> >> Introduce recvmmsg socket syscall").

> > I also get these for i386 and sparc32 defconfig builds.

This one should fix it, thanks for the report!

- Arnaldo

>From ea9776634ed9b0b4a92c53002ea225bca143f47e Mon Sep 17 00:00:00 2001
From: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Date: Fri, 16 Oct 2009 23:07:15 -0300
Subject: [PATCH] net: Avoid compiler warning for mmsghdr when CONFIG_COMPAT is not selected

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
---
 include/net/compat.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/include/net/compat.h b/include/net/compat.h
index 9679f05..3c7d4e3 100644
--- a/include/net/compat.h
+++ b/include/net/compat.h
@@ -33,7 +33,11 @@ extern int compat_sock_get_timestamp(struct sock *, struct timeval __user *);
 extern int compat_sock_get_timestampns(struct sock *, struct timespec __user *);
 
 #else /* defined(CONFIG_COMPAT) */
-#define compat_msghdr	msghdr		/* to avoid compiler warnings */
+/*
+ * To avoid compiler warnings:
+ */
+#define compat_msghdr	msghdr
+#define compat_mmsghdr	mmsghdr
 #endif /* defined(CONFIG_COMPAT) */
 
 extern int get_compat_msghdr(struct msghdr *, struct compat_msghdr __user *);
-- 
1.6.2.5
