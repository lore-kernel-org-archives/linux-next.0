From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 08:20:04 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0906100817060.6847@localhost.localdomain>
References: <1244477423.4079.228.camel@mulgrave.site>  <20090609202130.GA5291@elte.hu>  <20090610004126.491508c9@lxorguk.ukuu.org.uk>  <20090609235647.GE23846@elte.hu>  <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>  <20090610003055.GA26492@elte.hu>
  <20090610010014.GA28345@elte.hu> <1244644726.4109.30.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:48265 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755308AbZFJPUd (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 11:20:33 -0400
In-Reply-To: <1244644726.4109.30.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Ingo Molnar <mingo@elte.hu>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org



On Wed, 10 Jun 2009, James Bottomley wrote:
> 
> If I go the merge point route, I get a tree with more non trivial merge
> points than commits, so it becomes incredibly difficult for anyone to
> follow what's going on.  I also can no longer use git-email to send my
> patch series anywhere.

Why do you need to merge at all?

Do you get constant conflicts? If so, _that_ is likely the problem.

The rule should be that you should _never_ need to merge from Ingo or me, 
and things should be smooth. And if there are too frequent conflicts for 
that to work, then the rule should be that things get cleaned up so that 
those conflicts don't happen!

Constant rebasing, or constant merging, is a symptom of something simply 
not working. It's probably why Ingo is fed up with Voyager in the first 
place. Can you guys just start telling me what the actual maintenance 
problem is? Where do you actually step on each others toes? What are the 
conflicts? Why is Voyager so special?

			Linus
