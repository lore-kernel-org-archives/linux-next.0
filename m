From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add the freevxfs tree to linux-next
Date: Fri, 1 Jul 2016 09:36:03 +1000
Message-ID: <20160701093603.2d94cb81@canb.auug.org.au>
References: <20160630090918.GA8701@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47843 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751536AbcF3Xi0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jun 2016 19:38:26 -0400
In-Reply-To: <20160630090918.GA8701@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org

Hi Christoph,

On Thu, 30 Jun 2016 11:09:18 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> the good old freevxfs driver finally got some updates again,
> can you please add
> 
>     git://git.infradead.org/users/hch/freevxfs.git for-next
> 
> to linux-next?

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
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
