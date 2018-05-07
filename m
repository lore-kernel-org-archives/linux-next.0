From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the bpf-next tree
Date: Mon, 7 May 2018 12:09:09 +1000
Message-ID: <20180507120909.1fee1683@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pinGblI+CAMhna2p.DI8MNt"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/pinGblI+CAMhna2p.DI8MNt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/net/bpf_jit_comp.c

between commit:

  e782bdcf58c5 ("bpf, x64: remove ld_abs/ld_ind")

from the bpf-next tree and commit:

  5f26c50143f5 ("x86/bpf: Clean up non-standard comments, to make the code =
more readable")

from the tip tree.

I fixed it up (the former commit removed some code modified by the latter,
so I just removed it) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/pinGblI+CAMhna2p.DI8MNt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrvtUUACgkQAVBC80lX
0GxbnQf/WbCGq523yGk3BWfqBgqDNnzB3b/Y5FLqJXRrqvBvYjOBhJJJ7VbGQPMx
wVArZAhwMlDh0Om4yB+rXHX0CzH6l5S0t7Uobg8xjVqe0DKQh5FaEGrgGqBuI1d6
x3CcqwZlyu/qJTjc+PbBGngkqFkmLdhbKkLzyE7iYccJxgNZDP023mgRvbcs9iWu
/S6FnVWHehMB/VEgh3p8wSnvJBf+rYoKCA5u1dYN951LIKYDibnScS1i5qEQHCbi
cyT+4U58f53uuXzit7VduJVr9hz9tl5kbvI8FiZfHsKQ0GoIaQZ9BXDD8NzhgLd4
00H1jxmUjmAortjW8r4oRAgHM40kxQ==
=AlFX
-----END PGP SIGNATURE-----

--Sig_/pinGblI+CAMhna2p.DI8MNt--
