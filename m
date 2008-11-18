From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: procedures
Date: Tue, 18 Nov 2008 08:47:57 -0800
Message-ID: <20081118084757.5c92c878.randy.dunlap@oracle.com>
References: <20081112173807.05cfadf0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:21066 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbYKRQst (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Nov 2008 11:48:49 -0500
In-Reply-To: <20081112173807.05cfadf0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

On Wed, 12 Nov 2008 17:38:07 +1100 Stephen Rothwell wrote:

...

> The following will cause a tree to be temporarily dropped from linux-next:
> 	- non-trivial conflicts with Linus' tree
> 	- build failures

Hi Stephen,
One clarification, please.

Does this mean build failures that _you_ see/experience during tree merging
and not other reported build failures?

Thanks,
~Randy


> 	- non-obvious conflicts with other trees (this will require
> us to come up with some way forward for the trees involved)
> 	- the contact for the tree being unresponsive
> 
> Most conflicts will be notified to the contacts for the trees involved
> (some really trivial ones will not).  Simple conflicts between trees I
> will try to fix up (if possible) and carry such resolutions as necessary.
> 
> I will not, any more, carry fix up patches to make linux-next build or
> boot.  If a tree is identified as causing such a problem, it will be
> dropped until the problem is fixed.
> 
> This is all open to discussion ...
