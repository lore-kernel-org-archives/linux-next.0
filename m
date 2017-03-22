From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the livepatching tree with the tip tree
Date: Wed, 22 Mar 2017 13:41:23 +1100
Message-ID: <20170322134123.73f29daa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jikos@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kyle Huey <me@kylehuey.com>, Josh Poimboeuf <jpoimboe@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the livepatching tree got a conflict in:

  arch/x86/include/asm/thread_info.h

between commit:

  e9ea1e7f53b8 ("x86/arch_prctl: Add ARCH_[GET|SET]_CPUID")

from the tip tree and commit:

  afb94c9e0b41 ("livepatch/x86: add TIF_PATCH_PENDING thread flag")

from the livepatching tree.

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
index 9fc44b95f7cb,83372dc43943..000000000000
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@@ -87,7 -84,7 +84,8 @@@ struct thread_info 
  #define TIF_SECCOMP		8	/* secure computing */
  #define TIF_USER_RETURN_NOTIFY	11	/* notify kernel of userspace return */
  #define TIF_UPROBE		12	/* breakpointed or singlestepping */
+ #define TIF_PATCH_PENDING	13	/* pending live patching update */
 +#define TIF_NOCPUID		15	/* CPUID is not accessible in userland */
  #define TIF_NOTSC		16	/* TSC is not accessible in userland */
  #define TIF_IA32		17	/* IA32 compatibility process */
  #define TIF_NOHZ		19	/* in adaptive nohz mode */
@@@ -111,7 -108,7 +109,8 @@@
  #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
  #define _TIF_USER_RETURN_NOTIFY	(1 << TIF_USER_RETURN_NOTIFY)
  #define _TIF_UPROBE		(1 << TIF_UPROBE)
+ #define _TIF_PATCH_PENDING	(1 << TIF_PATCH_PENDING)
 +#define _TIF_NOCPUID		(1 << TIF_NOCPUID)
  #define _TIF_NOTSC		(1 << TIF_NOTSC)
  #define _TIF_IA32		(1 << TIF_IA32)
  #define _TIF_NOHZ		(1 << TIF_NOHZ)
