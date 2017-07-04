From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the pm tree
Date: Tue, 04 Jul 2017 22:13:33 +0200
Message-ID: <2002105.224HtT5E8x@aspire.rjw.lan>
References: <20170623122534.3303f515@canb.auug.org.au> <s5hr2xwdw0i.wl-tiwai@suse.de> <CAL_Jsq+sYxWq+Y1=iGtLk4hSQWXJBQ7LJVh9FbsOMshKzqjKcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:49906 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752207AbdGDUVI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jul 2017 16:21:08 -0400
In-Reply-To: <CAL_Jsq+sYxWq+Y1=iGtLk4hSQWXJBQ7LJVh9FbsOMshKzqjKcw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Tuesday, July 04, 2017 11:55:47 AM Rob Herring wrote:
> On Tue, Jul 4, 2017 at 11:09 AM, Takashi Iwai <tiwai@suse.de> wrote:
> > On Tue, 04 Jul 2017 18:00:30 +0200,
> > Rob Herring wrote:
> >>
> >> On Mon, Jul 3, 2017 at 9:10 AM, Takashi Iwai <tiwai@suse.de> wrote:
> >> > On Mon, 03 Jul 2017 04:55:24 +0200,
> >> > Stephen Rothwell wrote:
> >> >>
> >> >> Hi all,
> >> >>
> >> >> [cc-ing the sound tree maintainer]
> >> >
> >> > Thanks.
> >> >
> >> >> With the merge window opening, just a reminder that this conflict
> >> >> still exists.
> >> >
> >> > Rob, do you have an immutable branch to drag the affecting commit so
> >> > that I can merge & resolve in my side?
> >>
> >> Yes, use this branch:
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/property-move
> >
> > OK, thanks.
> >
> > When are you going to send a pull request to Linus?  I planned to do
> > for sound tree in tomorrow.  If you will do earlier, I'll try to
> > resolve in my side.
> 
> I think Rafael has already sent his changes to Linus with the same
> branch.

No, I haven't yet.

I've sent my ACPI and PM pull requests, but this will be a separate one.

Thanks,
Rafael
