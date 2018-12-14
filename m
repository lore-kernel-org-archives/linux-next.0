From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the bpf tree
Date: Fri, 14 Dec 2018 11:56:56 +1100
Message-ID: <20181214115656.32b1aea3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Xf+jvrrRNi6Kau1VwSy.GdD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>, Petar Penkov <ppenkov@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Xf+jvrrRNi6Kau1VwSy.GdD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/bpf/test_verifier.c

between commit:

  7640ead93924 ("bpf: verifier: make sure callees don't prune with caller d=
ifferences")

from the bpf tree and commit:

  e3da08d05700 ("bpf: allow BPF read access to qdisc pkt_len")

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

diff --cc tools/testing/selftests/bpf/test_verifier.c
index f8eac4a544f4,a08c67c8767e..000000000000
--- a/tools/testing/selftests/bpf/test_verifier.c
+++ b/tools/testing/selftests/bpf/test_verifier.c
@@@ -13915,34 -14067,38 +14067,66 @@@ static struct bpf_test tests[] =3D=20
  		.result_unpriv =3D REJECT,
  		.result =3D ACCEPT,
  	},
 +	{
 +		"calls: cross frame pruning",
 +		.insns =3D {
 +			/* r8 =3D !!random();
 +			 * call pruner()
 +			 * if (r8)
 +			 *     do something bad;
 +			 */
 +			BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0,
 +				     BPF_FUNC_get_prandom_u32),
 +			BPF_MOV64_IMM(BPF_REG_8, 0),
 +			BPF_JMP_IMM(BPF_JNE, BPF_REG_0, 0, 1),
 +			BPF_MOV64_IMM(BPF_REG_8, 1),
 +			BPF_MOV64_REG(BPF_REG_1, BPF_REG_8),
 +			BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 1, 0, 4),
 +			BPF_JMP_IMM(BPF_JEQ, BPF_REG_8, 1, 1),
 +			BPF_LDX_MEM(BPF_B, BPF_REG_9, BPF_REG_1, 0),
 +			BPF_MOV64_IMM(BPF_REG_0, 0),
 +			BPF_EXIT_INSN(),
 +			BPF_JMP_IMM(BPF_JEQ, BPF_REG_1, 0, 0),
 +			BPF_EXIT_INSN(),
 +		},
 +		.prog_type =3D BPF_PROG_TYPE_SOCKET_FILTER,
 +		.errstr_unpriv =3D "function calls to other bpf functions are allowed f=
or root only",
 +		.result_unpriv =3D REJECT,
 +		.errstr =3D "!read_ok",
 +		.result =3D REJECT,
 +	},
+ 	{
+ 		"check wire_len is not readable by sockets",
+ 		.insns =3D {
+ 			BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+ 				    offsetof(struct __sk_buff, wire_len)),
+ 			BPF_EXIT_INSN(),
+ 		},
+ 		.errstr =3D "invalid bpf_context access",
+ 		.result =3D REJECT,
+ 	},
+ 	{
+ 		"check wire_len is readable by tc classifier",
+ 		.insns =3D {
+ 			BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
+ 				    offsetof(struct __sk_buff, wire_len)),
+ 			BPF_EXIT_INSN(),
+ 		},
+ 		.prog_type =3D BPF_PROG_TYPE_SCHED_CLS,
+ 		.result =3D ACCEPT,
+ 	},
+ 	{
+ 		"check wire_len is not writable by tc classifier",
+ 		.insns =3D {
+ 			BPF_STX_MEM(BPF_W, BPF_REG_1, BPF_REG_1,
+ 				    offsetof(struct __sk_buff, wire_len)),
+ 			BPF_EXIT_INSN(),
+ 		},
+ 		.prog_type =3D BPF_PROG_TYPE_SCHED_CLS,
+ 		.errstr =3D "invalid bpf_context access",
+ 		.errstr_unpriv =3D "R1 leaks addr",
+ 		.result =3D REJECT,
+ 	},
  };
 =20
  static int probe_filter_length(const struct bpf_insn *fp)

--Sig_/Xf+jvrrRNi6Kau1VwSy.GdD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwS/9gACgkQAVBC80lX
0GyLrwf9Fr8Mg5eP63NfORzViPzOrmQmwyPWWwkhsGr9jS8Zaf9fwXdKPsuO1AF/
bbeoSSSwcBGZMsuCIwDK5ln84Ex+D1zFLXtwg7GwRshlXP7wOFXSRgAaAqStoSOG
jrzMlYqq3tVv7B9JoAiB+R629gL3DpYU2N2RGRPJLQuAZjJPPnSW+oyZGM4iE8pa
wMyxJMOAtu2AUtDJE1C1m01xhNjhTggNpOaMPuBhtsRV7nC3CYA0YDhh8G7ySjEg
MYti7+Rl4/qY8gcFC07NYQSxr//anL0wBKZEKHKZFWc1Fa9E58vmQBVFsWvhs5l3
O3205Ga29OpLit3Lu94F6tpxS2/hlQ==
=+S2i
-----END PGP SIGNATURE-----

--Sig_/Xf+jvrrRNi6Kau1VwSy.GdD--
