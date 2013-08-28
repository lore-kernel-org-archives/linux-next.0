From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Wed, 28 Aug 2013 10:26:44 -0700
Message-ID: <20130828172644.GD5012@kroah.com>
References: <20130828164506.3f8497c59e07b0ccaaa44aec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55717 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752305Ab3H1RY3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Aug 2013 13:24:29 -0400
Content-Disposition: inline
In-Reply-To: <20130828164506.3f8497c59e07b0ccaaa44aec@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, avier Martinez Canillas <javier.martinez@collabora.co.uk>, Benoit Cousson <bcousson@baylibre.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Felipe Balbi <balbi@ti.com>

On Wed, Aug 28, 2013 at 04:45:06PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got conflicts in
> arch/arm/boot/dts/am335x-bone.dts, arch/arm/boot/dts/am335x-evm.dts and
> arch/arm/boot/dts/am335x-evmsk.dts between commit c031a7d41934 ("usb:
> usb: dsps: update code according to the binding document") from the usb
> tree and commits 63f6b2550aa0 ("ARM: dts: AM33XX: don't redefine OCP bus
> and device nodes"), 781f17983015 ("usb: musb: am335x-evm: Do not remove
> the session bit HOST-only mode") and 2ae847a1b10f ("usb: musb: am335x:
> add second port to beagle bone") from the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks, that looks good.

greg k-h
