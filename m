From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the akpm tree
Date: Mon, 19 May 2014 14:17:58 -0700
Message-ID: <20140519141758.37af77506f42b0e11a0b1bae@linux-foundation.org>
References: <20140519181314.1b92c548@canb.auug.org.au>
	<1400512396.2560.9.camel@buesod1.americas.hpqcorp.net>
	<20140519124850.7d4470e179c237552f363658@linux-foundation.org>
	<1400532980.6399.0.camel@buesod1.americas.hpqcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49618 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060AbaESVSA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 May 2014 17:18:00 -0400
In-Reply-To: <1400532980.6399.0.camel@buesod1.americas.hpqcorp.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Davidlohr Bueso <davidlohr@hp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>

On Mon, 19 May 2014 13:56:20 -0700 Davidlohr Bueso <davidlohr@hp.com> wrote:

> On Mon, 2014-05-19 at 12:48 -0700, Andrew Morton wrote:
> > On Mon, 19 May 2014 08:13:16 -0700 Davidlohr Bueso <davidlohr@hp.com> wrote:
> > 
> > > > Presumably a result of commit fe2038c57c03 ("rwsem: Support optimistic
> > > > spinning").
> > > 
> > > If CONFIG_SMP, we add two new fields to the rwsem structure
> > > (include/linux/rwsem.h) and likewise we update the
> > > __RWSEM_INITIALIZER(name) macro. Afaict the only way to trigger
> > > something like that is to be using the spinlock variant
> > > (rwsem-spinlock.h).
> > > 
> > > The fix for that would be:
> > > 
> > > diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
> > > index 3e108f1..091d993 100644
> > > --- a/include/linux/rwsem.h
> > > +++ b/include/linux/rwsem.h
> > > @@ -64,7 +64,7 @@ static inline int rwsem_is_locked(struct rw_semaphore *sem)
> > >  # define __RWSEM_DEP_MAP_INIT(lockname)
> > >  #endif
> > >  
> > > -#ifdef CONFIG_SMP
> > > +#if defined(CONFIG_SMP) && defined(CONFIG_RWSEM_XCHGADD_ALGORITHM)
> > >  #define __RWSEM_INITIALIZER(name)                      \
> > >         { RWSEM_UNLOCKED_VALUE,                         \
> > >           __RAW_SPIN_LOCK_UNLOCKED(name.wait_lock),     \
> > 
> > that squishes the warnings for me.
> 
> You guys know best, but shouldn't this change be routed through -tip?

Yes, this patch and the two fixes I have applied to it should be sent
that way.  If/when they turn up in -next I will drop my copies.

Keep sending ;)
