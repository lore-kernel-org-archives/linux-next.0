From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the y2038 tree
Date: Wed, 6 Jun 2018 20:41:16 +1000
Message-ID: <20180606204116.5b01ed36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rn0CUU1CZg6eHov=kShUIc8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Deepa Dinamani <deepa.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/rn0CUU1CZg6eHov=kShUIc8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the y2038 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/pstore/ram.c: In function 'ramoops_read_kmsg_hdr':
fs/pstore/ram.c:39:29: warning: format '%ld' expects argument of type 'long=
 int *', but argument 3 has type 'time64_t * {aka long long int *}' [-Wform=
at=3D]
 #define RAMOOPS_KERNMSG_HDR "=3D=3D=3D=3D"
                             ^
fs/pstore/ram.c:167:21: note: in expansion of macro 'RAMOOPS_KERNMSG_HDR'
  if (sscanf(buffer, RAMOOPS_KERNMSG_HDR TVSEC_FMT ".%lu-%c\n%n",
                     ^~~~~~~~~~~~~~~~~~~
fs/pstore/ram.c:42:23: note: format string is defined here
 # define TVSEC_FMT "%ld"
                     ~~^
                     %lld
fs/pstore/ram.c:39:29: warning: format '%ld' expects argument of type 'long=
 int *', but argument 3 has type 'time64_t * {aka long long int *}' [-Wform=
at=3D]
 #define RAMOOPS_KERNMSG_HDR "=3D=3D=3D=3D"
                             ^
fs/pstore/ram.c:174:28: note: in expansion of macro 'RAMOOPS_KERNMSG_HDR'
  } else if (sscanf(buffer, RAMOOPS_KERNMSG_HDR TVSEC_FMT ".%lu\n%n",
                            ^~~~~~~~~~~~~~~~~~~
fs/pstore/ram.c:42:23: note: format string is defined here
 # define TVSEC_FMT "%ld"
                     ~~^
                     %lld
fs/pstore/ram.c: In function 'ramoops_write_kmsg_hdr':
fs/pstore/ram.c:39:29: warning: format '%ld' expects argument of type 'long=
 int', but argument 3 has type 'time64_t {aka long long int}' [-Wformat=3D]
 #define RAMOOPS_KERNMSG_HDR "=3D=3D=3D=3D"
                             ^
fs/pstore/ram.c:370:30: note: in expansion of macro 'RAMOOPS_KERNMSG_HDR'
  hdr =3D kasprintf(GFP_ATOMIC, RAMOOPS_KERNMSG_HDR TVSEC_FMT ".%lu-%c\n",
                              ^~~~~~~~~~~~~~~~~~~
fs/pstore/ram.c:42:23: note: format string is defined here
 # define TVSEC_FMT "%ld"
                     ~~^
                     %lld

Introduced by commit

  0f0d83b99ef7 ("pstore: Convert internal records to timespec64")

--=20
Cheers,
Stephen Rothwell

--Sig_/rn0CUU1CZg6eHov=kShUIc8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsXukwACgkQAVBC80lX
0GwZrAf/cE9QCaKaCqo3FM+r2m8R8Tm8EFUNkT3MBkudHS3jSWkwcMXJuGjls2pw
uiLO2LeJgvffMu5b/MxFuhfkSTCZGqUuh57mzQOlk3mohrr5D/5C2/INLpb1ONrJ
cN0I3ChF6y6lza4MDGV96lw91jKaAKAeTFCzEfLB465cVRxsIdVStkeO+epL1Toa
dnHE+5kAnlMPRf6/1NfiQKeeSA9wNb2fbKCWevzN8mdv/zdMnARUoOYZi3CZmZVv
+kgy84TuRxdcwoKJkubepdltSVT8OPG9R9M33cg/xX7JW9FuH/ZKGDz7LQYJa5hu
THQb09hdFVCgbKcGLvFZmwj7rKhgRw==
=zD9H
-----END PGP SIGNATURE-----

--Sig_/rn0CUU1CZg6eHov=kShUIc8--
