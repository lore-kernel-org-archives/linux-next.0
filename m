From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Thu, 13 Jul 2017 21:17:13 -0400
Message-ID: <1499995033.2936.12.camel@redhat.com>
References: <20170714111437.69a6b100@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54420 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752279AbdGNBRQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 Jul 2017 21:17:16 -0400
In-Reply-To: <20170714111437.69a6b100@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Leon Romanovsky <leon@kernel.org>, Eli Cohen <eli@mellanox.com>

On Fri, 2017-07-14 at 11:14 +1000, Stephen Rothwell wrote:
> Hi Doug,
> 
> Today's linux-next merge of the rdma tree got conflicts in:
> 
>   drivers/infiniband/core/uverbs_cmd.c
>   drivers/infiniband/core/verbs.c
> 
> between commit:
> 
>   d291f1a65232 ("IB/core: Enforce PKey security on QPs")
> 
> from Linus' tree and commits:
> 
>   c7c0fb974caa ("IB/core: Introduce modify QP operation with udata")
>   5f4bc420f35f ("IB/uverbs: Make use of ib_modify_qp variant to avoid
> resolving DMAC")
> 
> from the rdma tree.
> 
> I fixed it up (I used the latter version of uverbs_cmd.c and see
> below)
> and can carry the fix as necessary. This is now fixed as far as
> linux-next
> is concerned, but any non trivial conflicts should be mentioned to
> your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting
> tree to minimise any particularly complex conflicts.

This was expected.  The SELinux changes went through the SELinux tree
and the referenced patches touch the same code.  Your fix is correct. 
Thanks.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
