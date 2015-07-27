From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add QCOM to linux-next
Date: Tue, 28 Jul 2015 08:52:42 +1000
Message-ID: <20150728085242.7e0e9e95@canb.auug.org.au>
References: <20150727214230.GH12739@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34236 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754401AbbG0Wwo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jul 2015 18:52:44 -0400
In-Reply-To: <20150727214230.GH12739@qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Gross <agross@codeaurora.org>
Cc: linux-next@vger.kernel.org

Hi Andy,

On Mon, 27 Jul 2015 16:42:30 -0500 Andy Gross <agross@codeaurora.org> wrote:
>
> Can you please add the following tree to linux-next:
> 
> git://codeaurora.org/quic/kernel/agross-msm.git qcom/for-next
> 
> We'll be using this for our QCOM SOC repo integration work.

I assume that this will be merged via the arm-soc tree?

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
