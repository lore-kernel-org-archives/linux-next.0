From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: build warning in Linus' tree
Date: Mon, 16 Apr 2012 21:45:03 -0400
Message-ID: <20120417014503.GA1151@phenom.dumpdata.com>
References: <20120417104430.d1844b17e4c7d5ffb132f816@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:25897 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754624Ab2DQBuK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 21:50:10 -0400
Content-Disposition: inline
In-Reply-To: <20120417104430.d1844b17e4c7d5ffb132f816@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 17, 2012 at 10:44:30AM +1000, Stephen Rothwell wrote:
> Hi Konrad,
> 
> Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/block/xen-blkback/xenbus.c: In function 'xen_blkbk_discard':
> drivers/block/xen-blkback/xenbus.c:419:4: warning: passing argument 1 of 'dev_warn' makes pointer from integer without a cast [enabled by default]
> include/linux/device.h:894:5: note: expected 'const struct device *' but argument is of type 'long int'
> 
> Introduced by commit 3389bb8bf761 ("xen/blkback: Make optional features
> be really optional").  Passing "dev-dev" to dev_warn() was hopefully not
> intended ...

No it was not. Not even sure how that mistake passed my compile test.

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
