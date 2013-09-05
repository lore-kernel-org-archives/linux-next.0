From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linus-next: update to the drm-intel-fixes tree
Date: Thu, 5 Sep 2013 14:57:48 +0200
Message-ID: <20130905125748.GG27291@phenom.ffwll.local>
References: <20130904094541.234e016eb3981d3b546c4cd1@canb.auug.org.au>
 <CAKMK7uGn0ML30XKa1nRZY=KCPUOg+4M_WO6p4PGLS17OHdCWEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:57601 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752308Ab3IEM5f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Sep 2013 08:57:35 -0400
Received: by mail-ee0-f44.google.com with SMTP id b47so890314eek.3
        for <linux-next@vger.kernel.org>; Thu, 05 Sep 2013 05:57:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAKMK7uGn0ML30XKa1nRZY=KCPUOg+4M_WO6p4PGLS17OHdCWEA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, linux-next <linux-next@vger.kernel.org>

On Wed, Sep 04, 2013 at 11:05:55AM +0200, Daniel Vetter wrote:
> Hi Stephen
> 
> On Wed, Sep 4, 2013 at 1:45 AM, Stephen Rothwell <sfr@canb.auug.org.au> Wrote:
> > This morning after fetching the drm-intel-fixes tree, I have discovered
> > that you have just added a whole set of patches on top of Dave's drm tree
> > and made that the drm-intel-fixes tree.  I understood that this tree was
> > for fixes to Linus' tree for the current release cycle.  Given that
> > Dave's tree has not been merged by Linus (yet), this is a bit
> > inconsistent.  Not only that, but now if I merge your tree early (which
> > is what I do with the -fixes trees), I will also merge all of Dave's
> > tree.  That in turn would mean that I would have missed the (what would
> > have been automatically applied) merge for I am carrying for Dave's
> > tree.  :-(
> >
> > I am going to have to drop your -fixes tree for today.
> >
> > If these are fixes for stuff in Linus' tree, then they should have been
> > based on Linus' tree - if they are fixes for Dave's tree, then they
> > should have been in your drm-intel tree, right?
> >
> > (fetches more trees ...)
> > And now, I discover that they are the latter :-)
> >
> > So your -fixes tree will be dropped, but all those patches will still be
> > merged via you drm-intel tree.
> 
> Hm, my workflow is to keep my feature queue branch open even through
> the merge window. To avoid pains I have the special for-linux-next
> tree which should only ever point at patches relevent for the current
> release cycle.
> 
> Now when the upstream merge window opens I take that patch queue and
> split out all the features that haven't made it into drm-next in time
> so that I'm left with only the bugfixes. That I then push to my -fixes
> branch. Then I rebase my feature queue on top of that.
> 
> So essentially as soon as the merge window upons my -fixes branch is
> for the current release and based on top of drm-next. And if there's
> any leftover fixes I just rebase them, too. While the merge window is
> open for-linux-next also points at the -fixes branch (but will switch
> back to the feature queue once -rc1 is out).
> 
> I guess to make you happy I could create a for-linux-next-fixes branch
> which would only be used in the -rc phase to include my -fixes into
> linux-next. I don't want to delay the -fixes split until drm-next is
> merged upstream since that usually happens rather late in the merge
> window. Would that work for you?

Ok I've implemented this and added a new for-linux-next-fixes branch which
should only contain drm/i915 -fixes that apply on top of linus git and
nothing from Dave's drm tree. Please yell if this branch contains stuff
you don't want to see there. Atm it's just v3.11 since all the stuff on
tops of Dave's drm-next is in for-linux-next (and drm-next also isn't yet
merged).

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
