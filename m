From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the tip tree
Date: Fri, 11 Feb 2011 14:58:10 +1100
Message-ID: <20110211145810.bdea73a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Beulich <JBeulich@novell.com>, Shaohua Li <shaohua.li@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/x86/kernel/vmlinux.lds.S between commit
94d1ac8b55799be10487fff9766cce6d6628462a ("x86: Reduce back the alignment
of the per-CPU data section") from the tip tree and commit
19df0c2fef010e94e90df514aaf4e73f6b80145c ("percpu: align percpu
readmostly subsection to cacheline") from the percpu tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/vmlinux.lds.S
index e9f7a3c,cef446f..0000000
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@@ -305,7 -305,7 +305,7 @@@ SECTION
  	}
  
  #if !defined(CONFIG_X86_64) || !defined(CONFIG_SMP)
- 	PERCPU(PAGE_SIZE)
 -	PERCPU(INTERNODE_CACHE_BYTES, THREAD_SIZE)
++	PERCPU(INTERNODE_CACHE_BYTES, PAGE_SIZE)
  #endif
  
  	. = ALIGN(PAGE_SIZE);
