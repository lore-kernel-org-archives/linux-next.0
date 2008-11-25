From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the 4xx tree
Date: Mon, 24 Nov 2008 20:04:26 -0500
Message-ID: <20081124200426.22cbe4c5@zod.rchland.ibm.com>
References: <20081125115021.b4782240.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e6.ny.us.ibm.com ([32.97.182.146]:41375 "EHLO e6.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752572AbYKYBEi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 20:04:38 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mAP13vIw006958
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2008 20:03:57 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAP14bWL140022
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2008 20:04:37 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAP14EP5022518
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2008 20:04:15 -0500
In-Reply-To: <20081125115021.b4782240.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, paulus@samba.org, ppc-dev <linuxppc-dev@ozlabs.org>, benh@kernel.crashing.org

On Tue, 25 Nov 2008 11:50:21 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Josh,
> 
> Today's linux-next merge of the 4xx tree got a conflict in
> arch/powerpc/configs/ppc44x_defconfig between commit
> c8d698849e135780738c2cb08f07f06eda982a8c ("powerpc/virtex: Update
> defconfigs") from the powerpc-merge tree and commit
> 867b71f3da64eb917c23cfd8babcd1c4fc0ba7fd ("powerpc/44x: update
> ppc44x_defconfig") from the 4xx tree.

Sigh.

> I fixed it up (by setting CONFIG_GPIO_XILINX to y as is done in the
> former).  I can carry this fix until either your tree is merged by Paul or
> you do a merge against the powerpc-merge tree (or Linus' tree after he
> takes Paul's tree).

I tend to rebase my next branch off of Paul's next branch, so if he
updates his tomorrow I can just do that and we will all be happy.  If
that isn't done by my afternoon time, I'll fix it up myself.  There's
no reason you should have to carry an extra patch.  linux-next is hard
enough :)

josh
