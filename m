From: Vladimir Davydov <vdavydov@parallels.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Tue, 27 Jan 2015 11:27:48 +0300
Message-ID: <20150127082748.GE28978@esperanza>
References: <20150127191243.6fbbf2f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.parallels.com ([199.115.105.18]:41003 "EHLO
	mx2.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754226AbbA0I1x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Jan 2015 03:27:53 -0500
Content-Disposition: inline
In-Reply-To: <20150127191243.6fbbf2f6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Tue, Jan 27, 2015 at 07:12:43PM +1100, Stephen Rothwell wrote:
> In file included from mm/slab_common.c:26:0:
> mm/slab_common.c: In function 'kmem_cache_destroy':
> mm/slab.h:259:30: warning: right-hand operand of comma expression has no effect [-Wunused-value]
>   for (iter = NULL, tmp = NULL, (root); 0; )
>                               ^

It's already been fixed, please see

https://lkml.org/lkml/2015/1/24/39

Thanks,
Vladimir
