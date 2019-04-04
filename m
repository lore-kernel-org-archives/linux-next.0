From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the spi tree
Date: Thu, 4 Apr 2019 13:47:01 +1100
Message-ID: <20190404134701.2cfe692f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LFNzN5p_WT.Bt/wNU2IvqoP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
List-Id: linux-next.vger.kernel.org

--Sig_/LFNzN5p_WT.Bt/wNU2IvqoP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/mt7621-spi/Kconfig
  drivers/staging/mt7621-spi/Makefile

between commit:

  cbd66c626e16 ("spi: mt7621: Move SPI driver out of staging")

from the spi tree and commits:

  99b75a4e3275 ("staging: add missing SPDX lines to Kconfig files")
  97ed8eab2a00 ("staging: add missing SPDX lines to Makefile files")

from the staging tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging. You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/LFNzN5p_WT.Bt/wNU2IvqoP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlylcCUACgkQAVBC80lX
0GwrIwf/aybXd1ndlWc47YMB8BEC4ztchpwPSaCaynVYxt7dzuAqkyVpGZTpDTS4
MVPLGKhVIoR2X2y3210+BcIEXLMApytPgLEtkm99A9Cw+vMDOlvgt5hiytaD9SaB
NCMthJP+FBQBFW/iD6ae/nlWj5gbeOvTlLGumSWZ7UWFJTgSoi3orfkDtQOikCDF
iRHFaOxLm5ioLoV45idqIS0uBnn7ONe7ONo4NtFjBlwQROzjKmDOfwu8gGVbqNJV
xoY9kh3GB7FnQ1Sf5fK5TmDvJZ72DwIig0CJ2ZhUB6mYh2p0s2dBsnEpYmuFALHg
d9NwGi8Kyu+Nm/nwQs5lP6fzjvgJTA==
=8Qpt
-----END PGP SIGNATURE-----

--Sig_/LFNzN5p_WT.Bt/wNU2IvqoP--
