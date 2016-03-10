From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: removal of the rpmsg tree
Date: Fri, 11 Mar 2016 07:48:06 +1100
Message-ID: <20160311074806.40d34cce@canb.auug.org.au>
References: <20160309162826.60d6b72b@canb.auug.org.au>
	<CAK=WgbaDinH5VC+tP5NYZMbh7CiOSfqNbkZEbaN3cT5pZhae5g@mail.gmail.com>
	<CAOCOHw4Y-iY+pOr4_L1zeDb6SES66_o=tBJy4wOD2ikgzMJPjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60322 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752795AbcCJUsI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Mar 2016 15:48:08 -0500
In-Reply-To: <CAOCOHw4Y-iY+pOr4_L1zeDb6SES66_o=tBJy4wOD2ikgzMJPjg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Bjorn,

On Wed, 9 Mar 2016 21:31:05 -0800 Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> Stephen, I'm co-maintain the hwspinlock, rpmsg and remoteproc
> subsystems; and will as such maintain the next branches.
> 
> Could you please pull the remoteproc next patches from the "for-next" branch of:
> git://github.com/andersson/remoteproc.git

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
