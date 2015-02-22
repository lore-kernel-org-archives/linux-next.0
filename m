From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree with Linus' tree
Date: Sun, 22 Feb 2015 11:27:13 +1100
Message-ID: <20150222112713.1fd0a359@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FURDHHbMZ9i91E3Aal2MxdF"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35429 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbbBVA1V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 19:27:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/FURDHHbMZ9i91E3Aal2MxdF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in
arch/s390/kernel/early.c between commit 61b0b01686d4 ("s390/spinlock:
disabled compare-and-delay by default") from Linus' tree and commit
c5f43f0a70fc ("s390: remove 31 bit support") from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/s390/kernel/early.c
index 4427ab7ac23a,434b4d26a8db..000000000000
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@@ -393,19 -328,16 +328,18 @@@ static __init void detect_machine_facil
  		S390_lowcore.machine_flags |=3D MACHINE_FLAG_TLB_LC;
  	if (test_facility(129))
  		S390_lowcore.machine_flags |=3D MACHINE_FLAG_VX;
- #endif
 -	if (test_facility(128))
 -		S390_lowcore.machine_flags |=3D MACHINE_FLAG_CAD;
  }
 =20
 -static int __init nocad_setup(char *str)
 +static int __init cad_setup(char *str)
  {
 -	S390_lowcore.machine_flags &=3D ~MACHINE_FLAG_CAD;
 +	int val;
 +
 +	get_option(&str, &val);
 +	if (val && test_facility(128))
 +		S390_lowcore.machine_flags |=3D MACHINE_FLAG_CAD;
  	return 0;
  }
 -early_param("nocad", nocad_setup);
 +early_param("cad", cad_setup);
 =20
  static int __init cad_init(void)
  {

--Sig_/FURDHHbMZ9i91E3Aal2MxdF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6SJlAAoJEMDTa8Ir7ZwVc5sQAIfn7sXAZkj+NkbtNIFK0lXF
wOHJw0t2LjT4VyZTLvtICYCLds1GlP7ekXuk8RyQNDiDtHzrozc7w0Tl/t2Q4zMF
7APpTca/QAJDPXJcOiQRYLS912tOQBQr7ckvEfd1Iz2RbgIVG3r04cPazRfSbZSN
SNZQGdTQmRvYWUsGC3MEQ2GtLe+5HWYc5pKKgOKhQKBX0w0LkIemCQaEtssLX7ac
HSGSVCRkDsItTZKgG3cKwv64jLi7yGH1vt22R8K5kXvKInbuwythR6l+6WBSZ4OT
c+sEUGoctJIwSNtD49awIlWhs9lYNXukWho6AiE8ue4FnHew+TchwPdIZ8ZZ6K5D
Guw6Zn3fEdlJ/akPq1Wo5527BbJXP5GF3KdQvzMC4VIvbO42Me2b+6SB4dlDH9hW
wluCJievhvEWfse1YyLRX1TlbWGKg9BoUZ18DQ1km+Wxa92a6JSep5wyJegHqxZc
uzGk3lnq0f5RR1gXLOKlw8Ddzh3gI8/355ALW+YUGX1xJEhfMyggRbUV3g7d6LUZ
X0Zlcnf+18l201Nyyu15Ec5Obg/kHYdSVnDvrk3RZISZOjoe+bIDCSX2aEm/t98H
b3Jqb7rKn4dZ/DSF/SGJNU/B41gWS4s/VfWq74HVI9NljCSq4TSKEY/2wx2nnTpX
wanbzth19YKFtPDXC/K2
=BOqa
-----END PGP SIGNATURE-----

--Sig_/FURDHHbMZ9i91E3Aal2MxdF--
