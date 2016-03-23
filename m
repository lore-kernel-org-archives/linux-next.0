From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Wed, 23 Mar 2016 11:14:20 +0000
Message-ID: <20160323111419.GB21390@e104818-lin.cambridge.arm.com>
References: <20160322101549.48ee810d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:45679 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753353AbcCWLOY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Mar 2016 07:14:24 -0400
Content-Disposition: inline
In-Reply-To: <20160322101549.48ee810d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Will Deacon <will.deacon@arm.com>

On Tue, Mar 22, 2016 at 10:15:49AM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/mm/init.c
> 
> between commit:
> 
>   dfd55ad85e4a ("arm64: vmemmap: use virtual projection of linear region")
> 
> from Linus' tree and commit:
> 
>   f09f1bacfe2b ("arm64: Split pr_notice("Virtual kernel memory layout...") into multiple pr_cont()")
> 
> from the arm64 tree.

The fix looks fine. Thanks.

-- 
Catalin
