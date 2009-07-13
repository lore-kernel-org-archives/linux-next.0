From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build warning
Date: Mon, 13 Jul 2009 10:18:02 -0700
Message-ID: <20090713171802.GB22728@kroah.com>
References: <20090713172646.55b9acee.sfr@canb.auug.org.au>
 <20090713172831.8875ac2c.sfr@canb.auug.org.au>
 <20090713175106.d2efbd60.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756679AbZGMRXc@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090713175106.d2efbd60.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Brownell <dbrownell@users.sourceforge.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jul 13, 2009 at 05:51:06PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 13 Jul 2009 17:28:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 13 Jul 2009 17:26:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next build (x86_64 allmodconfig) produced this warning:
> > > 
> > > drivers/firewire/core-device.c: In function 'init_fw_attribute_group':
> > > drivers/firewire/core-device.c:315: warning: assignment from incompatible pointer type
> > > 
> > > Introduced by commit 025a6a26b70e5dc12ab9333ea43d70c735f459ac ("driver
> > > model: constify attribute groups").
> > 
> > Also:
> > 
> > drivers/mtd/mtdcore.c:227: warning: initialization from incompatible pointer type
> 
> And from a PowerPC allyesconfig build:
> 
> drivers/block/cciss.c:582: warning: initialization from incompatible pointer type

David, care to send patches fixing these warnings?

thanks,

greg k-h
