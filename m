From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: error: implicit declarations of BUG/BUG_ON/WARN_ON/WARN_ON_ONCE
Date: Mon, 25 Jun 2012 11:53:02 +0900
Message-ID: <20120625025301.GB9317@linux-sh.org>
References: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au>
 <20120615065231.GA12272@localhost>
 <4FDB6261.2030400@xenotime.net>
 <4FDF5D50.7030505@xenotime.net>
 <20120622071305.GA15102@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120622071305.GA15102@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 22, 2012 at 03:13:05PM +0800, Fengguang Wu wrote:
> On Mon, Jun 18, 2012 at 09:54:40AM -0700, Randy Dunlap wrote:
> > On 06/15/2012 09:27 AM, Randy Dunlap wrote:
> > 
> > > On 06/14/2012 11:52 PM, Fengguang Wu wrote:
> > > 
> > >> On Fri, Jun 15, 2012 at 02:33:03PM +1000, Stephen Rothwell wrote:
> > >>> Hi all,
> > >>>
> > >>> Changes since 20120614:
> > >>>
> > >>> My fixes tree contains:
> > >>> 	fix bug.h's inclusion of kernel.h
> > >>
> > >> I got these errors with the attached randconfig. Not sure which change
> > >> triggers them.
> > > 
> > > Ditto.  When CONFIG_BUG is not enabled.
> > 
> > 
> > This problem is still in linux-next of 20120618...
> 
> It's now in Linus' tree..
> 
> Paul, any idea to fix this? The attached .config can reproduce the bug.
> 
I'm really starting to loathe this header. This should take care of it:

---

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 506ec19..7d10f96 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -3,10 +3,18 @@
 
 #include <linux/compiler.h>
 
+#ifdef CONFIG_GENERIC_BUG
+#define BUGFLAG_WARNING		(1 << 0)
+#define BUGFLAG_TAINT(taint)	(BUGFLAG_WARNING | ((taint) << 8))
+#define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
+#endif
+
+#ifndef __ASSEMBLY__
+#include <linux/kernel.h>
+
 #ifdef CONFIG_BUG
 
 #ifdef CONFIG_GENERIC_BUG
-#ifndef __ASSEMBLY__
 struct bug_entry {
 #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	unsigned long	bug_addr;
@@ -23,17 +31,8 @@ struct bug_entry {
 #endif
 	unsigned short	flags;
 };
-#endif		/* __ASSEMBLY__ */
-
-#define BUGFLAG_WARNING		(1 << 0)
-#define BUGFLAG_TAINT(taint)	(BUGFLAG_WARNING | ((taint) << 8))
-#define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
-
 #endif	/* CONFIG_GENERIC_BUG */
 
-#ifndef __ASSEMBLY__
-#include <linux/kernel.h>
-
 /*
  * Don't use BUG() or BUG_ON() unless there's really no way out; one
  * example might be detecting data structure corruption in the middle
