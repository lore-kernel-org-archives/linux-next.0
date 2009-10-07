From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Wed, 7 Oct 2009 08:39:44 -0700
Message-ID: <20091007083944.0d0d5059@jbarnes-g45>
References: <20091007123821.043465c6.sfr@canb.auug.org.au>
	<4ACBF2BF.5060707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934139AbZJGPkj@vger.kernel.org>
In-Reply-To: <4ACBF2BF.5060707@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 07 Oct 2009 10:45:35 +0900
Tejun Heo <tj@kernel.org> wrote:

> Stephen Rothwell wrote:
> > Hi Jesse,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > ERROR: "pci_set_cacheline_size" [drivers/pcmcia/pcmcia_core.ko]
> > undefined!
> > 
> > Caused by commit 018bc96e8e27bfcafec9357ff370bf51241a7ea7 ("pccard:
> > configure CLS on attach") which neglected to EXPORT_SYMBOL
> > pci_set_cacheline_size.
> > 
> > I have used the version of the pci tree from next-20091006 for
> > today.
> > 
> 
> Oops, Jesse, can you please add EXPORT_SYMBOL_GPL() there?

Sure, sorry I missed it.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
