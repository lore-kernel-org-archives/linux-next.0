From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 29 Oct 2018 20:07:05 +1100
Message-ID: <20181029200620.75f71e94@canb.auug.org.au>
References: <20180910133525.28c5dd20@canb.auug.org.au>
        <20181029153334.7c8d16cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3rSs4Wq3svp7df6CTRF.jzr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029153334.7c8d16cc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/3rSs4Wq3svp7df6CTRF.jzr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 29 Oct 2018 15:33:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Al, David,
>=20
> These have returned, so I have disabled CONFIG_SAMPLE_VFS again.

Here is the current set of errors I git today (this is from a PowerPC
allyesconfig build native compiler on a PowerPC64 LE machine):

samples/vfs/test-fsinfo.c: In function 'fsinfo':
samples/vfs/test-fsinfo.c:37:17: error: '__NR_fsinfo' undeclared (first use=
 in this function); did you mean 'fsinfo'?
  return syscall(__NR_fsinfo, dfd, filename, params, buffer, buf_size);
                 ^~~~~~~~~~~
                 fsinfo
samples/vfs/test-fsinfo.c:37:17: note: each undeclared identifier is report=
ed only once for each function it appears in
samples/vfs/test-fsinfo.c:38:1: warning: control reaches end of non-void fu=
nction [-Wreturn-type]
 }
 ^
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
samples/vfs/test-fs-query.c: In function 'fsopen':
samples/vfs/test-fs-query.c:33:1: warning: control reaches end of non-void =
function [-Wreturn-type]
 }
 ^
samples/vfs/test-fs-query.c: In function 'fsinfo':
samples/vfs/test-fs-query.c:39:1: warning: control reaches end of non-void =
function [-Wreturn-type]
 }
 ^
samples/vfs/test-statx.c: In function 'dump_statx':
samples/vfs/test-statx.c:164:29: warning: format '%llx' expects argument of=
 type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long =
unsigned int'} [-Wformat=3D]
   printf("Attributes: %016llx (", stx->stx_attributes);
                       ~~~~~~^     ~~~~~~~~~~~~~~~~~~~
                       %016lx

--=20
Cheers,
Stephen Rothwell

--Sig_/3rSs4Wq3svp7df6CTRF.jzr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWzbkACgkQAVBC80lX
0Gx8XQf+NPQJYd61cT0HfSNAiw8R52N7vLfN50UP0qkPfjbKhiyeK29bw6Uv6s3W
fYLHs3Ce+d1UVkFCTs2r7Qxs/IUqUbQDxYAQHjw979WU3MqvingubTvwpaqAl/W1
N/63oJ1ACfi2afqxra5wD76+hXsgtaPSMMb4dClVH2PuDP0AYK+REpuwRGdrsb37
GKw9fZ/rE5J35duTVMzm271SWnobq2Dq8NEP96BQrwnNtpDPJBZ1kT3Ai37cmmfp
yrjzVc6khvKmtoRjz7p4LmiVu0TMmR3f+8BaTFlrtQELyRjOrNuj5mTE96pW2JSr
a4XQ+8zF39pR5DnS7TiSDkheBHtshA==
=fAJ3
-----END PGP SIGNATURE-----

--Sig_/3rSs4Wq3svp7df6CTRF.jzr--
