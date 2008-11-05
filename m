From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Tue, 4 Nov 2008 20:47:45 -0800
Message-ID: <20081105044745.GB3668@kroah.com>
References: <20081103113640.1ad6899d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38619 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754517AbYKEEtr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 23:49:47 -0500
Content-Disposition: inline
In-Reply-To: <20081103113640.1ad6899d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Douglas Schilling Landgraf <dougsland@gmail.com>

On Mon, Nov 03, 2008 at 11:36:40AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> I am still getting these errors after merging the usb tree:
> 
> drivers/media/radio/radio-mr800.c: In function 'vidioc_s_frequency':
> drivers/media/radio/radio-mr800.c:362: error: implicit declaration of function 'warn'
> drivers/media/radio/radio-mr800.c: In function 'usb_amradio_suspend':
> drivers/media/radio/radio-mr800.c:513: error: implicit declaration of function 'info'
> 
> I have been reverting these patches for a while:
> 	USB: remove info() macro from usb.h
> 	USB: remove warn() macro from usb.h
> 
> Today, I excluded those patches completely from my tree and they will
> stay excluded until a fix is applied to drivers/media/radio/radio-mr800.c.
> 
> Alexey sent a patch on Oct 12 (see below).  Greg, you might as well put
> this your series until Mauro or Douglas gets around to sending it to
> Linus.  However, that patch does not address the warn() usage ...
> 
> Mauro, Douglas, any comment?

Mauro, do you want me to send patches cleaning this up to you?

thanks,

greg k-h
