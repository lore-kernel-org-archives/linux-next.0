From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the scsi-fixes tree
Date: Wed, 30 Jan 2019 07:53:36 +1100
Message-ID: <20190130075336.3164fcc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//LouQrkFFexUt7KaZyWjIIu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steffen Maier <maier@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_//LouQrkFFexUt7KaZyWjIIu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b63195698dea ("scsi: zfcp: fix sysfs block queue limit output for max_seg=
ment_size")

Fixes tag

  Fixes: 50c2e9107f ("scsi: introduce a max_segment_size host_template para=
meters")

has these problem(s):

  - SHA1 should be at least 12 digits long

--=20
Cheers,
Stephen Rothwell

--Sig_//LouQrkFFexUt7KaZyWjIIu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxQvVAACgkQAVBC80lX
0GyyGwgAglHqjd/1TNdKN2ZPkGgSoJ1lVE/alfGW8tG9JOu6aqHpTnhn5JUeS8dr
MoVtCKWcKlm+MrL7zkzii78u21XENSOycM/1k7O/iU41d1Q5p+qKhRSQF8vtnrIS
0bItDwTd+LQ7Vg2yK859hd/n6+sHrux9/HxfxlA1l27LKP3K05TSIzHAd7R/OAFv
SazREi1mFhORCMIbFetAWoS6JujHy6Zhzv96YLFQ+X84Yvn+mBEfKWUI1iDBQRcG
nT8RWrP25Ozk6bCYR7Xpzu7pNw+P40WU9aiQ+h/NaJtpUWXednADCJ07AgMUor2C
fM+BLOO5yzmDG/qyjtUuP1aVuuwoug==
=ylgP
-----END PGP SIGNATURE-----

--Sig_//LouQrkFFexUt7KaZyWjIIu--
