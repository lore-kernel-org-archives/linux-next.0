From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 15 Apr 2019 13:00:24 +1000
Message-ID: <20190415130024.68c7d2a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ATFa4udzLKNS5bup8du0UJW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Valente <paolo.valente@linaro.org>, Angelo Ruocco <angelo.ruocco.90@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ATFa4udzLKNS5bup8du0UJW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/bfq-iosched.c

between commit:

  eed47d19d936 ("block, bfq: fix use after free in bfq_bfqq_expire")

from Linus' tree and commit:

  636b8fe86bed ("block, bfq: fix some typos in comments")

from the block tree.

I fixed it up (the former included the fix from the latter, so I just
used that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ATFa4udzLKNS5bup8du0UJW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyz88gACgkQAVBC80lX
0GywfAf+KbwkCrTCbinmBRefg3wBXGBhL/foeJto9yn4RdmaBH4NVabje/mZeWrZ
lWxPgRWWrz+xHAo6i7VSk/JmRuzajQVHYrh9LMNGW2n9kwqLRswT8U8NzUJRz0pf
3FxLrIorHYGtUZKwghLDi2/OcYxxuKSwAd87R9tmPq+XOtiFOztko/1jYbK/mQ85
++fVEEgKh7zgGDrqkgMGcwt8ALZWAUYPtdMPCsa2DCHDpQYmoopd6GKgZTPrenEA
XeR8mW4AfsXCEuNkTo89Qv9vMmqd4QT96I259gVuf6Z6E13uCBgpSUjaXaN0DRUH
Cei09jHfXJu5m240GVMmD5V6qLAhRw==
=yonb
-----END PGP SIGNATURE-----

--Sig_/ATFa4udzLKNS5bup8du0UJW--
