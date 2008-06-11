From: Alex Chiang <achiang@hp.com>
Subject: Re: linux-next: pci merge conflict
Date: Tue, 10 Jun 2008 21:38:29 -0600
Message-ID: <20080611033829.GC12778@ldl.fc.hp.com>
References: <20080611132338.f68e6cb1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0026.austin.hp.com ([15.216.28.33]:18791 "EHLO
	g1t0026.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755121AbYFKDib (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Jun 2008 23:38:31 -0400
Content-Disposition: inline
In-Reply-To: <20080611132338.f68e6cb1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>

* Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Jesse,
> 
> Today's linux-next merge of the pci tree got a conflict in
> drivers/pci/hotplug/fakephp.c between commit
> b9a4a152420e0158822ffb0cf0e57d36019604c7 ("driver-core: prepare for
> removal of 20 char limit from struct device") from the driver-core tree
> and commit fe99740cac117f208707488c03f3789cf4904957 ("PCI: construct one
> fakephp slot per PCI slot") from the pci tree.
> 
> I did what seemed to be the right thing - it seems that the driver-core
> patch to this file is no longer needed.  It is worth a check.

Yes, I mentioned the possibility of this conflict here:

	http://lkml.org/lkml/2008/6/10/382

And yes, dropping the driver-core hunk is the correct thing to
do.

Thanks Stephen!

/ac

