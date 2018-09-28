From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the arm64 tree
Date: Fri, 28 Sep 2018 13:49:29 +1000
Message-ID: <20180928134929.73598ec6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AbN9IIKd.4DXS_x49UCAG6i"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/AbN9IIKd.4DXS_x49UCAG6i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  arch/arm64/kernel/traps.c

between commit:

  8a60419d3676 ("arm64: force_signal_inject: WARN if called from kernel con=
text")

from the arm64 tree and commit:

  6fa998e83ef9 ("signal/arm64: Push siginfo generation into arm64_notify_di=
e")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/traps.c
index 21689c6a985f,856b32aa03d8..000000000000
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@@ -353,12 -366,6 +368,9 @@@ void force_signal_inject(int signal, in
  	const char *desc;
  	struct pt_regs *regs =3D current_pt_regs();
 =20
 +	if (WARN_ON(!user_mode(regs)))
 +		return;
 +
- 	clear_siginfo(&info);
-=20
  	switch (signal) {
  	case SIGILL:
  		desc =3D "undefined instruction";

--Sig_/AbN9IIKd.4DXS_x49UCAG6i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlutpMkACgkQAVBC80lX
0GwSLAf/UNR1AOtAmLKtxFCoadq57qvQjMMqsNVV1yNb23v+f7mJejm+u34AMoHE
scjKQqm8ndKVs7dgqNoqDCnNahTEEGnRmqzr/d0ONqzhLdm+Chbn7DAuv8cNNgpZ
MMozwZYaKt/KEBCjMsdUV4zq1XIkCYk6LxfqQIi4hkPwQExOoJf4Ppi/XmN3bkRD
TfxTTudkwQdc/CD/GOYWpxW1MXIKevVpkmLpINFek+cXRWEdY+O2imy9QptyxI2p
mOs9jaMevYsOZKXh6wr7qPL6Z+cyZWIwTje5G3FYi73EdeVXmTP1gyf1NcPaZfve
i8xRLMHpa7x0NKtgQTaukn7TFnXwsg==
=tN97
-----END PGP SIGNATURE-----

--Sig_/AbN9IIKd.4DXS_x49UCAG6i--
