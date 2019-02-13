From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Wed, 13 Feb 2019 17:03:45 +1100
Message-ID: <20190213170345.656c3030@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3Gc2sE8KC2b8Gtu8=f2jYIg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3Gc2sE8KC2b8Gtu8=f2jYIg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  scripts/gcc-plugins/Kconfig

between commit:

  9219e54be983 ("gcc-plugins: structleak: Generalize to all variable types")

from the kspp tree and commit:

  7fabedf42152 ("kasan: remove use after scope bugs detection.")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/gcc-plugins/Kconfig
index d0cc92e48f6f,d9fd9988ef27..000000000000
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@@ -67,22 -67,13 +67,18 @@@ config GCC_PLUGIN_LATENT_ENTROP
  	   * https://pax.grsecurity.net/
 =20
  config GCC_PLUGIN_STRUCTLEAK
 -	bool "Force initialization of variables containing userspace addresses"
 +	bool "Zero initialize stack variables"
- 	# Currently STRUCTLEAK inserts initialization out of live scope of
- 	# variables from KASAN point of view. This leads to KASAN false
- 	# positive reports. Prohibit this combination for now.
- 	depends on !KASAN_EXTRA
  	help
 -	  This plugin zero-initializes any structures containing a
 -	  __user attribute. This can prevent some classes of information
 -	  exposures.
 -
 -	  This plugin was ported from grsecurity/PaX. More information at:
 +	  While the kernel is built with warnings enabled for any missed
 +	  stack variable initializations, this warning is silenced for
 +	  anything passed by reference to another function, under the
 +	  occasionally misguided assumption that the function will do
 +	  the initialization. As this regularly leads to exploitable
 +	  flaws, this plugin is available to identify and zero-initialize
 +	  such variables, depending on the chosen level of coverage.
 +
 +	  This plugin was originally ported from grsecurity/PaX. More
 +	  information at:
  	   * https://grsecurity.net/
  	   * https://pax.grsecurity.net/
 =20

--Sig_/3Gc2sE8KC2b8Gtu8=f2jYIg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjs0EACgkQAVBC80lX
0GzayQf/V98XM0JTiHCheBVhkf9RjTLiVDFPwM5mGCWbvTlYEQlfH174/b9qzkok
YqT2Y8oUBScvB9s8xEP0tcnbw9ZfKLm9LPRNIOvu+fWnrebCX7zYtbzRwUAgROu7
xFAVrftk+vH0Ij+cgCUPbAUN5pmx1axchaN5O/JTYNRAqRroOjqWBMJsr2aAHc/S
3li0xUAXO7oFNSVjlMqKg/3DtKqxMbVmVNWjGXv1JtAcZ13Ug+2paPF3IEQLCLMb
rx0bH+4yVFQNAzPk3bg2T+WTdRSOVZpulqALscri2+2oiVVndDZgv3LzOPIjq6wL
Yg/JNtpoeYUhgQ07E6MTW6qHBEnR/A==
=M/Xn
-----END PGP SIGNATURE-----

--Sig_/3Gc2sE8KC2b8Gtu8=f2jYIg--
