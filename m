From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 00:33:27 -0700
Message-ID: <20080606003327.9ac0e91b.akpm@linux-foundation.org>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au>
	<20080605195604.41623687.akpm@linux-foundation.org>
	<20080606071707.GB9708@elte.hu>
	<20080606072536.GA19334@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:32769 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756516AbYFFHdo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 03:33:44 -0400
In-Reply-To: <20080606072536.GA19334@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 6 Jun 2008 09:25:36 +0200 Ingo Molnar <mingo@elte.hu> wrote:

> 
> * Ingo Molnar <mingo@elte.hu> wrote:
> 
> > * Andrew Morton <akpm@linux-foundation.org> wrote:
> > 
> > > On Thu, 5 Jun 2008 17:52:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > > I have created today's linux-next tree at
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> > > 
> > > Instantly oopses on two x86_64 boxes with this config:
> > > http://userweb.kernel.org/~akpm/config-akpm2.txt
> > > 
> > > oops: http://userweb.kernel.org/~akpm/p6056454.jpg
> > >
> > > At a guess I'd say the sched_domains code is calling into slab before 
> > > slab is initalised.  Something like that.
> > 
> > did SLUB change in linux-next? There is no such problem in -tip.
> 
> i just successfully booted your config on 4 separate 64-bit test-systems 
> with latest -tip. (two dual-core boxes, a quad and a 16way box) Latest 
> -tip includes sched-next and x86-next as well.

What's the point in testing a radically differenet kernel from the one
which is known to be crashing?
