From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the block tree
Date: Fri, 28 Sep 2018 11:11:24 +1000
Message-ID: <20180928111124.745bf2ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yy6YmAVRty.sLu=Rb/Trb_I"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/yy6YmAVRty.sLu=Rb/Trb_I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

block/kyber-iosched.c:84:22: warning: integer overflow in expression of typ=
e 'long int' results in '705032704' [-Woverflow]
  [KYBER_DISCARD] =3D 5 * NSEC_PER_SEC,
                      ^

Introduced by commit

  6e25cb01ea20 ("kyber: implement improved heuristics")

--=20
Cheers,
Stephen Rothwell

--Sig_/yy6YmAVRty.sLu=Rb/Trb_I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlutf7wACgkQAVBC80lX
0Gw2cAf8CBp4h61SdtashYNOUgegNNUqSD9vgcS7M0XbjqkFXrICt6WZIVq5nohG
ewKe9e5TgHAuVRjGn5GxeYuNqZnEMPdfI2DsIFQSctFKWvoejq+9P+woRfcx1mHT
jc2hTjnxO9xGfeHzbXcSqv/knLFfAGUkb24lDycqCi++PTPFuSpAvJcsk4fBsR86
koYkwk8wZVA3vuhjsgdMIkV69Ws2sV/zN6Dq5ajqIz3jvZaNC3zR7hxeB1DLGI1E
byuQzEfWG3ZukfeFC6NkAwNahlYaSHKfBBmXmCb0xF0kJ48bkgHZJSl3PE3KJ1tL
md/v3sLYzPpgrfaTnS1AAXAoLM6NFQ==
=z5wW
-----END PGP SIGNATURE-----

--Sig_/yy6YmAVRty.sLu=Rb/Trb_I--
