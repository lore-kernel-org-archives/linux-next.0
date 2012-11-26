From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 sound-asoc tree
Date: Mon, 26 Nov 2012 11:32:21 -0800
Message-ID: <20121126193221.GB3413@kroah.com>
References: <20121126194229.feef81574cac8e860cf68df9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:58606 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755564Ab2KZTcX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Nov 2012 14:32:23 -0500
Content-Disposition: inline
In-Reply-To: <20121126194229.feef81574cac8e860cf68df9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Bo Shen <voice.shen@atmel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>

On Mon, Nov 26, 2012 at 07:42:29PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/misc/atmel-ssc.c between commit 5c86ac695c7e ("ASoC: atmel-ssc:
> use module_platform_driver macro") from the sound-asoc tree and commit
> 2d6bed9ca93e ("drivers/misc: remove use of __devexit_p") from the
> char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
