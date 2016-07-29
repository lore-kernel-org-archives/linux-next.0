From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 29 Jul 2016 14:14:10 +1000
Message-ID: <20160729141410.3dadca86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/include/asm/thread_info.h

between commit:

  609c19a385c8 ("x86/ptrace: Stop setting TS_COMPAT in ptrace code")

from the tip tree and commit:

  58f9594bd42f ("signal: consolidate {TS,TLF}_RESTORE_SIGMASK code")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/thread_info.h
index d4b0fd24a63e,b45ffdda3549..000000000000
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@@ -263,35 -219,8 +263,11 @@@ static inline int arch_within_stack_fra
   * have to worry about atomic accesses.
   */
  #define TS_COMPAT		0x0002	/* 32bit syscall active (64BIT)*/
 +#ifdef CONFIG_COMPAT
 +#define TS_I386_REGS_POKED	0x0004	/* regs poked by 32-bit ptracer */
 +#endif
- #define TS_RESTORE_SIGMASK	0x0008	/* restore signal mask in do_signal() */
  
  #ifndef __ASSEMBLY__
- #define HAVE_SET_RESTORE_SIGMASK	1
- static inline void set_restore_sigmask(void)
- {
- 	struct thread_info *ti = current_thread_info();
- 	ti->status |= TS_RESTORE_SIGMASK;
- 	WARN_ON(!test_bit(TIF_SIGPENDING, (unsigned long *)&ti->flags));
- }
- static inline void clear_restore_sigmask(void)
- {
- 	current_thread_info()->status &= ~TS_RESTORE_SIGMASK;
- }
- static inline bool test_restore_sigmask(void)
- {
- 	return current_thread_info()->status & TS_RESTORE_SIGMASK;
- }
- static inline bool test_and_clear_restore_sigmask(void)
- {
- 	struct thread_info *ti = current_thread_info();
- 	if (!(ti->status & TS_RESTORE_SIGMASK))
- 		return false;
- 	ti->status &= ~TS_RESTORE_SIGMASK;
- 	return true;
- }
  
  static inline bool in_ia32_syscall(void)
  {
