From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging tree
Date: Tue, 28 Nov 2017 20:41:39 +0100
Message-ID: <20171128194139.GA2653@kroah.com>
References: <20171128081651.71a2e92a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45745 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752417AbdK1Tle (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 14:41:34 -0500
Content-Disposition: inline
In-Reply-To: <20171128081651.71a2e92a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Shvetsov <andrey.shvetsov@k2l.de>, Christian Gromm <christian.gromm@microchip.com>

On Tue, Nov 28, 2017 at 08:16:51AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Commits
> 
>   2525ef557c73 ("staging: most: update driver usage file")
>   e7e3ce04588c ("staging: most: core: fix list traversing")
> 
> are missing a Signed-off-by from their author.

Ugh, I missed that.  Christian, please be more careful.

I need to set up a git hook for this :(

greg k-h
