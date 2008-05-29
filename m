From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: pci/driver-core merge conflicts
Date: Wed, 28 May 2008 19:59:57 -0700
Message-ID: <20080529025957.GA13909@kroah.com>
References: <20080529121847.fcc81e2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:46103 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751677AbYE2DHR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 May 2008 23:07:17 -0400
Content-Disposition: inline
In-Reply-To: <20080529121847.fcc81e2f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Thu, May 29, 2008 at 12:18:47PM +1000, Stephen Rothwell wrote:
> Hi Jesse, Greg,
> 
> Today's linux-next merge of the pci tree got a trivial conflict in
> drivers/base/power/main.c between commit
> bd24b944eb93549b1ca5becbf27c7373504f7eed ("driver-core: prepare for
> removal of 20 char limit from struct device") from the driver-core tree
> and commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top
> level suspend and hibernation callbacks") from the pci tree.  I took the
> latter version except to use "dev_name(dev->parent)" instead of
> "dev->parent->bus_id".

Yes, that is correct.

> The second conflict was in include/linux/device.h between commit
> 9c77d9cc76e424a3c59822c405cbf75a45465170 ("class: move driver core
> specific parts to a private structure") from the driver-core tree and
> commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top level
> suspend and hibernation callbacks") from the pci tree.  I just added both
> new fields of struct class.

That should be fine.

thanks,

greg k-h
