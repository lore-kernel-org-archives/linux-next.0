From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the arm-soc
 tree
Date: Tue, 25 Feb 2014 08:49:21 -0800
Message-ID: <20140225164921.GA4458@kroah.com>
References: <20140225170944.d322d9868871bc2f669b92e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47696 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752809AbaBYQrw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Feb 2014 11:47:52 -0500
Content-Disposition: inline
In-Reply-To: <20140225170944.d322d9868871bc2f669b92e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>

On Tue, Feb 25, 2014 at 05:09:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> arch/arm/boot/dts/imx53-qsb.dts between commit d5eb195f26fa ("ARM: dts:
> i.MX53: move common QSB nodes to new file") from the arm-soc tree and
> commit 17b5001b5143 ("imx-drm: convert to componentised device support")
> from the staging tree.
> 
> I fixed it up (see at bottom) and can carry the fix as necessary (no
> action is required).  I also added the following fix up patch:

I think it's right, but I really have no idea about any of these.  I'll
defer to Russell to ensure they are correct.

thanks,

greg k-h
