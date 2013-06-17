From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the renesas tree with the tty tree
Date: Mon, 17 Jun 2013 12:35:05 -0700
Message-ID: <20130617193505.GA20255@kroah.com>
References: <20130617171622.450bae1a5319f54004a18e2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130617171622.450bae1a5319f54004a18e2d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simon Horman <horms@verge.net.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jingchang Lu <b35083@freescale.com>, Ulrich Hecht <ulrich.hecht@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 17, 2013 at 05:16:22PM +1000, Stephen Rothwell wrote:
> Hi Simon,
> 
> Today's linux-next merge of the renesas tree got a conflict in
> include/uapi/linux/serial_core.h between commit c9e2e946fb0b ("tty:
> serial: add Freescale lpuart driver support") from the tty tree and
> commit 24610a30600b ("serial: sh-sci: HSCIF support") from the renesas
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/uapi/linux/serial_core.h
> index c8eaeb5,26eee07..0000000
> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@@ -226,7 -226,7 +226,10 @@@
>   /* Rocketport EXPRESS/INFINITY */
>   #define PORT_RP2	102
>   
>  +/* Freescale lpuart */
>  +#define PORT_LPUART	103
>  +
> + /* SH-SCI */
>  -#define PORT_HSCIF	103
> ++#define PORT_HSCIF	104

Looks correct to me, thanks.

greg k-h
