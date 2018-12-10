From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
Date: Mon, 10 Dec 2018 11:02:57 +0200
Message-ID: <20181210090257.GY10650@smile.fi.intel.com>
References: <20181210161454.1c8ca97f@canb.auug.org.au>
 <9045374.omvoRxFOEf@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9045374.omvoRxFOEf@aspire.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 10, 2018 at 09:58:53AM +0100, Rafael J. Wysocki wrote:
> On Monday, December 10, 2018 6:14:54 AM CET Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the driver-core tree got a conflict in:
> > 
> >   drivers/base/platform.c
> > u
> > between commit:
> > 
> >   2d51ac9086fd ("driver core: platform: Remove duplicated device_remove_properties() call")
> > 
> > from the pm tree and commit:
> > 
> >   99fef587ff98 ("driver core: platform: Respect return code of platform_device_register_full()")
> > 
> > from the driver-core tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> The fix looks good to me, thank you!

Confirm, the result looks as it supposed to be.
Thanks!

-- 
With Best Regards,
Andy Shevchenko
