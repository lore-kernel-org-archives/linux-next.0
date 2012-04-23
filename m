From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the modem-shm tree with the
 driver-core tree
Date: Mon, 23 Apr 2012 07:24:39 -0700
Message-ID: <20120423142439.GC32269@kroah.com>
References: <20120423154420.09f149266ae36bb8e08b4207@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43701 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751675Ab2DWOYl (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Apr 2012 10:24:41 -0400
Content-Disposition: inline
In-Reply-To: <20120423154420.09f149266ae36bb8e08b4207@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?iso-8859-1?Q?=22Sjur_Br=E6ndeland=22?= <sjur.brandeland@stericsson.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>

On Mon, Apr 23, 2012 at 03:44:20PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the modem-shm tree got a conflict in
> drivers/Kconfig between commit de55d8716ac5  ("Extcon (external
> connector): import Android's switch class and modify") from the
> driver-core tree and commit 021fd6178bcd ("modem_shm: Makefile and
> Kconfig for M7400 Shared Memory Drivers") from the modem-shm tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good, thanks for doing this.

greg k-h
