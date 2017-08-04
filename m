From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Thu, 3 Aug 2017 18:02:03 -0700
Message-ID: <20170804010203.GA30746@kroah.com>
References: <20170802142628.6b39c31d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170802142628.6b39c31d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 02, 2017 at 02:26:28PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/8250/8250_core.c
> 
> between commit:
> 
>   9527b82ae3af ("Revert "serial: Delete dead code for CIR serial ports"")
> 
> from the tty.current tree and commit:
> 
>   c7ac15ce8924 ("serial: core: move UPF_NO_TXEN_TEST to quirks and rename")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/tty/serial/8250/8250_core.c
> index 1aab3010fbfa,3db9d6e19660..000000000000
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@@ -1043,24 -1043,14 +1043,25 @@@ int serial8250_register_8250_port(struc
>   		if (up->dl_write)
>   			uart->dl_write = up->dl_write;
>   
>  -		if (serial8250_isa_config != NULL)
>  -			serial8250_isa_config(0, &uart->port,
>  -					&uart->capabilities);
>  +		if (uart->port.type != PORT_8250_CIR) {
>  +			if (serial8250_isa_config != NULL)
>  +				serial8250_isa_config(0, &uart->port,
>  +						&uart->capabilities);
>  +
> ++			serial8250_apply_quirks(uart);
>  +			ret = uart_add_one_port(&serial8250_reg,
>  +						&uart->port);
>  +			if (ret == 0)
>  +				ret = uart->port.line;
>  +		} else {
>  +			dev_info(uart->port.dev,
>  +				"skipping CIR port at 0x%lx / 0x%llx, IRQ %d\n",
>  +				uart->port.iobase,
>  +				(unsigned long long)uart->port.mapbase,
>  +				uart->port.irq);
>   
>  -		serial8250_apply_quirks(uart);
>  -		ret = uart_add_one_port(&serial8250_reg, &uart->port);
>  -		if (ret == 0)
>  -			ret = uart->port.line;
>  +			ret = 0;
>  +		}
>   	}
>   	mutex_unlock(&serial_mutex);
>   

Looks good, thanks!

greg k-h
