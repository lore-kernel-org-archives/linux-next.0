From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the jc_docs tree
Date: Fri, 12 Apr 2019 11:05:18 +1000
Message-ID: <20190412110518.46e329af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/emHHSzS8SwAffydAoVO3eI_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>
List-Id: linux-next.vger.kernel.org

--Sig_/emHHSzS8SwAffydAoVO3eI_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  .mailmap

between commit:

  9b628c6ab437 ("mailmap: update my obsolete email address")

from the jc_docs tree and commit:

  fa0dcb3fe2ca ("mailmap: add entry for email addresses")

from the bpf-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc .mailmap
index 151501c73503,e7984bb6b4b0..000000000000
--- a/.mailmap
+++ b/.mailmap
@@@ -16,8 -16,9 +16,11 @@@ Alan Cox <alan@lxorguk.ukuu.org.uk
  Alan Cox <root@hraefn.swansea.linux.org.uk>
  Aleksey Gorelov <aleksey_gorelov@phoenix.com>
  Aleksandar Markovic <aleksandar.markovic@mips.com> <aleksandar.markovic@i=
mgtec.com>
 +Alex Shi <alex.shi@linux.alibaba.com> <alex.shi@intel.com>
 +Alex Shi <alex.shi@linux.alibaba.com> <alex.shi@linaro.org>
+ Alexei Starovoitov <ast@kernel.org> <ast@plumgrid.com>
+ Alexei Starovoitov <ast@kernel.org> <alexei.starovoitov@gmail.com>
+ Alexei Starovoitov <ast@kernel.org> <ast@fb.com>
  Al Viro <viro@ftp.linux.org.uk>
  Al Viro <viro@zenIV.linux.org.uk>
  Andi Shyti <andi@etezian.org> <andi.shyti@samsung.com>

--Sig_/emHHSzS8SwAffydAoVO3eI_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyv5E4ACgkQAVBC80lX
0Gy9MQf9HV3njCxmY/t9eYQlrQRRYFcqtKBWXcQBaLUONuT5S+uqDlU9o8yGqZFz
v72XOw+gU8HaFr/Xa0gd0LIiLVBrCmDibOlEvSq8N3giHIJUhKiCMcVTkf3lfQ7m
QdKBBRC23YFTAGcJC17uEY8nvBQINVH5QZ9P0+RgwzjoGHOedPd41rb+GiY/M8D8
5ooqo5v1qZPTSnteB23esVCxvxwRjALz3ZfegsQnPaXN4TJ30WrnGnVzqQSt638m
SrBdmo8iAQL14U/Fq5HvYdAA3w+MIAso5r/tiAhYmSQRLW5SAl2DIytYVVxGOM6w
7VKUxvPEvSpdPbuyKSBm0rC6fdO2Sw==
=/QdY
-----END PGP SIGNATURE-----

--Sig_/emHHSzS8SwAffydAoVO3eI_--
