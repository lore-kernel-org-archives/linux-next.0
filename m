From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the tty tree
Date: Mon, 17 Sep 2012 04:20:02 -0700
Message-ID: <20120917112002.GA28478@kroah.com>
References: <20120917173103.9805531382847454e2d59bb8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120917173103.9805531382847454e2d59bb8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 17, 2012 at 05:31:03PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/serial/digi_acceleport.c between commit adc8d746caa6 ("tty:
> move the termios object into the tty") from the tty tree and commit
> f9dfbebb8b39 ("USB: serial: digi_acceleport.c: remove dbg() usage") from
> the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

This fix, and the other usb->tty tree issues, all look good to me,
thanks for doing them, and sorry for the problems.

greg k-h
