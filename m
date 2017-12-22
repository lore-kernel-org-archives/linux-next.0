From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the omap tree with the keystone tree
Date: Fri, 22 Dec 2017 08:41:45 -0800
Message-ID: <20171222164145.GY3875@atomide.com>
References: <20171222084545.5bab63b5@canb.auug.org.au>
 <20171221231253.GX3875@atomide.com>
 <2ec2df22-0f65-daf1-fe20-2dc3ad75f9cd@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ec2df22-0f65-daf1-fe20-2dc3ad75f9cd@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: linux-next.vger.kernel.org

* Santosh Shilimkar <santosh.shilimkar@oracle.com> [171222 02:01]:
> On 12/21/2017 3:12 PM, Tony Lindgren wrote:
> > * Stephen Rothwell <sfr@canb.auug.org.au> [171221 21:48]:
> > > Hi Tony,
> > > 
> > > Today's linux-next merge of the omap tree got a conflict in:
> > > 
> > >    arch/arm/configs/multi_v7_defconfig
> > > 
> > > between commit:
> > > 
> > >    d3b15c54ed7e ("ARM: config: sync multi-v7 config with keystone peripherals")
> > > 
> > > from the keystone tree and commit:
> > > 
> > >    d03366dcbffc ("ARM: multi_v7_defconfig: Enable CONFIG_PCI_DRA7XX (Host & Device modes)")
> > > 
> > > from the omap tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > 
> > Thanks I'll wait on this one so Kishon can check the resulting next.
> > 
> > Santosh, the removal of CONFIG_PCI in multi_v7_defconfig looks a bit
> > suspcicious to me, care to check if commit d3b15c54ed7e is correct?
> > 
> I just used savedefconfig so not sure why some of those needed ones
> got knocked off. For now, I will drop the v7_defconfig patch and
> post it separately later post merge window.

OK thanks for checking. In that case I'll go ahead with Kishon's
changes.

Regards,

Tony
