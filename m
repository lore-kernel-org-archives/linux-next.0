From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the usb tree
Date: Wed, 19 Sep 2012 08:18:00 +0100
Message-ID: <20120919071800.GE16905@kroah.com>
References: <20120919143505.76e9d77d320ed278f7ce4798@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34136 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753676Ab2ISHSD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Sep 2012 03:18:03 -0400
Content-Disposition: inline
In-Reply-To: <20120919143505.76e9d77d320ed278f7ce4798@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Devendra Naga <devendra.aaru@gmail.com>

On Wed, Sep 19, 2012 at 02:35:05PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/serqt_usb2/serqt_usb2.c between commit e8656b02ef35
> ("USB: serial: serqt_usb2: remove dbg() usage") from the usb tree and
> commit 623c2bb2c59a ("staging: serqt_usb2: fix dbg print when kzalloc
> failed to allocate qt_port") from the staging tree.
> 
> The former removes the line changed by the latter, so I just did that (no
> action is required).

That looks correct, thanks for doing this.

greg k-h
