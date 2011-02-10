From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the m68knommu
 tree
Date: Thu, 10 Feb 2011 10:51:15 -0800
Message-ID: <20110210185115.GB15944@kroah.com>
References: <20110210162914.eec2f4b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36848 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754909Ab1BJSvc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Feb 2011 13:51:32 -0500
Content-Disposition: inline
In-Reply-To: <20110210162914.eec2f4b5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Tejun Heo <tj@kernel.org>

On Thu, Feb 10, 2011 at 04:29:14PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/68328serial.c between commit
> abf67e214f867d16df6a9c4ac7d8fc0b98ebad97 ("m68knommu: fix derefernce of
> port.tty") from the m68knommu tree and commit
> f094298bae5f5d0e1cb3bff4621aae7ef486812a ("68328serial: remove unsed
> m68k_serial->tqueue_hangup") from the tty tree.
> 
> I just used the latter since it removed some of the code modified by the
> former.

Sounds fine, thanks.

greg k-h
