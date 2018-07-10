From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rdma tree
Date: Tue, 10 Jul 2018 11:28:31 +1000
Message-ID: <20180710112831.40add0eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JTUXcpEHUhp==jV4n4.f5.m"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JTUXcpEHUhp==jV4n4.f5.m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/linux/kernel.h:14:0,
                 from include/asm-generic/bug.h:18,
                 from arch/powerpc/include/asm/bug.h:128,
                 from include/linux/bug.h:5,
                 from arch/powerpc/include/asm/mmu.h:126,
                 from arch/powerpc/include/asm/lppaca.h:36,
                 from arch/powerpc/include/asm/paca.h:21,
                 from arch/powerpc/include/asm/current.h:16,
                 from include/linux/mutex.h:14,
                 from drivers/infiniband/hw/cxgb4/iw_cxgb4.h:34,
                 from drivers/infiniband/hw/cxgb4/cq.c:33:
drivers/infiniband/hw/cxgb4/cq.c: In function '__c4iw_poll_cq_one':
include/linux/printk.h:308:2: warning: 'cqe.header' may be used uninitializ=
ed in this function [-Wmaybe-uninitialized]
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
  ^~~~~~
drivers/infiniband/hw/cxgb4/cq.c:674:16: note: 'cqe.header' was declared he=
re
  struct t4_cqe cqe;
                ^~~

Introduced by commit

  4ab39e2f98f2 ("RDMA/cxgb4: Make c4iw_poll_cq_one() easier to analyze")

I can't tell easily if this is a false positive or not.

--=20
Cheers,
Stephen Rothwell

--Sig_/JTUXcpEHUhp==jV4n4.f5.m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltEC78ACgkQAVBC80lX
0GyPCAf+IqZk0Sv0KxNnHkDKpk02JHcaxI5+FeOlTfNvhD6i0LUgK6fsviV7NN8M
XE71jz0hsPeywZLRKw8A3WP0xAcN9F1EolfG5pBXkdHIQ0s/HMziLT9qplBREqAt
HkkMgEXX8BBYIObUGF8B73GrEqHRLbeYf7cZtExepvOMLZeFEp2mCzliKpFJuFjc
FIYAZmob6kM77Ns6WlpEmhy80mOkvFNALsSf5dN8+p17kN3PEbE74YQhxBDc4cFI
XP7mlhaD8sFI9abFVh1jwj807615nMe8xi4Jur3LJI+g0miHdOiMKi7mod1jioQ/
Twvb57Xnqk1sdMkIp/4cvlkacCcXew==
=HGmh
-----END PGP SIGNATURE-----

--Sig_/JTUXcpEHUhp==jV4n4.f5.m--
