From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Tue, 4 Dec 2018 12:05:29 +1100
Message-ID: <20181204120529.222e65c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0qiwlbuaXAD=8/ujjDA16IF"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quentin Monnet <quentin.monnet@netronome.com>, Joe Stringer <joe@wand.net.nz>
List-Id: linux-next.vger.kernel.org

--Sig_/0qiwlbuaXAD=8/ujjDA16IF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got conflicts in:

  include/uapi/linux/bpf.h

between commit:

  d74286d2c25a ("bpf: Improve socket lookup reuseport documentation")

from the bpf tree and commit:

  90b1023f68c7 ("bpf: fix documentation for eBPF helpers")

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

diff --cc include/uapi/linux/bpf.h
index ec8b40ff386e,572eb2d42768..000000000000
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@@ -2209,11 -2210,11 +2212,11 @@@ union bpf_attr=20
   *		This helper is available only if the kernel was compiled with
   *		**CONFIG_NET** configuration option.
   *	Return
-  *		Pointer to *struct bpf_sock*, or NULL in case of failure.
-  *		For sockets with reuseport option, the *struct bpf_sock*
-  *		result is from reuse->socks[] using the hash of the tuple.
+  *		A pointer to *struct bpf_sock*, or **NULL** in case of failure.
 - *		For sockets with reuseport option, **struct bpf_sock**
++ *		For sockets with reuseport option, the **struct bpf_sock**
+  *		return is from **reuse->socks**\ [] using hash of the packet.
   *
 - * struct bpf_sock *bpf_sk_lookup_udp(void *ctx, struct bpf_sock_tuple *t=
uple, u32 tuple_size, u32 netns, u64 flags)
 + * struct bpf_sock *bpf_sk_lookup_udp(void *ctx, struct bpf_sock_tuple *t=
uple, u32 tuple_size, u64 netns, u64 flags)
   *	Description
   *		Look for UDP socket matching *tuple*, optionally in a child
   *		network namespace *netns*. The return value must be checked,
@@@ -2245,14 -2244,15 +2248,16 @@@
   *		This helper is available only if the kernel was compiled with
   *		**CONFIG_NET** configuration option.
   *	Return
-  *		Pointer to *struct bpf_sock*, or NULL in case of failure.
-  *		For sockets with reuseport option, the *struct bpf_sock*
-  *		result is from reuse->socks[] using the hash of the tuple.
+  *		A pointer to **struct bpf_sock**, or **NULL** in case of
 - *		failure. For sockets with reuseport option, **struct bpf_sock**
 - *		return is from **reuse->socks**\ [] using hash of the packet.
++ *		failure. For sockets with reuseport option, the
++ *		**struct bpf_sock** return is from **reuse->socks**\ []
++ *		using hash of the packet.
   *
-  * int bpf_sk_release(struct bpf_sock *sk)
+  * int bpf_sk_release(struct bpf_sock *sock)
   *	Description
-  *		Release the reference held by *sock*. *sock* must be a non-NULL
-  *		pointer that was returned from bpf_sk_lookup_xxx\ ().
+  *		Release the reference held by *sock*. *sock* must be a
+  *		non-**NULL** pointer that was returned from
+  *		**bpf_sk_lookup_xxx**\ ().
   *	Return
   *		0 on success, or a negative error in case of failure.
   *
@@@ -2494,8 -2495,9 +2509,9 @@@ struct __sk_buff=20
  	/* ... here. */
 =20
  	__u32 data_meta;
 -	struct bpf_flow_keys *flow_keys;
 +	__bpf_md_ptr(struct bpf_flow_keys *, flow_keys);
  	__u64 tstamp;
+ 	__u32 wire_len;
  };
 =20
  struct bpf_tunnel_key {

--Sig_/0qiwlbuaXAD=8/ujjDA16IF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwF0tkACgkQAVBC80lX
0Gy1Twf/XiYWV15vq6amV99G6gvuypSEAWDCrJ9MWQQ4Pm40S+S4LNdcHOcgEc3r
Z0HCVcfxFVuvW3WUBvH+o6f0VKoiPUqXvQZpB7je6XfJdHzNQa4JdPbkBhtrTWu5
+OIOvi+L/GrzemVkJZholLvmaIW0hztC3p5ycLScpp7cpRN3IqJ3uypMI/wMWcjr
hiOGL1ZtpItmQF9vB/cxntTheUbkk3OtmmeppHKk+P/GFbm/652QFdOp0oDKszmR
BewEvHQu6AMSg1okNSBV+kgTu6RcEPgLO3M0d98EGOOJy8eI+PZhykzfw4SyCwFg
HoZqKacm81NON1+cihJyHDyINB0bYA==
=ybMQ
-----END PGP SIGNATURE-----

--Sig_/0qiwlbuaXAD=8/ujjDA16IF--
