From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Mon, 30 Jun 2008 23:22:48 +1000
Message-ID: <20080630232248.8d993f1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_23_22_48_+1000_/MYxwF_j/r6rC.8U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43584 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756174AbYF3NW6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 09:22:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Mon__30_Jun_2008_23_22_48_+1000_/MYxwF_j/r6rC.8U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (i386 defconfig) failed like this:

  GEN     /scratch/sfr/i386_defconfig/Makefile
  GEN     /scratch/sfr/i386_defconfig/Makefile
  SYMLINK include/asm -> include/asm-x86
  Using /scratch/sfr/next as source for kernel
/bin/sh: include/asm/asm-offsets.h: No such file or directory

I can only guess that this is a kbuild problem.  The object include directo=
ry
looked like this:

/scratch/sfr/i386_defconfig/include$ ls -la
total 24
drwxr-xr-x   5 sfr users 4096 2008-06-30 23:06 .
drwxr-xr-x   8 sfr users 4096 2008-06-30 23:06 ..
lrwxrwxrwx   1 sfr users    7 2008-06-30 23:06 asm -> asm-x86
drwxr-xr-x   2 sfr users 4096 2008-06-30 23:06 asm-i386
drwxr-xr-x 184 sfr users 8192 2008-06-30 23:06 config
drwxr-xr-x   2 sfr users 4096 2008-06-30 23:06 linux

My powerpc (ppc64_defconfig, allnoconfig, allyesconfig and
ppc44x_deconfig), x86_64 (allmodconfig), sparc (defconfig) and sparc64
(defconfig) build all worked.  The kisskb overnight builds will show us
what else is broken.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_23_22_48_+1000_/MYxwF_j/r6rC.8U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkho3igACgkQjjKRsyhoI8xPxQCfdKuduLXPeFhq3O43rMZY7AoA
OGIAn3ZRmTse7RD23mxZsKMCVq2+psFL
=b3xV
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_23_22_48_+1000_/MYxwF_j/r6rC.8U--
