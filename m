From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the at91 tree
Date: Tue, 18 Sep 2018 09:30:21 +0200
Message-ID: <20180918073020.GB4067@kroah.com>
References: <20180918131238.2838bedd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180918131238.2838bedd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 18, 2018 at 01:12:38PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   5ae2f1f30197 ("MAINTAINERS: move former ATMEL entries to proper MICROCHIP locatioat91n")
> 
> from the at91 tree and commit:
> 
>   010de20412fc ("MAINTAINERS: Add entry for mcp3911 ADC driver")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me.

greg k-h
