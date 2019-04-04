From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Thu, 4 Apr 2019 13:43:35 +1100
Message-ID: <20190404134335.6752d477@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/idTcLt29mAheRKmHQW9qx.W"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/idTcLt29mAheRKmHQW9qx.W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/media/mt9t031/Kconfig
  drivers/staging/media/mt9t031/Makefile

between commit:

  dfe571ca8daa ("media: soc_camera: Remove leftover files, add TODO")

from the v4l-dvb tree and commits:

  99b75a4e3275 ("staging: add missing SPDX lines to Kconfig files")
  97ed8eab2a00 ("staging: add missing SPDX lines to Makefile files")

from the staging tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/idTcLt29mAheRKmHQW9qx.W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlylb1cACgkQAVBC80lX
0Gwbwgf/Stjq9acsaCMzrgvVsc1uhBFrF4R2i/6Imf0RuXw1Qw86gpSDwumgo2FL
KPtN2Mj0Pug6s5jt8O+qLeHEQJ6frBWD5IS7yoHdps53Ua5cOIK7yld/jsTLCtdN
ZdjsCnsPXMsVE2rVrVWyt/z7aqUwxoV3wIRzKse5FevMYo/rlPvK+02qIchW8vzK
hUWiTChucpix5BBiscPSRPNpct5n5nhfcYY8lgzsoznMDPM/vz0x9DgoM50XBrPV
+Hp2PxKGL+EutFKTchVWBpTdCAREvoLSAAlMPJlqkqqeG/noCKugW/SfsB6Mgg/F
NBA+7m3KDXBxD62vHaDXRUzO/XqFiw==
=PzvP
-----END PGP SIGNATURE-----

--Sig_/idTcLt29mAheRKmHQW9qx.W--
