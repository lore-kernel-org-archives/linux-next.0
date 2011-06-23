From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: manual merge of the tmem tree with the xen-two tree
Date: Thu, 23 Jun 2011 09:58:35 -0700 (PDT)
Message-ID: <6ff0f0d5-534e-4403-80f7-edd228618049@default>
References: <20110622144611.a900a000.sfr@canb.auug.org.au
 20110622140642.GD5574@dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:64004 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759773Ab1FWQ6y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jun 2011 12:58:54 -0400
In-Reply-To: <20110622140642.GD5574@dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Wilk <konrad.wilk@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> From: Konrad Rzeszutek Wilk
> Subject: Re: linux-next: manual merge of the tmem tree with the xen-two tree
> 
> On Wed, Jun 22, 2011 at 02:46:11PM +1000, Stephen Rothwell wrote:
> > Hi Dan,
> >
> > Today's linux-next merge of the tmem tree got a conflict in
> > drivers/xen/Kconfig drivers/xen/tmem.c between commit afec6e04922d ("xen:
> > prepare tmem shim to handle frontswap") from the xen-two tree and commit
> > ac33c46b42ba ("xen: enable frontswap for Xen tmem") from the tmem tree.
> 
> Dan, can you please rebase your #linux-next branch on my #linux-next branch
> so that Stephen's awesome build engine can chug along for this?
> 
> Thanks!
> > I just used the xen-two versions of these files (as they look newer).
> 
> OK, we will sort this out.

Should hopefully all be fixed now.  (Konrad's version of the commit is
indeed the newer version so I have removed the older version from the
tmem tree.)

Thanks,
Dan
