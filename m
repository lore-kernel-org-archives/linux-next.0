From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Thu, 17 Jan 2013 16:42:50 -0800
Message-ID: <20130118004250.GC29380@kroah.com>
References: <20130117133533.c005e3b2ee5c489e94902e3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:43245 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752076Ab3ARAmw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jan 2013 19:42:52 -0500
Content-Disposition: inline
In-Reply-To: <20130117133533.c005e3b2ee5c489e94902e3a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>, Davidlohr Bueso <davidlohr.bueso@hp.com>

On Thu, Jan 17, 2013 at 01:35:33PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/zram/zram_drv.c between commit 397c60668aa5 ("staging:
> zram: fix invalid memory references during disk write") from Linus' tree
> and commit d178a07c4bd3 ("staging: zram: drop zram_stat_dec/inc
> functions") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
