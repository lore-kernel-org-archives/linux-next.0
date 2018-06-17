From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.18-rc1)
Date: Sun, 17 Jun 2018 12:34:54 +1000
Message-ID: <20180617123454.155ca9ce@canb.auug.org.au>
References: <CA+55aFw34Dh6p0qAZ_Ja=fjuJ89ojZZTWtmrRPKmB1QuP3C7hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NjJj_VEbnNQWFlMJJdBVzBF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFw34Dh6p0qAZ_Ja=fjuJ89ojZZTWtmrRPKmB1QuP3C7hw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/NjJj_VEbnNQWFlMJJdBVzBF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20180604 was the first linux-next after
the merge window opened.)

Commits in v4.18-rc1 (relative to v4.17):          11594
Commits in next-20180604:                          10962
Commits with the same SHA1:                        10324
Commits with the same patch_id:                      168 (1)
Commits with the same subject line:                   38 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20180604:     10530 90%

Some breakdown of the list of extra commits (relative to next-20180604)
in -rc1:

Top ten first word of commit summary:

     61 f2fs
     54 perf
     54 net
     53 drm
     30 xfs
     23 ib
     22 netfilter
     22 kvm
     19 rdma
     18 treewide

Top ten authors:

     38 acme@redhat.com
     37 yuchao0@huawei.com
     28 keescook@chromium.org
     26 mchehab+samsung@kernel.org
     21 chuck.lever@oracle.com
     20 arnd@arndb.de
     16 rostedt@goodmis.org
     15 darrick.wong@oracle.com
     14 trond.myklebust@hammerspace.com
     14 fred.isaman@gmail.com

Top ten commiters:

    146 davem@davemloft.net
     67 jaegeuk@kernel.org
     54 acme@redhat.com
     47 alexander.deucher@amd.com
     40 trond.myklebust@hammerspace.com
     39 tglx@linutronix.de
     38 torvalds@linux-foundation.org
     38 keescook@chromium.org
     34 mchehab+samsung@kernel.org
     31 idryomov@gmail.com

There are also 432 commits in next-20180604 that didn't make it into
v4.18-rc1.

Top ten first word of commit summary:

     82 rcu
     46 ovl
     36 mm
     24 arm
     22 coresight
     18 nds32
     18 leaking_addresses
     12 vfs
     12 revert
     10 drm

Top ten authors:

     90 paulmck@linux.vnet.ibm.com
     39 mszeredi@redhat.com
     28 vgoyal@redhat.com
     21 akpm@linux-foundation.org
     18 me@tobin.cc
     16 dan.j.williams@intel.com
     13 guro@fb.com
     12 greentime@andestech.com
     11 suzuki.poulose@arm.com
     11 olof@lixom.net

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    104 paulmck@linux.vnet.ibm.com
     87 sfr@canb.auug.org.au
     67 mszeredi@redhat.com
     23 mathieu.poirier@linaro.org
     18 me@tobin.cc
     18 greentime@andestech.com
     14 maxime.ripard@bootlin.com
     11 olof@lixom.net
     11 dan.j.williams@intel.com
      7 p.zabel@pengutronix.de

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/NjJj_VEbnNQWFlMJJdBVzBF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlslyM4ACgkQAVBC80lX
0Gzj/Af/b5B1jhMgTwpjb7UTP6SAS7V7uYiaFPwjs1ejySmvSIVSY+fEyf7ZG6jE
3qmzWlDCei5On2RqFfUJrCiiXfdbKoG60w1ReeNZ9cgX7piAAxh78DlwIkMmcWjT
Qc9hD2q6Z3jZZPgO8jBKs8+THeSaDUcXGAKruudQ/7a+RZOlb3lOn30gyuxCYPPG
RQzulurWihbo1iKJ9qsKCPA060E7msTsHIhwdLgEEUjwVcEkLIP+zCEpaHDvK2Ew
hcUDM7bA8avceAuOfdXv5bomw6kHX76aJFGD4XG4FZ045mzao3eZauiaaiGGJVAF
8d/OfQ81sSxfJd5LcAwvkvWyO+59Ew==
=Qi6b
-----END PGP SIGNATURE-----

--Sig_/NjJj_VEbnNQWFlMJJdBVzBF--
