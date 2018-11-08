From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the block tree
Date: Thu, 8 Nov 2018 14:31:09 +1100
Message-ID: <20181108143109.7dcc0a3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8Rf2OoNeWgxex_6+iw=vZGy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.com>, Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>, David Miller <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Sig_/8Rf2OoNeWgxex_6+iw=vZGy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (sparc64 defconfig)
produced this warning:

/home/sfr/next/next/drivers/block/sunvdc.c: In function 'init_queue':
/home/sfr/next/next/drivers/block/sunvdc.c:788:6: warning: unused variable =
'ret' [-Wunused-variable]
  int ret;
      ^~~

Introduced by commit

  fa182a1fa97d ("sunvdc: convert to blk-mq")

--=20
Cheers,
Stephen Rothwell

--Sig_/8Rf2OoNeWgxex_6+iw=vZGy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvjrf0ACgkQAVBC80lX
0GwPJgf6AlcFUIap8e6QJGIdYVB0phr2I82HOPXyCtRnDI8+00UHIjuWgapa/OCi
am8sTv6Wt/OeswvbmkTvpCVf1pL7Zl7zb1lV0t7RrtP0k6LFrReepD/8RG/Hp8cq
AobM+9+qSh2CIuehHQzuXHBbsxxN3+KgF04FoSyV4PdUkL90n7uk+6O/5CmjT3Zl
dDOGHZ8XKVfl78MmN7dhq/wyYYi71k0mCKUGkiLqeoEx0MjDp7mabsk1Ome8X2So
rWIp52jE362THoqF0jKQnmEdR9sAsrDFfpyTZ70mwoDNGHfkLUraw/K8BfwHpqco
0RP1YJNs6x151E+1Gs9qq1yXcqsYRA==
=5y6+
-----END PGP SIGNATURE-----

--Sig_/8Rf2OoNeWgxex_6+iw=vZGy--
