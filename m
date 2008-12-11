From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powerpc build warning
Date: Thu, 11 Dec 2008 19:42:01 +1100
Message-ID: <20081211194201.0bec049a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_19_42_01_+1100_VluBRiRzqF5zqeUV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34102 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754648AbYLKImS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 03:42:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Dave Hansen <dave@linux.vnet.ibm.com>

--Signature=_Thu__11_Dec_2008_19_42_01_+1100_VluBRiRzqF5zqeUV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (powerpc allyesconfig) produced this warning:

arch/powerpc/mm/numa.c: In function 'do_init_bootmem':
arch/powerpc/mm/numa.c:932: warning: unused variable 'i'

Caused by commit 4a6186696e7f15b3ea4dafcdb64ee0703e0e4487 ("powerpc: Fix
boot freeze on machine with empty memory node") which is now in Linus'
tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_19_42_01_+1100_VluBRiRzqF5zqeUV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklA0lkACgkQjjKRsyhoI8zMpgCgpH0ydVk430XYjIEtQHBgc9DN
B54An0b+zGGwfpp5prllqpynYzz7iYOo
=VeKL
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_19_42_01_+1100_VluBRiRzqF5zqeUV--
