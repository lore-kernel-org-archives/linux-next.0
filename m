From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the pm tree
Date: Fri, 30 Sep 2016 07:44:41 +0200
Message-ID: <20160930054441.GC5458@kroah.com>
References: <20160930134223.4eb0767d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160930134223.4eb0767d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksey Makarov <aleksey.makarov@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 30, 2016 at 01:42:23PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   include/linux/acpi.h
> 
> between commit:
> 
>   058dfc767008 ("ACPI / watchdog: Add support for WDAT hardware watchdog")
> 
> from the pm tree and commit:
> 
>   ad1696f6f09d ("ACPI: parse SPCR and enable matching console")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks.

greg k-h
