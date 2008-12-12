From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: staging tree build failure
Date: Fri, 12 Dec 2008 10:55:26 -0800
Message-ID: <20081212185526.GA25992@kroah.com>
References: <20081208204303.3c99dfa4.sfr@canb.auug.org.au> <20081211193739.57277b63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:37844 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752992AbYLLTiI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Dec 2008 14:38:08 -0500
Content-Disposition: inline
In-Reply-To: <20081211193739.57277b63.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Thu, Dec 11, 2008 at 07:37:39PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 8 Dec 2008 20:43:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/staging/agnx/xmit.c: In function 'fill_agnx_hdr':
> > drivers/staging/agnx/xmit.c:629: error: 'struct <anonymous>' has no member named 'retry_limit'
> > drivers/staging/agnx/xmit.c:630: error: 'struct <anonymous>' has no member named 'retry_limit'
> 	.
> 	.
> 	.
> > 
> > Commit "STAGING: Move staging drivers back to staging-specific menu"
> > allowed them to build in the allmodconfig again.  I have dropped the
> > staging tree for today.
> 
> This failure is still happening.

Ick, sorry about that, this should now be fixed.

thanks,

greg k-h
