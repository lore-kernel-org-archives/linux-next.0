From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Fri, 27 Apr 2012 10:05:36 -0700
Message-ID: <20120427170536.GA2789@kroah.com>
References: <20120427143703.f6946999cbca5509e22820a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55242 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758624Ab2D0RFi (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Apr 2012 13:05:38 -0400
Content-Disposition: inline
In-Reply-To: <20120427143703.f6946999cbca5509e22820a6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesper Juhl <jj@chaosbits.net>

On Fri, Apr 27, 2012 at 02:37:03PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/vt6656/ioctl.c between commit 17b7e1ba1e2e ("staging:
> vt6656: Don't leak memory in drivers/staging/vt6656/ioctl.c::private_ioctl
> ()") from Linus' tree and commit 62ef30b5781d ("staging: vt6656: Remove
> redundant casts from ioctl.c") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, that looks correct.

greg k-h
