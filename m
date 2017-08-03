From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Thu, 3 Aug 2017 10:28:10 +1000
Message-ID: <20170803102810.37f7c6b0@canb.auug.org.au>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
        <20170802235740.GB27974@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751172AbdHCA2N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Aug 2017 20:28:13 -0400
In-Reply-To: <20170802235740.GB27974@fury>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Linus <torvalds@linux-foundation.org>

Hi Darren,

On Wed, 2 Aug 2017 16:57:40 -0700 Darren Hart <dvhart@infradead.org> wrote:
>
> Is this a new check Stephen?

Yes :-)

> Is there any statement regarding maintainer teams that we must abide by
> this?  e.g. any time a rebase in a testing branch is made, the
> maintainer must also ensure a SOB is on each patch?

I would say that if you rebase someone's commit(s), then you are on the
"patch's delivery path" and so should add a Signed-off-by tag. (cc'ing
Linus to see if he has an opinion.  Linus, the case here is a patch
originally committed by one maintainer and then rebased by the other.)

> I just want to get a clear picture of what the failure was so we can
> update our tooling so this doesn't repeat itself.

"git rebase" does have a "--signoff" option.

-- 
Cheers,
Stephen Rothwell
