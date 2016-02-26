From: Dave Hansen <dave@sr71.net>
Subject: [PATCH] x86, pkeys: fix siginfo ABI breakage from new field
Date: Fri, 26 Feb 2016 09:34:27 -0800
Message-ID: <20160226173427.54A6949F@viggo.jf.intel.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:13100 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422632AbcBZRe2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 12:34:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave@sr71.net>, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de


From: Dave Hansen <dave.hansen@linux.intel.com>

Stephen Rothwell reported:

	http://lkml.kernel.org/r/20160226164406.065a1ffc@canb.auug.org.au

that the Memory Protection Keys patches from the tip tree broke
a build-time check on an ARM build because they changed the ABI
of siginfo.

A u64 was used for the protection key field in siginfo.  When the
containing union was aligned, this u64 unioned nicely with the
two 'void *'s in _addr_bnd.  But, on 32-bit, if the union was
unaligned, the u64 might grow the size of the union, breaking the
ABI for subsequent fields.

To fix this, we replace the u64 with an 'unsigned long'.  The long
is guaranteed to union well with the pointers from _addr_bnd.  It
is also plenty large enough to store the 16-bit pkey we have today
on x86.  This also has the advantage that it allows existing 64-bit
userspace to keep working without modification.

I also shouldn't have been using a u64 in a userspace API to begin
with.

Fixes: cd0ea35ff551 ("signals, pkeys: Notify userspace about protection key faults")
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
---

 b/arch/ia64/include/uapi/asm/siginfo.h |    2 +-
 b/arch/mips/include/uapi/asm/siginfo.h |    2 +-
 b/include/uapi/asm-generic/siginfo.h   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff -puN include/uapi/asm-generic/siginfo.h~pkeys-101-fix-siginfo include/uapi/asm-generic/siginfo.h
--- a/include/uapi/asm-generic/siginfo.h~pkeys-101-fix-siginfo	2016-02-26 08:50:47.760659292 -0800
+++ b/include/uapi/asm-generic/siginfo.h	2016-02-26 08:52:08.591330838 -0800
@@ -98,7 +98,7 @@ typedef struct siginfo {
 					void __user *_upper;
 				} _addr_bnd;
 				/* used when si_code=SEGV_PKUERR */
-				u64 _pkey;
+				unsigned long _pkey;
 			};
 		} _sigfault;
 
diff -puN arch/mips/include/uapi/asm/siginfo.h~pkeys-101-fix-siginfo arch/mips/include/uapi/asm/siginfo.h
--- a/arch/mips/include/uapi/asm/siginfo.h~pkeys-101-fix-siginfo	2016-02-26 08:51:50.357502608 -0800
+++ b/arch/mips/include/uapi/asm/siginfo.h	2016-02-26 08:51:55.206722873 -0800
@@ -93,7 +93,7 @@ typedef struct siginfo {
 					void __user *_upper;
 				} _addr_bnd;
 				/* used when si_code=SEGV_PKUERR */
-				u64 _pkey;
+				unsigned long _pkey;
 			};
 		} _sigfault;
 
diff -puN arch/ia64/include/uapi/asm/siginfo.h~pkeys-101-fix-siginfo arch/ia64/include/uapi/asm/siginfo.h
--- a/arch/ia64/include/uapi/asm/siginfo.h~pkeys-101-fix-siginfo	2016-02-26 08:51:50.413505152 -0800
+++ b/arch/ia64/include/uapi/asm/siginfo.h	2016-02-26 08:52:00.806977252 -0800
@@ -70,7 +70,7 @@ typedef struct siginfo {
 					void __user *_upper;
 				} _addr_bnd;
 				/* used when si_code=SEGV_PKUERR */
-				u64 _pkey;
+				unsigned long _pkey;
 			};
 		} _sigfault;
 
_
