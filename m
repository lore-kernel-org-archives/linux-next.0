From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the i.MX tree
Date: Fri, 4 Mar 2011 09:12:15 -0800
Message-ID: <20110304171215.GA22173@kroah.com>
References: <20110304155800.b48993d7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38573 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759768Ab1CDROc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Mar 2011 12:14:32 -0500
Content-Disposition: inline
In-Reply-To: <20110304155800.b48993d7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Zhao <richard.zhao@freescale.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@freescale.com>

On Fri, Mar 04, 2011 at 03:58:00PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/gadget/fsl_mxc_udc.c between commit
> 4d2f13be1e370a670c1cae20c194d5ce961e0fa5 ("ARM: imx3x: clean up
> ARCH_MX3X") from the i.MX tree and commit
> a51ea8cc9cfcfd719240455ff8f217b4f165d1d0 ("usb: gadget/fsl_mxc_udc:
> Detect the CPU type in run-time") from the usb tree.
> 
> The latter is a superset of the former, so I used that.

Thanks, I appreciate it.

greg k-h
