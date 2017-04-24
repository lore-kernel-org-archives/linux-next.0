From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 24 Apr 2017 09:39:08 +0100
Message-ID: <20170424083908.GW29622@ZenIV.linux.org.uk>
References: <20170424161130.762d71a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:36872 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166805AbdDXIjR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2017 04:39:17 -0400
Content-Disposition: inline
In-Reply-To: <20170424161130.762d71a8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Williams <dan.j.williams@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 24, 2017 at 04:11:30PM +1000, Stephen Rothwell wrote:
> Hi Dan,
> 
> After merging the nvdimm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/nvdimm/x86.c: In function 'pmem_from_user':
> drivers/nvdimm/x86.c:115:11: error: implicit declaration of function '__copy_from_user_nocache' [-Werror=implicit-function-declaration]
>   int rc = __copy_from_user_nocache(dst, src, size);
>            ^
> 
> Caused by commit
> 
>   6e704ff67315 ("uio, libnvdimm, pmem: implement cache bypass for all copy_from_iter() operations")
> 
> interacting with commit
> 
>   3f763453e6f2 ("kill __copy_from_user_nocache()")
> 
> from the vfs tree.
> 
> I have no idea why Al removed that function,

Because the entire nocache pile is messy and misguided and the fewer of
those we have, the easier it will be to untangle the damn thing.  This
particular turdlet had no users in mainline.  Unfortunately, it has
grown one in nvdimm, so we'll probably have to drop that removal for now
and hope that it won't be too painful to untangle come next cycle.

Oh, well...  Guess we'll need to resurrect memcpy_nocache() threads from
December and deal witht that mess for good.
