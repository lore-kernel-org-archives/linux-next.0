From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Tue, 14 Oct 2008 13:50:18 +1100
Message-ID: <20081014135018.fbdfcff6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_13_50_19_+1100_G2IaRpVd3QN4.hYd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38063 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755489AbYJNDL4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 23:11:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Tue__14_Oct_2008_13_50_19_+1100_G2IaRpVd3QN4.hYd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
arch/x86/kernel/traps.c, arch/x86/kernel/traps_32.c and
arch/x86/kernel/traps_64.c between various commits from Linus' tree and
commit 9f3c643d0d55424a469a28d463a2ae74a16ba721 ("sysfs: crash
debugging") from the driver-core tree.

The two traps_{64,32}.c files have been merged into the traps.c file but
the code modified by the driver-core patch has been moved to dumpstack_
{64,32}.c anyway.

I applied the following patch.

Time to update.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/arch/x86/kernel/dumpstack_32.c b/arch/x86/kernel/dumpstack_32.c
index 201ee35..1a78180 100644
--- a/arch/x86/kernel/dumpstack_32.c
+++ b/arch/x86/kernel/dumpstack_32.c
@@ -13,6 +13,7 @@
 #include <linux/kexec.h>
 #include <linux/bug.h>
 #include <linux/nmi.h>
+#include <linux/sysfs.h>
=20
 #include <asm/stacktrace.h>
=20
@@ -343,6 +344,7 @@ int __kprobes __die(const char *str, struct pt_regs *re=
gs, long err)
 	printk("DEBUG_PAGEALLOC");
 #endif
 	printk("\n");
+	sysfs_printk_last_file();
 	if (notify_die(DIE_OOPS, str, regs, err,
 			current->thread.trap_no, SIGSEGV) =3D=3D NOTIFY_STOP)
 		return 1;
diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
index 086cc81..96a5db7 100644
--- a/arch/x86/kernel/dumpstack_64.c
+++ b/arch/x86/kernel/dumpstack_64.c
@@ -13,6 +13,7 @@
 #include <linux/kexec.h>
 #include <linux/bug.h>
 #include <linux/nmi.h>
+#include <linux/sysfs.h>
=20
 #include <asm/stacktrace.h>
=20
@@ -489,6 +490,7 @@ int __kprobes __die(const char *str, struct pt_regs *re=
gs, long err)
 	printk("DEBUG_PAGEALLOC");
 #endif
 	printk("\n");
+	sysfs_printk_last_file();
 	if (notify_die(DIE_OOPS, str, regs, err,
 			current->thread.trap_no, SIGSEGV) =3D=3D NOTIFY_STOP)
 		return 1;

--Signature=_Tue__14_Oct_2008_13_50_19_+1100_G2IaRpVd3QN4.hYd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0COsACgkQjjKRsyhoI8wNMwCeNpf/94bsFWkd80ZYJU7+pHlM
/mIAn3/kY9qf0mDp3onpCSIn3ox1B2Mz
=UtGH
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_13_50_19_+1100_G2IaRpVd3QN4.hYd--
