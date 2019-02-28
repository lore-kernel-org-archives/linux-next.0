From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bpf-next tree
Date: Thu, 28 Feb 2019 12:31:36 +1100
Message-ID: <20190228123136.064f94a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KVSuOZSF+iWuksnPHYBlN6u"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/KVSuOZSF+iWuksnPHYBlN6u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bpf-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/sysctl.c:1238:13: error: 'sysctl_bpf_stats_enabled' undeclared here =
(not in a function); did you mean 'sysctl_base_table'?
   .data  =3D &sysctl_bpf_stats_enabled,
             ^~~~~~~~~~~~~~~~~~~~~~~~
             sysctl_base_table

Caused by commit

  492ecee892c2 ("bpf: enable program stats")

CONFIG_BPF=3Dy
# CONFIG_BPF_SYSCALL is not set

I applied the following patch for today, but it should be done
properly. Also this patch leaves proc_dointvec_minmax_bpf_stats() as an
unused function.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 Feb 2019 12:26:58 +1100
Subject: [PATCH] bpf: hack to make "enable program stats" build

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 86e0771352f2..80a70f69cbd5 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1232,7 +1232,6 @@ static struct ctl_table kern_table[] =3D {
 		.extra1		=3D &one,
 		.extra2		=3D &one,
 	},
-#endif
 	{
 		.procname	=3D "bpf_stats_enabled",
 		.data		=3D &sysctl_bpf_stats_enabled,
@@ -1242,6 +1241,7 @@ static struct ctl_table kern_table[] =3D {
 		.extra1		=3D &zero,
 		.extra2		=3D &one,
 	},
+#endif
 #if defined(CONFIG_TREE_RCU) || defined(CONFIG_PREEMPT_RCU)
 	{
 		.procname	=3D "panic_on_rcu_stall",
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/KVSuOZSF+iWuksnPHYBlN6u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx3OfgACgkQAVBC80lX
0GzCGAf/QhBD93TcwOUJMY+JyzbG/g8JY95Ei9jnwYP0XKbhyA7GPVdttmWarXoZ
WLWjmsIWjbU8cI/Am+enJAWJUMclLAlyAprzZOQ7VrI40rN/97VsbsVNKGjOIov9
BbhGrM7J1p87EnlML15KWGewpNxrI+MFSgaZQYukvPx9IPE296ClXT42LFfTuCZW
fi4qqgogxR1nKn/Nl06PXCqxwY3q33VIr83vl/SGvi2xgRP+k2A7ZOhk6loo6WAM
VS4Y+nKeXywnCAlOeX+pjOmbnh4vsHbtMigcXWrnQdPseZknwJcB9oy7Wc3jOJu7
trQUxa69z+Ql8yd2BKbYSrlLkAsjhQ==
=588i
-----END PGP SIGNATURE-----

--Sig_/KVSuOZSF+iWuksnPHYBlN6u--
