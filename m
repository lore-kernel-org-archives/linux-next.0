From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Thu, 4 Dec 2008 19:54:24 +1100
Message-ID: <20081204195424.1cbd42a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Dec_2008_19_54_24_+1100__fgbpGrg1bz9UWFd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57860 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751810AbYLDIyd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Dec 2008 03:54:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Thu__4_Dec_2008_19_54_24_+1100__fgbpGrg1bz9UWFd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc64 defconfig) failed like this:

  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/docproc
  HOSTCC  scripts/basic/hash
  GEN     /scratch/sfr/sparc64_defconfig/Makefile
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/kxgettext.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/lex.zconf.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'sparc64_defconfig'
***
*** Can't find default configuration "arch/sparc/configs/sparc64_defconfig"!
***

Caused, I suspect by commit 60f2e8ffcf7291fc7df05dd91caf84d75c5181c5
("sparc,sparc64: unify Makefile") which I reverted (along with
commit 9251dc5153ee5dae27e81835a35f3b7c0a73259e "sparc,sparc64: unify
prom/" which depended on it).  But that just got me to this error:

cc1: fatal error: opening output file arch/sparc64/kernel/../../sparc/kerne=
l/vmlinux.lds: No such file or directory

(I build in a separate object directory.)

So I reverted the whole sparc tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Dec_2008_19_54_24_+1100__fgbpGrg1bz9UWFd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3msAACgkQjjKRsyhoI8y4VgCeLIR9Hq8OAap86K5/D31TUq+A
miwAoJyTYXzHilKmB3nLK2SE4HkL+Let
=HXYe
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Dec_2008_19_54_24_+1100__fgbpGrg1bz9UWFd--
