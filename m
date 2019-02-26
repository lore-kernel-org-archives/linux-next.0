From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Date: Tue, 26 Feb 2019 13:48:35 +1100
Message-ID: <20190226134835.35a51322@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yj77Klv+bFuYDbGji2MIpGq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/yj77Klv+bFuYDbGji2MIpGq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Kbuild

between commits:

  86948e2a69de ("scripts/gdb: delay generation of gdb constants.py")
  f4d5577af6d3 ("kbuild: remove unimportant comments from ./Kbuild")

from the kbuild tree and commit:

  8d32588077bd ("locking/atomics: Check generated headers are up-to-date")

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

diff --cc Kbuild
index a07bbd62f052,4a4c47c38d1d..000000000000
--- a/Kbuild
+++ b/Kbuild
@@@ -50,5 -59,27 +50,18 @@@ quiet_cmd_syscalls =3D CALL    $
  missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
  	$(call cmd,syscalls)
 =20
+ #####
 -# 5) Check atomic headers are up-to-date
++# Check atomic headers are up-to-date
+ #
+=20
+ always +=3D old-atomics
+ targets +=3D old-atomics
+=20
+ quiet_cmd_atomics =3D CALL    $<
+       cmd_atomics =3D $(CONFIG_SHELL) $<
+=20
+ old-atomics: scripts/atomic/check-atomics.sh FORCE
+ 	$(call cmd,atomics)
+=20
 -#####
 -# 6) Generate constants for Python GDB integration
 -#
 -
 -extra-$(CONFIG_GDB_SCRIPTS) +=3D build_constants_py
 -
 -build_constants_py: $(timeconst-file) $(bounds-file)
 -	@$(MAKE) $(build)=3Dscripts/gdb/linux $@
 -
  # Keep these three files during make clean
  no-clean-files :=3D $(bounds-file) $(offsets-file) $(timeconst-file)

--Sig_/yj77Klv+bFuYDbGji2MIpGq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx0qQMACgkQAVBC80lX
0GwckAgAkonEJfSE3ilAxZo167WeHgtDGaKo5NfgtXgYnqxlFt2mZy4PGcD5bIHh
8KCFi8u4YmzFYxp4/YyLiuTDZanu8rIMtVL12xYWuG4X4cEhCrtMU6s2WHzhS9aM
/0NP8Oef5pMqYWjfqSMtj2UzFDPxorQNm/n2G2IZ5ZIgCrawnHC3MWMCU95Kt/J3
P/CaF+D3lrIghguhHdj6gA/OVHmgqQRbEAPxLt9KIe93LXkQGrcN1nFUGEV+Tx5F
6nJMmWHJYALHwrOzPNgmcVYZUWSlzPx8vFGPENbaP3w3fZ8kHayNL0lmX709RRKw
XeiOHlB3yO2KhQOKwxGoivFLVgzAJw==
=GwUK
-----END PGP SIGNATURE-----

--Sig_/yj77Klv+bFuYDbGji2MIpGq--
