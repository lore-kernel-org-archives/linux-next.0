From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: linux-next: Tree for August 13 (nfsd)
Date: Thu, 14 Aug 2008 11:16:33 +0200
Message-ID: <20080814111633.55f5f1e8@surf>
References: <20080813172452.14b0775c.sfr@canb.auug.org.au>
	<20080813104748.13848196.randy.dunlap@oracle.com>
	<20080813180931.GC26765@fieldses.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([88.191.46.45]:57672 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754644AbYHNJQn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Aug 2008 05:16:43 -0400
In-Reply-To: <20080813180931.GC26765@fieldses.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, neilb@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Le Wed, 13 Aug 2008 14:09:31 -0400,
"J. Bruce Fields" <bfields@fieldses.org> a =C3=A9crit :

> Looks like that's just two more functions that need to be stubbed out
> in the case where CONFIG_FILE_LOCKING is undefined?--hopefully Thomas
> Petazzoni (cc'd) could be talked into reproducing this and sending me
> an incremental fix....

Here is an incremental fix.

---

=46ixup configure out fs locks support

This patch adds a few more stubs required to get NFS server to compile
properly with CONFIG_FILE_LOCKING=3Dn.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 include/linux/fs.h |    2 ++
 1 file changed, 2 insertions(+)

Index: linuxdev/include/linux/fs.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/include/linux/fs.h
+++ linuxdev/include/linux/fs.h
@@ -1050,6 +1050,8 @@
 #define __break_lease(a, b) ({ 0; })
 #define lease_get_mtime(a, b) ({ })
 #define generic_setlease(a, b, c) ({ -EINVAL; })
+#define vfs_setlease(a, b, c) ({ -EINVAL; })
+#define lease_modify(a, b) ({ -EINVAL; })
 #define lock_may_read(a, b, c) ({ 1; })
 #define lock_may_write(a, b, c) ({ 1; })
 #endif /* !CONFIG_FILE_LOCKING */


--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
