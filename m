From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the cifs tree
Date: Fri, 24 May 2019 14:27:13 +1000
Message-ID: <20190524142713.360c0c10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/onC+sUfs3YQg2TItGbXTUJg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Murphy Zhou <jencce.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/onC+sUfs3YQg2TItGbXTUJg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f875253b5fe6 ("fs/cifs/smb2pdu.c: fix buffer free in SMB2_ioctl_free")

Fixes tag

  Fixes: 2c87d6a ("cifs: Allocate memory for all iovs in smb2_ioctl")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/onC+sUfs3YQg2TItGbXTUJg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzncqEACgkQAVBC80lX
0Gx3PQf/ZW8ZQSBngy86/4u4M3SvsJhOkPdIQ0xNaoMx7m4fC6QpINDluenVLQ5p
9pqXPanFi0N91DrdFxut3oRJaVR8RfV4AyHU5tFiXVZRzBEEhjTQcbWtIGINBNkH
fFjhC4KHo8muVthr7IIhfn2eVzwhYB74H9w+LOfREjIo9ih6GN9Ep/22TETZ7BND
YYoSbUrwhtQAeBpnkOFCK2qrMK8CGpY1b+UjfZliHcp3nWJPIuARhX8le2YfOlTL
ZXoSfpiSM5dMvbE6EN7VHSnmpH5FFwKcEPhm62fwmrqKoYoyT/BnG3EG28sDPfkh
LTrZiHKzpdLIagXzAW5WJohrK9UmAQ==
=2Z21
-----END PGP SIGNATURE-----

--Sig_/onC+sUfs3YQg2TItGbXTUJg--
