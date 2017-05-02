From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 watchdog tree
Date: Tue, 2 May 2017 15:35:18 -0700
Message-ID: <20170502223518.GE26866@fury>
References: <20170502140403.24e315cf@canb.auug.org.au>
 <20170502180940.GB26866@fury>
 <20170502191217.GA11901@roeck-us.net>
 <20170502202159.GC26866@fury>
 <CAHp75VeCGUh_AYFKWwm4riFBGC1dgifchUQSr_2dO3mo_pUx1Q@mail.gmail.com>
 <20170502213046.GD26866@fury>
 <20170502215822.GA18400@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47460 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751177AbdEBWf2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 18:35:28 -0400
Content-Disposition: inline
In-Reply-To: <20170502215822.GA18400@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wim Van Sebroeck <wim@iguana.be>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On Tue, May 02, 2017 at 02:58:22PM -0700, Guenter Roeck wrote:
> On Tue, May 02, 2017 at 02:30:46PM -0700, Darren Hart wrote:
> > On Tue, May 02, 2017 at 11:57:18PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 2, 2017 at 11:21 PM, Darren Hart <dvhart@infradead.org> wrote:
> > > > On Tue, May 02, 2017 at 12:12:17PM -0700, Guenter Roeck wrote:
> > > >> On Tue, May 02, 2017 at 11:09:40AM -0700, Darren Hart wrote:
> > > >> > On Tue, May 02, 2017 at 02:04:03PM +1000, Stephen Rothwell wrote:
> > > 
> > > > From my perspective, the most direct solution would be to drop these two patches
> > > > from the watchdog tree and let them go through the platform driver x86 tree with
> > > > Guenter's Acked-by. If you have additional patches which depend on these two,
> > > > then if you will provide an immutable branch we can merge, we can do that too
> > > > (but I try to keep the number of external merges to a minimum - which is
> > > > becoming increasingly difficult lately for some reason).
> > > 
> > > Sorry for not being in doubt, I just decided that Ack from Guenter
> > > means that default case is to go through PDx86 tree without any
> > > additional agreement.
> > 
> > I assumed that was the case, yes. I read through the thread and would have
> > thought the same. As Guenter is directing us to Wim, I think the MAINTAINERS
> > file doesn't really capture the logistics of the watchdog maintainer model, as a
> 
> Now I am confused. Please apologize my lack of understanding.
> 
> I am listed as "Reviewer", not "Maintainer", for watchdog drivers.

:facepalm:

Yes you are, I misread the get_maintainer.pl output ... somehow.

> Please let me know how that does not capture the logistics of the watchdog
> (or any other) maintainer model, and how to better reflect that I review
> watchdog patches and Wim, as maintainer, sends them to Linus. I thought that
> is what "R:" and "M:" is for ?

Nope, it's right, I messed up.

> 
> The only possibly unusual detail is that I maintain a branch with all patches
> I have reviewed. This branch is picked up by Wim and either accepted as-is or,
> if he does not agree with some patch, modified accordingly. This branch is
> not in linux-next and thus not part of any official maintainer model,
> but exists for convenience and to enable additional testing through 0day
> and my own test farm.
> 
> > Reviewed-by from a listed maintainer wouldn't be typical unless they expected
> > someone else to merge it - in this case, I suppose Guenter meant Wim and not us
> > :-)
> > 
> 
> You are correct, "Reviewed-by:" typically is intended for Wim, as I thought
> it would be expected for a designated reviewer. I tend to use "Acked-by:"
> if I assume or expect that a patch will be picked up by a different maintainer,
> though I typically add a note saying that this is the case (no idea if I did
> that here). Is there some different set of tags I should use ?

Nope, we just should have confirmed with Wim.

> On a side note, it appears that I tagged "watchdog: iTCO_wdt: cleanup
> set/unset no_reboot_bit functions" with "Reviewed-by:", not with "Acked-by:".

I noticed this as well. If Wim drops these, we'll correct that in our branch.

-- 
Darren Hart
VMware Open Source Technology Center
