From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 19 May 2017 15:09:31 -0700
Message-ID: <20170519220931.GA24990@fury>
References: <20170519132317.5dc47b24@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43900 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751704AbdESWJe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 May 2017 18:09:34 -0400
Content-Disposition: inline
In-Reply-To: <20170519132317.5dc47b24@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ritesh Raj Sarraf <rrs@debian.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Fri, May 19, 2017 at 01:23:17PM +1000, Stephen Rothwell wrote:
> Hi Darren,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/platform/x86/ideapad-laptop.c:438:16: warning: 'touchpad_store' defined but not used [-Wunused-function]
>  static ssize_t touchpad_store(struct device *dev,
>                 ^
> 
> Introduced by commit
> 
>   7f363145992c ("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")

Thank you Stephen,

Andy, you warned me about this and I had forgotten before I included it in next.

Would you like to drop this change, or drop the touchpad_store function?

-- 
Darren Hart
VMware Open Source Technology Center
