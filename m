From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the hid tree
Date: Thu, 25 Apr 2019 23:34:30 +1000
Message-ID: <20190425233430.14bdb102@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VptbqHJTGaAO0_23zbBy+FA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/VptbqHJTGaAO0_23zbBy+FA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  39b3c3a5fbc5 ("HID: input: fix assignment of .value")

Fixes tag

  Fixes: 2dc702c991e377 ("HID: input: use the Resolution Multiplier for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  d43c17ead879 ("HID: input: make sure the wheel high resolution multiplier=
 is set")

Fixes tag

  Fixes: 2dc702c991e377 ("HID: input: use the Resolution Multiplier for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not aplit Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/VptbqHJTGaAO0_23zbBy+FA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzBt2YACgkQAVBC80lX
0Gyi6wf/U880bovOfKFESGLQK8IsFPz3Y8utCcnHmkG3aUrMybPnWGfelwe30bhi
0yO9wqgxdsnssyt3atDPF0pKpWOdOHGXXkKalWRA/Lua4VTC01wjQ6fYnCI5xf0T
O1zP4xpnoECg6krPxidVfs9Jkmjn2RgZxSfLb9BoDNqmDpLq0w2BbxCkvDJzCLSU
lON5oeBH1VTSz7Nr1/RWIL+3+uUC9vjXS8asyYudsyHmiEnPEPu46jjM5TfakCdI
loKMKNL9yR/0Bb6ZEkRGOhceSKJZZ/Y6Gf3DIsFuFCWz7PndB/anA+bUNIe3OqOp
FW8cVLGSWEo3h2QRzLsNSdbAxLoIRA==
=+Ln4
-----END PGP SIGNATURE-----

--Sig_/VptbqHJTGaAO0_23zbBy+FA--
