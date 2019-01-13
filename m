From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the vfs-fixes tree
Date: Mon, 14 Jan 2019 10:27:53 +1100
Message-ID: <20190114102753.1bf83b5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/77eBvyHVTzbBN4F7m=pcuRj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/77eBvyHVTzbBN4F7m=pcuRj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  kernel/cgroup/cgroup-internal.h

between commit:

  61aa329d0762 ("cgroup: saner refcounting for cgroup_root")

from the vfs-fixes tree and commit:

  b3678086951a ("kernfs, sysfs, cgroup, intel_rdt: Support fs_context")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/cgroup/cgroup-internal.h
index c9a35f09e4b9,ff86943ea1c8..000000000000
--- a/kernel/cgroup/cgroup-internal.h
+++ b/kernel/cgroup/cgroup-internal.h
@@@ -197,12 -213,10 +215,10 @@@ int cgroup_path_ns_locked(struct cgrou
  			  struct cgroup_namespace *ns);
 =20
  void cgroup_free_root(struct cgroup_root *root);
- void init_cgroup_root(struct cgroup_root *root, struct cgroup_sb_opts *op=
ts);
+ void init_cgroup_root(struct cgroup_fs_context *ctx);
 -int cgroup_setup_root(struct cgroup_root *root, u16 ss_mask, int ref_flag=
s);
 +int cgroup_setup_root(struct cgroup_root *root, u16 ss_mask);
  int rebind_subsystems(struct cgroup_root *dst_root, u16 ss_mask);
- struct dentry *cgroup_do_mount(struct file_system_type *fs_type, int flag=
s,
- 			       struct cgroup_root *root, unsigned long magic,
- 			       struct cgroup_namespace *ns);
+ int cgroup_do_get_tree(struct fs_context *fc);
 =20
  int cgroup_migrate_vet_dst(struct cgroup *dst_cgrp);
  void cgroup_migrate_finish(struct cgroup_mgctx *mgctx);

--Sig_/77eBvyHVTzbBN4F7m=pcuRj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw7yXkACgkQAVBC80lX
0Gy/ywf+IqeuMx52pBL5lYTdZw8OG776f5pjOQZNpKAS6DcpNYRmiKlZLGWe/N19
x5uN4NDkPFaj+yxJdc+JSJOimfsaPQuaAHcr7hSKb+V4WDI7bXMigYjimj80q8X/
OU1naSyP0HPhm5VQ/eV3IiKGsGSpzfZWgUJdEO8lK2Eoaxid431ejA57Y5myA+Ut
AYv5SPZBGSNDi1ltWnmlM/PjTaCVQmimrxw3gZbY876rzkIlwcDwTzmVE9iCDM9B
oAhO0+HrEUwAtPdWkXfdc5yCQ0yASPPvTUzeTz2JEEV+4j7Ja5MVfwqh3PwP3vLq
Pmx0V90NLId23W/YL7JQ31tHGvBDlg==
=CPO8
-----END PGP SIGNATURE-----

--Sig_/77eBvyHVTzbBN4F7m=pcuRj--
