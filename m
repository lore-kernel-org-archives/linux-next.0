From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: ground rules
Date: Fri, 14 Aug 2009 08:07:59 -0400
Message-ID: <20090814120759.GA2650@tuxdriver.com>
References: <20090814180246.9ac3e78e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:42661 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959AbZHNMPR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2009 08:15:17 -0400
Content-Disposition: inline
In-Reply-To: <20090814180246.9ac3e78e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

On Fri, Aug 14, 2009 at 06:02:46PM +1000, Stephen Rothwell wrote:
> [This email has been bcc'd to all the current contributors to
> linux-next.  No response is required unless you have some issue with the
> following.]
> 
> Thanks for being a participant of linux-next.  I have been asked by my 
> employer to send you this e-mail summarizing these "ground rules" for the 
> project:
> 
> The linux-next integration testing is not a judgment of your code.  The 
> purpose of linux-next is for integration testing and to lower the impact 
> of conflicts between subsystems in the next merge window. 
> 
> You need to ensure that the patches/commits in your tree/series have been:
>      * submitted under GPL v2 (or later) and include the Contributor's
> 	Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

ACK (if that helps!)

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
