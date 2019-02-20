From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the device-mapper tree
Date: Wed, 20 Feb 2019 13:15:55 +1100
Message-ID: <20190220131555.15317a39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PVmk/xY08i5Nb.lRcC+fPGh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/PVmk/xY08i5Nb.lRcC+fPGh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build
(powerpc_ppc64_defconfig) produced this warning:

In file included from include/linux/blkdev.h:21,
                 from include/linux/blk-mq.h:5,
                 from drivers/md/dm-core.h:14,
                 from drivers/md/dm.c:8:
drivers/md/dm.c: In function 'dec_pending':
include/linux/bio.h:626:15: warning: 'bio' may be used uninitialized in thi=
s function [-Wmaybe-uninitialized]
  bio->bi_next =3D bl->head;
  ~~~~~~~~~~~~~^~~~~~~~~~
drivers/md/dm.c:930:14: note: 'bio' was declared here
  struct bio *bio;
              ^~~

Introduced by commit

  58c66b86cfe7 ("dm: improve noclone_endio() to support multipath target")

--=20
Cheers,
Stephen Rothwell

--Sig_/PVmk/xY08i5Nb.lRcC+fPGh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxsuFsACgkQAVBC80lX
0GwpLQgAiHux41yYTJ7TJsVOCUAyNKhkgVpAJJ7PmKZHgqBSx9ev+FfRCeynGzNE
wGAzX5wuZUprPB1+evEZK5u6LWlW+vn+OnnwpAQznJpIsD03WkuSFODq+KTfnoVq
T+tyZsL2aZloBC0CV0wWBj/ZJ40EO5O/uuauPWLobuw1ot+wMHI+Cid1RuE4V0hU
gpreP5sB8qbKnpAqq55pQpfKN6g+qQIEqUTd9tFesqPeiWSMRKs1vBKdUewQir8j
B12qXrE7+AhmNh8cHzxQwNDgXHmgSj1enWgVYEKQWD/i1LBz5c71o+kGoBTb/h6s
6JVeFtBaoMop602l/nNm/ovd7Nx/9w==
=+D6c
-----END PGP SIGNATURE-----

--Sig_/PVmk/xY08i5Nb.lRcC+fPGh--
