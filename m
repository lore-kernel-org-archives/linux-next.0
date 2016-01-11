From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: strange commit in the parisc-hd tree
Date: Tue, 12 Jan 2016 09:39:51 +1100
Message-ID: <1452551991.23317.3.camel@ellerman.id.au>
References: <20160111092822.4b4c0233@canb.auug.org.au>
	 <569422C8.4000706@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47580 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760604AbcAKWjx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2016 17:39:53 -0500
In-Reply-To: <569422C8.4000706@gmx.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Helge Deller <deller@gmx.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Parisc List <linux-parisc@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2016-01-11 at 22:46 +0100, Helge Deller wrote:
> On 10.01.2016 23:28, Stephen Rothwell wrote:
> > I noticed the following commit in the parisc-hd tree today:
> > 
> >   43122681dd75 ("Fix __ARCH_SI_PREAMBLE_SIZE on parisc")
> > 
> > which among other things says:
> > 
> >   This patch is not planned to be committed as it currently is.
> 
> Right, I split it up into two.
> 
> > [...] Please remove it from linux-next inclusion until it is ready.
> 
> Sure, I just removed it now.
> 
> > Delibeately introducing a patch to linux-next that may well cause build breakage
> > in other architectures just before the merge window opens is a bit antisocial.
> 
> That was in no way my intention.
> In contrary, I wanted to see if other platforms are affected by the same bug without knowing.
> Do you by any chance know if it broke some of the existing platforms?
> If yes, that would be valuable info...
> 
> Just in case people want to know what this is all about:
> On parisc I found __ARCH_SI_PREAMBLE_SIZE to have a wrong value in 64bit kernel builds.
> Patch which fixes it is here:
> https://patchwork.kernel.org/patch/7994821/
> 
> To prevent other (existing and future) architectures to run into the same
> problem I wanted to test this patch via linux-next and inform them:
> http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=test__ARCH_SI_PREAMBLE_SIZE

That doesn't fire on powerpc, ie. we have it correct.

Though I wonder why it's not just defined using offsetof? Possibly just that
it's awkward with the way the headers are organised.

cheers
