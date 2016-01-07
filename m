From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: manual merge of the target-updates tree with the
 rdma tree
Date: Thu, 07 Jan 2016 02:04:42 -0800
Message-ID: <1452161082.14302.22.camel@haakon3.risingtidesystems.com>
References: <20160107164212.4cfbbe02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:52337 "EHLO
	linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752965AbcAGKE4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2016 05:04:56 -0500
In-Reply-To: <20160107164212.4cfbbe02@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagig@mellanox.com>, Jenny Derzhavetz <jennyf@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>

On Thu, 2016-01-07 at 16:42 +1100, Stephen Rothwell wrote:
> Hi Nicholas,
> 
> Today's linux-next merge of the target-updates tree got conflicts in:
> 
>   drivers/infiniband/ulp/iser/iscsi_iser.h
>   drivers/infiniband/ulp/iser/iser_initiator.c
>   drivers/infiniband/ulp/iser/iser_memory.c
>   drivers/infiniband/ulp/iser/iser_verbs.c
>   drivers/infiniband/ulp/isert/ib_isert.c
> 
> between commits:
> 
>   4a061b287b1e ("IB/ulps: Avoid calling ib_query_device")
>   cfeb91b375ad ("IB/iser: Convert to CQ abstraction")
>   2392a4cdcb8d ("IB/iser: constify iser_reg_ops structure")
>   422bd0acb062 ("IB/isert: Support the remote invalidation exception")
>   59caaed7a72a ("IB/iser: Support the remote invalidation exception")
> 
> from the rdma tree and commit:
> 
>   ddca7d44ccd2 ("iser: Have initiator and target to share protocol structures and definitions")
>   6d2cb3ad4bc2 ("iser-target: Support the remote invalidation exception")
>   c37c810bae45 ("IB/iser: Increment the rkey when registering and not when invalidating")
>   9a4a71456262 ("IB/iser: Support the remote invalidation exception")
> 
> from the target-updates tree.
> 
> I fixed it up (hopefully - mainly taking one of the other side (usually
> the rdma tree version, so please check the result when I release it)
> and can carry the fix as necessary (no action is required).
> 
> Seom of these patches are very similar ...
> 

Thanks SFR.

Sagi & Or, to confirm the iser/iser-target changes currently queued in
Doug's rdma.git for-next branch means the -v2 series introducing
remote invalidation support here:

http://www.spinics.net/lists/target-devel/msg11289.html

can now be safely dropped from target-pending/for-next, yes..?
