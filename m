From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the s390 tree
Date: Mon, 23 Jun 2008 21:27:32 -0700
Message-ID: <20080624042732.GA32107@kroah.com>
References: <20080624134546.c8ac496d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:42493 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960AbYFXE3k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Jun 2008 00:29:40 -0400
Content-Disposition: inline
In-Reply-To: <20080624134546.c8ac496d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Tue, Jun 24, 2008 at 01:45:46PM +1000, Stephen Rothwell wrote:
> Hi Martin, Greg,
> 
> Today's linux-next merge of the s390 tree got a conflict in
> drivers/s390/cio/qdio.c between commit
> 4836b98e1d4c0b5e86ce4e071321367cf28885c4 ("s390: bus_id -> dev_name
> conversions") from the driver-core tree and commit
> bc3817177fc931f0ade32808e4cb61be2f0999fb ("[S390] qdio: Repair timeout
> handling for qdio_shutdown") from the s390 tree.
> 
> It is a simple near overlap of changes, and I fixed it up.  I can carry
> the fixup.

Great, thanks for doing this.

greg k-h
