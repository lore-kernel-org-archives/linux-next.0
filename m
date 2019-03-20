From: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: linux-next: Fixes tag needs some work in the ntb tree
Date: Wed, 20 Mar 2019 15:00:37 -0600
Message-ID: <8a8ce003-c151-d04b-3ac9-8823a6c8ff7b@deltatee.com>
References: <20190321075818.24f9703a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321075818.24f9703a@canb.auug.org.au>
Content-Language: en-CA
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jon Mason <jdmason@kudzu.us>, NTB Mailing List <linux-ntb@googlegroups.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 2019-03-20 2:58 p.m., Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f4d0dd1064b8 ("NTB: ntb_transport: Ensure qp->tx_mw_dma_addr is initaliazed")
> 
> Fixes tag
> 
>   Fixes: c27ccb899219 ("NTB: ntb_transport: Ensure the destination buffer is mapped for TX DMA")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Did you mean:
> 
>   c59666bb32b9 ("NTB: ntb_transport: Ensure the destination buffer is mapped for TX DMA")

My fault. I sent the fix patch with the fixes tag before the original
patch was merged upstream expecting them to be squashed. c59666bb32b9 is
the correct hash in upstream now.

Logan
