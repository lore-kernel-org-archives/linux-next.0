From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request for inclusion of ipvs and ipvs-next trees in next
Date: Mon, 5 Oct 2015 23:40:54 +1100
Message-ID: <20151005234054.1bfade21@canb.auug.org.au>
References: <20151002005626.GA4802@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41666 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752100AbbJEMk4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Oct 2015 08:40:56 -0400
In-Reply-To: <20151002005626.GA4802@verge.net.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Simon Horman <horms@verge.net.au>
Cc: linux-next@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, David Miller <davem@davemloft.net>

Hi Simon,

On Fri, 2 Oct 2015 09:56:26 +0900 Simon Horman <horms@verge.net.au> wrote:
>
> I would like to request the inclusion of 'ipvs.git' and 'ipvs-next.git' in
> linux-next.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs-next.git
> 
> I have been maintaining IPVS using those trees for a number of years and
> maintaining IPVS without those trees for a number of years before that.
> 
> Usually 'ipvs-next.git' feeds into Pablo's 'nf-next.git' which
> in turn feeds into Dave's 'net-next.git'. Likewise for s/-next//.

Added from tomorrow.  (just noting that I don't fetch the nf{,-next}
trees ...)

I am using the git:... version of the URLs and assume that you mean for me
to fetch the master branch of each of those trees.

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
