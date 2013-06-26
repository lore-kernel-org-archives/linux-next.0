From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: please add queue for removal of __cpuinit and
 friends.
Date: Wed, 26 Jun 2013 13:47:33 -0400
Message-ID: <20130626174733.GD2172@windriver.com>
References: <20130625152702.GA27288@windriver.com>
 <20130626112202.0929939fdc416f23d4bc06fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:58191 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751813Ab3FZRrB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 13:47:01 -0400
Content-Disposition: inline
In-Reply-To: <20130626112202.0929939fdc416f23d4bc06fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

[Re: linux-next: please add queue for removal of __cpuinit and friends.] On 26/06/2013 (Wed 11:22) Stephen Rothwell wrote:

> Hi Paul,
> 
> On Tue, 25 Jun 2013 11:27:02 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >
> > Would you please add the patch queue below to linux-next for
> > the remainder of this week and the two weeks of the merge window?
> 
> Maybe.  I will see how much pain it causes me.
> 
> > It is the patch queue for removal of __cpuinit ; a git repository
> > of patches with a series file that can be browsed here:
> > 
> >   http://git.kernel.org/cgit/linux/kernel/git/paulg/cpuinit-delete.git
> > 
> > or cloned directly from here:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/paulg/cpuinit-delete.git
> > 
> > and the deletion and merge strategy was described here previously:
> > 
> >   https://lkml.org/lkml/2013/6/20/513
> 
> Yeah, I should have responded to that.  Given that the meat of this
> series is the first 2 patches (the rest is merely cleaning up the uses of
> the now mulled out macros, right) I think it would have been better (i.e.
> easier for me :-)) if you had a git tree based on v3.10-rc<something> and
> then did a sweep after v3.11-rc1 was out to clean up the rest.

If you'd still rather go that way, then there is such a two patch branch at:

git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git  cpuinit-delete

Those are the ones that will be (hopefully) added early on in the merge
window anyway.  Note that you'll get a conflict on vmlinux.lds because the
__devinit delete is in Greg's drivers-next tree and not yet mainline.

> > I do not expect any significant changes to the repository going forward.
> > Perhaps adding a couple more "Acked-by:" tags, and dropping a couple
> > patches for when maintainers request to carry them locally.  So I hope
> > it should not be a big burden.  And it is a one-shot tree as well.
> 
> The problem is that it is based on shifting sands i.e. linux-next.  This
> means that I will have to rebase it each day onto the new linux-next just
> before I release it.  I already do this with Andrew's tree and that is a
> bit of a pain already.

Understood.  Feel free to take the two patch approach if it is too much
hassle.  If you do, I will continue to track applicabiliy of the "sweep"
patches locally on your daily linux-next as I had been.

> It also means (given that some linus-next included trees do not actually
> get merged for -rc1), that some of these patches may never apply cleanly
> to Linus' tree.

Yep, but at the same time, linux-next is about 8,000 commits closer to
what the "sweep" patches will be landing on, so I think it was still the
right baseline for me to be doing this work against while we wait for
the merge window.

Thanks for giving the whole series a spin for at least one next tree, as
it probably helped to ensure people are more aware the change is coming.

Paul.
--

> 
> I will try it today and see how we go.  I assume that the current set of
> patches is based on next-20130625?
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
