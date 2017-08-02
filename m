From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Wed, 2 Aug 2017 16:57:40 -0700
Message-ID: <20170802235740.GB27974@fury>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:37338 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751073AbdHBX5o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2017 19:57:44 -0400
Content-Disposition: inline
In-Reply-To: <20170803063743.1d50a5d2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Thu, Aug 03, 2017 at 06:37:43AM +1000, Stephen Rothwell wrote:
> Hi Darren,
> 
> Commits
> 
>   890f658c101d ("platform/x86: peaq-wmi: silence a static checker warning")
>   6d8d55626296 ("platform/x86: msi-wmi: remove unnecessary static in msi_wmi_notify()")
>   cd0223c64c60 ("platform/x86: ibm_rtl: remove unnecessary static in ibm_rtl_write()")
> 
> are missing Signed-off-by's from their commiter.

So each of these was originally committed by Andy... but appear as
committed by me. This must have occured as a rebase of our testing
branch I suppose. Nothing has been out of the ordinary this development
cycle, so I wonder that we haven't received such a report previously.
Hrm.

Is this a new check Stephen?

Is there any statement regarding maintainer teams that we must abide by
this?  e.g. any time a rebase in a testing branch is made, the
maintainer must also ensure a SOB is on each patch?

I just want to get a clear picture of what the failure was so we can
update our tooling so this doesn't repeat itself.

-- 
Darren Hart
VMware Open Source Technology Center
