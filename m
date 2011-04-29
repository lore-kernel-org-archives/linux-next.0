From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for April 28 (staging/wlan-ng: prism2)
Date: Thu, 28 Apr 2011 19:15:36 -0700
Message-ID: <20110429021536.GB22138@suse.de>
References: <20110428152534.7240a49c.sfr@canb.auug.org.au>
 <20110428092917.039071a4.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110428092917.039071a4.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 28, 2011 at 09:29:17AM -0700, Randy Dunlap wrote:
> On Thu, 28 Apr 2011 15:25:34 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> 
> 
> drivers/staging/wlan-ng/prism2fw.c:1115: warning: the frame size of 4288 bytes is larger than 2048 bytes
> 
> Noooooo.

Heh.  What caused this?  I don't remember changing anything here
recently.

thanks,

greg k-h
