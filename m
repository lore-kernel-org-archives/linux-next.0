From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH] sunrpc: Include missing smp_lock.h
Date: Tue, 13 Apr 2010 22:54:34 +0200
Message-ID: <20100413205433.GD5602@nowhere>
References: <20100413152741.4d56be0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:45619 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752145Ab0DMUyi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Apr 2010 16:54:38 -0400
Content-Disposition: inline
In-Reply-To: <20100413152741.4d56be0c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 13, 2010 at 03:27:41PM +1000, Stephen Rothwell wrote:
> Hi "Fr=E9d=E9ric,
>=20
> After merging the bkl-procfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> net/sunrpc/cache.c: In function 'cache_ioctl_procfs':
> net/sunrpc/cache.c:1355: error: implicit declaration of function 'loc=
k_kernel'
> net/sunrpc/cache.c:1359: error: implicit declaration of function 'unl=
ock_kernel'
>=20
> Caused by commit 64ef834551d7696f54553d7608eba80a5a800e77 ("procfs: P=
ush
> down the bkl from ioctl").  Forgot to include linux/smp_lock.h?  See
> Documentation/SubmitChecklist Rule #1.
>=20
> I have dropped the bkl-procfs tree for today.


Sorry about this.

I have pushed the following fix in the bkl/procfs branch.

Thanks.

---
Author: Frederic Weisbecker <fweisbec@gmail.com>
Date:   Tue Apr 13 22:46:36 2010 +0200

    sunrpc: Include missing smp_lock.h
   =20
    Now that cache_ioctl_procfs() calls the bkl explicitly, we need to
    include the relevant header as well.
   =20
    This fixes the following build error:
   =20
    	net/sunrpc/cache.c: In function 'cache_ioctl_procfs':
    	net/sunrpc/cache.c:1355: error: implicit declaration of function '=
lock_kernel'
    	net/sunrpc/cache.c:1359: error: implicit declaration of function '=
unlock_kernel'
   =20
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>

diff --git a/net/sunrpc/cache.c b/net/sunrpc/cache.c
index 3212357..59ef938 100644
--- a/net/sunrpc/cache.c
+++ b/net/sunrpc/cache.c
@@ -28,6 +28,7 @@
 #include <linux/workqueue.h>
 #include <linux/mutex.h>
 #include <linux/pagemap.h>
+#include <linux/smp_lock.h>
 #include <asm/ioctls.h>
 #include <linux/sunrpc/types.h>
 #include <linux/sunrpc/cache.h>
