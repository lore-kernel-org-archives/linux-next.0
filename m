From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Tue, 7 Aug 2018 20:58:48 +1000
Message-ID: <20180807205848.12025adc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jqTeiI2=TeK6KpzhhWzA3kN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/jqTeiI2=TeK6KpzhhWzA3kN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (powercp
allyesconfig) failed like this (I have also included all the warnings):

samples/statx/test-fsinfo.c: In function 'fsinfo':
samples/statx/test-fsinfo.c:36:17: error: '__NR_fsinfo' undeclared (first u=
se in this function); did you mean '__NR_sysinfo'?
  return syscall(__NR_fsinfo, dfd, filename, params, buffer, buf_size);
                 ^~~~~~~~~~~
                 __NR_sysinfo
samples/statx/test-fsinfo.c:36:17: note: each undeclared identifier is repo=
rted only once for each function it appears in
samples/statx/test-fsinfo.c: In function 'dump_attr_LIMITS':
samples/statx/test-fsinfo.c:181:30: warning: format '%llx' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64 {aka long=
 unsigned int}' [-Wformat=3D]
  printf("\tmax file size: %llx\n", f->max_file_size);
                           ~~~^     ~~~~~~~~~~~~~~~~
                           %lx
samples/statx/test-fsinfo.c:182:32: warning: format '%llx' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64 {aka long=
 unsigned int}' [-Wformat=3D]
  printf("\tmax ids      : u=3D%llx g=3D%llx p=3D%llx\n",
                             ~~~^
                             %lx
         f->max_uid, f->max_gid, f->max_projid);
         ~~~~~~~~~~             =20
samples/statx/test-fsinfo.c:182:39: warning: format '%llx' expects argument=
 of type 'long long unsigned int', but argument 3 has type '__u64 {aka long=
 unsigned int}' [-Wformat=3D]
  printf("\tmax ids      : u=3D%llx g=3D%llx p=3D%llx\n",
                                    ~~~^
                                    %lx
         f->max_uid, f->max_gid, f->max_projid);
                     ~~~~~~~~~~        =20
samples/statx/test-fsinfo.c:182:46: warning: format '%llx' expects argument=
 of type 'long long unsigned int', but argument 4 has type '__u64 {aka long=
 unsigned int}' [-Wformat=3D]
  printf("\tmax ids      : u=3D%llx g=3D%llx p=3D%llx\n",
                                           ~~~^
                                           %lx
         f->max_uid, f->max_gid, f->max_projid);
                                 ~~~~~~~~~~~~~=20
samples/statx/test-fsinfo.c: In function 'dump_attr_SUPPORTS':
samples/statx/test-fsinfo.c:198:24: warning: format '%llx' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64 {aka long=
 unsigned int}' [-Wformat=3D]
  printf("\tstx_attr=3D%llx\n", f->stx_attributes);
                     ~~~^     ~~~~~~~~~~~~~~~~~
                     %lx
samples/statx/test-fsinfo.c: In function 'fsinfo':
samples/statx/test-fsinfo.c:37:1: warning: control reaches end of non-void =
function [-Wreturn-type]
 }
 ^
scripts/Makefile.host:90: recipe for target 'samples/statx/test-fsinfo' fai=
led
samples/statx/test-statx.c: In function 'dump_statx':
samples/statx/test-statx.c:160:29: warning: format '%llx' expects argument =
of type 'long long unsigned int', but argument 2 has type '__u64 {aka long =
unsigned int}' [-Wformat=3D]
   printf("Attributes: %016llx (", stx->stx_attributes);
                       ~~~~~~^     ~~~~~~~~~~~~~~~~~~~
                       %016lx
samples/statx/test-fs-query.c: In function 'fsopen':
samples/statx/test-fs-query.c:32:17: error: '__NR_fsopen' undeclared (first=
 use in this function); did you mean '__NR_open'?
  return syscall(__NR_fsopen, fs_name, flags);
                 ^~~~~~~~~~~
                 __NR_open
samples/statx/test-fs-query.c:32:17: note: each undeclared identifier is re=
ported only once for each function it appears in
samples/statx/test-fs-query.c: In function 'fsinfo':
samples/statx/test-fs-query.c:38:17: error: '__NR_fsinfo' undeclared (first=
 use in this function); did you mean '__NR_sysinfo'?
  return syscall(__NR_fsinfo, dfd, filename, params, buffer, buf_size);
                 ^~~~~~~~~~~
                 __NR_sysinfo
samples/statx/test-fs-query.c: In function 'fsopen':
samples/statx/test-fs-query.c:33:1: warning: control reaches end of non-voi=
d function [-Wreturn-type]
 }
 ^
samples/statx/test-fs-query.c: In function 'fsinfo':
samples/statx/test-fs-query.c:39:1: warning: control reaches end of non-voi=
d function [-Wreturn-type]
 }
 ^

Caused by commit

  ba5214f7f40c ("vfs: Implement parameter value retrieval with fsinfo()")

which enabled CONFIG_SAMPLE_STATX.  I have disabled that again.  I assume
that problem is that these syscalls are not yet wired up on PowerPC ...

--=20
Cheers,
Stephen Rothwell

--Sig_/jqTeiI2=TeK6KpzhhWzA3kN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltpe2kACgkQAVBC80lX
0GyGPgf/R4ja5F8LGTYELmOXxlRDyY/VUD7b6WOFPua4pVUPGO7j1/XkWJmdXnfM
hnZ8iWnknjqZ/5JhNRFzoIzTrRiQOraFx0Np1aNwMu5r/MBgIqafOtinvjMC2G/U
eiij5ZLorLGVMMGDcqmsaBbYpBWi6ERTPMJr2uQTjO3dPgHnuLFjMp1s2HX+bLoZ
0K6nD595xvGXSfMSZ2QvnOV+tv2qOIF3CS/5eANMSK9BvVwwsUW1OgZMB+JU+yaj
zTX8BgptzD9mTdubGZ3+8HrRCm2cUq6ua6THhsbv5KIIIvmKDlBKij9Iqn6j0JI/
RNpwWN37x6aP2OUBUpF0uCbWN+b0ug==
=BcCI
-----END PGP SIGNATURE-----

--Sig_/jqTeiI2=TeK6KpzhhWzA3kN--
