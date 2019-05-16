From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Date: Thu, 16 May 2019 11:00:18 +1000
Message-ID: <20190516110018.4e85254e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7DYV1ZLNDZ1kZ/LMGOb=0jE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/7DYV1ZLNDZ1kZ/LMGOb=0jE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  arch/x86/entry/entry_64.S

between commits:

  8f34c5b5afce ("x86/exceptions: Make IST index zero based")
  3207426925d2 ("x86/exceptions: Disconnect IST index and stack order")
  2a594d4ccf3f ("x86/exceptions: Split debug IST stack")

from Linus' tree and commit:

  2700fefdb2d9 ("x86_64: Add gap to int3 to allow for call emulation")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/entry/entry_64.S
index 20e45d9b4e15,27fcc6fbdd52..000000000000
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@@ -878,7 -879,7 +878,7 @@@ apicinterrupt IRQ_WORK_VECTOR			irq_wor
   * @paranoid =3D=3D 2 is special: the stub will never switch stacks.  Thi=
s is for
   * #DF: if the thread stack is somehow unusable, we'll still get a useful=
 OOPS.
   */
- .macro idtentry sym do_sym has_error_code:req paranoid=3D0 shift_ist=3D-1=
 ist_offset=3D0
 -.macro idtentry sym do_sym has_error_code:req paranoid=3D0 shift_ist=3D-1=
 create_gap=3D0
++.macro idtentry sym do_sym has_error_code:req paranoid=3D0 shift_ist=3D-1=
 ist_offset=3D0 create_gap=3D0
  ENTRY(\sym)
  	UNWIND_HINT_IRET_REGS offset=3D\has_error_code*8
 =20
@@@ -1128,8 -1143,8 +1142,8 @@@ apicinterrupt3 HYPERV_STIMER0_VECTOR=20
  	hv_stimer0_callback_vector hv_stimer0_vector_handler
  #endif /* CONFIG_HYPERV */
 =20
 -idtentry debug			do_debug		has_error_code=3D0	paranoid=3D1 shift_ist=3DDE=
BUG_STACK
 +idtentry debug			do_debug		has_error_code=3D0	paranoid=3D1 shift_ist=3DIS=
T_INDEX_DB ist_offset=3DDB_STACK_OFFSET
- idtentry int3			do_int3			has_error_code=3D0
+ idtentry int3			do_int3			has_error_code=3D0	create_gap=3D1
  idtentry stack_segment		do_stack_segment	has_error_code=3D1
 =20
  #ifdef CONFIG_XEN_PV

--Sig_/7DYV1ZLNDZ1kZ/LMGOb=0jE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzctiIACgkQAVBC80lX
0GwWZggAorC5X+xTH+vP9/QFuHBmrJvruuWSXPm0WKd4nH6x3AlHt+EgtPGqAT52
VR+ASjIv0p6xxCbNOG87cp5Iff3GECPWrkjYsbBVx7EJukiQbpywARr7S46rMbbe
q/wdqaRQOr7IZj8hsyt8LXhaTSaQq+zuCKN17FXyugd8cEu0MQwHl0XL5skZNthB
47S2xpUSOHJJmfFDkRtj9TW4/psHdEuVxE80/4ArU78zw1hNCaMTwtGJdC2gEXSB
WW4Zt/eM/Ro+NVtrdXsj2RUpFfDR7qFGOUDenksTXtgHX77MBZWeDNQmRXGNt1g8
IVJdMzZvlk0L+vMKV57ekIRKe2HQvg==
=40U7
-----END PGP SIGNATURE-----

--Sig_/7DYV1ZLNDZ1kZ/LMGOb=0jE--
