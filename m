From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 17 (objtool)
Date: Wed, 24 Apr 2019 18:22:09 +0200
Message-ID: <20190424162209.GQ11158@hirez.programming.kicks-ass.net>
References: <20190417173117.196b5ac6@canb.auug.org.au>
 <7114e2f5-0c1f-c5e4-177c-2a5c61d12d58@infradead.org>
 <20190424160357.6olyocstevbz7wnw@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424160357.6olyocstevbz7wnw@treble>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 24, 2019 at 11:03:57AM -0500, Josh Poimboeuf wrote:
> On Wed, Apr 17, 2019 at 08:41:34AM -0700, Randy Dunlap wrote:

> > on x86_64:
> > 
> >   CC      drivers/gpu/drm/i915/i915_gem_execbuffer.o
> > drivers/gpu/drm/i915/i915_gem_execbuffer.o: warning: objtool: .altinstr_replacement+0x18: redundant UACCESS disable

> I haven't looked at this, do you know if this is the same issue as the
> other note from Randy, or something else?

That smells like the below commit went missing... But I cannot reproduce
when building next/master myself.

---
commit 8f4faed01e3015955801c8ef066ec7fd7a8b3902
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Thu Feb 28 13:52:31 2019 +0100

    i915, uaccess: Fix redundant CLAC
    
    New tooling noticed this:
    
     drivers/gpu/drm/i915/i915_gem_execbuffer.o: warning: objtool: .altinstr_replacement+0x3c: redundant UACCESS disable
     drivers/gpu/drm/i915/i915_gem_execbuffer.o: warning: objtool: .altinstr_replacement+0x66: redundant UACCESS disable
    
    You don't need user_access_end() if user_access_begin() fails.
    
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Cc: Borislav Petkov <bp@alien8.de>
    Cc: Chris Wilson <chris@chris-wilson.co.uk>
    Cc: Josh Poimboeuf <jpoimboe@redhat.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
index 02adcaf6ebea..16f80a448820 100644
--- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
@@ -1667,6 +1667,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 					     len)) {
 end_user:
 				user_access_end();
+end:
 				kvfree(relocs);
 				err = -EFAULT;
 				goto err;
@@ -1686,7 +1687,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		 * relocations were valid.
 		 */
 		if (!user_access_begin(urelocs, size))
-			goto end_user;
+			goto end;
 
 		for (copied = 0; copied < nreloc; copied++)
 			unsafe_put_user(-1,
@@ -2695,7 +2696,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		 * when we did the "copy_from_user()" above.
 		 */
 		if (!user_access_begin(user_exec_list, count * sizeof(*user_exec_list)))
-			goto end_user;
+			goto end;
 
 		for (i = 0; i < args->buffer_count; i++) {
 			if (!(exec2_list[i].offset & UPDATE))
@@ -2709,6 +2710,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		}
 end_user:
 		user_access_end();
+end:;
 	}
 
 	args->flags &= ~__I915_EXEC_UNKNOWN_FLAGS;
