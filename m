From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the scsi-fixes tree
Date: Wed, 6 Feb 2019 07:20:33 +1100
Message-ID: <20190206072033.3d04f96b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dH6dPBFmqgDel7/Lh7aRdwi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vaibhav Jain <vaibhav@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dH6dPBFmqgDel7/Lh7aRdwi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

In commit

  bb61b843ffd4 ("scsi: cxlflash: Prevent deadlock when adapter probe fails")

Fixes tag

  Fixes: c21e0bbfc485("cxlflash: Base support for IBM CXL Flash Adapter")

has these problem(s):

  - missing space between the SHA1 and the subject

--=20
Cheers,
Stephen Rothwell

--Sig_/dH6dPBFmqgDel7/Lh7aRdwi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxZ8BIACgkQAVBC80lX
0Gw6fwgApPTy3mb0g7GavnOVHIAhJlfJRF+iZnt7ogkJxJj6B01gTTb4H/oPlC9g
6Uq9AVhdm7k5Os8eoCsOS0yGy0ExIiv05exjfLFl/hy8o7+lus0MKlkdUoqRuILB
Kgh3/AuKTY2zHY5k01TVT4j6ZUwqZ6E6FB6QgL/t+7sxiciiCiJ3m9bmRfIhjIMg
Ykxf+xyrUjFMbGFvNJR+wnMyoGpqMSibxeSLw8pXo10s582tYLoTJmkClCJfVido
YBIDBTE22grMJqgqqVTUKlkzb1r7emh6oXZq/TCaCus0J9dqte+18HW7tLo+yMpu
C6py+ETPnuxIeAq7BhuhoVA1t0v9tA==
=/bEn
-----END PGP SIGNATURE-----

--Sig_/dH6dPBFmqgDel7/Lh7aRdwi--
