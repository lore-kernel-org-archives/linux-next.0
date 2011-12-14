From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 14 Dec 2011 11:24:55 -0800
Message-ID: <20111214192455.GA4155@kroah.com>
References: <20111214154844.3ad4e1d685c7987cba0820a0@canb.auug.org.au>
 <1323854697.28489.7.camel@twins>
 <20111214150359.GA840@kroah.com>
 <1323875585.28489.48.camel@twins>
 <20111214170144.GA6933@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:53463 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755473Ab1LNTZF (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Dec 2011 14:25:05 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1C20321375
	for <linux-next@vger.kernel.org>; Wed, 14 Dec 2011 14:25:04 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111214170144.GA6933@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Dec 14, 2011 at 09:01:44AM -0800, Greg KH wrote:
> On Wed, Dec 14, 2011 at 04:13:05PM +0100, Peter Zijlstra wrote:
> > On Wed, 2011-12-14 at 07:03 -0800, Greg KH wrote:
> > 
> > > I'll remove the use of kfree in the WARN_ON(), which should solve this
> > > problem.
> > 
> > The alternative is that we introduce something like CONFIG_KREF_DEBUG
> > and out-of-line the functions in that case while also adding more debug
> > checks. Alexey recently proposed a refcnt.h thing that almost does what
> > kref does but has different debug checks.
> 
> That might be nice to have, but the kfree check was there to catch
> people who were trying to be "tricky", and they will not be running with
> that debug option enabled.
> 
> I'll just remove it, and rely on the documentation and public
> humiliation instead of kernel warnings to try to enforce this rule.
> It's worked pretty good so far with the kobject rules :)

Here's the patch I just applied to the driver-core-next tree, which
should resolve this build problem.

>From 6261ddee70174372d6a75601f40719b7a5392f3f Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@suse.de>
Date: Wed, 14 Dec 2011 11:19:07 -0800
Subject: kref: fix up the kfree build problems

It turns out that some memory allocators use kobjects, which use krefs,
and kref.h was wanting to figure out the address of kfree(), which ended
up in a loop.

kfree was only being needed for a warning to tell the caller that they
were doing something stupid.  Now we just move that warning into the
comments for the functions, which results in a bit more fun as everyone
enjoys digging for people to mock at times of boredom.

So, remove the dependancy of slab.h on kref.h, and fix up the other
include file as well (we really only need bug.h and atomic.h, not
types.h).

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Oliver Neukum <oneukum@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
---
 include/linux/kref.h |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/kref.h b/include/linux/kref.h
index d66c88a..abc0120 100644
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -15,8 +15,8 @@
 #ifndef _KREF_H_
 #define _KREF_H_
 
-#include <linux/types.h>
-#include <linux/slab.h>
+#include <linux/bug.h>
+#include <linux/atomic.h>
 
 struct kref {
 	atomic_t refcount;
@@ -48,7 +48,10 @@ static inline void kref_get(struct kref *kref)
  * @release: pointer to the function that will clean up the object when the
  *	     last reference to the object is released.
  *	     This pointer is required, and it is not acceptable to pass kfree
- *	     in as this function.
+ *	     in as this function.  If the caller does pass kfree to this
+ *	     function, you will be publicly mocked mercilessly by the kref
+ *	     maintainer, and anyone else who happens to notice it.  You have
+ *	     been warned.
  *
  * Subtract @count from the refcount, and if 0, call release().
  * Return 1 if the object was removed, otherwise return 0.  Beware, if this
@@ -60,7 +63,6 @@ static inline int kref_sub(struct kref *kref, unsigned int count,
 	     void (*release)(struct kref *kref))
 {
 	WARN_ON(release == NULL);
-	WARN_ON(release == (void (*)(struct kref *))kfree);
 
 	if (atomic_sub_and_test((int) count, &kref->refcount)) {
 		release(kref);
@@ -75,7 +77,10 @@ static inline int kref_sub(struct kref *kref, unsigned int count,
  * @release: pointer to the function that will clean up the object when the
  *	     last reference to the object is released.
  *	     This pointer is required, and it is not acceptable to pass kfree
- *	     in as this function.
+ *	     in as this function.  If the caller does pass kfree to this
+ *	     function, you will be publicly mocked mercilessly by the kref
+ *	     maintainer, and anyone else who happens to notice it.  You have
+ *	     been warned.
  *
  * Decrement the refcount, and if 0, call release().
  * Return 1 if the object was removed, otherwise return 0.  Beware, if this
-- 
1.7.7.3
