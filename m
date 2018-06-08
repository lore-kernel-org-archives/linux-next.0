From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 8 Jun 2018 14:45:30 +1000
Message-ID: <20180608144530.782d7aee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7UF87IhDa62mIJnFa_Z=6bY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
List-Id: linux-next.vger.kernel.org

--Sig_/7UF87IhDa62mIJnFa_Z=6bY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from fs/fat/inode.c:24:0:
fs/fat/inode.c: In function '__fat_get_block':
fs/fat/inode.c:163:9: warning: format '%ld' expects argument of type 'long =
int', but argument 5 has type 'sector_t {aka long long unsigned int}' [-Wfo=
rmat=3D]
         "invalid FAT chain (i_pos %lld, last_block %ld)",
         ^
fs/fat/fat.h:397:24: note: in definition of macro 'fat_fs_error'
  __fat_fs_error(sb, 1, fmt , ## args)
                        ^~~

Introduced by commit

  3bdac70a1921 ("fat: use fat_fs_error() instead of BUG_ON() in __fat_get_b=
lock()")

--=20
Cheers,
Stephen Rothwell

--Sig_/7UF87IhDa62mIJnFa_Z=6bY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsaCeoACgkQAVBC80lX
0GyKVwf9HyNfDYXAt0Rc8u0Lm3gAVLRK8J8HF3k1OD3prNhlAUOheDD35kbD88Jv
GYhzbzrDeH7eAahSXaHt/5rCrSObX5dPz0F4SX1LrMwPwY3ll8DkfJrig8w0CujZ
KFTkL/gm5R51Hak5fdTVaPR9Nz3o30unbxqIu/abwY88mVoJaU20me0QWMUDLVQj
mkKrq3bJd6d0frubilUHNOnWXjZZSRHmugNiuOkr9GKXa5YabGegBXfLMLbtNRaJ
k/LLIznRh9/Z7AeO6UbmYJMW0EwoeTbO/CGBiR19S6dUZXGajQ6yTjdEWy00O31x
+qtFo/JheKXMA3sHQ0zcAb3CvsP+UQ==
=YGvW
-----END PGP SIGNATURE-----

--Sig_/7UF87IhDa62mIJnFa_Z=6bY--
