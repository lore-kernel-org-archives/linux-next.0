From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Wed, 23 Aug 2017 08:39:51 +0200
Message-ID: <0c99fb26-f741-2377-930e-f192e39d855c@suse.cz>
References: <20170822165719.112d9186@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45017 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752291AbdHWGjx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Aug 2017 02:39:53 -0400
In-Reply-To: <20170822165719.112d9186@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Waiman Long <longman@redhat.com>

On 08/22/2017 08:57 AM, Stephen Rothwell wrote:
> Hi Andrew,

Hi,

> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   init/main.c
> 
> between commit:
> 
>   caba4cbbd27d ("debugobjects: Make kmemleak ignore debug objects")
> 
> from the tip tree and commit:
> 
>   50a7dc046b58 ("mm, page_ext: move page_ext_init() after page_alloc_init_late()")

This patch can be also dropped from mmotm. It was a RFC and review
suggested a different approach which I didn't get to try yet. (The other
patches in the series should be fine to stay in any case).

> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
