From: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH -next] soc/qbman: fix implicit header dependency now
 causing build fails
Date: Wed, 3 May 2017 12:26:54 +0200
Message-ID: <20170503102654.GD5077@suse.de>
References: <20170502222112.16720-1-paul.gortmaker@windriver.com>
 <20170503084240.GC5077@suse.de>
 <20170503191524.41e16fa5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52937 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752586AbdECK06 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 06:26:58 -0400
Content-Disposition: inline
In-Reply-To: <20170503191524.41e16fa5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org

Hi Stephen,

On Wed, May 03, 2017 at 07:15:24PM +1000, Stephen Rothwell wrote:
> It looks like there is at least one more:
> 
> drivers/soc/fsl/qbman/qman.c: In function 'qman_init_fq':
> drivers/soc/fsl/qbman/qman.c:1787:4: error: implicit declaration of function 'dma_map_single' [-Werror=implicit-function-declaration]
> drivers/soc/fsl/qbman/qman.c:1788:21: error: 'DMA_TO_DEVICE' undeclared (first use in this function)
> drivers/soc/fsl/qbman/qman.c:1789:4: error: implicit declaration of function 'dma_mapping_error' [-Werror=implicit-function-declaration]
> 
> This is from a powerpc orenet64_smp_defconfig build of today's
> linux-next.

Thanks, I'll fix that up too later today. Please let me know if you find
more of that in your compile-testing.


	Joerg
