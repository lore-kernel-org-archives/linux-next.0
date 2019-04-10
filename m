From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the orangefs tree
Date: Thu, 11 Apr 2019 09:19:47 +1000
Message-ID: <20190411091947.741fa90d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TD_ROFwRk9Q9Bq8gyuRi6Mj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Marshall <hubcap@omnibond.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Brandenburg <martin@omnibond.com>
List-Id: linux-next.vger.kernel.org

--Sig_/TD_ROFwRk9Q9Bq8gyuRi6Mj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

After merging the orangefs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/home/sfr/next/next/fs/orangefs/file.c:438:18: error: initialization of 'vm=
_fault_t (*)(struct vm_fault *)' {aka 'unsigned int (*)(struct vm_fault *)'=
} from incompatible pointer type 'int (*)(struct vm_fault *)' [-Werror=3Din=
compatible-pointer-types]
  .page_mkwrite =3D orangefs_page_mkwrite,
                  ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  c32607e8fc3b ("orangefs: write range tracking")

I have used the orangefs tree from next-20190410 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/TD_ROFwRk9Q9Bq8gyuRi6Mj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyuehMACgkQAVBC80lX
0Gz2dwf/Wh3cZVr6xtLK9sa9G+qy2Tv/uh+KrApbAHRN6CNRJ586lKdMKYfPkkNF
g7vog9xDKOWmGLoLJJ1DZUdleTuf+6QsolBkGJhW+p8/1eeii/+cVnmmwNR9vFJn
rqigYe0aWvxR85A4GqdEqtEMxW1r/QDw0rTdkpGb0mN8mhHAbxQtnBiB/32Ty1S5
GicRROqzafGcgOlt6FVtOOt8kGBRr9bqC9zO1AXR3eZrZj+xMbw38aw2jlZ5BEJB
9uZHS5k2zxiflx53ce3+iF1VmWT2+1ElX4vT9sEw+NYCw3aX1cmWJqm2BJT4/E5q
lfTaxeYP3ZZsJhJ11i+fr6jqgSlP5g==
=snbl
-----END PGP SIGNATURE-----

--Sig_/TD_ROFwRk9Q9Bq8gyuRi6Mj--
