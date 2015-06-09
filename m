From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the mips tree
Date: Tue, 9 Jun 2015 14:10:14 -0700
Message-ID: <20150609211014.GA16485@kroah.com>
References: <20150609205953.4ecde1ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150609205953.4ecde1ce@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 09, 2015 at 08:59:53PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got conflicts in
> drivers/tty/serial/8250/Kconfig and drivers/tty/serial/8250/Makefile
> between commit d4a7bd1c0e5e ("serial: 8250_ingenic: support for Ingenic
> SoC UARTs") from the mips tree and commit 1a8d2903cb6a ("serial:
> 8250_uniphier: add UniPhier serial driver") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/tty/serial/8250/Kconfig
> index 43330ea95cfd,a74a8e4717d4..000000000000
> --- a/drivers/tty/serial/8250/Kconfig
> +++ b/drivers/tty/serial/8250/Kconfig
> @@@ -343,11 -351,9 +351,18 @@@ config SERIAL_8250_MT657
>   	  If you have a Mediatek based board and want to use the
>   	  serial port, say Y to this option. If unsure, say N.
>   
>  +config SERIAL_8250_INGENIC
>  +	bool "Support for Ingenic SoC serial ports"
>  +	depends on SERIAL_8250_CONSOLE && OF_FLATTREE
>  +	select LIBFDT
>  +	select SERIAL_EARLYCON
>  +	help
>  +	  If you have a system using an Ingenic SoC and wish to make use of
>  +	  its UARTs, say Y to this option. If unsure, say N.
> ++
> + config SERIAL_8250_UNIPHIER
> + 	tristate "Support for UniPhier on-chip UART"
> + 	depends on SERIAL_8250 && ARCH_UNIPHIER
> + 	help
> + 	  If you have a UniPhier based board and want to use the on-chip
> + 	  serial ports, say Y to this option. If unsure, say N.
> diff --cc drivers/tty/serial/8250/Makefile
> index 98fba26e194a,6fa22ffad63d..000000000000
> --- a/drivers/tty/serial/8250/Makefile
> +++ b/drivers/tty/serial/8250/Makefile
> @@@ -22,7 -22,6 +22,9 @@@ obj-$(CONFIG_SERIAL_8250_DW)		+= 8250_d
>   obj-$(CONFIG_SERIAL_8250_EM)		+= 8250_em.o
>   obj-$(CONFIG_SERIAL_8250_OMAP)		+= 8250_omap.o
>   obj-$(CONFIG_SERIAL_8250_FINTEK)	+= 8250_fintek.o
> + obj-$(CONFIG_SERIAL_8250_LPC18XX)	+= 8250_lpc18xx.o
>   obj-$(CONFIG_SERIAL_8250_MT6577)	+= 8250_mtk.o
>  +obj-$(CONFIG_SERIAL_8250_INGENIC)	+= 8250_ingenic.o
>  +
>  +CFLAGS_8250_ingenic.o += -I$(srctree)/scripts/dtc/libfdt
> + obj-$(CONFIG_SERIAL_8250_UNIPHIER)	+= 8250_uniphier.o



Fix looks good, thanks for this.

greg k-h
