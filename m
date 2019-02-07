From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with the fixes tree
Date: Thu, 7 Feb 2019 15:47:47 +1100
Message-ID: <20190207154747.03209c75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tL67iu3TIvWPDkzPspvZxii"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/tL67iu3TIvWPDkzPspvZxii
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/osd/osd_initiator.c

between commit:

  24648908acac ("scsi: osd: osd_initiator: mark expected switch fall-throug=
hs")

from the fixes tree and commit:

  19fcae3d4f2d ("scsi: remove the SCSI OSD library")

from the scsi-mkp tree.

I fixed it up (the latter removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tL67iu3TIvWPDkzPspvZxii
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbuHMACgkQAVBC80lX
0GygAQf/aD4jQN/1bUKPbM1BZraKjY75NNx/raTJSCvqLOH0bBObqLthBmNi5R6p
RAcS7cdI+HxkkkPZEqR3NxQc0OhhGtX9AJKa8IHVj0jIIxpst9J0mxmtoQ3IZdzl
kJE24Il/t6Qd686TQMGIC4wUl/rlxTUIUrgQHVl0KJ9GXJEjFCBVfbnnWlBDz8zG
8E9ztw/gxX2WW93vEiFBeL3tGHmbpBrsWvM6E8WZm7mxh6NKJ2aFnq6EUyVQpbqu
l3ngvrGN9JDNyJsZtFixMhDrCurPPsKjS1Ic85G4DN46TUAAX28embx+/Qf3xHhT
beg4s5O5q5CW+y1bgciphWlYEilm3w==
=quQL
-----END PGP SIGNATURE-----

--Sig_/tL67iu3TIvWPDkzPspvZxii--
