From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Wed, 3 Dec 2008 10:46:58 +0100
Message-ID: <20081203094658.GA2030@uranus.ravnborg.org>
References: <20081126154206.31958aed.sfr@canb.auug.org.au> <20081126210657.GA11963@uranus.ravnborg.org> <20081203113650.d4245a05.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:35261 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbYLCJrW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Dec 2008 04:47:22 -0500
Content-Disposition: inline
In-Reply-To: <20081203113650.d4245a05.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, Dec 03, 2008 at 11:36:50AM +1100, Stephen Rothwell wrote:
> Hi Sam,
> 
> On Wed, 26 Nov 2008 22:06:57 +0100 Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > On Wed, Nov 26, 2008 at 03:42:06PM +1100, Stephen Rothwell wrote:
> > > Hi Sam,
> > > 
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > > 
> > > In file included from arch/x86/include/asm/processor.h:15,
> > >                  from include/linux/prefetch.h:14,
> > >                  from include/linux/list.h:6,
> > >                  from include/linux/module.h:9,
> > >                  from kernel/configs.mod.c:1:
> > > arch/x86/include/asm/current.h:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'struct'
> > > 
> > > and went rapidly down hill from there.
> > 
> > I will cook up a fix tomorrow if day-time job does not become night-time.
> 
> I am still getting the same errors ...
I have been concentrating (used all my spare time) on sparc unification.
Will fix this soonish.

I need to reshuffle a few patches nothing major. But it will
take me a few hours.

	Sam
