From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: ground rules
Date: Fri, 14 Aug 2009 08:56:13 -0500
Message-ID: <1250258173.4021.3.camel@mulgrave.site>
References: <20090814180246.9ac3e78e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:35539 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755626AbZHNN4P (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Aug 2009 09:56:15 -0400
In-Reply-To: <20090814180246.9ac3e78e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

On Fri, 2009-08-14 at 18:02 +1000, Stephen Rothwell wrote:
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

The rest are fine, but this one isn't feasible for a driver tree ... I
don't have all the hardware, and people will insist on fixing
theoretical bugs in drivers we can't test on.

A lot of time, bugs turn up in this code only after it has been on
release for several months and the small pool of HW owners actually gets
around to testing it.

Additionally, I have to carry patches on trust for HW I'm never likely
to see outside someones multi-million dollar lab.

>      * destined for the current or next Linux merge window.

James
