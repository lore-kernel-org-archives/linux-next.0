From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Wed, 2 Jan 2019 12:32:28 +1100
Message-ID: <20190102123228.67892bdb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zedF5+EIlAP=nTj/6pwVMue"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Tejun Heo <tj@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/zedF5+EIlAP=nTj/6pwVMue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  kernel/cgroup/cgroup-v1.c

between commit:

  3fc9c12d27b4 ("cgroup: Add named hierarchy disabling to cgroup_no_v1 boot=
 param")

from Linus' tree and commit:

  b3678086951a ("kernfs, sysfs, cgroup, intel_rdt: Support fs_context")

from the vfs tree.

Its a pity that the former commit did not appear until after the merge
window opened.  :-(

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/cgroup/cgroup-v1.c
index 583b969b0c0e,4b189e821cad..000000000000
--- a/kernel/cgroup/cgroup-v1.c
+++ b/kernel/cgroup/cgroup-v1.c
@@@ -1003,17 -968,91 +971,94 @@@ int cgroup1_parse_param(struct fs_conte
  				continue;
 =20
  			/* Mutually exclusive option 'all' + subsystem name */
- 			if (all_ss)
- 				return -EINVAL;
- 			opts->subsys_mask |=3D (1 << i);
- 			one_ss =3D true;
+ 			if (ctx->all_ss)
+ 				return cg_invalf(fc, "cgroup1: subsys name conflicts with all");
+ 			ctx->subsys_mask |=3D (1 << i);
+ 			ctx->one_ss =3D true;
+ 			return 0;
+ 		}
 =20
- 			break;
+ 		return cg_invalf(fc, "cgroup1: Unknown subsys name '%s'", param->key);
+ 	}
+ 	if (opt < 0)
+ 		return opt;
+=20
+ 	switch (opt) {
+ 	case Opt_none:
+ 		/* Explicitly have no subsystems */
+ 		ctx->none =3D true;
+ 		return 0;
+ 	case Opt_all:
+ 		/* Mutually exclusive option 'all' + subsystem name */
+ 		if (ctx->one_ss)
+ 			return cg_invalf(fc, "cgroup1: all conflicts with subsys name");
+ 		ctx->all_ss =3D true;
+ 		return 0;
+ 	case Opt_noprefix:
+ 		ctx->flags |=3D CGRP_ROOT_NOPREFIX;
+ 		return 0;
+ 	case Opt_clone_children:
+ 		ctx->cpuset_clone_children =3D true;
+ 		return 0;
+ 	case Opt_cpuset_v2_mode:
+ 		ctx->flags |=3D CGRP_ROOT_CPUSET_V2_MODE;
+ 		return 0;
+ 	case Opt_xattr:
+ 		ctx->flags |=3D CGRP_ROOT_XATTR;
+ 		return 0;
+ 	case Opt_release_agent:
+ 		/* Specifying two release agents is forbidden */
+ 		if (ctx->release_agent)
+ 			return cg_invalf(fc, "cgroup1: release_agent respecified");
+ 		ctx->release_agent =3D param->string;
+ 		param->string =3D NULL;
+ 		if (!ctx->release_agent)
+ 			return -ENOMEM;
+ 		return 0;
+=20
+ 	case Opt_name:
++		/* blocked by boot param? */
++		if (cgroup_no_v1_named)
++			return cg_invalf(fc, "cgroup1: Blocked by boot paramter");
+ 		/* Can't specify an empty name */
+ 		if (!param->size)
+ 			return cg_invalf(fc, "cgroup1: Empty name");
+ 		if (param->size > MAX_CGROUP_ROOT_NAMELEN - 1)
+ 			return cg_invalf(fc, "cgroup1: Name too long");
+ 		/* Must match [\w.-]+ */
+ 		for (i =3D 0; i < param->size; i++) {
+ 			char c =3D param->string[i];
+ 			if (isalnum(c))
+ 				continue;
+ 			if ((c =3D=3D '.') || (c =3D=3D '-') || (c =3D=3D '_'))
+ 				continue;
+ 			return cg_invalf(fc, "cgroup1: Invalid name");
  		}
- 		if (i =3D=3D CGROUP_SUBSYS_COUNT)
- 			return -ENOENT;
+ 		/* Specifying two names is forbidden */
+ 		if (ctx->name)
+ 			return cg_invalf(fc, "cgroup1: name respecified");
+ 		ctx->name =3D param->string;
+ 		param->string =3D NULL;
+ 		return 0;
  	}
 =20
+ 	return 0;
+ }
+=20
+ /*
+  * Validate the options that have been parsed.
+  */
+ static int cgroup1_validate(struct fs_context *fc)
+ {
+ 	struct cgroup_fs_context *ctx =3D cgroup_fc2context(fc);
+ 	struct cgroup_subsys *ss;
+ 	u16 mask =3D U16_MAX;
+ 	int i;
+=20
+ #ifdef CONFIG_CPUSETS
+ 	mask =3D ~((u16)1 << cpuset_cgrp_id);
+ #endif
+=20
  	/*
  	 * If the 'all' option was specified select all the subsystems,
  	 * otherwise if 'none', 'name=3D' and a subsystem name options were

--Sig_/zedF5+EIlAP=nTj/6pwVMue
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwsFK0ACgkQAVBC80lX
0GwL1gf/YL0Zs2VpoNeGXBa0AZRHyBhFgryB8xqqAJxONLiSBL6wkuLRwMYrWv/5
SITPBcMrhDwqOXynao3yPet/PQBKE5axMksQhpt0V+3qRvp5s2mfZ6+e+6ktX2gC
pCcCjtMlnLaYQ2Oj5ycWnRX5IcYDid38pLtL47kvQ9aMSYObuGR3VLBbHQsecqmM
/buHqnemsztayerpoUztLRfNH64/6bAYchb9TYwJd8//fmVNzCas7fgqPVvfuM92
tVQgGjje5xbRHqMReqQt7ZG8Lh+g+FsH9vDUHoSVQ6/JynkJC83eroq1KTF1eevd
AGNSWadWjCMUvW/9yhISA3y72PlsFw==
=QdGV
-----END PGP SIGNATURE-----

--Sig_/zedF5+EIlAP=nTj/6pwVMue--
