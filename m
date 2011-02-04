From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the i.MX tree
Date: Thu, 3 Feb 2011 20:20:47 -0800
Message-ID: <20110204042047.GA3331@kroah.com>
References: <20110204151408.9988102e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:41150 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752244Ab1BDETl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Feb 2011 23:19:41 -0500
Content-Disposition: inline
In-Reply-To: <20110204151408.9988102e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>, Sascha Hauer <s.hauer@pengutronix.de>

On Fri, Feb 04, 2011 at 03:14:08PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/Kconfig between commit
> 47d37d6f94ccf32d302492f969209930b2411f9e ("serial: Add auart driver for
> i.MX23/28") from the i.M tree and commit
> 4564e1ef219fa69ed827fe2613569543a6b26fbc ("serial: pch_uart: support new
> device ML7213") from the tty tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

Looks good to me, thanks for handling this.

greg k-h
