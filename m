From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the tip tree
Date: Fri, 23 Jun 2017 14:19:13 +1000
Message-ID: <20170623141913.322b0062@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

In file included from arch/x86/include/asm/paravirt_types.h:44:0,
                 from arch/x86/include/asm/ptrace.h:71,
                 from arch/x86/include/asm/math_emu.h:4,
                 from arch/x86/include/asm/processor.h:11,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:37,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:80,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:35,
                 from include/linux/time.h:5,
                 from include/uapi/linux/timex.h:56,
                 from include/linux/timex.h:56,
                 from include/linux/clocksource.h:12,
                 from arch/x86/include/asm/vgtod.h:5,
                 from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:15,
                 from arch/x86/entry/vdso/vdso32/vclock_gettime.c:32:
arch/x86/include/asm/pgtable.h: In function 'pte_flags_pkey':
arch/x86/include/asm/pgtable_types.h:56:43: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define _PAGE_PKEY_BIT0 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT0)
                                           ^
arch/x86/include/asm/pgtable_types.h:68:26: note: in expansion of macro '_PAGE_PKEY_BIT0'
 #define _PAGE_PKEY_MASK (_PAGE_PKEY_BIT0 | \
                          ^
arch/x86/include/asm/pgtable.h:1187:22: note: in expansion of macro '_PAGE_PKEY_MASK'
  return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
                      ^
arch/x86/include/asm/pgtable_types.h:57:43: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define _PAGE_PKEY_BIT1 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT1)
                                           ^
arch/x86/include/asm/pgtable_types.h:69:5: note: in expansion of macro '_PAGE_PKEY_BIT1'
     _PAGE_PKEY_BIT1 | \
     ^
arch/x86/include/asm/pgtable.h:1187:22: note: in expansion of macro '_PAGE_PKEY_MASK'
  return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
                      ^
arch/x86/include/asm/pgtable_types.h:58:43: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define _PAGE_PKEY_BIT2 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT2)
                                           ^
arch/x86/include/asm/pgtable_types.h:70:5: note: in expansion of macro '_PAGE_PKEY_BIT2'
     _PAGE_PKEY_BIT2 | \
     ^
arch/x86/include/asm/pgtable.h:1187:22: note: in expansion of macro '_PAGE_PKEY_MASK'
  return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
                      ^
arch/x86/include/asm/pgtable_types.h:59:43: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define _PAGE_PKEY_BIT3 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT3)
                                           ^
arch/x86/include/asm/pgtable_types.h:71:5: note: in expansion of macro '_PAGE_PKEY_BIT3'
     _PAGE_PKEY_BIT3)
     ^
arch/x86/include/asm/pgtable.h:1187:22: note: in expansion of macro '_PAGE_PKEY_MASK'
  return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
                      ^
In file included from include/linux/kasan.h:16:0,
                 from include/linux/slab.h:120,
                 from include/linux/irq.h:25,
                 from arch/x86/include/asm/hardirq.h:5,
                 from include/linux/hardirq.h:8,
                 from include/linux/interrupt.h:12,
                 from arch/x86/include/asm/mshyperv.h:5,
                 from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:20,
                 from arch/x86/entry/vdso/vdso32/vclock_gettime.c:32:
arch/x86/include/asm/pgtable.h:1187:39: warning: right shift count >= width of type [-Wshift-count-overflow]
  return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
                                       ^

I have no idea what caused this.

-- 
Cheers,
Stephen Rothwell
