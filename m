From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the vfs tree
Date: Fri, 22 Jun 2018 11:53:46 +1000
Message-ID: <20180622115346.1e9cc433@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PtLXaja3U9+9ULz58XqSlfI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/PtLXaja3U9+9ULz58XqSlfI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/cpu/intel_rdt_rdtgroup.c

between commit:

  58e4e43911f8 ("kernfs, sysfs, cgroup, intel_rdt: Support fs_context")

from the vfs tree and commit:

  a3dbd01e6c9d ("x86/intel_rdt: Create character device exposing pseudo-loc=
ked region")

from the tip tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
index 38a54f56ff40,7b4a09d81a30..000000000000
--- a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
+++ b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
@@@ -1270,9 -1861,16 +1842,15 @@@ static int rdt_get_tree(struct fs_conte
  		rdtgroup_default.mon.mon_data_kn =3D kn_mondata;
  	}
 =20
+ 	ret =3D rdt_pseudo_lock_init();
+ 	if (ret) {
+ 		dentry =3D ERR_PTR(ret);
+ 		goto out_mondata;
+ 	}
+=20
 -	dentry =3D kernfs_mount(fs_type, flags, rdt_root,
 -			      RDTGROUP_SUPER_MAGIC, NULL);
 -	if (IS_ERR(dentry))
 +	ret =3D kernfs_get_tree(fc);
 +	if (ret < 0)
- 		goto out_mondata;
+ 		goto out_psl;
 =20
  	if (rdt_alloc_capable)
  		static_branch_enable_cpuslocked(&rdt_alloc_enable_key);

--Sig_/PtLXaja3U9+9ULz58XqSlfI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlssVqoACgkQAVBC80lX
0Gxz9wf9HJ/dniTuD4KSfg5FhxNVN8J2WYddbbX0+HVTdf+qqBJb2DEJnywtETaN
2TlMKIhYfwa1rM4s9BJh+vgpGLv2HQQPMKIkvCJfRgV7u2RyagvC/gzf7fLcfwyU
Mz9hz+mZS3BmEgIi5htcDb30q0OWeIKxuxf0q6Z+QY3y0N9IS2FYRQZP1/DBDnLw
k2BDueq/gNKMh8sbBGRnjG697+EOcPwS4KfDbHxvBNbySvTkxNRWe+4GbTZA4DAd
MinhfKmG5r/NDqdHq1+AyMm1EPK364ekuoW9NgzUFVgpb5du0WueS9h0hsGLVBgJ
XB35mIaocLdgiYENlxcbLaMoeYJaAQ==
=pBJf
-----END PGP SIGNATURE-----

--Sig_/PtLXaja3U9+9ULz58XqSlfI--
