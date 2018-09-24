From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the tip tree
Date: Mon, 24 Sep 2018 13:34:34 +1000
Message-ID: <20180924133434.3c04d891@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tlqE6TIcDKEcIt2vYqb6Zmx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jann Horn <jannh@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/tlqE6TIcDKEcIt2vYqb6Zmx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  arch/x86/kernel/traps.c

between commits:

  76dee4a72849 ("x86/kprobes: Inline kprobe_exceptions_notify() into do_gen=
eral_protection()")
  81fd9c18444e ("x86/fault: Plumb error code and fault address through to f=
ault handlers")

from the tip tree and commits:

  6ace1098a68c ("signal/x86/traps: Factor out show_signal")
  79e21d654093 ("signal/x86/traps: Move more code into do_trap_no_signal so=
 it can be reused")

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

diff --cc arch/x86/kernel/traps.c
index 5bd0a997d81e,34a327f35976..000000000000
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@@ -202,11 -202,8 +202,8 @@@ do_trap_no_signal(struct task_struct *t
  						error_code, trapnr))
  				return 0;
  		}
- 		return -1;
- 	}
-=20
- 	if (!user_mode(regs)) {
+ 	} else if (!user_mode(regs)) {
 -		if (fixup_exception(regs, trapnr))
 +		if (fixup_exception(regs, trapnr, error_code, 0))
  			return 0;
 =20
  		tsk->thread.error_code =3D error_code;
@@@ -560,19 -540,9 +544,19 @@@ do_general_protection(struct pt_regs *r
 =20
  		tsk->thread.error_code =3D error_code;
  		tsk->thread.trap_nr =3D X86_TRAP_GP;
 +
 +		/*
 +		 * To be potentially processing a kprobe fault and to
 +		 * trust the result from kprobe_running(), we have to
 +		 * be non-preemptible.
 +		 */
 +		if (!preemptible() && kprobe_running() &&
 +		    kprobe_fault_handler(regs, X86_TRAP_GP))
 +			return;
 +
- 		if (notify_die(DIE_GPF, "general protection fault", regs, error_code,
+ 		if (notify_die(DIE_GPF, desc, regs, error_code,
  			       X86_TRAP_GP, SIGSEGV) !=3D NOTIFY_STOP)
- 			die("general protection fault", regs, error_code);
+ 			die(desc, regs, error_code);
  		return;
  	}
 =20

--Sig_/tlqE6TIcDKEcIt2vYqb6Zmx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluoW0oACgkQAVBC80lX
0GypKwgAkq1U6dsJv73sBq7FV8XRl9S3sUIORJZHVsTXTTR7iSpf5lRLXwb/d80/
MMKKSNwluJIYxwTbnGdJeU7CRhuTEtizT6JKo5c57CpFGMjUNnD8cCK+nzJ9Snkn
oTOeCo+gpbzkz0dr3WPgpt1dNyxnX1s1PZtHvKSZvD4cJ118SK97QoJaEANykTpj
Je1gx/TD0EOG/x4clNOlxsqFLXCob0diJk0LUiL9uaht8Cb8E2JZiDJd91eJxo09
+01s3gjssjaoSus6Z4XUFCCm/HDVbZ+Frb8V8U09LUb11TiiVMR95MSdQeOAg0RH
InJzr18k5FbJ2p3PmlFR0ZkgEnGD+g==
=nb7z
-----END PGP SIGNATURE-----

--Sig_/tlqE6TIcDKEcIt2vYqb6Zmx--
