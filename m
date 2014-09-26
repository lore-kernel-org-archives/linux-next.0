From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Fri, 26 Sep 2014 10:36:33 +0200
Message-ID: <20140926083632.GA19463@lst.de>
References: <20140926183450.7474b448@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:58883 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753181AbaIZIgg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Sep 2014 04:36:36 -0400
Content-Disposition: inline
In-Reply-To: <20140926183450.7474b448@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>, Christoph Hellwig <hch@lst.de>, Xiong <wenxiong@linux.vnet.ibm.com>

On Fri, Sep 26, 2014 at 06:34:50PM +1000, Stephen Rothwell wrote:
> Hi James,
> 
> After merging the scsi tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/scsi/ipr.c: In function 'ipr_handle_log_data':
> drivers/scsi/ipr.c:2468:15: error: 'IPR_IOASC_HW_CMD_FAILED' undeclared (first use in this function)
>   if (ioasc == IPR_IOASC_HW_CMD_FAILED &&
>                ^
> 
> Caused by commit 3185ea63907c ("ipr: don't log error messages when
> applications issues illegal requests").  Someone typoed that name in
> ipr.h ...
> 
> I have reverted that commit for today.

Thanks.  The fix should be here:

http://git.infradead.org/users/hch/scsi-queue.git/commitdiff/d247a70a4d67623eb738176ee703a7bb8b6c325c
