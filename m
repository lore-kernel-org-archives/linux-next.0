From: Jesper Juhl <jj@chaosbits.net>
Subject: Re: Duplicate patches in the tree
Date: Sat, 5 Mar 2011 23:22:43 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1103052322050.6297@swampdragon.chaosbits.net>
References: <alpine.LNX.2.00.1103052113270.32044@swampdragon.chaosbits.net> <20110306083644.f2bec4af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from swampdragon.chaosbits.net ([90.184.90.115]:15955 "EHLO
	swampdragon.chaosbits.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055Ab1CEWXR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Mar 2011 17:23:17 -0500
In-Reply-To: <20110306083644.f2bec4af.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Sun, 6 Mar 2011, Stephen Rothwell wrote:

> Hi Jesper,
> 
> On Sat, 5 Mar 2011 21:45:19 +0100 (CET) Jesper Juhl <jj@chaosbits.net> wrote:
> >
> > I noticed something currious today in linux-next. 
> > There are, what looks to me like, duplicate patches with different commit 
> > id's but identical contents. Perhaps this is just a git artefact that I 
> > don't know about, but it seemed currious enough that I thought I'd ask.
> 
> This happens sometimes ...
> 
...
> 
> Its perfectly normal, it just means that the branch of the voltage
> tree has included in linux-next is not based on (or merged with) the branch
> that is has been submitted to Linus.  This happens a bit with bug fixes.
> 

Ahh, I see. Thanks for explaining that - makes perfect sense. 

-- 
Jesper Juhl <jj@chaosbits.net>            http://www.chaosbits.net/
Plain text mails only, please.
Don't top-post http://www.catb.org/~esr/jargon/html/T/top-post.html
