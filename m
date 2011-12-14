From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 14 Dec 2011 09:01:44 -0800
Message-ID: <20111214170144.GA6933@kroah.com>
References: <20111214154844.3ad4e1d685c7987cba0820a0@canb.auug.org.au>
 <1323854697.28489.7.camel@twins>
 <20111214150359.GA840@kroah.com>
 <1323875585.28489.48.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:55867 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752045Ab1LNRCL (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Dec 2011 12:02:11 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id DD7D9206F8
	for <linux-next@vger.kernel.org>; Wed, 14 Dec 2011 12:02:07 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1323875585.28489.48.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Dec 14, 2011 at 04:13:05PM +0100, Peter Zijlstra wrote:
> On Wed, 2011-12-14 at 07:03 -0800, Greg KH wrote:
> 
> > I'll remove the use of kfree in the WARN_ON(), which should solve this
> > problem.
> 
> The alternative is that we introduce something like CONFIG_KREF_DEBUG
> and out-of-line the functions in that case while also adding more debug
> checks. Alexey recently proposed a refcnt.h thing that almost does what
> kref does but has different debug checks.

That might be nice to have, but the kfree check was there to catch
people who were trying to be "tricky", and they will not be running with
that debug option enabled.

I'll just remove it, and rely on the documentation and public
humiliation instead of kernel warnings to try to enforce this rule.
It's worked pretty good so far with the kobject rules :)

thanks,

greg k-h
