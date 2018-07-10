From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the rdma tree
Date: Tue, 10 Jul 2018 11:33:42 +1000
Message-ID: <20180710113342.605e53e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/f1b5CFzKy9XM64wKgjeAdmJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/f1b5CFzKy9XM64wKgjeAdmJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

In file included from include/linux/printk.h:336:0,
                 from include/linux/kernel.h:14,
                 from arch/x86/include/asm/percpu.h:45,
                 from arch/x86/include/asm/current.h:6,
                 from include/linux/mutex.h:14,
                 from drivers/infiniband/hw/cxgb4/iw_cxgb4.h:34,
                 from drivers/infiniband/hw/cxgb4/cq.c:33:
drivers/infiniband/hw/cxgb4/cq.c: In function '__c4iw_poll_cq_one':
include/linux/dynamic_debug.h:127:3: warning: 'cqe.u.gen.wrid_hi' may be us=
ed uninitialized in this function [-Wmaybe-uninitialized]
   __dynamic_pr_debug(&descriptor, pr_fmt(fmt), \
   ^~~~~~~~~~~~~~~~~~
drivers/infiniband/hw/cxgb4/cq.c:674:16: note: 'cqe.u.gen.wrid_hi' was decl=
ared here
  struct t4_cqe cqe;
                ^~~
In file included from include/linux/printk.h:336:0,
                 from include/linux/kernel.h:14,
                 from arch/x86/include/asm/percpu.h:45,
                 from arch/x86/include/asm/current.h:6,
                 from include/linux/mutex.h:14,
                 from drivers/infiniband/hw/cxgb4/iw_cxgb4.h:34,
                 from drivers/infiniband/hw/cxgb4/cq.c:33:
include/linux/dynamic_debug.h:127:3: warning: 'cqe.u.gen.wrid_low' may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
   __dynamic_pr_debug(&descriptor, pr_fmt(fmt), \
   ^~~~~~~~~~~~~~~~~~
drivers/infiniband/hw/cxgb4/cq.c:674:16: note: 'cqe.u.gen.wrid_low' was dec=
lared here
  struct t4_cqe cqe;
                ^~~
In file included from include/linux/printk.h:336:0,
                 from include/linux/kernel.h:14,
                 from arch/x86/include/asm/percpu.h:45,
                 from arch/x86/include/asm/current.h:6,
                 from include/linux/mutex.h:14,
                 from drivers/infiniband/hw/cxgb4/iw_cxgb4.h:34,
                 from drivers/infiniband/hw/cxgb4/cq.c:33:
include/linux/dynamic_debug.h:127:3: warning: 'cqe.len' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
   __dynamic_pr_debug(&descriptor, pr_fmt(fmt), \
   ^~~~~~~~~~~~~~~~~~
drivers/infiniband/hw/cxgb4/cq.c:674:16: note: 'cqe.len' was declared here
  struct t4_cqe cqe;
                ^~~

Introduced by commit

  4ab39e2f98f2 ("RDMA/cxgb4: Make c4iw_poll_cq_one() easier to analyze")

Again, I can't easily tell if these are false positives or not.

--=20
Cheers,
Stephen Rothwell

--Sig_/f1b5CFzKy9XM64wKgjeAdmJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltEDPYACgkQAVBC80lX
0GzUVAf9FjuBtyhILSITkzHBuATTHFS9pKAzuQP/CoZqlql23kcZ3z68XJyaKf39
YzILhidXgvA93oqDZCfv9zrbLT0+tPrYhDm64+uQZ/ZJGyELHNd7FsURSUQ1Ind7
mndZvA7bRV5FWJmXFksgEyJXnHVKl4TE9BxEORmhNgZG4yK3ndTkgRqqTXTvHZBN
5cMjorezOA6ichh+6IJZuMQ//ZGR8UHrVMhDBk3+WqDQ3DiUBU+f0ZyxKVxd1WwB
p9/CcikWxr+3o0ALb586cUipP/n414Ef759ig5ZHZk/V8/c09aWXwoB303KeD33q
1GkcIZJ3kktMC7vY81At5jdLiISt9A==
=CqmQ
-----END PGP SIGNATURE-----

--Sig_/f1b5CFzKy9XM64wKgjeAdmJ--
