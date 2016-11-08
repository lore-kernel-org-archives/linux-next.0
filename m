From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] linux-next: manual merge of the tip tree with the
 drm-intel tree
Date: Tue, 8 Nov 2016 17:09:16 +0100
Message-ID: <20161108160916.56nxpkiupw3u7rgy@phenom.ffwll.local>
References: <20161108152541.096711bb@canb.auug.org.au>
 <20161108104403.mi3onjfn65etrrtu@phenom.ffwll.local>
 <20161108132448.GG3117@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34053 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753211AbcKHQJW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2016 11:09:22 -0500
Received: by mail-wm0-f67.google.com with SMTP id p190so23612838wmp.1
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2016 08:09:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161108132448.GG3117@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rob Clark <robdclark@gmail.com>

On Tue, Nov 08, 2016 at 02:24:48PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 08, 2016 at 11:44:03AM +0100, Daniel Vetter wrote:
> > On Tue, Nov 08, 2016 at 03:25:41PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > FIXME: Add owner of second tree to To:
> > >        Add author(s)/SOB of conflicting commits.
> > > 
> > > Today's linux-next merge of the tip tree got a conflict in:
> > > 
> > >   drivers/gpu/drm/i915/i915_gem_shrinker.c
> > > 
> > > between commits:
> > > 
> > >   1233e2db199d ("drm/i915: Move object backing storage manipulation to its own locking")
> > > 
> > > from the drm-intel tree and commit:
> > > 
> > >   3ab7c086d5ec ("locking/drm: Kill mutex trickery")
> > >   c7faee2109f9 ("locking/drm: Fix i915_gem_shrinker_lock() locking")
> > 
> > Hm, this seems to be the older versions that nuke the recursive locking
> > trickery entirely, I thought we had version in-flight that kept that? I
> > know that the i915 (and msm locking fwiw) is horrible since essentially
> > it's a recursive BKL, and we're working (slowly, after all getting rid of
> > the BKL wasn't simple either) to fix this. But meanwhile I'm assuming that
> > we'll still need this to be able to get out of low memory situations in
> > i915. Has that part simply not yet landed?
> 
> You're talking about:
> 
>   lkml.kernel.org/r/20161007154351.GL3117@twins.programming.kicks-ass.net
> 
> ? I got no feedback from you DRM guys on that so I kinda forgot about
> that in the hope we'd not have to do this at all.

Yes. Chris/Joonas, pls give this is a spin and review.
> 
> I can try and resurrect, that I suppose.
> 
> Now, I know you're working on getting rid of this entirely for i915, but
> what about that MSM driver? Will we continue to need it there, is
> anybody actually maintaining that thing?

Rob Clark is, and since he's a one-man gpu driver team with other
responsibilities it might take even longer than for i915 :(
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
