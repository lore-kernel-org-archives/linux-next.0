From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Mon, 18 Mar 2019 22:18:07 +1100
Message-ID: <20190318221807.6a8eadd3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iVv7u9KJP0m58jvp2G66wdY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iVv7u9KJP0m58jvp2G66wdY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  825b22e5961a ("ASoC: rsnd: src: fix compiler warnings")

Fixes tag

  Fixes: linux-next commit 7674bec4fc09 ("ASoC: rsnd: update BSDSR/BSDISR h=
andling")

has these problem(s):

  - 'linux-next commit' was unexpected.

--=20
Cheers,
Stephen Rothwell

--Sig_/iVv7u9KJP0m58jvp2G66wdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyPfm8ACgkQAVBC80lX
0GxwEgf+JTq7XTw0AXdw8AEBFuPKYo3R2WU82AQECWnE9W3Wl2EkAP6rZlRM43op
QrC+OoVGQQzt7XaLuvpT2pWkdO0zsx4kpxnZve33M/Cq0l3IPSF6KZyJ/gXA7U+v
H0zFhwPkujxiCTtp8jp5MM8F8gx2Av7vV6O+IVRAzTh84MjoaMT1qQ47RYaFROrM
Dmzn2W+YLNAQOwArc9hXyCRruO9di7j0SalugnUoVew5KH5joDNNZtAvXUwp4+wp
0dCsBcFU/FaWZbmkH2YCDWmfisR/M344AjCt5PssgfH0BASEsd7EdLf4Sv/FfBEb
IJeXA4e/+P5yCHPHjZ107dZ0A89rgg==
=6oUb
-----END PGP SIGNATURE-----

--Sig_/iVv7u9KJP0m58jvp2G66wdY--
