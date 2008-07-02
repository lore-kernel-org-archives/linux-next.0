From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 15:21:24 +1000
Message-ID: <20080702152124.56862a10.sfr@canb.auug.org.au>
References: <20080702151916.9719a473.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40866 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752799AbYGBFV0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jul 2008 01:21:26 -0400
In-Reply-To: <20080702151916.9719a473.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>

[Sorry Jesper, not reaaly meant for you :-)]

On Wed, 2 Jul 2008 15:19:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Alan,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> drivers/serial/sunhv.c: In function `receive_chars':
> drivers/serial/sunhv.c:188: error: structure has no member named `tty'
> drivers/serial/sunsu.c: In function `receive_chars':
> drivers/serial/sunsu.c:314: error: structure has no member named `tty'
> drivers/serial/sunsab.c: In function `receive_chars':
> drivers/serial/sunsab.c:121: error: structure has no member named `tty'
> 
> I applied the following patch (which, again, may not be correct).
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From 64954736b8e00870d991549f46b5d64d51de1280 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 2 Jul 2008 15:12:18 +1000
> Subject: [PATCH] ttydev: sparc fix for tty move
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/serial/sunhv.c  |    2 +-
>  drivers/serial/sunsab.c |    2 +-
>  drivers/serial/sunsu.c  |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/serial/sunhv.c b/drivers/serial/sunhv.c
> index 2847336..aeeec55 100644
> --- a/drivers/serial/sunhv.c
> +++ b/drivers/serial/sunhv.c
> @@ -185,7 +185,7 @@ static struct tty_struct *receive_chars(struct uart_port *port)
>  	struct tty_struct *tty = NULL;
>  
>  	if (port->info != NULL)		/* Unopened serial console */
> -		tty = port->info->tty;
> +		tty = port->info->port.tty;
>  
>  	if (sunhv_ops->receive_chars(port, tty))
>  		sun_do_break();
> diff --git a/drivers/serial/sunsab.c b/drivers/serial/sunsab.c
> index 9ff5b38..15ee497 100644
> --- a/drivers/serial/sunsab.c
> +++ b/drivers/serial/sunsab.c
> @@ -118,7 +118,7 @@ receive_chars(struct uart_sunsab_port *up,
>  	int i;
>  
>  	if (up->port.info != NULL)		/* Unopened serial console */
> -		tty = up->port.info->tty;
> +		tty = up->port.info->port.tty;
>  
>  	/* Read number of BYTES (Character + Status) available. */
>  	if (stat->sreg.isr0 & SAB82532_ISR0_RPF) {
> diff --git a/drivers/serial/sunsu.c b/drivers/serial/sunsu.c
> index 1074e73..e24e682 100644
> --- a/drivers/serial/sunsu.c
> +++ b/drivers/serial/sunsu.c
> @@ -311,7 +311,7 @@ static void sunsu_enable_ms(struct uart_port *port)
>  static struct tty_struct *
>  receive_chars(struct uart_sunsu_port *up, unsigned char *status)
>  {
> -	struct tty_struct *tty = up->port.info->tty;
> +	struct tty_struct *tty = up->port.info->port.tty;
>  	unsigned char ch, flag;
>  	int max_count = 256;
>  	int saw_console_brk = 0;
> -- 
> 1.5.6

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
