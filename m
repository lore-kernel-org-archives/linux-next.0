From: Borislav Petkov <bp@suse.de>
Subject: [PATCH] x86/rwsem: Save and restore all callee-clobbered regs in
 32-bit ____down_write()
Date: Thu, 12 May 2016 19:29:38 +0200
Message-ID: <20160512172938.GB14245@pd.tnic>
References: <57348665.3050301@roeck-us.net>
 <20160512135131.GA7803@pd.tnic>
 <20160512144657.GA14245@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160512144657.GA14245@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Anyway, here's an actual patch with a commit message. Guenter, can you
give it a run please?

It does fix the issue here with your .config but I'd appreciate a
confirmation.

Thanks.

---
=46rom: Borislav Petkov <bp@suse.de>

____down_write() calls a function to handle the slow path when the lock
is contended. But in order to be able to call a C function, one has to
stash all callee-clobbered registers. The 32-bit path saves only %ecx
for a reason unknown to me. However, after

  71c01930b42e ("locking/rwsem, x86: Clean up ____down_write()")

the useless dependency on edx was removed and this caused the following
splat:

  BUG: unable to handle kernel NULL pointer dereference at 00000015
  IP: [<c185e094>] down_write+0x24/0x30
  *pde =3D 00000000
  Oops: 0002 [#1] PREEMPT SMP
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Tainted: G S      W       4.6.0-rc7-nex=
t-20160511-yocto-standard #1
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.7.5-201=
40531_083030-gandalf 04/01/2014
  task: f4d00000 ti: f4d08000 task.ti: f4d08000
  EIP: 0060:[<c185e094>] EFLAGS: 00210282 CPU: 0
  EIP is at down_write+0x24/0x30
  EAX: f4d00000 EBX: f4f6d600 ECX: ffff0001 EDX: 00000001
  ESI: 00000168 EDI: c1c2eb68 EBP: f4d09ef4 ESP: f4d09eec
   DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
  CR0: 80050033 CR2: 00000015 CR3: 01ccb000 CR4: 000406d0

This happens because gcc decided to stash the pointer to @sem in edx (i=
t
is not used in the inline asm anymore, thus free):

  movl    %eax, %edx      # sem, sem

  lock;   xadd      %ecx,(%eax)   # tmp91, sem
  test ...

  call call_rwsem_down_write_failed

  mov    %eax,0x14(%edx)

*before* the slow path happens and if we hit it on 32-bit, it can
clobber edx and we're staring at garbage value at deref time.

The simple fix is to save/restore edx too, around the slow path. We
don't need to stash eax because it is used in the slow path as the @sem
arg.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/x86/lib/rwsem.S | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/lib/rwsem.S b/arch/x86/lib/rwsem.S
index a37462a23546..02240807e97a 100644
--- a/arch/x86/lib/rwsem.S
+++ b/arch/x86/lib/rwsem.S
@@ -33,10 +33,12 @@
  * value or just clobbered..
  */
=20
-#define save_common_regs \
-	pushl %ecx
+#define save_common_regs	\
+	pushl %ecx;		\
+	pushl %edx
=20
-#define restore_common_regs \
+#define restore_common_regs	\
+	popl %edx;		\
 	popl %ecx
=20
 	/* Avoid uglifying the argument copying x86-64 needs to do. */
--=20
2.7.3

--=20
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
