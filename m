From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of driver-core tree
Date: Mon, 16 Jun 2008 20:14:19 -0700
Message-ID: <20080617031419.GA1088@kroah.com>
References: <20080616103906.35926c45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:59448 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752880AbYFQDTQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jun 2008 23:19:16 -0400
Content-Disposition: inline
In-Reply-To: <20080616103906.35926c45.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>, Mike Christie <michaelc@cs.wisc.edu>, Kay Sievers <kay.sievers@vrfy.org>

On Mon, Jun 16, 2008 at 10:39:06AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a context conflict
> in drivers/scsi/hosts.c between commit
> 3ed7897242b7efe977f3a8d06d4e5a4ebe28b10e ("[SCSI] scsi_host regression:
> fix scsi host leak") from the scsi-rc-fixes (presumably soon to be
> Linus') tree and commit d2523cff4094586032a5b0820ca86fbae6424dc0 ("Driver
> Core: add ability for class_find_device to start in middle of list") from
> the driver-core tree.
> 
> It is trivial and I fixed it up.

Great, thanks for doing this.

greg k-h
