From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats
Date: Mon, 20 May 2019 13:37:51 +1000
Message-ID: <20190520133751.5e47cde8@canb.auug.org.au>
References: <CAHk-=wgxi6fnxZ+p5Zdqr-i4s=xhOCBJL6s_RauYkjxM2CpXeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Dlg4REijNlevxIC6yrJ+w7o"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wgxi6fnxZ+p5Zdqr-i4s=xhOCBJL6s_RauYkjxM2CpXeA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Dlg4REijNlevxIC6yrJ+w7o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20190507 was the first linux-next after
the merge window opened.)

Commits in v5.2-rc1 (relative to v5.1):            12064
Commits in next-20190507:                          11388
Commits with the same SHA1:                        10638
Commits with the same patch_id:                      350 (1)
Commits with the same subject line:                   61 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20190507:     11049 91%

Some breakdown of the list of extra commits (relative to next-20190507)
in -rc1:

Top ten first word of commit summary:

     58 net
     46 afs
     44 perf
     35 kvm
     35 drm
     34 x86
     34 tools
     33 documentation
     25 thermal
     23 drivers

Top ten authors:

     50 dhowells@redhat.com
     28 yamada.masahiro@socionext.com
     28 tstoyanov@vmware.com
     27 changbin.du@intel.com
     21 amit.kucheria@linaro.org
     20 jlayton@kernel.org
     16 hch@lst.de
     15 bgolaszewski@baylibre.com
     14 deller@gmx.de
     13 yuehaibing@huawei.com

Top ten commiters:

    105 davem@davemloft.net
     73 acme@redhat.com
     59 edubezval@gmail.com
     50 lee.jones@linaro.org
     50 dhowells@redhat.com
     42 pbonzini@redhat.com
     31 yamada.masahiro@socionext.com
     31 jgg@ziepe.ca
     31 corbet@lwn.net
     29 idryomov@gmail.com

There are also 339 commits in next-20190507 that didn't make it into
v5.2-rc1.

Top ten first word of commit summary:

     27 drm
     20 xtensa
     20 mm
     20 arm
     19 nvmem
     19 i2c
     15 selftests
     14 ntb
     11 nfc
     10 arm64

Top ten authors:

     18 jcmvbkbc@gmail.com
     17 akpm@linux-foundation.org
     12 wsa+renesas@sang-engineering.com
     12 evan.quan@amd.com
     10 stefan.wahren@i2se.com
     10 linux@rasmusvillemoes.dk
      9 zohar@linux.ibm.com
      9 logang@deltatee.com
      7 jean-philippe.brucker@arm.com
      6 tadeusz.struk@intel.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    103 sfr@canb.auug.org.au
     23 jcmvbkbc@gmail.com
     23 alexander.deucher@amd.com
     22 srinivas.kandagatla@linaro.org
     15 wsa@the-dreams.de
     15 jarkko.sakkinen@linux.intel.com
     14 jdmason@kudzu.us
     12 stefan.wahren@i2se.com
     11 sameo@linux.intel.com
     11 mst@redhat.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/Dlg4REijNlevxIC6yrJ+w7o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlziIQ8ACgkQAVBC80lX
0GyOQgf/YUoXTvaZGZwRATywOYhHagZDDl2GHSe9N9lJMOxdzSzFdYK0ydsAMk/x
T9FGQBWSj0FO6UxkQ7vVVpLZ7Xe7MCjkRkkQqqwUqnkqEMkkM7ESQz/uecVSZLCn
LjqGKIY7ZAO4ZeX64N8tD2wWlhHDkUp8V0rrchT5jO4I9SskfwPDx6+fBn7gTyhk
m/ld1DcnvT/qT4uAtP3h5H7YY8/7PcisnOALXcmo1FKlsRUsGPjp3yC9+o/SHf3W
MyeBHGhgYO7R6hG5u5HYsHGmN+8ZGYWQt06rGSLRqMkTmEBtxPNLO/kDylx72our
WlGXzldIQZjNPXqCgXR47gIYMSqnkQ==
=uKbi
-----END PGP SIGNATURE-----

--Sig_/Dlg4REijNlevxIC6yrJ+w7o--
