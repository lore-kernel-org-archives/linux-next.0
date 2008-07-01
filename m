From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Tue, 1 Jul 2008 15:23:02 +0100
Message-ID: <20080701152302.07cdba1e@lxorguk.ukuu.org.uk>
References: <20080702001740.9bbea0df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:34796 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756117AbYGAOkg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 10:40:36 -0400
In-Reply-To: <20080702001740.9bbea0df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

> It could easily (probably) have been the merge.
> 
> I have reverted the ttydev tree for now.  I am not sure quite where we go
> from here.

Well I expected there would be a few explosions from merging a large new
tree in. No problem. As soon as the new tree is done and out I will
regenerate the patch set versus that which should iron out all the
firmware clashes and the like.

Thanks
Alan
