From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Wed, 20 Jan 2016 18:07:00 -0800
Message-ID: <20160121020700.GA9861@kroah.com>
References: <20160121125618.78f0cb37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50583 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751807AbcAUCHF (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2016 21:07:05 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id ECBDB20988
	for <linux-next@vger.kernel.org>; Wed, 20 Jan 2016 21:07:01 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20160121125618.78f0cb37@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

On Thu, Jan 21, 2016 at 12:56:18PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree (now in Linus' tree, sorry for not pointing
> it out earlier), today's linux-next build (multi_v7_defconfig) produced
> this warning:
> 
> drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
>  static struct vendor_data vendor_zte = {
>                            ^
> 
> Introduced by commit
> 
>   7ec758718920 ("tty: amba-pl011: add support for ZTE UART (EXPERIMENTAL)")

Thanks, Arnd sent me a patch for this earlier today, I'll merge it after
4.5-rc1 is out.

thanks,

greg k-h
