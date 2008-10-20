From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual import of the driver-core,current tree
Date: Sun, 19 Oct 2008 20:48:23 -0700
Message-ID: <20081020034823.GD26650@kroah.com>
References: <20081020110119.6f01662a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:56558 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751748AbYJTDvz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Oct 2008 23:51:55 -0400
Content-Disposition: inline
In-Reply-To: <20081020110119.6f01662a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, Oct 20, 2008 at 11:01:19AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next import of the driver-core.current tree got a conflict
> in document-kernel-taint-flags-properly.patch.  It would not apply until
> I removed the line
> 
> - 64 - A module from drivers/staging was loaded.
> 
> from the context.

That's fine, I'll clean this all up tomorrow in the morning.

thanks,

greg k-h
