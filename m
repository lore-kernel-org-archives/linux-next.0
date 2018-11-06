From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Tue, 6 Nov 2018 11:43:17 +1100
Message-ID: <20181106114317.1fbce2bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V2udws/wg9FA4M=zy2WB=Tv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/V2udws/wg9FA4M=zy2WB=Tv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/bin/bash: scripts/atomic/check-atomics.sh: No such file or directory

Caused by commit

  8d32588077bd ("locking/atomics: Check generated headers are up-to-date")

I build with O=3D

I have appplied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Nov 2018 11:37:10 +1100
Subject: [PATCH] fix for "locking/atomics: Check generated headers are
 up-to-date"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Kbuild | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Kbuild b/Kbuild
index 47c9fe175bd9..780048056ac5 100644
--- a/Kbuild
+++ b/Kbuild
@@ -80,7 +80,7 @@ always +=3D old-atomics
 targets +=3D old-atomics
=20
 quiet_cmd_atomics =3D CALL    $<
-      cmd_atomics =3D $(CONFIG_SHELL) scripts/atomic/check-atomics.sh
+      cmd_atomics =3D $(CONFIG_SHELL) $<
=20
 old-atomics: scripts/atomic/check-atomics.sh FORCE
 	$(call cmd,atomics)
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/V2udws/wg9FA4M=zy2WB=Tv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvg46UACgkQAVBC80lX
0GxRRAgAk80jx7lgDJ1maHNoo7KKjgJP4u+RwCIhWcRH8jRYfJlWdbiUxqbojuxd
yPZfFHA5D+qgvptM7gqQOPXuuVdfJXFsPZJd1A4XwWstGhb8IHdFb4P5mZ9v5UjQ
DehN3+Bb7IIMeY7Z3sDAhaHw8/N96mkFLRw3fqgNhhN88o+9j/xOIojiNsiB5RFa
BaTkPyC266Unttue1W/dqnuENbwmSafgiyufoWXMqCCKP7qyeeKk20LCDaGtS5D/
OlTfm8WBX1Fb+x5guIkrGFq4tD0gQgTpdaOtO8I69Eu/8vLnT7Uu7+QeLhOomgYL
qg0Dm2miXo9W2zCIzbU43C7Fs1eqKA==
=aerB
-----END PGP SIGNATURE-----

--Sig_/V2udws/wg9FA4M=zy2WB=Tv--
