From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Mon, 6 Feb 2017 09:50:42 +0100
Message-ID: <20170206085042.GA3726@kroah.com>
References: <20170206151638.6e0f8a60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42028 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751071AbdBFIvC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2017 03:51:02 -0500
Content-Disposition: inline
In-Reply-To: <20170206151638.6e0f8a60@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>

On Mon, Feb 06, 2017 at 03:16:38PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build
> (arm_multi_v7_defconfig) produced this warning:
> 
> drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]
>  static int scif_set_rtrg(struct uart_port *port, int rx_trig)
>             ^
> 
> Introduced by commit
> 
>   a380ed461f66 ("serial: sh-sci: implement FIFO threshold register setting")
> 
> Forgot to add a call to this new function?

I think this is fixed by a patch I just took into my tree, which isn't
in linux-next yet.  Right Ulrich?  Or is this still a warning with your
latest patch series?

thanks,

greg k-h
