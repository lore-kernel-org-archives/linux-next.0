From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Thu, 2 May 2019 08:46:26 +1000
Message-ID: <20190502084626.108fb691@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aMI74E1W0Jhnl1fNB2aKUWK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/aMI74E1W0Jhnl1fNB2aKUWK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  Makefile

between commit:

  6f303d60534c ("gcc-9: silence 'address-of-packed-member' warning")

from Linus' tree and commit:

  c21e4135d629 ("kbuild: re-enable int-in-bool-context warning")

from the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Makefile
index 633d1196bf00,8b3b62f18c9a..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -677,8 -691,6 +691,7 @@@ KBUILD_CFLAGS	+=3D $(call cc-option,-fno-
  KBUILD_CFLAGS	+=3D $(call cc-disable-warning,frame-address,)
  KBUILD_CFLAGS	+=3D $(call cc-disable-warning, format-truncation)
  KBUILD_CFLAGS	+=3D $(call cc-disable-warning, format-overflow)
- KBUILD_CFLAGS	+=3D $(call cc-disable-warning, int-in-bool-context)
 +KBUILD_CFLAGS	+=3D $(call cc-disable-warning, address-of-packed-member)
 =20
  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
  KBUILD_CFLAGS	+=3D -Os

--Sig_/aMI74E1W0Jhnl1fNB2aKUWK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzKIcIACgkQAVBC80lX
0GyDWAgAhG9OF5Y3gtnD7UV5wo5EDp/2Pm306QK2UP3L7SZO9UetGPCvMPwcTrki
jGOX6ihfLZaVZLXSqhnXWXKE1jWGH4c4oCyMgTGDlAAUnjGtThHVD5FOQr98sSqe
QChsJkhwY0SMWfkzt42h00xghIzYJUzBS0ayJxdKva/hn5kpF1LEGPgJwXeiNOtb
PTGGAxaXsGln0ndP8pYTHqGzBnM0exk0Dt62Dx3Zm072kXUwJiK7lUvYNLYuwdyf
5ceG781YTOnTcYN9d4jk1PQLQvjPkv3WkLAUMbgKMxjBSjvZ5vZsEyPai0mrmRFr
rPdhBYmT0XLOiHWN7LwtCXKNrJ1Npg==
=on7B
-----END PGP SIGNATURE-----

--Sig_/aMI74E1W0Jhnl1fNB2aKUWK--
