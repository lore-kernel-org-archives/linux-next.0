From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 23 Aug 2011 21:50:23 -0700
Message-ID: <20110824045023.GB1122@kroah.com>
References: <20110824143354.d32c86b5143631442aca3700@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110824143354.d32c86b5143631442aca3700@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 24, 2011 at 02:33:54PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/built-in.o: In function `dw8250_handle_irq':
> 8250_dw.c:(.text+0xcad9c): undefined reference to `serial8250_handle_irq'
> 
> CONFIG_SERIAL_8250 is 'm' and CONFIG_SERIAL_8250_DW is 'y' ...
> 
> Caused by commit 6b1a98d1c485 ("tty: serial8250: add helpers for the
> DesignWare 8250").
> 
> I have used the ttye tree form next-20110823 for today.

Ick.

Jamie, can you please send me a patch that fixes this up?

thanks,

greg k-h
