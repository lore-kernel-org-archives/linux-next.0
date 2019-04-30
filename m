From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the pm tree
Date: Tue, 30 Apr 2019 17:48:29 +1000
Message-ID: <20190430174829.4f33e8b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tY5zH+.a1hnR/MQ9ywNeJ+P"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/tY5zH+.a1hnR/MQ9ywNeJ+P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  Documentation/driver-api/index.rst

between commit:

  680e6ffa1510 ("Documentation: add Linux ACPI to Sphinx TOC tree")

from the pm tree and commit:

  09e7d4ed8991 ("docs: Add Generic Counter interface documentation")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/driver-api/index.rst
index aa87075c7846,201247b7c1e8..000000000000
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@@ -56,7 -56,7 +56,8 @@@ available subsections can be seen below
     slimbus
     soundwire/index
     fpga/index
 +   acpi/index
+    generic-counter
 =20
  .. only::  subproject and html
 =20

--Sig_/tY5zH+.a1hnR/MQ9ywNeJ+P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzH/c0ACgkQAVBC80lX
0Gzg5gf8Cu23ZHieu0LDK4k6BT34cgCWBgHWEzDcxCQhD/of7hf8e/nIryBzvICg
4rTEWtv7PoNXtIBDoZDHAGSfS4FLqpkZCwoMi7JGO+RLZyjc7oV3aSO2rgthIFut
QMqfKBG5Z9QLsBXGPMqCC9+/Wurwu5cDYYwLybJDgveKk2eaK78FdAX88K9Xzcaj
Uy61mcW2cQ+e0guwTKWLoEV+gOoJeQaeMfNfj31+EzOKzguL4s9YOW76hAf6fJzx
HvU+IIDXk/XB1QMx1hM8N5i5tEHIih9AAqZNtK7yvN0A7nxSJ5PDQTRUnIYKV4Kr
F025sHq6kw0ryHH0eldgFX1Xz4FjvA==
=DOkb
-----END PGP SIGNATURE-----

--Sig_/tY5zH+.a1hnR/MQ9ywNeJ+P--
