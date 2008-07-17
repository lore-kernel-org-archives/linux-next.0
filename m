From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/3] proc: make grab_header static
Date: Thu, 17 Jul 2008 16:36:35 -0700
Message-ID: <20080717163635.6862a6f7.akpm@linux-foundation.org>
References: <1216329755.6029.31.camel@brick>
	<20080717150950.5d721d90.akpm@linux-foundation.org>
	<20080717232328.GO28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:57445 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758664AbYGQXgh (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 19:36:37 -0400
In-Reply-To: <20080717232328.GO28946@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: harvey.harrison@gmail.com, linux-next@vger.kernel.org

On Fri, 18 Jul 2008 00:23:28 +0100
Al Viro <viro@ZenIV.linux.org.uk> wrote:

> On Thu, Jul 17, 2008 at 03:09:50PM -0700, Andrew Morton wrote:
> > On Thu, 17 Jul 2008 14:22:35 -0700
> > Harvey Harrison <harvey.harrison@gmail.com> wrote:
> > 
> > > fs/proc/proc_sysctl.c:69:25: warning: symbol 'grab_header' was not declared. Should it be static?
> 
> > urgh.  We need to do something here.
> > 
> > People are dumping large hunks of 2.6.28 material into linux-next
> > during the merge window.  This screws me up because I haven't merged
> > into 2.6.27 yet, and my patch queue is based on linux-next.  And I
> > _have_ to do that, because lots of the git trees haven't merged into
> > mainline yet.
> 
> FWIW, you are slightly misreading the situation - it *is* my fault, but
> in a different way.  What's happening is not development going into that
> branch - it's untangling a huge pile of pending patches into sequence.
> And yes, it should've gone public as-is a couple of weeks ago ;-/

So this is actually late-breaking 2.6.27 material?  In that case: ouch,
but OK.

But the core problem remains: linux-next is the 2.6.27 integration tree
and remains the 2.6.27 integration tree *for some people* until
2.6.28-rc1 is released.

If people start putting lots of 2.6.x+1 material into linux-next prior
to the 2.6.x-rc1 release then we'll need to point this out and ask
people to tweak their practices a bit.

This happened yesterday with git-security-testing and James just moved
piles of new stuff into a "devel" tree which he'll transfer to
linux-next after -rc1, no probs.
