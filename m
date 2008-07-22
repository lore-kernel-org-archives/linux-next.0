From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ubi tree
Date: Tue, 22 Jul 2008 13:31:22 +1000
Message-ID: <20080722133122.29f8e2cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_13_31_22_+1000_Qhd8E99PBnDMkDKr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51732 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753278AbYGVDba (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 23:31:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <dedekind@yandex.ru>
Cc: linux-next@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

--Signature=_Tue__22_Jul_2008_13_31_22_+1000_Qhd8E99PBnDMkDKr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

Today's linux-next merge of the ubi tree got a trivial conflict in
drivers/mtd/ubi/cdev.c between commit
72b67048f5dac18fd6494e3d3bff7e54840e8761 ("UBI: cdev lock_kernel()
pushdown") from Linus' tree and commit
9c0ec8fe1eed2106441e12ca2964f431df044f1d ("UBI: fix checkpatch.pl errors
and warnings") from the ubi tree.

Just overlapping additions of include files.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_13_31_22_+1000_Qhd8E99PBnDMkDKr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFVIoACgkQjjKRsyhoI8xAJQCdFzTTav0d6uxP1v3UXH64qeAb
VhsAoKpr8JvbJYuN0I1WtiSPdz48nT3p
=t6r5
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_13_31_22_+1000_Qhd8E99PBnDMkDKr--
