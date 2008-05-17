From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Fwd: Re: [PATCH] kprobes: fix compilation break due to kprobe_mutex
Date: Sat, 17 May 2008 14:35:27 +0100
Message-ID: <20080517133527.GC30141@flint.arm.linux.org.uk>
References: <20080517114244.GB30141@flint.arm.linux.org.uk> <20080517220204.d78fdce2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:59297 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754377AbYEQNfn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 17 May 2008 09:35:43 -0400
Content-Disposition: inline
In-Reply-To: <20080517220204.d78fdce2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Sat, May 17, 2008 at 10:02:04PM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> On Sat, 17 May 2008 12:42:45 +0100 Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> >
> > Presumably this hasn't been detected because linux-next isn't building
> > enough ARM configurations to hit one that has kprobes enabled?
> 
> http://kisskb.ellerman.id.au/kisskb/compiler/11/
> 
> That's what I have building for arm.  I have asked twice for a suggested
> set of configs.  Consider this request number three :-)

The answer is all of them.  I can't suggest any subset, mainly because
I don't know what's in each and what each will cover.  The coverage of
each is really up to each platform maintainer I'm afraid.

> From: "Abhishek Sagar" <sagar.abhishek@gmail.com>
> > 
> > Now that I look at it, the commit I'm referring to is in
> > git://git.kernel.org/pub/scm/linux/kernel/git/x86/linux-2.6-x86.git :
> > auto-sched-next. I merged all the recent kprobe related changes from
> > there into my local arm kprobes branch based on 2.6.26-rc2 and fired a
> > build for arm. That's when I encountered the kprobe build error.
> 
> Also, that branch isn't in linux-next.  The commit maybe but I don't know
> what commit is being discussed, sorry.

085a6d5e4fb23c6395da1d0106feed795b57c79b
