From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 26 Feb 2016 16:44:06 +1100
Message-ID: <20160226164406.065a1ffc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45573 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750916AbcBZFoJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 00:44:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from /home/sfr/next/next/include/linux/linkage.h:4:0,
                 from /home/sfr/next/next/arch/arm/include/asm/bug.h:4,
                 from /home/sfr/next/next/include/linux/bug.h:4,
                 from /home/sfr/next/next/include/linux/mmdebug.h:4,
                 from /home/sfr/next/next/include/linux/gfp.h:4,
                 from /home/sfr/next/next/include/linux/slab.h:14,
                 from /home/sfr/next/next/kernel/signal.c:13:
/home/sfr/next/next/kernel/signal.c: In function 'signals_init':
/home/sfr/next/next/include/linux/compiler.h:506:38: error: call to '__compiletime_assert_3610' declared with attribute error: BUILD_BUG_ON failed: __ARCH_SI_PREAMBLE_SIZE != offsetof(struct siginfo, _sifields._pad)

Caused by commit

  21c0826ab237 ("kernel/signal.c: add compile-time check for __ARCH_SI_PREAMBLE_SIZE")

interacting with commit

  cd0ea35ff551 ("signals, pkeys: Notify userspace about protection key faults")

from the tip tree.

The addition of the "u64 _pkey" has presumably changed the alignment of
the enclosing union on (some) 32 bit platforms and so added padding
after the si_code field.  This is a user API issue. :-(

[As an aside, I am pretty sure that we should not be using "u64" in a
uapi header in any case.]

I have added the following patch for today (and will add it to the tip
tree merge from Monday unless some other fix comes along).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Feb 2016 16:31:36 +1100
Subject: [PATCH] signals, pkeys: make si_pkey 32 bits for now

to prevent a change of alignment in the siginfo structure

Fixes: cd0ea35ff551 ("signals, pkeys: Notify userspace about protection key faults")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/ia64/include/uapi/asm/siginfo.h | 2 +-
 arch/mips/include/uapi/asm/siginfo.h | 2 +-
 include/uapi/asm-generic/siginfo.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/include/uapi/asm/siginfo.h b/arch/ia64/include/uapi/asm/siginfo.h
index 0151cfab929d..0c660bbccd3f 100644
--- a/arch/ia64/include/uapi/asm/siginfo.h
+++ b/arch/ia64/include/uapi/asm/siginfo.h
@@ -70,7 +70,7 @@ typedef struct siginfo {
 					void __user *_upper;
 				} _addr_bnd;
 				/* used when si_code=SEGV_PKUERR */
-				u64 _pkey;
+				int _pkey;
 			};
 		} _sigfault;
 
diff --git a/arch/mips/include/uapi/asm/siginfo.h b/arch/mips/include/uapi/asm/siginfo.h
index 6f4edf0d794c..d2adebc0023d 100644
--- a/arch/mips/include/uapi/asm/siginfo.h
+++ b/arch/mips/include/uapi/asm/siginfo.h
@@ -93,7 +93,7 @@ typedef struct siginfo {
 					void __user *_upper;
 				} _addr_bnd;
 				/* used when si_code=SEGV_PKUERR */
-				u64 _pkey;
+				int _pkey;
 			};
 		} _sigfault;
 
diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
index 90384d55225b..0f23ec63c291 100644
--- a/include/uapi/asm-generic/siginfo.h
+++ b/include/uapi/asm-generic/siginfo.h
@@ -98,7 +98,7 @@ typedef struct siginfo {
 					void __user *_upper;
 				} _addr_bnd;
 				/* used when si_code=SEGV_PKUERR */
-				u64 _pkey;
+				int _pkey;
 			};
 		} _sigfault;
 
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
