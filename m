From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci/driver-core merge conflicts
Date: Thu, 29 May 2008 08:57:16 -0700
Message-ID: <200805290857.16581.jbarnes@virtuousgeek.org>
References: <20080529121847.fcc81e2f.sfr@canb.auug.org.au> <20080529025957.GA13909@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-05.bluehost.com ([69.89.21.15]:56451 "HELO
	outbound-mail-05.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753236AbYE2P5b (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 11:57:31 -0400
In-Reply-To: <20080529025957.GA13909@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Wednesday, May 28, 2008 7:59 pm Greg KH wrote:
> On Thu, May 29, 2008 at 12:18:47PM +1000, Stephen Rothwell wrote:
> > Hi Jesse, Greg,
> >
> > Today's linux-next merge of the pci tree got a trivial conflict in
> > drivers/base/power/main.c between commit
> > bd24b944eb93549b1ca5becbf27c7373504f7eed ("driver-core: prepare for
> > removal of 20 char limit from struct device") from the driver-core tree
> > and commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top
> > level suspend and hibernation callbacks") from the pci tree.  I took the
> > latter version except to use "dev_name(dev->parent)" instead of
> > "dev->parent->bus_id".
>
> Yes, that is correct.
>
> > The second conflict was in include/linux/device.h between commit
> > 9c77d9cc76e424a3c59822c405cbf75a45465170 ("class: move driver core
> > specific parts to a private structure") from the driver-core tree and
> > commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top level
> > suspend and hibernation callbacks") from the pci tree.  I just added both
> > new fields of struct class.
>
> That should be fine.

Hm, I knew this would cause problems eventually. :)  Should I put these fixups 
in my tree?  Or can you track them somehow, Stephen?

Thanks,
Jesse
