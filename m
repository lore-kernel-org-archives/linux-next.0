From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Mon, 6 Feb 2017 09:51:05 +0100
Message-ID: <20170206085105.GB3726@kroah.com>
References: <20170206152209.0819e332@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170206152209.0819e332@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 06, 2017 at 03:22:09PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "of_device_uevent_modalias" [drivers/tty/serdev/serdev.ko] undefined!
> ERROR: "of_device_get_modalias" [drivers/tty/serdev/serdev.ko] undefined!
> 
> Caused by commit
> 
>   cd6484e1830b ("serdev: Introduce new bus for serial attached devices")
> 
> I have used the tty tree from next-20170203 for today.

Ugh, how has this been passing the 0-day bot builds succesfully?

Rob, any ideas?

thanks,

greg k-h
