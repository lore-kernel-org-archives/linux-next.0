From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the usb.current tree
Date: Tue, 24 Jan 2012 16:33:55 -0800
Message-ID: <20120125003355.GA18976@kroah.com>
References: <20120125112023.9cd8b4b1eedd717960e4c0a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43404 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755109Ab2AYAd7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jan 2012 19:33:59 -0500
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 411FC20FAD
	for <linux-next@vger.kernel.org>; Tue, 24 Jan 2012 19:33:59 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120125112023.9cd8b4b1eedd717960e4c0a0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>

On Wed, Jan 25, 2012 at 11:20:23AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb.current tree, today's linux-next build (x86_64_allmodconfig)
> produced this warning:
> 
> drivers/usb/host/Kconfig:559:error: recursive dependency detected!
> drivers/usb/host/Kconfig:559:	symbol USB_HWA_HCD depends on UWB
> drivers/uwb/Kconfig:5:	symbol UWB is selected by USB_WUSB
> drivers/usb/wusbcore/Kconfig:4:	symbol USB_WUSB is selected by USB_HWA_HCD
> 
> Introduced by commit 0dd2b62ada6f ("drivers: usb: Fix dependency for
> USB_HWA_HCD").

Yeah, I just reverted that about 30 minutes, you must have pulled before
I pushed that change out.

thanks,

greg k-h
