From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] linux-next: manual merge of the tip tree with the
 drm-intel tree
Date: Tue, 8 Nov 2016 18:11:06 +0100
Message-ID: <20161108171106.ugkcetcv3auvx7cz@phenom.ffwll.local>
References: <20161108152541.096711bb@canb.auug.org.au>
 <20161108104403.mi3onjfn65etrrtu@phenom.ffwll.local>
 <20161108132448.GG3117@twins.programming.kicks-ass.net>
 <20161108160916.56nxpkiupw3u7rgy@phenom.ffwll.local>
 <20161108170415.GM3117@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34862 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933311AbcKHRLK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2016 12:11:10 -0500
Received: by mail-wm0-f65.google.com with SMTP id a20so13148644wme.2
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2016 09:11:10 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161108170415.GM3117@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rob Clark <robdclark@gmail.com>

On Tue, Nov 08, 2016 at 06:04:15PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 08, 2016 at 05:09:16PM +0100, Daniel Vetter wrote:
> > > Now, I know you're working on getting rid of this entirely for i915, but
> > > what about that MSM driver? Will we continue to need it there, is
> > > anybody actually maintaining that thing?
> > 
> > Rob Clark is, and since he's a one-man gpu driver team with other
> > responsibilities it might take even longer than for i915 :(
> 
> Fair enough. For my information, how much a of copy/paste job from i915
> was that? Could he, in principle, copy/paste your changes to get rid of
> this back into MSM without too much effort, or have things diverged
> greatly since the initial copy/paste?

Probably diverged too much already, and on top the big part is the command
submission, and that's entirely driver/hw specific. But etnaviv is a plain
gem driver which uses per-bo locking, and there's all the ttm drivers with
similar designs, so there's plenty of templates. But it's not just
copypasta for sure.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
