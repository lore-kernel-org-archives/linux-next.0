From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the modules
 tree
Date: Thu, 12 Feb 2015 16:08:59 +1100
Message-ID: <20150212160859.4dcb40ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kSVR4.lYJgdGcTunRGsJdmV"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34074 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750717AbbBLFJI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Feb 2015 00:09:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin.vincent@axis.com>, Andrey Ryabinin <a.ryabinin@samsung.com>

--Sig_/kSVR4.lYJgdGcTunRGsJdmV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
scripts/module-common.lds between commit 5d8591bc0fba ("module: set
ksymtab/kcrctab* section addresses to 0x0") from the modules tree and
commit c84e031a79f9 ("kernel: add support for .init_array.*
constructors") from the akpm-current tree.

I fixed it up (I think - please check - see below) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc scripts/module-common.lds
index bec15f908fc6,01c5849fe44a..000000000000
--- a/scripts/module-common.lds
+++ b/scripts/module-common.lds
@@@ -6,14 -6,17 +6,17 @@@
  SECTIONS {
  	/DISCARD/ : { *(.discard) }
 =20
 -	__ksymtab		: { *(SORT(___ksymtab+*)) }
 -	__ksymtab_gpl		: { *(SORT(___ksymtab_gpl+*)) }
 -	__ksymtab_unused	: { *(SORT(___ksymtab_unused+*)) }
 -	__ksymtab_unused_gpl	: { *(SORT(___ksymtab_unused_gpl+*)) }
 -	__ksymtab_gpl_future	: { *(SORT(___ksymtab_gpl_future+*)) }
 -	__kcrctab		: { *(SORT(___kcrctab+*)) }
 -	__kcrctab_gpl		: { *(SORT(___kcrctab_gpl+*)) }
 -	__kcrctab_unused	: { *(SORT(___kcrctab_unused+*)) }
 -	__kcrctab_unused_gpl	: { *(SORT(___kcrctab_unused_gpl+*)) }
 -	__kcrctab_gpl_future	: { *(SORT(___kcrctab_gpl_future+*)) }
 +	__ksymtab		0 : { *(SORT(___ksymtab+*)) }
 +	__ksymtab_gpl		0 : { *(SORT(___ksymtab_gpl+*)) }
 +	__ksymtab_unused	0 : { *(SORT(___ksymtab_unused+*)) }
 +	__ksymtab_unused_gpl	0 : { *(SORT(___ksymtab_unused_gpl+*)) }
 +	__ksymtab_gpl_future	0 : { *(SORT(___ksymtab_gpl_future+*)) }
 +	__kcrctab		0 : { *(SORT(___kcrctab+*)) }
 +	__kcrctab_gpl		0 : { *(SORT(___kcrctab_gpl+*)) }
 +	__kcrctab_unused	0 : { *(SORT(___kcrctab_unused+*)) }
 +	__kcrctab_unused_gpl	0 : { *(SORT(___kcrctab_unused_gpl+*)) }
 +	__kcrctab_gpl_future	0 : { *(SORT(___kcrctab_gpl_future+*)) }
+=20
+ 	. =3D ALIGN(8);
+ 	.init_array		: { *(SORT(.init_array.*)) *(.init_array) }
  }

--Sig_/kSVR4.lYJgdGcTunRGsJdmV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU3DVxAAoJEMDTa8Ir7ZwVCxsP/1ibYn2oRTCBe6c1LuTSGi/z
3XiYiSpM9zMBaiTYy1bi6jdeMpw0GW333vc7fri6kCwcibAf60nzcAls8QGlEjOY
9nM4DapyI4UTaJzM072M1C3pJ79IIWtrahioe0987sWtIb6/hJDUz46Iq28Uckgl
Q9oN9YNXU2buWjZcsPIcZNwxX2RBxGEt1ayOpQyQf6zrX4Alt7U9ZRjI/nG9vHqW
5XSYsiCBLLV1qiBospf5e2h9E1kVNvrM4jGbyh3dpqDtumAi6EoDYoiljcM9swAV
Hoh/tMZtuWqelfi2shEXDvk/L1qm9kqVBHmHuonktpAqe38Lqf6osch5MSTK6G9F
C0cDsF6zsx2Mi3p264kiYf4U35TrsMFpQAELtaBLjFV0reL9NeQAhE611ueE/RTY
luQCci2JK0XZ3t8VhB9tw83Lmeis5p8rgmzEZlsCziuEIRFkOjt9XpoEtfnD4rYq
t3pthJvyvg3d+A627uMP1ZMnEmCty5d0YJP8Makp+/m0YG4MEo1TC5SIli3GI90B
F96Da6PrKQajCiUS/fuNOizsq3AG/2ZFh6ecp8kye1ppfgBZRfsVziSYMt6EnvfI
Jr7vo3Jf3muy/jIfMYvBiKisCHLJPJhWis+CLqkjj489qpY1Uk0PuOOG9tEBr/nX
FRrP98tvx3/Z0ugDCIXl
=3Rz3
-----END PGP SIGNATURE-----

--Sig_/kSVR4.lYJgdGcTunRGsJdmV--
