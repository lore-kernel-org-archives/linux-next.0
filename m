From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: manual merge of the tmem tree with the xen-two tree
Date: Wed, 22 Jun 2011 10:06:42 -0400
Message-ID: <20110622140642.GD5574@dumpdata.com>
References: <20110622144611.a900a000.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:34518 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932196Ab1FVOHA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2011 10:07:00 -0400
Content-Disposition: inline
In-Reply-To: <20110622144611.a900a000.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Magenheimer <dan.magenheimer@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 22, 2011 at 02:46:11PM +1000, Stephen Rothwell wrote:
> Hi Dan,
> 
> Today's linux-next merge of the tmem tree got a conflict in
> drivers/xen/Kconfig drivers/xen/tmem.c between commit afec6e04922d ("xen:
> prepare tmem shim to handle frontswap") from the xen-two tree and commit
> ac33c46b42ba ("xen: enable frontswap for Xen tmem") from the tmem tree.
> 

Dan, can you please rebase your #linux-next branch on my #linux-next branch
so that Stephen's awesome build engine can chug along for this?

Thanks!
> I just used the xen-two versions of these files (as they look newer).

OK, we will sort this out.
