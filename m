From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Thu, 7 Jul 2011 06:44:21 -0700
Message-ID: <20110707134421.GE26939@kroah.com>
References: <20110707162554.c069e5c60e103804a99d27b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110707162554.c069e5c60e103804a99d27b1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 07, 2011 at 04:25:54PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from drivers/staging/ft1000/ft1000-pcmcia/ft1000_proc.c:26:0:
> drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_read_reg':
> drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:80:2: error: implicit declaration of function 'inw'
> drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_write_reg':
> drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:86:2: error: implicit declaration of function 'outw'
> 
> Caused by commit 8ac299853b70 ("staging: ft1000-pcmcia: get rid of
> ft1000_dev.h") which I can;t revert (it is too deeply buried).  I have
> just left the breakage for today - hopefully it will be fixed before I
> have to worry about it again. :-)

Ick, Ondrej, can you look into this and resolve it please?

Do we really have PPC support for PCMCIA these days?

thanks,

greg k-h
