From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: rebase/rewrite of the renesas tree
Date: Thu, 11 Jul 2013 09:31:33 +0900
Message-ID: <20130711003133.GC22153@verge.net.au>
References: <20130711100851.14dc2f2c5c268a23486c89c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59662 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754210Ab3GKAbg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jul 2013 20:31:36 -0400
Content-Disposition: inline
In-Reply-To: <20130711100851.14dc2f2c5c268a23486c89c1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 11, 2013 at 10:08:51AM +1000, Stephen Rothwell wrote:
> Hi Simon,
> 
> Why have you just rebased the renesas tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#next)?
> You have just invalidated your testing and made it likely that your
> upstream maintainers will blast you if you ask them to pull your tree
> (though it is probably too late for v3.11 now anyway).

Hi Stephen,

I am not planning to send any pull requests for v3.11,
at least not for the branches that I rebased.

I can rewind the next branch if you like. If so, would rewinding
it to the point it was at for next-20130709 make sense?

Also, on this topic, could you clarify when it would be appropriate
to do any rebasing. Obviously I am not clear on this.
