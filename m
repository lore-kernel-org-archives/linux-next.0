From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in Linus' tree
Date: Sun, 3 Feb 2019 08:28:03 +1100
Message-ID: <20190203082803.5f7fc82e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WQfnB1TBUNONhsJ5OCl6FnW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianchao Wang <jianchao.w.wang@oracle.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/WQfnB1TBUNONhsJ5OCl6FnW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[Just a reminder for the future.]

Hi all,

In commit

  85bd6e61f34d ("blk-mq: fix a hung issue when fsync")

Fixes tag

  Fixes: bd166ef1 (blk-mq-sched: add framework for MQ capable IO schedulers)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/WQfnB1TBUNONhsJ5OCl6FnW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxWC2MACgkQAVBC80lX
0GwuIAgAk2onIopY2IFHDyz3J32pg835WL186IdxMJ/R8MhRXl1HI01AFQnCR5aw
RKpuDzlrlX/yBIHFPI3ZacaD38VgPfA7QGsR9smSUSF/WtGJBQXgAHVw4AxC+cMM
rKIZdh2O7UBU1ICLXTxLpeiV18N1nqR9Pmi1ZeUBBJGqNlc6/y2dVptg6YbPCbHH
hFEVLrCv4mwpWxBQArF0Mvtw/P/7AdnUnrAv/Bo21/WsVOd9623OBy2RzeFg/rFY
bnW7NqVeNCrFh5PUbtP6tH/WHBpJSEvxOL32tmjG/qYrPw46LL2h01P2meqAA0pM
EbXh5N1FKZEym5CpyBX8unIiNYWHrQ==
=6IJF
-----END PGP SIGNATURE-----

--Sig_/WQfnB1TBUNONhsJ5OCl6FnW--
