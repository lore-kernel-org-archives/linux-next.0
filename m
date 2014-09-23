From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Tue, 23 Sep 2014 09:36:54 +0100
Message-ID: <20140923083652.GP30085@e104818-lin.cambridge.arm.com>
References: <20140923172339.32ad4301@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss-mx-na.foss.arm.com ([217.140.108.86]:35820 "EHLO
	foss-mx-na.foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754958AbaIWIhF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Sep 2014 04:37:05 -0400
Content-Disposition: inline
In-Reply-To: <20140923172339.32ad4301@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laura Abbott <lauraa@codeaurora.org>

On Tue, Sep 23, 2014 at 08:23:39AM +0100, Stephen Rothwell wrote:
> Today's linux-next merge of the akpm-current tree got a conflict in
> arch/arm64/mm/dma-mapping.c between commit 2189064795dc ("arm64:
> Implement set_arch_dma_coherent_ops() to replace bus notifiers") from
> the arm64 tree and commit 50a477611cc9 ("arm64: add atomic pool for
> non-coherent and CMA allocations") from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

It looks fine. Thanks.

-- 
Catalin
