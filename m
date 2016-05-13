From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rdma-leon tree
Date: Fri, 13 May 2016 10:33:30 +1000
Message-ID: <20160513103330.7dc8fd31@canb.auug.org.au>
References: <20160513100807.05177f21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58028 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751352AbcEMAdd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 May 2016 20:33:33 -0400
In-Reply-To: <20160513100807.05177f21@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Leon,

On Fri, 13 May 2016 10:08:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the rdma-leon tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: ".rdma_addr_size" [drivers/infiniband/core/rdma_ucm.ko] undefined!
> ERROR: ".rdma_addr_register_client" [drivers/infiniband/core/rdma_cm.ko] undefined!
> ERROR: ".rdma_addr_size" [drivers/infiniband/core/rdma_cm.ko] undefined!
> ERROR: ".rdma_addr_unregister_client" [drivers/infiniband/core/rdma_cm.ko] undefined!
> ERROR: ".rdma_translate_ip" [drivers/infiniband/core/rdma_cm.ko] undefined!
> ERROR: ".rdma_copy_addr" [drivers/infiniband/core/rdma_cm.ko] undefined!
> ERROR: ".rdma_resolve_ip" [drivers/infiniband/core/rdma_cm.ko] undefined!
> ERROR: ".rdma_addr_cancel" [drivers/infiniband/core/rdma_cm.ko] undefined!
> ERROR: ".rdma_resolve_ip_route" [drivers/infiniband/core/ib_sa.ko] undefined!
> ERROR: ".addr_init" [drivers/infiniband/core/ib_core.ko] undefined!
> ERROR: ".rdma_addr_find_l2_eth_by_grh" [drivers/infiniband/core/ib_core.ko] undefined!
> ERROR: ".addr_cleanup" [drivers/infiniband/core/ib_core.ko] undefined!
> 
> I don't know what has caused this, but the rdma-leon tree shares a lot
> of patches (but not commits) with the rdma tree and so needs to be
> cleaned up. Please sort out your work flow.
> 
> I have dropped the rdma-leon tree for today.

Note that the following merge of the rdma-leon-testing tree compiled
fine and there is only one commit in there that is not in the rdma-leon
tree ... (though there are also several merge commits).

-- 
Cheers,
Stephen Rothwell
