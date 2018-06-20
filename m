From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the scsi
 tree
Date: Wed, 20 Jun 2018 13:54:58 +1000
Message-ID: <20180620135458.7cc22318@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tZ_iyskd9HJPiUe8mw42WyT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Matthew Wilcox <willy@infradead.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/tZ_iyskd9HJPiUe8mw42WyT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/percpu_ida.c

between commit:

  acf3ff616ee2 ("scsi: Remove percpu_ida")

from the scsi tree and commit:

  0c4d6e08c775 ("lib/percpu_ida.c: don't do alloc from per-CPU list if ther=
e is none")

from the akpm-current tree.

I fixed it up (I just removed the file, but clearly the akpm-current
tree commit could be removed) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tZ_iyskd9HJPiUe8mw42WyT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsp0BIACgkQAVBC80lX
0Gy8yQgAhEZt8CFANxAzBTjJQw8vBnrH6CdW3lwPUcy+F5Yzy0mBb+S8gEHtNBxN
sa03TslDp/9ewgxYlGAMGpZ5lHhkEil1O+7jWCX5pgW/K7XSAGfByIsXCR8P9xpi
tzkaMK1Fb1j1fBpqILCZN35GqMRz2KDWuE1/w6qtWdCxo8V9ReQ/bC29uuDUtRWN
BxqLt+Bt2Ec+NcGldnYOkKKVcSFKhn2RScc2B6NCkavJ6Dvqj7b56dycVllKsklp
C0RLvIPsLLgV94OtUyuAAdk3Z66pyTBSRPRZfsiRgi2hNtss3krrqLY6Gg5IvPug
p54N0y5oDsyr+4D+ebmHOds+yjDwZA==
=qfiD
-----END PGP SIGNATURE-----

--Sig_/tZ_iyskd9HJPiUe8mw42WyT--
