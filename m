From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Mon, 10 Sep 2018 13:35:25 +1000
Message-ID: <20180910133525.28c5dd20@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HlhqzU84DhyvSzcdPActBVD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/HlhqzU84DhyvSzcdPActBVD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
allyesconfig) failed like this:

samples/vfs/test-fsinfo.c: In function 'fsinfo':
samples/vfs/test-fsinfo.c:37:17: error: '__NR_fsinfo' undeclared (first use=
 in this function); did you mean 'fsinfo'?
  return syscall(__NR_fsinfo, dfd, filename, params, buffer, buf_size);
                 ^~~~~~~~~~~
                 fsinfo
samples/vfs/test-fsinfo.c:37:17: note: each undeclared identifier is report=
ed only once for each function it appears in
samples/vfs/test-fsinfo.c: In function 'dump_attr_LIMITS':
samples/vfs/test-fsinfo.c:180:30: warning: format '%llx' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  printf("\tmax file size: %llx\n", f->max_file_size);
                           ~~~^     ~~~~~~~~~~~~~~~~
                           %lx
samples/vfs/test-fsinfo.c:181:32: warning: format '%llx' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  printf("\tmax ids      : u=3D%llx g=3D%llx p=3D%llx\n",
                             ~~~^
                             %lx
         f->max_uid, f->max_gid, f->max_projid);
         ~~~~~~~~~~
samples/vfs/test-fsinfo.c:181:39: warning: format '%llx' expects argument o=
f type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  printf("\tmax ids      : u=3D%llx g=3D%llx p=3D%llx\n",
                                    ~~~^
                                    %lx
         f->max_uid, f->max_gid, f->max_projid);
                     ~~~~~~~~~~
samples/vfs/test-fsinfo.c:181:46: warning: format '%llx' expects argument o=
f type 'long long unsigned int', but argument 4 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  printf("\tmax ids      : u=3D%llx g=3D%llx p=3D%llx\n",
                                           ~~~^
                                           %lx
         f->max_uid, f->max_gid, f->max_projid);
                                 ~~~~~~~~~~~~~
samples/vfs/test-fsinfo.c: In function 'dump_attr_SUPPORTS':
samples/vfs/test-fsinfo.c:197:24: warning: format '%llx' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  printf("\tstx_attr=3D%llx\n", f->stx_attributes);
                     ~~~^     ~~~~~~~~~~~~~~~~~
                     %lx
samples/vfs/test-fsmount.c: In function 'fsopen':
samples/vfs/test-fsmount.c:63:17: error: '__NR_fsopen' undeclared (first us=
e in this function); did you mean 'fsopen'?
  return syscall(__NR_fsopen, fs_name, flags);
                 ^~~~~~~~~~~
                 fsopen
samples/vfs/test-fsmount.c:63:17: note: each undeclared identifier is repor=
ted only once for each function it appears in
samples/vfs/test-fsmount.c: In function 'fsmount':
samples/vfs/test-fsmount.c:68:17: error: '__NR_fsmount' undeclared (first u=
se in this function); did you mean 'fsmount'?
  return syscall(__NR_fsmount, fsfd, flags, ms_flags);
                 ^~~~~~~~~~~~
                 fsmount
samples/vfs/test-fsmount.c: In function 'fsconfig':
samples/vfs/test-fsmount.c:74:17: error: '__NR_fsconfig' undeclared (first =
use in this function); did you mean 'fsconfig'?
  return syscall(__NR_fsconfig, fsfd, cmd, key, val, aux);
                 ^~~~~~~~~~~~~
                 fsconfig
samples/vfs/test-fsmount.c: In function 'move_mount':
samples/vfs/test-fsmount.c:81:17: error: '__NR_move_mount' undeclared (firs=
t use in this function); did you mean 'move_mount'?
  return syscall(__NR_move_mount,
                 ^~~~~~~~~~~~~~~
                 move_mount
samples/vfs/test-fs-query.c: In function 'fsopen':
samples/vfs/test-fs-query.c:32:17: error: '__NR_fsopen' undeclared (first u=
se in this function); did you mean 'fsopen'?
  return syscall(__NR_fsopen, fs_name, flags);
                 ^~~~~~~~~~~
                 fsopen
samples/vfs/test-fs-query.c:32:17: note: each undeclared identifier is repo=
rted only once for each function it appears in
samples/vfs/test-fs-query.c: In function 'fsinfo':
samples/vfs/test-fs-query.c:38:17: error: '__NR_fsinfo' undeclared (first u=
se in this function); did you mean 'fsinfo'?
  return syscall(__NR_fsinfo, dfd, filename, params, buffer, buf_size);
                 ^~~~~~~~~~~
                 fsinfo
samples/vfs/test-statx.c: In function 'dump_statx':
samples/vfs/test-statx.c:160:29: warning: format '%llx' expects argument of=
 type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long =
unsigned int'} [-Wformat=3D]
   printf("Attributes: %016llx (", stx->stx_attributes);
                       ~~~~~~^     ~~~~~~~~~~~~~~~~~~~
                       %016lx

Caused by commits

  2615362dc9ce ("vfs: Add a sample program for the new mount API")
  e9078278ec11 ("vfs: syscall: Add fsinfo() to query filesystem information=
")

The directory name has changed, but the errors persist!

I have applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 10 Sep 2018 13:19:20 +1000
Subject: [PATCH] disable building the VFS sample programs

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 samples/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/samples/Kconfig b/samples/Kconfig
index 0431af2589ac..c8823d9d97db 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -148,6 +148,7 @@ config SAMPLE_VFIO_MDEV_MBOCHS
=20
 config SAMPLE_VFS
 	bool "Build example programs that use new VFS system calls"
+	depends on BROKEN
 	help
 	  Build example userspace programs that use new VFS system calls such
 	  as mount API and statx()
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/HlhqzU84DhyvSzcdPActBVD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluV5n0ACgkQAVBC80lX
0GxNSwf+KuutIU/V8fjQO7mk8/TNr7r9YYdX0S8/aW6KqsTqNqyJLjgcaeiwJQYy
SKXw672EvvExKQH82rwrkS0tMw0rJFZYold2ySpbakjYUTDLRVtZ+Ftd4S21nHuf
ODQSojAp6Yb2FRBPSYVOwZxHQw247dQ9yCDoL1R4ghOnek1G+3PRMMXF/PpDifaq
1z+QdodiAgXU6A3zhpZglLGXS6pscAsf+zfZrDxGCzsiueSqfqXXTa8KtneSypgW
+DUpzqfxzuIsKvthEB2vD96iDnpTLpecKyWRu51zs267GZEC4gKUQ0gPh1TunLdW
ICsr/JDwPIIpCFy9YHSDsu/QsVlN4w==
=leGP
-----END PGP SIGNATURE-----

--Sig_/HlhqzU84DhyvSzcdPActBVD--
