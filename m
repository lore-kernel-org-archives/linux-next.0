From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 30 Jul 2015 08:19:51 +0200
Message-ID: <20150730061951.GA29312@lst.de>
References: <20150730141713.001bf7d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:49298 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752856AbbG3GTy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jul 2015 02:19:54 -0400
Content-Disposition: inline
In-Reply-To: <20150730141713.001bf7d6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>

On Thu, Jul 30, 2015 at 02:17:13PM +1000, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:

Can you please drop staging and especially lustre from these runs?
Conditions of the staging tree are they don't need to update.  Nevermind that
it never should have grown something as big and stale as lustre without
any prospects of being merged.
