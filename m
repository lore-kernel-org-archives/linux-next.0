From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Fri, 17 Jun 2011 11:17:17 +0100
Message-ID: <20110617101717.GB9504@e102109-lin.cambridge.arm.com>
References: <20110617102637.7868bc00.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([94.185.240.25]:42521 "HELO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752378Ab1FQKR1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jun 2011 06:17:27 -0400
In-Reply-To: <20110617102637.7868bc00.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk@arm.linux.org.uk>

Hi Stephen,

On Fri, Jun 17, 2011 at 01:26:37AM +0100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-lpae tree got a conflict in
> arch/arm/mm/dma-mapping.c between commit 8f5d638883e0 ("ARM: DMA: steal
> memory for DMA coherent mappings") from the arm tree and commit
> 7b550c77c248 ("ARM: LPAE: Use PMD_(SHIFT|SIZE|MASK) instead of PGDIR_*")
> from the arm-lpae tree.
> 
> The former has removed all the references to the PGDIR_* macros from this
> file, so I used that.

The fix is correct. I also did a kernel build for Versatile Express and
there were no errors.

Thanks.

-- 
Catalin
