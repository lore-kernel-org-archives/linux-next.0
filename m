From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the pci tree
Date: Wed, 13 Feb 2019 10:03:09 +1100
Message-ID: <20190213100309.03b5ea58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HvgDBrY/Nok0OKr._Fm/jPi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wen Yang <wen.yang99@zte.com.cn>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/HvgDBrY/Nok0OKr._Fm/jPi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  593425276b94 ("PCI: endpoint: functions: Use memcpy_fromio()/memcpy_toio(=
)")

Fixes tag

  Fixes: 349e7a85b25f ("PCI: endpoint: functions: Add an EP function to

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than 1 line.

--=20
Cheers,
Stephen Rothwell

--Sig_/HvgDBrY/Nok0OKr._Fm/jPi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjUK0ACgkQAVBC80lX
0GwiCAf/ZPyYTChTdSIz144wglVmqevEgejwyKpwETfuTeqb68kD6/IzkmRR9R8a
5D9HvGOiPuz4LuucUUJ1GrAefEB41YAQiLs6FTlxyjD8I27UjcBtWxM/07gLNqMC
XBSFsH+3khENk6I/Q1/aaPsZi7YM4rU1Xrk9goC2EQzjxYEwJ4RsYx519FwE4/st
YJpJPY2fd9lxX+g0bFxV6f96DQ7nQqZaDgQlmCVhtO4B4Qp3WTHvlt4QXioU12A7
FjVQcCg09/SEqiOB3rixJHV9RiFmZXUcR+ob4gY8vNRaLhhBFLeh561Ui+MyGk91
f9GuZ4SgrgFyEJ7Z+rkqSUt6t9oyQQ==
=qy5h
-----END PGP SIGNATURE-----

--Sig_/HvgDBrY/Nok0OKr._Fm/jPi--
