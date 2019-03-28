From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 5.1-rc1)
Date: Fri, 29 Mar 2019 10:47:11 +1100
Message-ID: <20190329104711.12718e5a@canb.auug.org.au>
References: <CAHk-=wj1c_Tb-wwM6qaPLdggXtW3rOh1JzYUOs+O7PsHt-=+jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bUmv7_/x3SXNwr=7WGREpV0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wj1c_Tb-wwM6qaPLdggXtW3rOh1JzYUOs+O7PsHt-=+jg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/bUmv7_/x3SXNwr=7WGREpV0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20190304 was the first linux-next after
the merge window opened.)

Commits in v5.1-rc1 (relative to v5.0):            11241
Commits in next-20190304:                          10955
Commits with the same SHA1:                        10131
Commits with the same patch_id:                      375 (1)
Commits with the same subject line:                   39 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20190304:     10545 93%

Some breakdown of the list of extra commits (relative to next-20190304)
in -rc1:

Top ten first word of commit summary:

     69 net
     43 perf
     30 drm
     24 scsi
     18 kbuild
     18 cifs
     17 platform
     16 sunrpc
     15 tracing
     15 pwm

Top ten authors:

     39 trond.myklebust@hammerspace.com
     30 arnd@arndb.de
     21 yamada.masahiro@socionext.com
     14 alexandre.belloni@bootlin.com
     12 vadimp@mellanox.com
     12 mchehab+samsung@kernel.org
     12 kjlu@umn.edu
     11 lsahlber@redhat.com
     11 evan.quan@amd.com
     10 stfrench@microsoft.com

Top ten commiters:

    143 davem@davemloft.net
     41 trond.myklebust@hammerspace.com
     35 acme@redhat.com
     28 yamada.masahiro@socionext.com
     28 stfrench@microsoft.com
     24 torvalds@linux-foundation.org
     23 martin.petersen@oracle.com
     23 alexander.deucher@amd.com
     22 rafael.j.wysocki@intel.com
     21 axboe@kernel.dk

There are also 410 commits in next-20190304 that didn't make it into
v5.1-rc1.

Top ten first word of commit summary:

     41 mm
     23 scsi
     23 btrfs
     22 arm
     20 xtensa
     13 dt-bindings
     12 nvmem
     12 clocksource
     11 nfc
     10 dm

Top ten authors:

     32 gustavo@embeddedor.com
     20 akpm@linux-foundation.org
     18 jcmvbkbc@gmail.com
     12 wqu@suse.com
     12 stefan.wahren@i2se.com
     10 jglisse@redhat.com
      8 logang@deltatee.com
      8 claudiu.beznea@microchip.com
      8 arnd@arndb.de
      7 snitzer@redhat.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    125 sfr@canb.auug.org.au
     24 gustavo@embeddedor.com
     24 dsterba@suse.com
     23 jcmvbkbc@gmail.com
     18 srinivas.kandagatla@linaro.org
     18 daniel.lezcano@linaro.org
     14 mst@redhat.com
     12 stefan.wahren@i2se.com
     11 sameo@linux.intel.com
     10 vgupta@synopsys.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).
--=20
Cheers,
Stephen Rothwell

--Sig_/bUmv7_/x3SXNwr=7WGREpV0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlydXP8ACgkQAVBC80lX
0GwtEQf/WC/9sHySpboyxsYXmzQm4Qm3NakchAGUZkjwnui8wf738j9K7nxl+NyS
5igffjsJ3SyWcVXEbUbKr1hGYK/z2JmKBBUKsJddtZzclpv1+M5g1jUXROygQ3vw
Y+ydOx3FZUpJpD9rmxPcPhBSTD0jVO2+FPejAakAjXSwX2c2ip6Y1ABS4gwWRlhx
he94+/+2CH2/jI9E7H90UO5WNQ54ggvf1VDNXWdY/7lUN61MxoRs9NdUHLPS1fwY
/J+UPxhGtM3jvAKilZ13uPe+m2TbghzNLZGG6om9zTbAVKHIa44TN4FMBstQ+tfv
N9Kh/sj7n1++JI7E6SEWT3INIUt1/A==
=GnVu
-----END PGP SIGNATURE-----

--Sig_/bUmv7_/x3SXNwr=7WGREpV0--
