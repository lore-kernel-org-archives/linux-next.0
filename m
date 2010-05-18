From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Tue, 18 May 2010 14:11:11 -0700
Message-ID: <20100518211111.GA27870@kroah.com>
References: <20100518174253.37e38d66.sfr@canb.auug.org.au>
 <Pine.LNX.4.44L0.1005180949560.1795-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1005180949560.1795-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, May 18, 2010 at 09:54:45AM -0400, Alan Stern wrote:
> On Tue, 18 May 2010, Stephen Rothwell wrote:
> 
> > Hi Greg,
> > 
> > After merging the usb tree, today's linux-next build (powerpc
> > ppc6xx_defconfig) failed like this:
> > 
> > drivers/usb/host/ehci-fsl.c:316: error: 'ehci' undeclared (first use in this function)
> > 
> > Caused by commit d19f8cd047971b43844d61d995be736dacb4826a ("USB: EHCI:
> > fix controller wakeup flag settings during suspend").
> 
> Here's a fix for the problem.  It's awfully easy to mess things up when 
> changing code for architectures you don't have.
> 
> Greg, can you merge this in with the original patch?

Thanks, now merged and pushed out.

greg k-h
