From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Tue, 03 Feb 2015 22:47:25 -0800
Message-ID: <1423032445.16386.1.camel@perches.com>
References: <20150204172925.728016bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0232.hostedemail.com ([216.40.44.232]:60924 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751542AbbBDGra (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 01:47:30 -0500
In-Reply-To: <20150204172925.728016bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>

(adding Christoph Hellwig)

On Wed, 2015-02-04 at 17:29 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> After merging the scsi tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/scsi/scsi_logging.c: In function 'sdev_prefix_printk':
> drivers/scsi/scsi_logging.c:119:6: error: void value not ignored as it ought to be
>   ret = dev_printk(level, &sdev->sdev_gendev, "%s", logbuf);
>       ^
> drivers/scsi/scsi_logging.c: In function 'scmd_printk':
> drivers/scsi/scsi_logging.c:146:6: error: void value not ignored as it ought to be
>   ret = dev_printk(level, &scmd->device->sdev_gendev, "%s", logbuf);
>       ^
> 
> Caused by commit ded85c193a39 ("scsi: Implement per-cpu logging
> buffer") interacting with commit d1f1052c5204 ("device: Change
> dev_<level> logging functions to return void") from the driver-core
> tree.
> 
> I added the following merge resolution patch.  Someone will have to
> remember to tell Linus.  Also, the void return may be able to be
> propagated further up the chain since these two new affected functions
> now always return 0.

Thanks and just so.

It seems that nothing uses either return value,
so it's probably better to use void for both
sdev_prefix_printk and scmd_printk.
