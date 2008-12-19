From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for December 17 (Radeon DRM BUG)
Date: Fri, 19 Dec 2008 20:45:12 +0100
Message-ID: <200812192045.14254.bzolnier@gmail.com>
References: <20081217232536.0b18f4a7.sfr@canb.auug.org.au> <200812182309.23254.bzolnier@gmail.com> <1229643564.11646.5.camel@clockmaker.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753863AbYLSTqV@vger.kernel.org>
In-Reply-To: <1229643564.11646.5.camel@clockmaker.usersys.redhat.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, Kevin Winchester <kjwinchester@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Friday 19 December 2008, Dave Airlie wrote:
> On Thu, 2008-12-18 at 23:09 +0100, Bartlomiej Zolnierkiewicz wrote:
> > tOn Thursday 18 December 2008, Dave Airlie wrote:
> > > On Thu, 2008-12-18 at 20:00 +0100, Bartlomiej Zolnierkiewicz wrote:
> > > > On Thursday 18 December 2008, Dave Airlie wrote:
> > > > > On Thu, Dec 18, 2008 at 10:14 AM, Kevin Winchester
> > > > > <kjwinchester@gmail.com> wrote:
> > > > > > Stephen Rothwell wrote:
> > > > > >>
> > > > > >> Hi all,
> > > > > >>
> > > > > >>
> > > > > >
> > > > > > I get the following BUG in the radeon drm code with today's linux-next when
> > > > > > I run "startx".  I have not built or tested linux-next in a while, but the
> > > > > > problem definitely does not occur in mainline.
> > > > 
> > > > [...]
> > > > 
> > > > This reminds me that drm tree in linux-next still results in BSOD (Black
> > > > Screen Of Death) on starting X for me (as reported on Saturday [1]).
> > > > 
> > > > Actually there is more to it as I discovered that my custom X radeon driver
> > > > (which is xorg-x11-drv-ati-6.9.0-61.fc10.i386 with "radeon: no need for this
> > > > anymore" from radeon-gem-cs change reverted, please see [2] for my previous
> > > > monologue) works fine while following stock driver versions:
> > > > 
> > > > 	xorg-x11-drv-ati-6.8.0-19.fc9.i386
> > > > 	xorg-x11-drv-ati-6.9.0-61.fc10.i386
> > > > 	xorg-x11-drv-ati-6.9.0-62.fc10.i386
> > > > 
> > > > result in BSOD.  OTOH they all work with next-20081128 (modulo hangs with
> > > > fc10 ones when "radeon: no need for this anymore" change is not reverted).
> > > > 
> > > > [ BTW xorg-x11-drv-ati-6.9.0-62.fc10.i386 still causes hangs when used with
> > > >   non-Fedora kernels and Fedora/kms kernel still has performance problems ]
> > > > 
> > > > IOW there are a lot of compatibility issues in recent drm/radeon changes.
> > > > 
> > > > Dave, could you please start looking into these problems?  I'm sure that we
> > > > all want recent drm changes + kms in 2.6.29 but given tight schedule and the
> > > > way things are looking right now I'm quite sceptical...
> > > > 
> > > > [1] http://lkml.org/lkml/2008/12/13/76
> > > > [2] http://lkml.org/lkml/2008/12/13/77
> > > > 
> > > 
> > > Bart,
> > > 
> > > please file bugs in RH bugzilla for Fedora issues. Fedora is shipping
> > > drivers that aren't upstream, and I'm attempting to resolve the issues
> > > as they arise. However not having a bug to track stuff in means it just
> > > goes far enough out of my inbox that I forget about it.
> > 
> > OK, I'll try to put all issues into RH bugzilla once I find some time. 
> > 
> > [ OTOH the hang issue mentioned above happens only with vanilla kernels,
> >   Fedora kernels are not affected because they ship KMS.  Anyway, you
> >   could have just told me that you prefer to have a RH bugzilla bug for
> >   it two weeks ago (and indeed KMS performance issue should have been
> >   handled through bugzilla -- however this one is of lower priority). ]
> 
> I know, literally I didn't see a mail in my inbox and forgot about this
> bug until it showed up again, so I should mention Fedora BZ for Fedora
> bugs earlier indeed..
> 
> drm-next should be fine in the next iteration, there was a missing patch
> hunk in the last commit, and then a locking bug after that.

The drm problem is indeed fixed in today's linux-next (I remembered to
check that it includes drm-next this time ;-).  Thanks!

> I'll try and look at the other stability issues you are seeing with
> Fedora today,
> 
> however halving the amount of video RAM everyone gets as a fix for an
> issue you are seeing is clearly not the answer, I'd like to actually
> track down the root cause of where it went wrong.

Same opinion here.  As I see now that limitation was added temporarily
to the driver and later removed.  I will do some more testing...

Thanks,
Bart
