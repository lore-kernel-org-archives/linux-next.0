From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the slave-dma
 tree
Date: Tue, 29 Aug 2017 08:20:24 +0530
Message-ID: <20170829025024.GK3053@localhost>
References: <20170829091056.398976cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:42057 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751209AbdH2Cq6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 22:46:58 -0400
Content-Disposition: inline
In-Reply-To: <20170829091056.398976cf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>

On Tue, Aug 29, 2017 at 09:10:56AM +1000, Stephen Rothwell wrote:
> Hi Vinod,
> 
> Commit
> 
>   966e5e01f420 ("dmaengine: altera: Use macros instead of structs to describe the registers")
> 
> is missing a Signed-off-by from its committer.

Oops, missed fixing that up while running with -i :(.

Fixed now, thanks for pointing out

-- 
~Vinod
