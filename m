From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Thu, 28 Mar 2013 11:04:59 -0700
Message-ID: <20130328180459.GA20456@kroah.com>
References: <20130327144134.0809a21c09b45d20a1fe480d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49275 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751110Ab3C1SFB (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Mar 2013 14:05:01 -0400
Content-Disposition: inline
In-Reply-To: <20130327144134.0809a21c09b45d20a1fe480d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <jhovold@gmail.com>, Ming Lei <tom.leiming@gmail.com>

On Wed, Mar 27, 2013 at 02:41:34PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/usb/serial/usb-serial.c: In function 'usb_serial_probe':
> drivers/usb/serial/usb-serial.c:887:3: error: 'struct usb_serial_port' has no member named 'delta_msr_wait'
> 
> Caused by commit eba0e3c3a0ba ("USB: serial: fix hang when opening port")
> fro the usb.current tree interacting with commit 53ab34dc50ad ("USB:
> serial: remove unused MSR-wait queue") from the usb tree.
> 
> I have reverted the commit from usb.current on the assumption that the
> problem it solves has been, or will be, solved some other way.

I've now fixed this in my tree, so all should be good.

thanks,

greg k-h
