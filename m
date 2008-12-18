From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for December 17 (Radeon DRM BUG)
Date: Thu, 18 Dec 2008 20:00:41 +0100
Message-ID: <200812182000.41727.bzolnier@gmail.com>
References: <20081217232536.0b18f4a7.sfr@canb.auug.org.au> <494995D7.6090009@gmail.com> <21d7e9970812172247t3d67e6f0waffa99587e2e024b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f21.google.com ([209.85.218.21]:48306 "EHLO
	mail-bw0-f21.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751794AbYLRTB4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Dec 2008 14:01:56 -0500
Received: by bwz14 with SMTP id 14so2230426bwz.13
        for <linux-next@vger.kernel.org>; Thu, 18 Dec 2008 11:01:54 -0800 (PST)
In-Reply-To: <21d7e9970812172247t3d67e6f0waffa99587e2e024b@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Kevin Winchester <kjwinchester@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>

On Thursday 18 December 2008, Dave Airlie wrote:
> On Thu, Dec 18, 2008 at 10:14 AM, Kevin Winchester
> <kjwinchester@gmail.com> wrote:
> > Stephen Rothwell wrote:
> >>
> >> Hi all,
> >>
> >>
> >
> > I get the following BUG in the radeon drm code with today's linux-next when
> > I run "startx".  I have not built or tested linux-next in a while, but the
> > problem definitely does not occur in mainline.

[...]

This reminds me that drm tree in linux-next still results in BSOD (Black
Screen Of Death) on starting X for me (as reported on Saturday [1]).

Actually there is more to it as I discovered that my custom X radeon driver
(which is xorg-x11-drv-ati-6.9.0-61.fc10.i386 with "radeon: no need for this
anymore" from radeon-gem-cs change reverted, please see [2] for my previous
monologue) works fine while following stock driver versions:

	xorg-x11-drv-ati-6.8.0-19.fc9.i386
	xorg-x11-drv-ati-6.9.0-61.fc10.i386
	xorg-x11-drv-ati-6.9.0-62.fc10.i386

result in BSOD.  OTOH they all work with next-20081128 (modulo hangs with
fc10 ones when "radeon: no need for this anymore" change is not reverted).

[ BTW xorg-x11-drv-ati-6.9.0-62.fc10.i386 still causes hangs when used with
  non-Fedora kernels and Fedora/kms kernel still has performance problems ]

IOW there are a lot of compatibility issues in recent drm/radeon changes.

Dave, could you please start looking into these problems?  I'm sure that we
all want recent drm changes + kms in 2.6.29 but given tight schedule and the
way things are looking right now I'm quite sceptical...

[1] http://lkml.org/lkml/2008/12/13/76
[2] http://lkml.org/lkml/2008/12/13/77

Thanks,
Bart
