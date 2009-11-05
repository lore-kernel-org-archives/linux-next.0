From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] BUILD_BUG_ON: make it handle more cases
Date: Thu, 5 Nov 2009 16:58:36 +1030
Message-ID: <200911051658.36265.rusty@rustcorp.com.au>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com> <200910201415.34361.rusty@rustcorp.com.au> <20091105112020.33f02552.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35545 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750714AbZKEG2d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Nov 2009 01:28:33 -0500
In-Reply-To: <20091105112020.33f02552.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hollis Blanchard <hollisb@us.ibm.com>, Jan Beulich <JBeulich@novell.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Thu, 5 Nov 2009 10:50:20 am Stephen Rothwell wrote:
> Hi Rusty,
> 
> On Tue, 20 Oct 2009 14:15:33 +1030 Rusty Russell <rusty@rustcorp.com.au> wrote:
> >
> > +#ifndef __OPTIMIZE__
> > +#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
> > +#else
> > +extern int __build_bug_on_failed;
> > +#define BUILD_BUG_ON(condition)					\
> > +	do {							\
> > +		((void)sizeof(char[1 - 2*!!(condition)]));	\
> > +		if (condition) __build_bug_on_failed = 1;	\
> > +	} while(0)
> > +#endif
> > +#define MAYBE_BUILD_BUG_ON(condition) BUILD_BUG_ON(condition)
> > +
> 
> I decided to try this in linux-next, but an x86_64 allmodconfig build
> gave this (gcc 4.4.0):
> 
> ERROR: "__build_bug_on_failed" [drivers/net/virtio_net.ko] undefined!
> ERROR: "__build_bug_on_failed" [drivers/block/virtio_blk.ko] undefined!
> 
> I assume that this is caused by the "MAYBE_BUILD_BUG_ON(fbit >= 32)" in
> virtio_has_feature() (in include/linux/virtio_config.h) which is called
> all over the place.  Unfortunately, virtio_has_feature() gets uninlined
> in those two files ...

Huh?  virtio_has_feature does:

	if (__builtin_constant_p(fbit))
		BUILD_BUG_ON(fbit >= 32);
	else
		BUG_ON(fbit >= 32);

So, if it's not a constant, gcc should throw away that first branch.  If it
is, it should optimize it away (and no, these are not real bugs AFAICT).

I did a 4.3.3 allmodconfig with this patch on 64-bit a few days back and all
was fine.  Will try 4.4.0 now.

Thanks,
Rusty.
