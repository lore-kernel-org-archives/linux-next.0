From: Andres Salomon <dilinger@queued.net>
Subject: Re: linux-next: Tree for October 1 (staging/olpc_dcon)
Date: Fri, 1 Oct 2010 19:24:54 -0700
Message-ID: <20101001192454.0a427cb0@debxo>
References: <20101001153756.47b52566.sfr@canb.auug.org.au>
	<20101001154531.997630a2.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101001154531.997630a2.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Chris Ball <cjb@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, 1 Oct 2010 15:45:31 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On Fri, 1 Oct 2010 15:37:56 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20100930:
> 
> 
> drivers/staging/olpc_dcon/olpc_dcon_xo_1.c:57: error: implicit
> declaration of function 'geode_gpio_event_irq'
> drivers/staging/olpc_dcon/olpc_dcon_xo_1.c:57: error: implicit
> declaration of function 'geode_gpio'

Yep, it's pending a cs5535-gpio patch
(https://patchwork.kernel.org/patch/209482/).
