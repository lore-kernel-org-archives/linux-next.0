From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -tip] uaccess: fix parameters inversion for
	__copy_from_user_inatomic()
Date: Fri, 19 Sep 2008 10:53:55 +0200
Message-ID: <20080919085355.GA21043@elte.hu>
References: <48CF061A.5060002@ct.jp.nec.com> <20080918151908.9857ba64.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:47896 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750792AbYISIyK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Sep 2008 04:54:10 -0400
Content-Disposition: inline
In-Reply-To: <20080918151908.9857ba64.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org


* Andrew Morton <akpm@linux-foundation.org> wrote:

> On Mon, 15 Sep 2008 18:04:26 -0700
> Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com> wrote:
> 
> > From: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
> > 
> > The following patch changes to use __copy_from_user_inatomic(),
> > but the passing parameters incorrect.
> > 
> >     x86: some lock annotations for user copy paths, v3
> > 
> >     - add annotation back to clear_user()
> >     - change probe_kernel_address() to _inatomic*() method
> > 
> > Signed-off-by: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
> > ---
> >  include/linux/uaccess.h |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> > index 2062293..6b58367 100644
> > --- a/include/linux/uaccess.h
> > +++ b/include/linux/uaccess.h
> > @@ -78,7 +78,7 @@ static inline unsigned long __copy_from_user_nocache(void *to,
> >  							\
> >  		set_fs(KERNEL_DS);			\
> >  		pagefault_disable();			\
> > -		ret = __copy_from_user_inatomic((__force typeof(retval) __user *)(addr), &(retval), sizeof(retval));		\
> > +		ret = __copy_from_user_inatomic(&(retval), (__force typeof(retval) __user *)(addr), sizeof(retval));		\
> >  		pagefault_enable();			\
> >  		set_fs(old_fs);				\
> >  		ret;					\
> 
> The bug which this fixes was merged into linux-next-20080918, and
> manifests as squillions of messages like
> 
> [   58.693759] SLAB: cache with size 65536 has lost its name
> [   58.693926] SLAB: cache with size 65536 has lost its name
> [   58.694095] SLAB: cache with size 32768 has lost its name
> [   58.694261] SLAB: cache with size 32768 has lost its name
> [   58.694434] SLAB: cache with size 16384 has lost its name
> [   58.694606] SLAB: cache with size 16384 has lost its name
> [   58.694773] SLAB: cache with size 8192 has lost its name
> [   58.694940] SLAB: cache with size 8192 has lost its name
> [   58.695101] SLAB: cache with size 4096 has lost its name
> 
> so this version of linux-next (which will be the most-recent
> version of linux-next for the next three weeks) will need this patch:

that's already fixed via the commit below 4 days ago - i should have 
pushed it into tip/auto-core-next - did that now.

	Ingo

------------------->
>From fb71e45338453698bd7460f7e8f171ea0304d218 Mon Sep 17 00:00:00 2001
From: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
Date: Mon, 15 Sep 2008 18:04:26 -0700
Subject: [PATCH] uaccess: fix parameters inversion for __copy_from_user_inatomic()

The following patch changes to use __copy_from_user_inatomic(),
but the passing parameters incorrect:

    x86: some lock annotations for user copy paths, v3

This fixes the netfilter crash reported by Steven Noonan.

Reported-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
Tested-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 include/linux/uaccess.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 2062293..6b58367 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -78,7 +78,7 @@ static inline unsigned long __copy_from_user_nocache(void *to,
 							\
 		set_fs(KERNEL_DS);			\
 		pagefault_disable();			\
-		ret = __copy_from_user_inatomic((__force typeof(retval) __user *)(addr), &(retval), sizeof(retval));		\
+		ret = __copy_from_user_inatomic(&(retval), (__force typeof(retval) __user *)(addr), sizeof(retval));		\
 		pagefault_enable();			\
 		set_fs(old_fs);				\
 		ret;					\
