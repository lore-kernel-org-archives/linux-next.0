From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 13 Jan 2017 14:42:12 +1100
Message-ID: <20170113144212.5d46dcc6@canb.auug.org.au>
References: <20170112144933.7f161c69@canb.auug.org.au>
        <8af7e322-9d1f-112e-3ab3-b8b310939d6f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40673 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750927AbdAMDmP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Jan 2017 22:42:15 -0500
In-Reply-To: <8af7e322-9d1f-112e-3ab3-b8b310939d6f@suse.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Ren <zren@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Eric,

On Thu, 12 Jan 2017 13:06:01 +0800 Eric Ren <zren@suse.com> wrote:
>
> Thanks for your report and the fix for it. The 0-day project has reported several days ago,
> but this patch set is still in discussion, so I am waiting for more days to see if  other 
> developers
> have any other questions.
> 
> I am confused that how to deal with your patch if I need to work out the V2 patch set. Perhaps,
> pick up your fix and  add your efforts in the change log?

If you had already fixed the problem, then just submit your new
version.  You only need to give credit when you use someone's work.

If you want to give credit, then maybe a line like:

[sfr@canb.auug.org.au remove some inlines]

among the Signed-off-by: lines
-- 
Cheers,
Stephen Rothwell
