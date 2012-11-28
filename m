From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the tty tree
Date: Wed, 28 Nov 2012 08:47:26 -0800
Message-ID: <20121128164726.GA15624@kroah.com>
References: <20121128161430.e6719a4c3f55f12074b6cfc4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:53524 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754037Ab2K1Qrg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Nov 2012 11:47:36 -0500
Content-Disposition: inline
In-Reply-To: <20121128161430.e6719a4c3f55f12074b6cfc4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Kumar Amit Mehta <gmate.amit@gmail.com>

On Wed, Nov 28, 2012 at 04:14:30PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/dgrp/dgrp_tty.c between commit 3ba89e96610b ("staging:
> dgrp: dgrp_tty.c: Remove the TIOCSSOFTCAR ioctl handler from dgrp
> driver") from the tty tree and commit 8fdefcb0ab74 ("staging: dgrp:
> remove TIOCGSOFTCAR and TIOCSSOFTCAR handling") from the staging tree.
> 
> I fixed it up (using the staging tree version - since it is a superset of
> the tty tree version) and can carry the fix as necessary (no action is
> required).

That is correct, thanks for doing this.

greg k-h
