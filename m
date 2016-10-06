From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 percpu tree
Date: Thu, 6 Oct 2016 13:46:36 +1100
Message-ID: <20161006134636.7505d76e@canb.auug.org.au>
References: <20161006134357.06fe5655@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51445 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750868AbcJFC4T (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Oct 2016 22:56:19 -0400
In-Reply-To: <20161006134357.06fe5655@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, zijun_hu <zijun_hu@htc.com>

Hi all,

On Thu, 6 Oct 2016 13:43:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/percpu.c
> 
> between commits:
> 
>   93c76b6b2faa ("mm/percpu.c: correct max_distance calculation for pcpu_embed_first_chunk()")
>   9b7396624a7b ("mm/percpu.c: fix potential memory leakage for pcpu_embed_first_chunk()")
> 
> from the percpu tree and commit:
> 
>   567f646230a5 ("mm/percpu.c: correct max_distance calculation for pcpu_embed_first_chunk()")
> 
> from the akpm-current tree.
> 
> There is one small differenve between 567f646230a5 and 9b7396624a7b and
> then further changes in 93c76b6b2faa.

Cut an paste error.  Should have said:

There is one small difference between 567f646230a5 and 93c76b6b2faa and
then further changes in 9b7396624a7b.

-- 
Cheers,
Stephen Rothwell
