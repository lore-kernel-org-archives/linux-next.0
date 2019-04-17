From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the block tree
Date: Wed, 17 Apr 2019 12:31:25 +1000
Message-ID: <20190417123125.3de22f73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mNdL3ruxYKIGVZtrZ5ARkKw"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/mNdL3ruxYKIGVZtrZ5ARkKw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/f2fs/node.c: In function 'f2fs_remove_inode_page':
fs/f2fs/node.c:1193:47: warning: format '%zu' expects argument of type 'siz=
e_t', but argument 5 has type 'blkcnt_t' {aka 'long long unsigned int'} [-W=
format=3D]
    "Inconsistent i_blocks, ino:%lu, iblocks:%zu",
                                             ~~^
                                             %llu
    inode->i_ino, inode->i_blocks);
                  ~~~~~~~~~~~~~~~              =20

Introduced by commit

  90ae238d9dac ("f2fs: fix to avoid panic in f2fs_remove_inode_page()")

from the f2fs tree interacting with commit

  72deb455b5ec ("block: remove CONFIG_LBDAF")

--=20
Cheers,
Stephen Rothwell

--Sig_/mNdL3ruxYKIGVZtrZ5ARkKw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly2j/0ACgkQAVBC80lX
0GzDiwf/d9CUHjUAyzzDO9kDZdrbLqFE3thRc+3V4nrx1ZPK9YGjsQ4PQB6hhh7v
pHdnVHq8V07WIYzPLvM/AW9MTwBhSQ+R5jpMfc7jIO3s2wACVjSrM2qofaZJqx89
jXOEhPlQiRbDvYcgRvPpDACafFSeGe7gpB7e53pXPRdzlykIY0PYz/76J/87xVZd
rrfz4fZ1PhYF8hODUIxll0BxiNQCdwO6v1ZJIf02Eb2E+C5Yft6t72Ro0sMaQtRg
nP/3dMp41Yn+yiWhUn44RieVSpSwHPxOM0tUTMA6Q41jfnm+Iah+1+fbmvnRWgOs
ZsaFjpACo22wyCovrk568/qk3Wma6g==
=v9pi
-----END PGP SIGNATURE-----

--Sig_/mNdL3ruxYKIGVZtrZ5ARkKw--
