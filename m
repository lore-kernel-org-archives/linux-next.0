From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with Linus' tree
Date: Fri, 10 Nov 2017 13:39:05 +0900 (KST)
Message-ID: <20171110.133905.725214727380201198.davem@davemloft.net>
References: <20171110103100.3cffee49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:50234 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755926AbdKJEjJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Nov 2017 23:39:09 -0500
In-Reply-To: <20171110103100.3cffee49@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 10 Nov 2017 10:31:00 +1100

> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   net/sched/cls_basic.c
>   net/sched/cls_u32.c
> 
> between commits:
> 
>   0b2a59894b76 ("cls_basic: use tcf_exts_get_net() before call_rcu()")
>   35c55fc156d8 ("cls_u32: use tcf_exts_get_net() before call_rcu()")
> 
> from Linus' tree and commit:
> 
>   1d8134fea2eb ("net_sched: use idr to allocate basic filter handles")
> 
> from the net-next tree.

This should be resolved as I've just merged 'net' into 'net-next'.
