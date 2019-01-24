From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the spi tree with the mips tree
Date: Thu, 24 Jan 2019 13:27:59 +1100
Message-ID: <20190124132759.1416fec0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yeSH+FhAFozHcaFoh=H1CTs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>, Paul Burton <paul.burton@mips.com>, Alban Bedel <albeu@free.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/yeSH+FhAFozHcaFoh=H1CTs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Today's linux-next merge of the spi tree got a conflict in:

  arch/mips/ath79/dev-spi.h

between commit:

  85b9686dae30 ("MIPS: ath79: drop platform device registration code")

from the mips tree and commit:

  b172fd0c8980 ("spi: ath79: Enable support for compile test")

from the spi tree.

I fixed it up (the former removed the file so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yeSH+FhAFozHcaFoh=H1CTs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxJIq8ACgkQAVBC80lX
0GxHoQgAiDHn82GV+RjZoF7MpPbTKbNJRhOwevlepdE+CxrYAinRjp6ixmhSr5/Y
tAelTyGzjt63Ds1gDVbuz2gtLGsb6SIIZagQ7zAUIttL1PtEcyCBviKJ1yril2+L
3LXtUFp0NQP141MEv7yUtEUF30TAg/aN3g4gBS+a2sJvL8C/JEefO2TNyz4mkq0L
YFhPOEb78Zx/BIrEzmHn+6wA727KIY5IxP71R4e47SYobWkk0qNhtZovPBA07NBh
vTIMOALtRhGWipjGLVmsp9WqIX7X8wsMyUMnA9i1FD5KbxDkxm8TvX/qwoBxLUXm
gn1jW0XirkEWNc4zw2WJhZznX/+f4Q==
=TWqE
-----END PGP SIGNATURE-----

--Sig_/yeSH+FhAFozHcaFoh=H1CTs--
