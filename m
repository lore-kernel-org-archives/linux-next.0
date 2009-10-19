From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: tree build failure
Date: Mon, 19 Oct 2009 11:19:29 -0700
Message-ID: <1255976369.13995.98.camel@slab.beaverton.ibm.com>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
	<1254267572.15622.1621.camel@slab.beaverton.ibm.com>
	<4AC318450200007800017355@vpn.id2.novell.com>
	<1254498517.3839.17.camel@slab.beaverton.ibm.com>
	<4AC9B5310200007800017EA1@vpn.id2.novell.com>
	<1255115648.2546.71.camel@slab.beaverton.ibm.com>
	<1255561026.29192.0.camel@slab.beaverton.ibm.com>
	<4AD6EB17020000780001A050@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4AD6EB17020000780001A050@vpn.id2.novell.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Jan Beulich <JBeulich@novell.com>
Cc: sfr@canb.auug.org.au, Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-next@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

On Thu, 2009-10-15 at 08:27 +0100, Jan Beulich wrote:
> >>> Hollis Blanchard <hollisb@us.ibm.com> 15.10.09 00:57 >>>
> >On Fri, 2009-10-09 at 12:14 -0700, Hollis Blanchard wrote:
> >> Rusty's version of BUILD_BUG_ON() does indeed fix the build break, and
> >> also exposes the bug in kvmppc_account_exit_stat(). So to recap:
> >> 
> >> original: built but didn't work
> >> Jan's: doesn't build
> >> Rusty's: builds and works
> >> 
> >> Where do you want to go from here?
> >
> >Jan, what are your thoughts? Your BUILD_BUG_ON patch has broken the
> >build, and we still need to fix it.
> 
> My perspective is that it just uncovered already existing brokenness. And
> honestly, I won't be able to get to look into this within the next days. (And
> btw., when I run into issues with other people's code changes, quite
> frequently I'm told to propose a patch, so I'm also having some
> philosophical problem understanding why I can't simply expect the same
> when people run into issues with changes I made, especially in cases like
> this where it wasn't me introducing the broken code.) So, if this can wait
> for a couple of days, I can try to find time to look into this. Otherwise, I'd
> rely on someone running into the actual issue to implement a solution.

Sorry, I thought it was clear, but to be more explicit: I propose the
following patch, which replaces the current BUILD_BUG_ON implementation
with Rusty's version.

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -677,18 +677,19 @@ struct sysinfo {
 	char _f[20-2*sizeof(long)-sizeof(int)];	/* Padding: libc5 uses this.. */
 };
 
-/* Force a compilation error if condition is true */
-#define BUILD_BUG_ON(condition) ((void)BUILD_BUG_ON_ZERO(condition))
-
-/* Force a compilation error if condition is constant and true */
-#define MAYBE_BUILD_BUG_ON(cond) ((void)sizeof(char[1 - 2 * !!(cond)]))
-
-/* Force a compilation error if condition is true, but also produce a
-   result (of value 0 and type size_t), so the expression can be used
-   e.g. in a structure initializer (or where-ever else comma expressions
-   aren't permitted). */
-#define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
-#define BUILD_BUG_ON_NULL(e) ((void *)sizeof(struct { int:-!!(e); }))
+#ifndef __OPTIMIZE__
+#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
+#else
+/* If it's a constant, catch it at compile time, otherwise at link time. */
+extern int __build_bug_on_failed;
+#define BUILD_BUG_ON_ZERO(e) (sizeof(char[1 - 2 * !!(e)]) - 1)
+#define BUILD_BUG_ON(condition) \
+		do {                                                            \
+				((void)sizeof(char[1 - 2*!!(condition)]));              \
+				if (condition) __build_bug_on_failed = 1;               \
+		} while(0)
+#define MAYBE_BUILD_BUG_ON(condition) BUILD_BUG_ON(condition)
+#endif
 
 /* Trap pasters of __FUNCTION__ at compile-time */
 #define __FUNCTION__ (__func__)


-- 
Hollis Blanchard
IBM Linux Technology Center
