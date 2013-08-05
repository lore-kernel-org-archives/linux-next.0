From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the sh tree
Date: Mon, 5 Aug 2013 13:25:48 +0800
Message-ID: <20130805052548.GB31808@kroah.com>
References: <20130805150456.974461a9896ae4d61f044aab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35092 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754135Ab3HEFYc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Aug 2013 01:24:32 -0400
Content-Disposition: inline
In-Reply-To: <20130805150456.974461a9896ae4d61f044aab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bastian Hecht <hechtb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, Paul Mundt <lethal@linux-sh.org>

On Mon, Aug 05, 2013 at 03:04:56PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/sh-sci.c between commit ada80ee7fa60 ("serial: sh-sci:
> Add OF support") from the sh tree and commit 3ba35baa55fa ("serial:
> sh-sci: use dev_get_platdata()") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
