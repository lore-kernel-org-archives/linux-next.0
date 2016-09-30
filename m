From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the v4l-dvb tree
Date: Fri, 30 Sep 2016 07:44:16 +0200
Message-ID: <20160930054416.GA5458@kroah.com>
References: <20160930133319.57ac11a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160930133319.57ac11a3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Songjun Wu <songjun.wu@microchip.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 30, 2016 at 01:33:19PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   71fb2c74287d ("[media] MAINTAINERS: atmel-isc: add entry for Atmel ISC")
> 
> from the v4l-dvb tree and commit:
> 
>   5615c3715749 ("MAINTAINERS: update entry for atmel_serial driver")
> 
> from the tty tree.

Ick, MAINTAINERS is a tough thing to merge at times, sorry, patch looks
fine to me.

greg k-h
