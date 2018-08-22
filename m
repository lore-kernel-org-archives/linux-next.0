From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Thu, 23 Aug 2018 08:35:52 +1000
Message-ID: <20180823083552.6fd372af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mro.6O4w9MnCWFD7==DKJwp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/mro.6O4w9MnCWFD7==DKJwp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ld: failed to merge target specific data of file drivers/input/mouse/alps.o
ld: drivers/input/mouse/byd.o: compiled for a big endian system and target =
is little endian
ld: failed to merge target specific data of file drivers/input/mouse/byd.o

and many, many more like this.

Sorry, I can't easily tell what caused this.

I have used the kbuild tree from next-20180822 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/mro.6O4w9MnCWFD7==DKJwp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt95UgACgkQAVBC80lX
0GzEwQf7BHhPvlz4bMi/xEqfOoEH7Dc6BQAcvfn/1BDSX1JGUJp34An8r40JkG60
ZoN63sP1phqPGPMfrPzMZohMdcnuN480njVruQKKZ3k5MWsb1poHDre4jEPmfReI
/f2hch0bz8XSiHQ1DI3ofeWeFCmk46eSWEdROuv7u4hcQ4GscY3lPSPR3GsSaZmX
zofpnMMu350fXF2FBB6i/w/gj0RA8/1hFmVlpD99B54xNifKzGJcAtIwhIYRoN7h
auer9590Iuo/mWa2A/oviyBmnOF41mO0SsGPnE0xINeKV4S4N9DNlvRdOg5DOG6U
7MRBy0rBXZvr4xkO5akvmeSWv6ctmA==
=mStA
-----END PGP SIGNATURE-----

--Sig_/mro.6O4w9MnCWFD7==DKJwp--
