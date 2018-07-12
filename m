From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: duplicate patches in the gfs2 and xfs trees
Date: Thu, 12 Jul 2018 11:37:24 +1000
Message-ID: <20180712113724.413e4a3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sdbwM7O_eY_PRfZf2lltwSo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/sdbwM7O_eY_PRfZf2lltwSo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

It looks like part of the xfs tree (the iomap-4.19-merge branch) that
was merge into the gfs2 tree has been rebased and the gfs2 tree has not
been updated to cope.  The rebase commits are exactly the same patches
(though I didn't check to see if any of the commit messages had changed).

--=20
Cheers,
Stephen Rothwell

--Sig_/sdbwM7O_eY_PRfZf2lltwSo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltGsNQACgkQAVBC80lX
0Gx08QgAozmrQsiGero9EERUw0sFmVKqE4e/0tRTd0eXS40a4fVE8SUedCtX2das
IGFgSDCM8IRPhu2SG7YtPdUkaiyGRfjfKHmdm+sHaTfmluqzoSFMEvdDtzP97Oje
AuXXLCNRTUPjfxvUxOhMNuYF/lFYJCbhEmsV9CppkJ7LHPCIrVHB6Vp26adlahFF
NPXUNCAfzWijePD//YoM5/ZOO8LVg2U+Q3zw7jqtI46Vg+h20qwXshP/kmufsby6
NRVC/bsBwk7cbbhtjGOYM0mejV7FLZrMv+xhRZhghK8J651v/Do/tgEdiRu6Ly+p
T55IHfu/E4nnfS6Tc/MMm1qfzbea7Q==
=OKPe
-----END PGP SIGNATURE-----

--Sig_/sdbwM7O_eY_PRfZf2lltwSo--
