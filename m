From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: tty tree build failure
Date: Wed, 23 Dec 2009 16:19:22 -0800
Message-ID: <20091224001922.GA26275@kroah.com>
References: <20091224104830.fe78906e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753813AbZLXAv4@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091224104830.fe78906e.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 24, 2009 at 10:48:30AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/mmc/card/sdio_uart.c: In function 'sdio_uart_add_port':
> drivers/mmc/card/sdio_uart.c:99: warning: passing argument 1 of 'kfifo_alloc' makes pointer from integer without a cast
> include/linux/kfifo.h:110: note: expected 'struct kfifo *' but argument is of type 'long unsigned int'
> drivers/mmc/card/sdio_uart.c:99: warning: passing argument 3 of 'kfifo_alloc' makes integer from pointer without a cast
> include/linux/kfifo.h:110: note: expected 'gfp_t' but argument is of type 'struct spinlock_t *'
> drivers/mmc/card/sdio_uart.c:99: warning: assignment makes pointer from integer without a cast
> drivers/mmc/card/sdio_uart.c: In function 'sdio_uart_transmit_chars':
> drivers/mmc/card/sdio_uart.c:476: error: implicit declaration of function 'kfifo_get'
> drivers/mmc/card/sdio_uart.c: In function 'sdio_uart_write':
> drivers/mmc/card/sdio_uart.c:810: error: implicit declaration of function 'kfifo_put'
> 
> Caused by commit ed30500af457c06b533549f5554671e58c4db18a ("tty:
> sdio_uart: Use kfifo instead of the messy circ stuff") interacting with
> the kfifo API change in Linus' tree.
> 
> I have reverted that commit for today.

Thanks, I'll delete that commit and let Alan resubmit it as the API has
now changed.

thanks,

greg k-h
