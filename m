From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 7 Feb 2017 15:15:08 -0800
Message-ID: <20170207151508.cb70495ca166c06e21f9cfd4@linux-foundation.org>
References: <20170208100803.37cbed40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:36914 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754394AbdBGXPK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Feb 2017 18:15:10 -0500
In-Reply-To: <20170208100803.37cbed40@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>, Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, Hillf Danton <hillf.zj@alibaba-inc.com>

On Wed, 8 Feb 2017 10:08:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> allnoconfig, bfin (most, if not all, configs) and many others) failed
> like this:
> 
> mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
> mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'
> mm/nommu.c:1638:1: error: conflicting types for 'do_munmap'
> ipc/shm.c:1368:3: error: too few arguments to function 'do_munmap'
> 
> Caused by commit
> 
>   24424bfbce7e ("userfaultfd: non-cooperative: add event for memory unmaps")
> 
> This forgot to update the mm/nommu.c versions of these functions :-(
> 
> Sorry for not reporting this earlier.
> 
> I have no idea what to do about this as this patch is deep within the mm
> changes and so almost certainly will not revert cleanly (and dropping
> this patch will presumably have flow on effects to the reset of the
> mm patches).

That patch has a string of fixes and I think we have that fixed up. 
I'll be doing another mmotm in a few minutes...
