From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Fri, 30 Nov 2018 16:30:08 +1100
Message-ID: <20181130163008.7d2b213f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zEZ9CCD=V0c1j7VEH4Vzx+Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/zEZ9CCD=V0c1j7VEH4Vzx+Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc_le perf)
failed like this:

bench/numa.c: In function 'bind_to_node':
bench/numa.c:301:21: error: 'NUMA_NO_NODE' undeclared (first use in this fu=
nction); did you mean 'NUMA_NUM_NODES'?
  if (target_node =3D=3D NUMA_NO_NODE) {
                     ^~~~~~~~~~~~
                     NUMA_NUM_NODES
bench/numa.c:301:21: note: each undeclared identifier is reported only once=
 for each function it appears in
bench/numa.c: In function 'bind_to_memnode':
bench/numa.c:342:14: error: 'NUMA_NO_NODE' undeclared (first use in this fu=
nction); did you mean 'NUMA_NUM_NODES'?
  if (node =3D=3D NUMA_NO_NODE)
              ^~~~~~~~~~~~
              NUMA_NUM_NODES
bench/numa.c: In function 'init_thread_data':
bench/numa.c:1366:19: error: 'NUMA_NO_NODE' undeclared (first use in this f=
unction); did you mean 'NUMA_NUM_NODES'?
   td->bind_node =3D NUMA_NO_NODE;
                   ^~~~~~~~~~~~
                   NUMA_NUM_NODES

Caused by patch

  "mm: replace all open encodings for NUMA_NO_NODE"

I applied the following partial revert for today:

=46rom 765f2fd3d18ca1d4d0783b888d127af784929e3e Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 30 Nov 2018 16:26:32 +1100
Subject: [PATCH] partial revert (perf) of "mm: replace all open encodings f=
or NUMA_NO_NODE"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/perf/bench/numa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index e0ad5f1de226..44195514b19e 100644
--- a/tools/perf/bench/numa.c
+++ b/tools/perf/bench/numa.c
@@ -298,7 +298,7 @@ static cpu_set_t bind_to_node(int target_node)
=20
 	CPU_ZERO(&mask);
=20
-	if (target_node =3D=3D NUMA_NO_NODE) {
+	if (target_node =3D=3D -1) {
 		for (cpu =3D 0; cpu < g->p.nr_cpus; cpu++)
 			CPU_SET(cpu, &mask);
 	} else {
@@ -339,7 +339,7 @@ static void bind_to_memnode(int node)
 	unsigned long nodemask;
 	int ret;
=20
-	if (node =3D=3D NUMA_NO_NODE)
+	if (node =3D=3D -1)
 		return;
=20
 	BUG_ON(g->p.nr_nodes > (int)sizeof(nodemask)*8);
@@ -1363,7 +1363,7 @@ static void init_thread_data(void)
 		int cpu;
=20
 		/* Allow all nodes by default: */
-		td->bind_node =3D NUMA_NO_NODE;
+		td->bind_node =3D -1;
=20
 		/* Allow all CPUs by default: */
 		CPU_ZERO(&td->bind_cpumask);
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/zEZ9CCD=V0c1j7VEH4Vzx+Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwAyuAACgkQAVBC80lX
0Gw8jwf/TGAM09PCWuxA17iufNK75CA590m1YTGG1wrNdeoenoM6zZhuXhjiVnMN
V1OiGEsFtNvI0dRQaZ0O2ni8I2ju+FD5HYmVq5quBUfKWdBfc/qokkNsnQnqyP8u
JFHHWeMkxbtio4B6tdcKZb4M1cn8WuPnYsO50Zlm7dqxCvb/w1biETKKNLtJeET1
fEE29IxV20XpwBU70dCtXaVNCHdIbzL36OOzID5rq02YZKpV/KPrddjpdSQGRqNV
9fNdfBS0Ub8K1is48Ns1kUXtMb32nuFMpTWzDKhV5HmlWTYBZ0Bk1YgZ3GAf5EzM
QoP3S5B5EOqMy0N8MWpd9PnDRcnliw==
=qIWt
-----END PGP SIGNATURE-----

--Sig_/zEZ9CCD=V0c1j7VEH4Vzx+Q--
