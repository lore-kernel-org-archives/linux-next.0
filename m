From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Mon, 23 Apr 2012 09:40:38 -0700
Message-ID: <20120423164038.GA16576@kroah.com>
References: <20120419145951.4e1652ae5b1b80686892495d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58743 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753395Ab2DWQkk (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Apr 2012 12:40:40 -0400
Content-Disposition: inline
In-Reply-To: <20120419145951.4e1652ae5b1b80686892495d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomoya MORINAGA <tomoya.rohm@gmail.com>

On Thu, Apr 19, 2012 at 02:59:51PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/pch_uart.c between commit af6d17cdc8c8 ("pch_uart: Fix
> dma channel unallocated issue") from the tty.current tree and commit
> 44db113212d8 ("pch_uart: Delete unused structure member") from the tty
> tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks for this, it should now be resolved in my tree.

greg k-h
