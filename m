From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the bpf tree
Date: Mon, 3 Dec 2018 13:03:12 +1100
Message-ID: <20181203130312.687d560d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y.u.TdzF9tv3osKnhYSq8=L"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Stringer <joe@wand.net.nz>, Nitin Hande <nitin.hande@gmail.com>, Vlad Dumitrescu <vladum@google.com>, Lorenz Bauer <lmb@cloudflare.com>
List-Id: linux-next.vger.kernel.org

--Sig_/y.u.TdzF9tv3osKnhYSq8=L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  include/uapi/linux/bpf.h
  tools/include/uapi/linux/bpf.h

between commits:

  b7df9ada9a77 ("bpf: fix pointer offsets in context for 32 bit")
  d74286d2c25a ("bpf: Improve socket lookup reuseport documentation")

from the bpf tree and commits:

  c8123ead13a5 ("bpf: Extend the sk_lookup() helper to XDP hookpoint.")
  608114e441ad ("tools: sync linux/bpf.h")
  f11216b24219 ("bpf: add skb->tstamp r/w access from tc clsact and cg skb =
progs")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/bpf.h
index 72c453a8bf50,597afdbc1ab9..000000000000
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@@ -2473,7 -2481,8 +2494,8 @@@ struct __sk_buff=20
  	/* ... here. */
 =20
  	__u32 data_meta;
 -	struct bpf_flow_keys *flow_keys;
 +	__bpf_md_ptr(struct bpf_flow_keys *, flow_keys);
+ 	__u64 tstamp;
  };
 =20
  struct bpf_tunnel_key {
diff --cc tools/include/uapi/linux/bpf.h
index 72c453a8bf50,597afdbc1ab9..000000000000
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@@ -2473,7 -2481,8 +2494,8 @@@ struct __sk_buff=20
  	/* ... here. */
 =20
  	__u32 data_meta;
 -	struct bpf_flow_keys *flow_keys;
 +	__bpf_md_ptr(struct bpf_flow_keys *, flow_keys);
+ 	__u64 tstamp;
  };
 =20
  struct bpf_tunnel_key {

--Sig_/y.u.TdzF9tv3osKnhYSq8=L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwEjuAACgkQAVBC80lX
0Gzmsgf/QLhwS2EGNugxz+/PMVyr4jmNVjekgM9mG8X8gdxm/ZItN7jIdnfqwkvz
JxB3ZlBd3H8LXtaFvLLANcgjweJzozJYdfH25FKPOznrXGO+m/coqkKmYerxFeaZ
j+/9h5psMh9ZQ/KNTCaC55YmR8hGWRAFizRAxmRUPqkrNdTjn5BUsUck32si5lmA
Cx5+3YTSbCHGDkoJwHERBkfxTz8ugPwuFlIFA32wfUrFd4MJqA0X/c4IwEQBVbj2
AhaQoZuK6k0dk2a37e+fBdCfaImQzWAxZer+cPqd+jfsuRC1znjheg55+Ewii9Ck
Uv8SfjVnaWUIb8PttkT9WQ4uNodcwA==
=n4+G
-----END PGP SIGNATURE-----

--Sig_/y.u.TdzF9tv3osKnhYSq8=L--
