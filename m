From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Wed, 19 Sep 2012 08:17:48 +0100
Message-ID: <20120919071748.GD16905@kroah.com>
References: <20120919143136.46dd2318963c0d8524492041@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120919143136.46dd2318963c0d8524492041@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 19, 2012 at 02:31:36PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/usb/serial/vizzini.c: In function 'vizzini_set_termios':
> drivers/usb/serial/vizzini.c:454:22: error: invalid type argument of '->' (have 'struct ktermios')
> 
> Caused by commit c05fecb1d57e ("USB: serial: add vizzini driver")
> interacting with commit adc8d746caa6 ("tty: move the termios object into
> the tty") from the tty tree.
> 
> I added the following merge fix patch and can carry it as necessary:

Looks correct to me, thanks for this, a side affect of api changes in
the tty tree at the moment.

greg k-h
