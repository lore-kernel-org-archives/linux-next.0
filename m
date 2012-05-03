From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the input tree
Date: Thu, 3 May 2012 14:49:43 -0700
Message-ID: <20120503214943.GB16912@kroah.com>
References: <20120503144421.bce525fdec4a9b2d3b7557d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50327 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754455Ab2ECVtq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 May 2012 17:49:46 -0400
Content-Disposition: inline
In-Reply-To: <20120503144421.bce525fdec4a9b2d3b7557d5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chris Bagwell <chris@cnpbagwell.com>

On Thu, May 03, 2012 at 02:44:21PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/input/tablet/wacom_wac.c between commit eb71d1bb270e ("Input:
> wacom - use dev_xxx() instead of naked printk()s and dbg()s") from the
> input tree and commit 3b6aee237e88 ("USB: wacom: remove dbg() usage")
> from the usb tree.
> 
> I just used the input tree's version (which used "input->dev.parent"
> instead of "&input->dev").

That's fine, Dmitry and I are still "discussing" which pointer is best
to use on lkml, but either is good for the merge :)

thanks,

greg k-h
