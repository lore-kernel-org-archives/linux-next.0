From: Borislav Petkov <bp@suse.de>
Subject: Re: next: Crashes in x86 images due to 'locking/rwsem, x86: Clean up
 ____down_write()'
Date: Thu, 12 May 2016 16:46:57 +0200
Message-ID: <20160512144657.GA14245@pd.tnic>
References: <57348665.3050301@roeck-us.net>
 <20160512135131.GA7803@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38831 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752142AbcELOrE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 May 2016 10:47:04 -0400
Content-Disposition: inline
In-Reply-To: <20160512135131.GA7803@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 12, 2016 at 03:51:31PM +0200, Borislav Petkov wrote:
> On Thu, May 12, 2016 at 06:34:29AM -0700, Guenter Roeck wrote:
> > Borislav,
> >=20
> > your patch 'locking/rwsem, x86: Clean up ____down_write()' causes v=
arious
> > crashes in x86 qemu tests.
>=20
> Thanks for the report, let me take a look.
>=20
> @Ingo: can you please back this one out of the lineup for the merge
> window until I've sorted out the issue?

Ok, I was able to reproduce:

BUG: unable to handle kernel NULL pointer dereference at 00000015
IP: [<c185e094>] down_write+0x24/0x30
*pde =3D 00000000=20
Oops: 0002 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G S      W       4.6.0-rc7-next-=
20160511-yocto-standard #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.7.5-20140=
531_083030-gandalf 04/01/2014
task: f4d00000 ti: f4d08000 task.ti: f4d08000
EIP: 0060:[<c185e094>] EFLAGS: 00210282 CPU: 0
EIP is at down_write+0x24/0x30
EAX: f4d00000 EBX: f4f6d600 ECX: ffff0001 EDX: 00000001
ESI: 00000168 EDI: c1c2eb68 EBP: f4d09ef4 ESP: f4d09eec
 DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
CR0: 80050033 CR2: 00000015 CR3: 01ccb000 CR4: 000406d0

We fault here:

c185e070 <down_write>:
c185e070:       55                      push   %ebp
c185e071:       89 e5                   mov    %esp,%ebp
c185e073:       e8 20 2b 00 00          call   c1860b98 <mcount>
c185e078:       b9 01 00 ff ff          mov    $0xffff0001,%ecx
c185e07d:       89 c2                   mov    %eax,%edx
c185e07f:       f0 0f c1 08             lock xadd %ecx,(%eax)
c185e083:       66 85 c9                test   %cx,%cx
c185e086:       74 05                   je     c185e08d <down_write+0x1=
d>
c185e088:       e8 f7 31 b7 ff          call   c13d1284 <call_rwsem_dow=
n_write_failed>
c185e08d:       64 a1 48 59 cb c1       mov    %fs:0xc1cb5948,%eax
c185e093:       5d                      pop    %ebp
c185e094:       89 42 14                mov    %eax,0x14(%edx)		<--- HE=
RE
c185e097:       c3                      ret
c185e098:       90                      nop
c185e099:       8d b4 26 00 00 00 00    lea    0x0(%esi,%eiz,1),%esi

and %edx is 1 (+ 0x14 gives the 00000015 deref addr).

But edx should contain sem. The code does:

        .loc 1 47 0
        movl    %eax, %edx      # sem, sem

	lock;   xadd      %ecx,(%eax)   # tmp91, sem

	call call_rwsem_down_write_failed

	mov    %eax,0x14(%edx)

and if something in that call clobbers %edx, boom! Now I need to think
about how to make gcc reload sem after

	LOCK_CONTENDED(sem, __down_write_trylock, __down_write);

for
	rwsem_set_owner(sem);

Btw, the hunk below seems to fix it. And the comment above those
{save,restore}_common_regs talk about "Save the C-clobbered registers
(%eax, %edx and %ecx)" but the only reg we're stashing is ecx.

Why aren't we stashing edx too?

Ingo, Peter?

---
diff --git a/arch/x86/lib/rwsem.S b/arch/x86/lib/rwsem.S
index a37462a23546..02240807e97a 100644
--- a/arch/x86/lib/rwsem.S
+++ b/arch/x86/lib/rwsem.S
@@ -33,10 +33,12 @@
  * value or just clobbered..
  */
=20
-#define save_common_regs \
-       pushl %ecx
+#define save_common_regs       \
+       pushl %ecx;             \
+       pushl %edx
=20
-#define restore_common_regs \
+#define restore_common_regs    \
+       popl %edx;              \
        popl %ecx
=20
        /* Avoid uglifying the argument copying x86-64 needs to do. */

--=20
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
--=20
