From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with Linus' tree
Date: Mon, 24 Sep 2018 10:19:56 +1000
Message-ID: <20180924101956.4024470e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BenR638O_rk0vljbXVo+1Yz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Yonghong Song <yhs@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/BenR638O_rk0vljbXVo+1Yz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  tools/lib/bpf/Build

between commit:

  6d41907c630d ("tools lib bpf: Provide wrapper for strerror_r to build in =
!_GNU_SOURCE systems")

from Linus' tree and commit:

  f7010770fbac ("tools/bpf: move bpf/lib netlink related functions into a n=
ew file")

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

diff --cc tools/lib/bpf/Build
index 6eb9bacd1948,512b2c0ba0d2..000000000000
--- a/tools/lib/bpf/Build
+++ b/tools/lib/bpf/Build
@@@ -1,1 -1,1 +1,1 @@@
- libbpf-y :=3D libbpf.o bpf.o nlattr.o btf.o libbpf_errno.o str_error.o
 -libbpf-y :=3D libbpf.o bpf.o nlattr.o btf.o libbpf_errno.o netlink.o
++libbpf-y :=3D libbpf.o bpf.o nlattr.o btf.o libbpf_errno.o str_error.o ne=
tlink.o

--Sig_/BenR638O_rk0vljbXVo+1Yz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluoLawACgkQAVBC80lX
0Gzotwf/V7CQ726XCmE/S04vLxUcCAFZ2c3EQdq7Gv9VxUftcpSObjCYXHUpHsBE
yuRaP+x/x4x46zWHILRmJtRC8bBiyDd9pT/2SvFSed+mZ3rk1oGneqe5VdnsINXr
xEXgWB20DhjJCdmT6diwO+2gI791JnxCUVB/STlivEJfDAWAlPOfxi7YjDPoCeJ/
+wQqpbb/n//zK/u/rM3afIJSEy9kvfBfTIdiI/1PF9tUWc5IA0rbwVGI1CNDH1dq
JJhhYAC8CMi+854ukLCqNUSEYsN//VClHQRAZT/kGHzJV5GlW9FlaRzCWQypVb0e
W2hj4eZAQp0XoAtmjk+wUaEsxYsu9w==
=ODdk
-----END PGP SIGNATURE-----

--Sig_/BenR638O_rk0vljbXVo+1Yz--
