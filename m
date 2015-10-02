From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Sep 18 (build failures, up to 10/02)
Date: Fri, 2 Oct 2015 09:16:37 -0700
Message-ID: <20151002161637.GA17786@roeck-us.net>
References: <20150918140810.6345bce9@canb.auug.org.au>
 <20150918142204.GA17018@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54057 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751781AbbJBQQj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2015 12:16:39 -0400
Content-Disposition: inline
In-Reply-To: <20150918142204.GA17018@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Zhang <zjzhang@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, Matt Fleming <matt.fleming@intel.com>, Ingo Molnar <mingo@kernel.org>

On Fri, Sep 18, 2015 at 07:22:04AM -0700, Guenter Roeck wrote:
> On Fri, Sep 18, 2015 at 02:08:10PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20150917:
> > 
> > I used the h8300 tree from next-20150828 since the current tree has been
> > rebased onto something very old :-(
> > 
> > The bluetooth tree still had its build failure.
> > 
> > The tip tree gained a conflict against Linus' tree.
> > 
> > The akpm-current tree lost its build failure.
> > 
> > Non-merge commits (relative to Linus' tree): 1938
> >  1581 files changed, 83940 insertions(+), 23948 deletions(-)
> > 
> 
> Build failures:
> 
> ia64:defconfig
> ia64:allnoconfig
> 
> drivers/built-in.o: In function `efi_mem_attributes':
> (.text+0xde962): undefined reference to `memmap'
> drivers/built-in.o: In function `efi_mem_attributes':
> (.text+0xde971): undefined reference to `memmap'
> 
> Bisect points to 'efi, x86: Rearrange efi_mem_attributes()'.
> On a side note, 'memmap' is really a bad name for a global variable,
> As the patch description suggests, the variable does not exist for ia64,
> so the build failure is not entirely unexpected.
> 
The build for ia64 still fails in next-20151002. Maybe it is time 
to revert the offending commit ? After all, the commit was supposed
to _fix_ a problem associated with ia64, not to make it completely
non-buildable.

Guenter
