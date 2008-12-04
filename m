From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build warning
Date: Fri, 5 Dec 2008 10:42:11 +1100
Message-ID: <20081205104211.374a7c2b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__5_Dec_2008_10_42_11_+1100_n6_epJ6WHFIuDIqk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36743 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751800AbYLDXm0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Dec 2008 18:42:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__5_Dec_2008_10_42_11_+1100_n6_epJ6WHFIuDIqk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

The next-20081204 build (powerpc ppc64_defconfig) produced these warnings:

include/linux/cpumask.h: In function 'set_cpu_possible':
include/linux/cpumask.h:1052: warning: passing argument 2 of 'cpumask_set_c=
pu' discards qualifiers from pointer target type
include/linux/cpumask.h:1054: warning: passing argument 2 of 'cpumask_clear=
_cpu' discards qualifiers from pointer target type
include/linux/cpumask.h: In function 'set_cpu_present':
include/linux/cpumask.h:1060: warning: passing argument 2 of 'cpumask_set_c=
pu' discards qualifiers from pointer target type
include/linux/cpumask.h:1062: warning: passing argument 2 of 'cpumask_clear=
_cpu' discards qualifiers from pointer target type
include/linux/cpumask.h: In function 'set_cpu_online':
include/linux/cpumask.h:1068: warning: passing argument 2 of 'cpumask_set_c=
pu' discards qualifiers from pointer target type
include/linux/cpumask.h:1070: warning: passing argument 2 of 'cpumask_clear=
_cpu' discards qualifiers from pointer target type

Caused by commit 38b04c5f8ddd01137b1524b126ac936d87b58213
("cpumask:cpu_online_mask-etc-as-primary") from the rr tree. Gcc (version
4.2.4) doesn't seem to let you just cast away the "const" from a variable.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__5_Dec_2008_10_42_11_+1100_n6_epJ6WHFIuDIqk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk4atMACgkQjjKRsyhoI8yUNACdFGhKoKL0vrM1rJl6q9jMzbhZ
qfcAn0hQ4KmMb/nuJZ7Q9ugY8aizFsFt
=XU3X
-----END PGP SIGNATURE-----

--Signature=_Fri__5_Dec_2008_10_42_11_+1100_n6_epJ6WHFIuDIqk--
