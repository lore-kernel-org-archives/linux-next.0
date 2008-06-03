From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm/mer-current merge conflict
Date: Tue, 3 Jun 2008 14:04:21 +1000
Message-ID: <20080603140421.183cefe5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__3_Jun_2008_14_04_21_+1000_zblgljhNfabS0BBs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36783 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750695AbYFCEEd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jun 2008 00:04:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Tue__3_Jun_2008_14_04_21_+1000_zblgljhNfabS0BBs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/mach-pxa/tosa.c between commit
0ef2cfc0ca4625424e5b8ead6c47359c35a7a841 ("[ARM] pxa: fix tosa.c build
error") from the arm-current tree and commit
a37cba9e5315bb57e8eb135e401ba35e4b2338ac ("[ARM] 5048/2: Clean up tosa
and spitz resetting") from the arm tree.  I used the latter since the
former's commit message implied that this was the right fix.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__3_Jun_2008_14_04_21_+1000_zblgljhNfabS0BBs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRMLNTgG2atn1QN8RAih6AJ9zYi4h/a0H8JquuFLRMbPHcJXu9ACffvTa
M2NWK8hCSJqqMTz+wUmKrz0=
=z7G6
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Jun_2008_14_04_21_+1000_zblgljhNfabS0BBs--
