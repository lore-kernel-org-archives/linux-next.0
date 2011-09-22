From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Thu, 22 Sep 2011 13:12:32 +1000
Message-ID: <20110922131232.56210b544f587210621ae339@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_Sep_2011_13_12_32_+1000_q6ggys1SmU1IFUO5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__22_Sep_2011_13_12_32_+1000_q6ggys1SmU1IFUO5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/dt3155v4l/dt3155v4l.c: In function 'dt3155_start_acq':
drivers/staging/dt3155v4l/dt3155v4l.c:210:2: error: implicit declaration of=
 function 'vb2_dma_contig_plane_paddr'
drivers/staging/dt3155v4l/dt3155v4l.c: At top level:
drivers/staging/dt3155v4l/dt3155v4l.c:321:2: warning: initialization from i=
ncompatible pointer type
drivers/staging/dt3155v4l/dt3155v4l.c:325:2: warning: initialization from i=
ncompatible pointer type

Casued by commit ba7fcb0c9549 ("[media] media: vb2: dma contig allocator:
use dma_addr instread of paddr").

I have used the v4l-dvb tree from next-20110921 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_Sep_2011_13_12_32_+1000_q6ggys1SmU1IFUO5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOeqegAAoJEDMEi1NhKgbsKeoIAI+H/i4cPScrKZDLkcuzFYqQ
HuVmCTj5FoO1zSRxYnqU0HhKIcYdO1DPPPjhRsd4qlNhB0Kc3xp/1RxLjbGCLucx
Np3o4BFlk4q4+CDac+NNvttMXTdtIbAsRrNa7ZCMno8W2m63/RWHq7GDVpuAZK+C
o4WLUYpZA6QlDP2PBVUia5k0/SvszhNMbPA1n6KAeeZ7qwNWs9ceqxvO0hRjdsMw
ifT4kD5imAWghMLXtXxA0xoVMDMDvdOYAUVwwYOew65fXF31zo0kFOXb8RcoeMYW
fGzommtgGR6GEpIiVxb1XWR47uRlQ6KJ6KJfODf2crQlT/9x5Oc7iT1+dD5DLzU=
=rVP7
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Sep_2011_13_12_32_+1000_q6ggys1SmU1IFUO5--
