From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the tty tree with the input tree
Date: Mon, 28 Jan 2013 22:38:03 -0800
Message-ID: <20130129063803.GC5797@core.coreip.homeip.net>
References: <20130128204424.a3eedfee954ba6cc7a620652@canb.auug.org.au>
 <20130128144615.GC2997@kroah.com>
 <20130128173330.GA11769@core.coreip.homeip.net>
 <CADwDc1AVOaA0N9evbR7A14udx+TRRQo6t_X_Nn15BdEEByupkg@mail.gmail.com>
 <20130128224443.GA1083@core.coreip.homeip.net>
 <20130128235916.GA3124@leaf>
 <20130129002357.GA4420@core.coreip.homeip.net>
 <20130129051321.GB3283@leaf>
 <20130129053308.GB1083@core.coreip.homeip.net>
 <CADwDc1CbNeDSNKDh0a01Nde7Mpz3xT6XpsTY4nui8DVt6M40Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:34916 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792Ab3A2GiH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Jan 2013 01:38:07 -0500
Content-Disposition: inline
In-Reply-To: <CADwDc1CbNeDSNKDh0a01Nde7Mpz3xT6XpsTY4nui8DVt6M40Mw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Millenbach <jmillenbach@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Swetland <swetland@google.com>, "Mike A. Chan" <mikechan@google.com>, Sheng Yang <sheng@linux.intel.com>, Yunhong Jiang <yunhong.jiang@intel.com>, Xiaohui Xin <xiaohui.xin@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Bruce Beare <bruce.j.beare@intel.com>, Tom Keel <thomas.keel@intel.com>, Alan Cox <alan@linux.intel.com>, Jamey Sharp <jamey@minilop.net>

Hi Joe,

On Mon, Jan 28, 2013 at 10:26:47PM -0800, Joe Millenbach wrote:
> On Mon, Jan 28, 2013 at 9:33 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > Please revert the input changes and add *ONE* new dependency to the
> > serport driver.
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> Apologies on this.  I must have misunderstood the problem originally,
> and I definitely misunderstood your solution until I looked at it
> again.  I just went through applying the changes I'd created minus the
> driver/input changes, plus your SERPORT TTY dependency.  You were
> right that it solves the dependency issue and is much more elegant.  I
> thought it was going to leave dangling select dependencies for users
> to deal with later.  Sorry I was so hesitant at first.
> 
> I'll be making up a new patch for Greg after I get it reviewed.

Thank you for making the changes.

By the "dangling select dependencies" I assume you mean "select SERIO"
that several drivers do? "select SERIO" selects only serio core which is
self contained and has no additional dependencies [so far], that is why
it is being selected rather than being depended upon.

Thanks.

-- 
Dmitry
