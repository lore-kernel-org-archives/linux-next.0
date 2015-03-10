From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 10 Mar 2015 21:23:22 +0530
Message-ID: <20150310155322.GA13969@sudip-PC>
References: <20150310160728.7213b9fa@canb.auug.org.au>
 <20150310150815.GA28071@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:41992 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752834AbbCJPxf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2015 11:53:35 -0400
Content-Disposition: inline
In-Reply-To: <20150310150815.GA28071@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 10, 2015 at 04:08:15PM +0100, Greg KH wrote:
> On Tue, Mar 10, 2015 at 04:07:28PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > After merging the staging tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > In file included from include/linux/module.h:17:0,
> >                  from drivers/staging/sm750fb/sm750.c:2:
> > drivers/staging/sm750fb/sm750.c: In function '__check_g_option':
> > drivers/staging/sm750fb/sm750.c:1436:14: error: 'g_option' undeclared (first use in this function)
> >  module_param(g_option,charp,S_IRUGO);
<snip>
> > to enable it again.
> 
> Sorry about that.  Yes, I know it's a mess.  The build error on ppc
> should now be fixed in my tree.  The build warnings are still there
> (some are gone).  I should just go fix them up myself, and will do so
> tonight if I don't get a patch from someone else that does so first...
> 
> So it should be safe to enable again.
i am so sorry for the mess. I thought patchset to fix the build failures will buy me some time to fix the other warnings.
I am sending another series to fix the remainig warnings.

reagrds
sudip

> 
> thanks,
> 
> greg k-h
