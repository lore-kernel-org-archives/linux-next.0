From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: usb tree build warning
Date: Tue, 1 Dec 2009 11:23:02 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.0912011122060.2983-100000@iolanthe.rowland.org>
References: <20091130170128.db346120.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:46661 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754155AbZLAQW4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2009 11:22:56 -0500
In-Reply-To: <20091130170128.db346120.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>

On Mon, 30 Nov 2009, Stephen Rothwell wrote:

> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> drivers/net/wimax/i2400m/usb.c: In function 'i2400mu_suspend':
> drivers/net/wimax/i2400m/usb.c:595: warning: unused variable 'usb_dev'
> 
> Introduced by commit a85c653a3945350875611d3cb071a0143cfeb2d2 ("USB:
> remove the auto_pm flag") which removed the last usage in this function.

Greg, can you fix this?  Simply modify the patch to eliminate the 
unused local variable and the enclosing #ifdef.

Thanks,

Alan Stern
