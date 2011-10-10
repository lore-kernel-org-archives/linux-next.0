From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH -next] usb gadget: fix langwell_udc.c build error
Date: Mon, 10 Oct 2011 10:16:45 -0700
Message-ID: <20111010171645.GA24628@kroah.com>
References: <20111007174230.702f4a0bf1fe71dab5e10961@canb.auug.org.au>
 <4E8F67C6.5020603@xenotime.net>
 <20111008100326.GA24633@legolas.emea.dhcp.ti.com>
 <4E91DF00.8060107@xenotime.net>
 <20111009223638.GA29776@legolas.emea.dhcp.ti.com>
 <4E9228CA.1060904@xenotime.net>
 <20111010050959.GA30935@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111010050959.GA30935@legolas.emea.dhcp.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Michal Nazarewicz <mina86@mina86.com>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 10, 2011 at 08:10:01AM +0300, Felipe Balbi wrote:
> Hi,
> 
> On Sun, Oct 09, 2011 at 04:05:46PM -0700, Randy Dunlap wrote:
> > On 10/09/11 15:36, Felipe Balbi wrote:
> > > git log --pretty=oneline -S'lpm_device_speed' HEAD --	\
> > > 	drivers/usb/gadget/langwell_udc.c
> > 
> > e538dfdae85244fd2c4231725d82cc1f1bc4942c usb: Provide usb_speed_string() function
> 
> Aha, now I know why, that went straight througth Greg.
> 
> Greg, can you pick this patch ? It's clearly needed. Meanwhile, I'll
> cherry-pick that commit from your tree and apply Randy's fix too.
> 
> Here's my ack for $SUBJECT:
> 
> Acked-by: Felipe Balbi <balbi@ti.com>

Um, pick what patch?

Randy, care to resend it to me with Felipe's ack?

thanks,

greg k-h
