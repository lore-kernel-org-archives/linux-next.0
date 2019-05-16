From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Date: Thu, 16 May 2019 11:05:48 +1000
Message-ID: <20190516110548.0d22d048@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yioRfzKsOHL0l_nK0l1RyO1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/yioRfzKsOHL0l_nK0l1RyO1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  include/linux/compiler.h

between commit:

  37686b1353cf ("tracing: Improve "if" macro code generation")

from Linus' tree and commit:

  a15fd609ad53 ("tracing: Simplify "if" macro code")

from the ftrace tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yioRfzKsOHL0l_nK0l1RyO1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzct2wACgkQAVBC80lX
0GwsFQgAifeawbCBdogc3+jkuvMkWdmndy76L6kGaUXr2LMVeJf4mBShwbBhB8FF
LMy+QQC6UFvs4sp1fZSfoZnNyKaYcnm/anmtAv5XgcNs5oOeQj8FR38hngsUHrQE
39Q4PkjV0xZUMR4BCDCEkB3mFKmzruXw5AE3pFgI1wBDlP4T9GaSR7D/KdFgBPc7
L0V8Pg3PnsiumgUpTEdS41iElgB/AQr69vHs+REZoO/jqFUX5PROGByKUetaKMdt
SBbs6hu3It5HX7uCIyTqLICN0Kpy+Xxp1DzrFio+JUTLAKx9j/aMHOvgxaNRctJy
Ns/A7sC30AReyfCGJzFT55HFcGgLPg==
=cqH5
-----END PGP SIGNATURE-----

--Sig_/yioRfzKsOHL0l_nK0l1RyO1--
