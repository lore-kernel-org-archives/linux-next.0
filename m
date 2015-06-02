From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Tue, 02 Jun 2015 08:02:34 -0700
Message-ID: <1433257354.2251.6.camel@HansenPartnership.com>
References: <20150602180636.0f89c971@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:51190 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932337AbbFBPCg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2015 11:02:36 -0400
In-Reply-To: <20150602180636.0f89c971@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bart Van Assche <bart.vanassche@sandisk.com>, Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>

On Tue, 2015-06-02 at 18:06 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> After merging the scsi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/usb/gadget/function/f_mass_storage.c:280:12: error: 'MAX_COMMAND_SIZE' undeclared here (not in a function)
>   u8   cmnd[MAX_COMMAND_SIZE];
>             ^
> 
> Caused by commit 0e640c799103 ("Replace MAX_COMMAND_SIZE with BLK_MAX_CDB").
> 
> I have used the scsi tree from next-20150601 for today.

Hm, yes, the commit causes a dependency on blkdev.h but doesn't pull it
in.  I'll drop it for a resubmit.

James
