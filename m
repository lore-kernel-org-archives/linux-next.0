From: Vinod <vkoul@kernel.org>
Subject: Re: linux-next: build warning after merge of the slave-dma tree
Date: Wed, 4 Jul 2018 09:50:17 +0530
Message-ID: <20180704042017.GW22377@vkoul-mobl>
References: <20180704133006.4d42d1a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180704133006.4d42d1a6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Angelo Dureghello <angelo@sysam.it>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 04-07-18, 13:30, Stephen Rothwell wrote:
> 
> After merging the slave-dma tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-edma-common.o

Thanks for the report, I have fixed it by adding this and pushed out.

-- 
~Vinod
