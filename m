From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.20-rc1)
Date: Thu, 8 Nov 2018 15:40:36 +1100
Message-ID: <20181108154036.69bc4e0f@canb.auug.org.au>
References: <CAHk-=whDiwASMgw8Q7TNA2MJhf3s=ouK4+_3ioqmobs-yagnkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CyxnKmrtWcX5cokb8GQEwO7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHk-=whDiwASMgw8Q7TNA2MJhf3s=ouK4+_3ioqmobs-yagnkQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/CyxnKmrtWcX5cokb8GQEwO7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20181019 was the last linux-next before
the merge window opened.)

Commits in v4.20-rc1 (relative to v4.19):          12125
Commits in next-20181019:                          11296
Commits with the same SHA1:                        10466
Commits with the same patch_id:                      526 (1)
Commits with the same subject line:                   56 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20181019:     11048 91%

Some breakdown of the list of extra commits (relative to next-20181019)
in -rc1:

Top ten first word of commit summary:

     86 net
     60 powerpc
     56 perf
     54 media
     36 drm
     33 pci
     32 thermal
     32 bpf
     23 ubifs
     21 selftests

Top ten authors:

     36 hans.verkuil@cisco.com
     28 darrick.wong@oracle.com
     28 acme@redhat.com
     25 dhowells@redhat.com
     24 s.hauer@pengutronix.de
     23 christophe.leroy@c-s.fr
     21 kishon@ti.com
     21 davem@davemloft.net
     21 daniel@iogearbox.net
     21 bvanassche@acm.org

Top ten commiters:

    161 davem@davemloft.net
     72 mpe@ellerman.id.au
     65 acme@redhat.com
     54 mchehab+samsung@kernel.org
     41 edubezval@gmail.com
     33 lorenzo.pieralisi@arm.com
     32 broonie@kernel.org
     31 hch@lst.de
     31 ast@kernel.org
     29 richard@nod.at

There are also 250 commits in next-20181019 that didn't make it into
v4.20-rc1.

Top ten first word of commit summary:

     28 vfs
     21 mm
     18 leaking_addresses
     14 arm
     11 nfc
     10 interconnect
     10 btrfs
      9 xtensa
      7 arm-soc
      6 drm

Top ten authors:

     38 dhowells@redhat.com
     19 akpm@linux-foundation.org
     18 me@tobin.cc
     11 arnd@arndb.de
      9 jcmvbkbc@gmail.com
      9 georgi.djakov@linaro.org
      7 nborisov@suse.com
      6 hannes@cmpxchg.org
      5 wens@csie.org
      5 sfr@canb.auug.org.au

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

     75 sfr@canb.auug.org.au
     40 dhowells@redhat.com
     18 me@tobin.cc
     13 georgi.djakov@linaro.org
     11 sameo@linux.intel.com
     10 dsterba@suse.com
      9 shuah@kernel.org
      9 jcmvbkbc@gmail.com
      7 paulmck@linux.vnet.ibm.com
      7 maxime.ripard@bootlin.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/CyxnKmrtWcX5cokb8GQEwO7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvjvkQACgkQAVBC80lX
0Gx0jQf/WVVgd88XcTxwzllA3kRr0jt5GMD/mkg/uXP+nZtiR54Gz2cFTnUdGN2j
2486eMFuK71qFgnfUJfHic7IVNxKq9mxiRN50fU0Vw2lEMlbqzLHqYKdDgKvN7Vv
+uIEWQm4xlkcnmIATnkN24uUAy/8qxV/R6s0Q+VgCTXS4XpOzO2gyFjD/Pe5+X8u
Gcovn5N1STtwDEmzqV/aD+5GNY2uGwxkLhxSed5gKDtGcHbdn7vy/y5gnvAwvFBd
PQtigP6g9DgJOtpQ8K3C8f7fHYhzDpyRfjZMc2HmV9+WmuIVL0dz7s+snRMKQwsb
0Q8ucCRVxo5GIxwrn3BBxNIumH2peA==
=6RZg
-----END PGP SIGNATURE-----

--Sig_/CyxnKmrtWcX5cokb8GQEwO7--
