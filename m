From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the net tree
Date: Wed, 29 Jul 2009 07:17:50 -0700
Message-ID: <20090729141750.GA28973@kroah.com>
References: <20090729165211.c13f3ca3.sfr@canb.auug.org.au>
 <20090729124406.GA26931@kroah.com>
 <20090729.064659.193718905.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:37873 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752039AbZG2OTg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jul 2009 10:19:36 -0400
Content-Disposition: inline
In-Reply-To: <20090729.064659.193718905.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kaber@trash.net

On Wed, Jul 29, 2009 at 06:46:59AM -0700, David Miller wrote:
> From: Greg KH <greg@kroah.com>
> Date: Wed, 29 Jul 2009 05:44:06 -0700
> 
> > On Wed, Jul 29, 2009 at 04:52:11PM +1000, Stephen Rothwell wrote:
> >> Hi Greg,
> >> 
> >> Today's linux-next merge of the staging tree got a conflict in
> >> drivers/staging/epl/VirtualEthernetLinux.c between commit
> >> 6ed106549d17474ca17a16057f4c0ed4eba5a7ca ("net: use NETDEV_TX_OK instead
> >> of 0 in ndo_start_xmit() functions") from the net tree and commit
> >> 49acb975a21d150c4beba4e581f3e1d004dd2867 ("Staging: remove epl driver")
> >> from the staging tree.
> >> 
> >> The latter just removes the file, so I did that.
> > 
> > Thanks a lot.  Yes, the epl driver has been dropped from staging, so
> > that's the right thing to do.
> 
> Please make sure you integrate that change, if the driver is
> simply moving out of staging to somewhere else.

Nope, the driver is getting dropped into the bin, it's not maintained
upstream, no one cares about it, and is a total and complete mess.

thanks,

greg k-h
