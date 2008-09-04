From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: Tree for September 3
Date: Wed, 3 Sep 2008 22:26:23 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0809032223200.3378@nehalem.linux-foundation.org>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au> <20080903214634.ea17ff53.akpm@linux-foundation.org> <20080903215455.792c78a3.akpm@linux-foundation.org> <20080904145744.3f791ca7.sfr@canb.auug.org.au>
 <20080903220546.bd673658.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:35372 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751124AbYIDF0c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 01:26:32 -0400
In-Reply-To: <20080903220546.bd673658.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Yinghai Lu <yhlu.kernel@gmail.com>



On Wed, 3 Sep 2008, Andrew Morton wrote:
> 
> This breakage spans over 1000 commits.  Not sure how that can happen in
> a rebased tree, but whatever.

If the only problem is that dmesg thing, and that cardbus doesn't work as 
a result, try my small patch before even bothering to bisect. I _think_ it 
will fix that thing.

But that particular thing actually comes from my source tree and is not 
linux-next specific, so if this is something that started happening only 
with Linux-next, and doesn't happen in my tree, then there is something 
else going on too with your Vaio.

Maybe that cardbus problem has been going on for a while, and you just 
didn't notice because it didn't matter? And now you have some new problem 
that is unrelated to that resource thing?

			Linus
