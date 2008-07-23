From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: circumvention and ignorance (was: Re: linux-next:
 Tree for July 22)
Date: Tue, 22 Jul 2008 20:10:05 -0700
Message-ID: <20080722201005.2d1081f5.randy.dunlap@oracle.com>
References: <20080722184059.a58c79d7.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0807230140000.28765@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:18864 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566AbYGWDLC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 23:11:02 -0400
In-Reply-To: <Pine.LNX.4.64.0807230140000.28765@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 23 Jul 2008 01:49:30 +0200 (CEST) Geert Uytterhoeven wrote:

> 	Hi all,
> 
> Looking at today's http://kisskb.ellerman.id.au/kisskb/matrix/, there's
> plenty of red, and not only in the linux-next division :-(
> 
> On Tue, 22 Jul 2008, Stephen Rothwell wrote:
> > We are up to 105 trees (counting Linus' and 14 trees of patches pending for
> > Linus' tree), more are welcome (even if they are currently empty).
> > Thanks to those who have contributed, and to those who haven't, please do.
> 
> We still see regular merging of trivially breaking patches that
> apparently never have been in linux-next...
> 
> > The ttydev tree was partially merged upstream and gained so many
> > conflicts that I have temporarily dropped it.
> 
> Worse, we're seeing things getting merged that have been known-broken in
> several linux-next incarnations during the last few weeks...
> 
> Now we have such a great thing like linux-next (thanks, Stephen! You
> saved my day a lot lately), perhaps we should start making full use of
> it?

E.g., we don't seem to have a good method of moving build fixes into their
appropriate tree/patchset.  Or maybe it's just that we can't get them
noticed by the appropriate people.

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
