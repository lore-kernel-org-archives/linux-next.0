From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: failed import of the usb quilt series
Date: Mon, 26 Jul 2010 21:17:40 -0700
Message-ID: <20100727041740.GD16038@kroah.com>
References: <20100727104236.eeccabdf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100727104236.eeccabdf.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 27, 2010 at 10:42:36AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Importing the usb quilt series today produced this error:
> 
> usb-serial-enabling-support-for-segway-rmp-in-ftdi_sio.patch
> error: patch failed: drivers/usb/serial/ftdi_sio.c:746
> error: drivers/usb/serial/ftdi_sio.c: patch does not apply
> Context reduced to (1/0) to apply fragment at 1012
> 
> I removed that patch for today.

Thanks, yes, this is a known issue, it conflicts with a patch that I
sent to Linus that is already in his tree.  I'll resync tomorrow with
the latest -git snapshot and it should work.

thanks,

greg k-h
