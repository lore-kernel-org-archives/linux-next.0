From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the s390 tree
Date: Mon, 6 May 2019 16:58:47 +1000
Message-ID: <20190506165847.0e648a4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ux0dL4xhqMQOJKdIaeT1DsM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Ux0dL4xhqMQOJKdIaeT1DsM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/s390/kernel/stacktrace.c

between commit:

  78c98f907413 ("s390/unwind: introduce stack unwind API")

from the s390 tree and commit:

  6a28b4c2d93b ("s390/stacktrace: Remove the pointless ULONG_MAX marker")

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

diff --cc arch/s390/kernel/stacktrace.c
index 89f9f63dca18,cc9ed9787068..000000000000
--- a/arch/s390/kernel/stacktrace.c
+++ b/arch/s390/kernel/stacktrace.c
@@@ -16,53 -41,29 +16,47 @@@
 =20
  void save_stack_trace(struct stack_trace *trace)
  {
 -	unsigned long sp;
 -
 -	sp =3D current_stack_pointer();
 -	dump_trace(save_address, trace, NULL, sp);
 +	struct unwind_state state;
 +
 +	unwind_for_each_frame(&state, current, NULL, 0) {
 +		if (trace->nr_entries >=3D trace->max_entries)
 +			break;
 +		if (trace->skip > 0)
 +			trace->skip--;
 +		else
 +			trace->entries[trace->nr_entries++] =3D state.ip;
 +	}
- 	if (trace->nr_entries < trace->max_entries)
- 		trace->entries[trace->nr_entries++] =3D ULONG_MAX;
  }
  EXPORT_SYMBOL_GPL(save_stack_trace);
 =20
  void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *tr=
ace)
  {
 -	unsigned long sp;
 -
 -	sp =3D tsk->thread.ksp;
 -	if (tsk =3D=3D current)
 -		sp =3D current_stack_pointer();
 -	dump_trace(save_address_nosched, trace, tsk, sp);
 +	struct unwind_state state;
 +
 +	unwind_for_each_frame(&state, tsk, NULL, 0) {
 +		if (trace->nr_entries >=3D trace->max_entries)
 +			break;
 +		if (in_sched_functions(state.ip))
 +			continue;
 +		if (trace->skip > 0)
 +			trace->skip--;
 +		else
 +			trace->entries[trace->nr_entries++] =3D state.ip;
 +	}
- 	if (trace->nr_entries < trace->max_entries)
- 		trace->entries[trace->nr_entries++] =3D ULONG_MAX;
  }
  EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
 =20
  void save_stack_trace_regs(struct pt_regs *regs, struct stack_trace *trac=
e)
  {
 -	unsigned long sp;
 -
 -	sp =3D kernel_stack_pointer(regs);
 -	dump_trace(save_address, trace, NULL, sp);
 +	struct unwind_state state;
 +
 +	unwind_for_each_frame(&state, current, regs, 0) {
 +		if (trace->nr_entries >=3D trace->max_entries)
 +			break;
 +		if (trace->skip > 0)
 +			trace->skip--;
 +		else
 +			trace->entries[trace->nr_entries++] =3D state.ip;
 +	}
- 	if (trace->nr_entries < trace->max_entries)
- 		trace->entries[trace->nr_entries++] =3D ULONG_MAX;
  }
  EXPORT_SYMBOL_GPL(save_stack_trace_regs);

--Sig_/Ux0dL4xhqMQOJKdIaeT1DsM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzP2ycACgkQAVBC80lX
0GzcJgf/WSfAWYc7/nI/cWjpTwQVB5BBHTIukEA2dT5QtCAe7NzwY4jleBobufJF
ehkeLLp3OXbXt29l2Jfv4lP6h4gTPFJF5aW7allb93Ifg+54eHlQ783QbJGgUuGB
TGjX1pjsOnBE2sn/t+XLfrkE7rdUwj1IVMSvA01u/2hpfDeKgVaqvOtsdH7JM+8Y
HcQLfodCtzzjgmCm9AtcTaeNszkAxfaXh0ZcZOxv0uEI22L4/9U2B8JdHkFteo4L
bGIxR/CcaCtn2/T3P3KFHF/geUOjJcf5a8b4x6bbynlhROicC4wTf70N7R3dmjqU
ZGcX/lnz8igGM/m3feT7YR9a44Hy2w==
=SgIA
-----END PGP SIGNATURE-----

--Sig_/Ux0dL4xhqMQOJKdIaeT1DsM--
