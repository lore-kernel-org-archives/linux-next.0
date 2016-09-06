From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Date: Tue, 6 Sep 2016 13:43:15 +1000
Message-ID: <20160906134315.7cc65f0f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Tony Luck <tony.luck@intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/lib/memcpy_64.S
  arch/x86/kernel/x8664_ksyms_64.c

between commit:

  784d5699eddc ("x86: move exports to actual definitions")

from the kbuild tree and commit:

  9a6fb28a355d ("x86/mce: Improve memcpy_mcsafe()")

from the tip tree.

I fixed it up (see below - I also removed
arch/x86/kernel/x8664_ksyms_64.c) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/lib/memcpy_64.S
index 94c917af9688,49e6ebac7e73..000000000000
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@@ -276,8 -273,7 +276,8 @@@ ENTRY(memcpy_mcsafe_unrolled
  .L_done_memcpy_trap:
  	xorq %rax, %rax
  	ret
- ENDPROC(memcpy_mcsafe)
- EXPORT_SYMBOL_GPL(memcpy_mcsafe)
+ ENDPROC(memcpy_mcsafe_unrolled)
++EXPORT_SYMBOL_GPL(memcpy_mcsafe_unrolled)
  
  	.section .fixup, "ax"
  	/* Return -EFAULT for any failure */
