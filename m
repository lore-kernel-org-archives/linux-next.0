From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Tue, 2 Dec 2014 10:12:30 -0800
Message-ID: <20141202181230.GD11700@kroah.com>
References: <20141201191923.6366f9b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141201191923.6366f9b5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Dec 01, 2014 at 07:19:23PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/mach-omap2/twl-common.c:94:21: error: array type has incomplete element type
>  struct phy_consumer consumers[] = {
>                      ^
> 
> Caused by commit dbc98635e0d4 ("phy: remove the old lookup method").
> 
> I have used the usb tree from next-20141128 for today.

Ick, Heikki and Kishon, do you want me to just revert this patch?  How
did you test it?

greg k-h
