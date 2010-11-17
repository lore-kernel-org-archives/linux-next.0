From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Tue, 16 Nov 2010 20:20:53 -0800
Message-ID: <20101117042053.GB2999@kroah.com>
References: <20101117131453.5b94f435.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:59755 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932768Ab0KQE0g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Nov 2010 23:26:36 -0500
Content-Disposition: inline
In-Reply-To: <20101117131453.5b94f435.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

On Wed, Nov 17, 2010 at 01:14:53PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/media/video/tlg2300/pd-main.c: In function 'poseidon_probe':
> drivers/media/video/tlg2300/pd-main.c:455: error: 'struct usb_device' has no member named 'autosuspend_delay'
> drivers/net/wimax/i2400m/usb.c: In function 'i2400mu_probe':
> drivers/net/wimax/i2400m/usb.c:517: error: 'struct usb_device' has no member named 'autosuspend_delay'
> 
> Caused by commit fcc4a01eb8661226e80632327673f67bf6a5840b ("USB: use the
> runtime-PM autosuspend implementation").  More grepping required ...
> 
> I have used the usb tree from next-20101116 for today.

Ick.  Alan, care to provide a patch?

thanks,

greg k-h
