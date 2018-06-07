From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Thu, 7 Jun 2018 11:53:50 +1000
Message-ID: <20180607115350.69251fcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tWhKl/+1bHH7mzrHfeG6KEG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "Shuah Khan (Samsung OSG)" <shuah@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/tWhKl/+1bHH7mzrHfeG6KEG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/testing/selftests/Makefile

between commit:

  a12ab9e125f1 ("selftests: move RTC tests to rtc subfolder")

from Linus' tree and commit:

  ccba8b64452b ("rseq/selftests: Provide Makefile, scripts, gitignore")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/Makefile
index 4cd339b5366a,593fb44c9cd4..000000000000
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@@ -29,7 -28,7 +29,8 @@@ TARGETS +=3D powerp
  TARGETS +=3D proc
  TARGETS +=3D pstore
  TARGETS +=3D ptrace
+ TARGETS +=3D rseq
 +TARGETS +=3D rtc
  TARGETS +=3D seccomp
  TARGETS +=3D sigaltstack
  TARGETS +=3D size

--Sig_/tWhKl/+1bHH7mzrHfeG6KEG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsYkC4ACgkQAVBC80lX
0GxXbwf/c5j4YyGj+TZPY/nBYPR2xDihK9so/yQdF9R6hHu7Z0LZ2o/zqwyzgaea
7QybPNk48nTK6yu2wAqkN0thLqirAX9awIJ50AW07fZNQuuBhfVLSTtPLH1szawI
eVOojJJ0qX56sey+qIGT2C4kQNun9wEgtZhm8tD6e2m/SuPZUDepamGBw3PwefSK
66f+XzQKuJXYvGQS5Z92c+yYSE3D5ppIqv+oiMJx0b2N7y+5oV9qP59Bwo4FAbL7
AMIxqzIH6EcJ3cjZtgJyKdwomRRhZ7wVY4/z+INbJSEJ29ffj3c1Q14f45nN5n6p
H2vuQAlJy8xICCYeqADT5JIYin5gyw==
=A3Qs
-----END PGP SIGNATURE-----

--Sig_/tWhKl/+1bHH7mzrHfeG6KEG--
