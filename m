From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Date: Fri, 25 Jan 2013 12:57:09 -0800
Message-ID: <20130125205709.GA22336@kroah.com>
References: <20130121144604.3c2f94e93ce6252aa43d3d9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36311 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753058Ab3AYU5L (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Jan 2013 15:57:11 -0500
Content-Disposition: inline
In-Reply-To: <20130121144604.3c2f94e93ce6252aa43d3d9e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Tony Prisk <linux@prisktech.co.nz>

On Mon, Jan 21, 2013 at 02:46:04PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/vt8500_serial.c between commit a6dd114e16cb ("tty:
> serial: vt8500: fix return value check in vt8500_serial_probe()") from
> Linus' tree and commit 12faa35ae5cb ("serial: vt8500: UART uses gated
> clock rather than 24Mhz reference") from the tty tree.
> 
> I fixed it up (I just used the tty tree version - which included the
> former fix) and can carry the fix as necessary (no action is required).

This should be resolved in the next pull of my tree.

thanks,

greg k-h
