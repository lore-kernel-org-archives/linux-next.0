From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Mon, 11 May 2015 11:42:44 +0100
Message-ID: <20150511104244.GD5856@e103592.cambridge.arm.com>
References: <20150511151626.5550750b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143]:64065 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752863AbbEKKmr convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 May 2015 06:42:47 -0400
In-Reply-To: <20150511151626.5550750b@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jakub Kicinski <kubakici@wp.pl>

On Mon, May 11, 2015 at 06:16:26AM +0100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (arm multi_v7_defconfig)
> failed like this:
> 
> drivers/tty/serial/amba-pl011.c: In function 'pl011_startup':
> drivers/tty/serial/amba-pl011.c:1582:5: error: 'struct uart_amba_port' has no member named 'tx_irq_seen'
>   uap->tx_irq_seen = 0;
>      ^
> 
> Caused by a mismerge between patch "Revert "serial/amba-pl011: Leave
> the TX IRQ alone when the UART is not open" (that appears in Linus' tree
> and the tty tree) and commit 1e84d22322ce ("serial/amba-pl011: Refactor
> and simplify TX FIFO handling") from the tty tree.
> 
> I applied this merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 May 2015 15:12:50 +1000
> Subject: [PATCH] serial/amba-pl011: fix mismerge
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Ack.  The revert should add those lines back in; then the "Refactor
and simplify" patch gets rid of them finally.

Cheers
---Dave

> ---
>  drivers/tty/serial/amba-pl011.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index 6fabc059efed..f5bd8426fd75 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -1578,9 +1578,6 @@ static int pl011_startup(struct uart_port *port)
>  
>  	writew(uap->vendor->ifls, uap->port.membase + UART011_IFLS);
>  
> -	/* Assume that TX IRQ doesn't work until we see one: */
> -	uap->tx_irq_seen = 0;
> -
>  	spin_lock_irq(&uap->port.lock);
>  
>  	/* restore RTS and DTR */
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
