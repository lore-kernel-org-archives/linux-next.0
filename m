From: Jon Mason <jdmason@kudzu.us>
Subject: Re: linux-next: Fixes tag needs some work in the ntb tree
Date: Thu, 21 Mar 2019 15:53:47 -0400
Message-ID: <CAPoiz9x9aWMzV3K-UhBz52AXdVpDbCQnLTeM7=nt5tAFL2RPBQ@mail.gmail.com>
References: <20190321075818.24f9703a@canb.auug.org.au> <8a8ce003-c151-d04b-3ac9-8823a6c8ff7b@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a8ce003-c151-d04b-3ac9-8823a6c8ff7b@deltatee.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, NTB Mailing List <linux-ntb@googlegroups.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 20, 2019 at 5:00 PM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2019-03-20 2:58 p.m., Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >   f4d0dd1064b8 ("NTB: ntb_transport: Ensure qp->tx_mw_dma_addr is initaliazed")
> >
> > Fixes tag
> >
> >   Fixes: c27ccb899219 ("NTB: ntb_transport: Ensure the destination buffer is mapped for TX DMA")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Did you mean:
> >
> >   c59666bb32b9 ("NTB: ntb_transport: Ensure the destination buffer is mapped for TX DMA")
>
> My fault. I sent the fix patch with the fixes tag before the original
> patch was merged upstream expecting them to be squashed. c59666bb32b9 is
> the correct hash in upstream now.

I've corrected the patch in my git branches and repushed.

Is there an existing set of tools/scripts I should run to prevent
things like this from happening?

Thanks,
Jon

>
> Logan
>
