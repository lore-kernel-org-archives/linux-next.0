From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with Linus' tree
Date: Wed, 23 Dec 2009 15:38:56 -0800
Message-ID: <20091223233856.GA19893@kroah.com>
References: <20091224093036.2ba1ecf5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756000AbZLWXkG@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091224093036.2ba1ecf5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefani Seibold <stefani@seibold.net>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 24, 2009 at 09:30:36AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/serial/generic.c between commit
> 119eecc831a42bd090543568932e440c6831f1bb ("Fix usb_serial_probe() problem
> introduced by the recent kfifo changes") from Linus' tree and commit
> 40b2ba0dfb62bed0f7cc6f699053d18ca4553e91 ("USB: serial: mct_usb232: add
> drain on close") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix for a while.  The result
> needs checking.

Thanks, I fixed this up already in my tree and will resync in a few
hours.

greg k-h
