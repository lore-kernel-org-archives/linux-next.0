From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: staging tree build failure
Date: Wed, 9 Dec 2009 12:30:02 -0800
Message-ID: <20091209203002.GB8222@kroah.com>
References: <20091209165646.41b9ce8a.sfr@canb.auug.org.au>
 <Pine.LNX.4.44L0.0912091026210.4120-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757824AbZLIUkc@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0912091026210.4120-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 09, 2009 at 10:29:22AM -0500, Alan Stern wrote:
> On Wed, 9 Dec 2009, Stephen Rothwell wrote:
> 
> > Hi Greg,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/net/usb/kaweth.c: In function 'kaweth_open':
> > drivers/net/usb/kaweth.c:719: error: implicit declaration of function 'usb_autopm_enable'
> > 
> > Caused by commit b3f937e6ddf3e60ed9b4c26349b7b171dffdd010 ("USB: prepare
> > for changover to Runtime PM framework").
> > 
> > I have reverted that commit for today.
> 
> This should have been okay because of Oliver's patch:
> 
> 	http://marc.info/?l=linux-netdev&m=125071045301270&w=2
> 
> which removed the offending reference.  Hasn't it been merged yet?  
> It was submitted back in August.

Hm, I thought I saw this in David's network tree in linux-next, but
perhaps that was the wifi and one other patch, I didn't look for the
kaweth patch.

David, any ideas if the patch above was just dropped for some reason.
If it was just overlooked, I can take it through my tree, as I depend on
it to not break the build.

thanks,

greg k-h
