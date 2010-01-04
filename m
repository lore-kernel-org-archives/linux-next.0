From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Mon, 4 Jan 2010 15:48:43 -0800
Message-ID: <20100104154843.294c06ff@jbarnes-piketon>
References: <20100105095543.8c446cb7.sfr@canb.auug.org.au>
	<20100104231001.GF9882@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754259Ab0ADXst@vger.kernel.org>
In-Reply-To: <20100104231001.GF9882@parisc-linux.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 4 Jan 2010 16:10:01 -0700
Matthew Wilcox <matthew@wil.cx> wrote:

> On Tue, Jan 05, 2010 at 09:55:43AM +1100, Stephen Rothwell wrote:
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > drivers/pci/hotplug/rpaphp_core.c:433: error: unknown field
> > 'get_max_bus_speed' specified in initializer
> > drivers/pci/hotplug/rpaphp_core.c:433: warning: excess elements in
> > struct initializer drivers/pci/hotplug/rpaphp_core.c:433: warning:
> > (near initialization for 'rpaphp_hotplug_slot_ops')
> > 
> > Caused by commit 7227d60c98ad0e1af49c717a62515d74002dd754 ("PCI:
> > Make current and maximum bus speeds part of the PCI core").
> > 
> > I have used the version of the pci tree from next-20100104 for
> > today.
> 
> Doh, sorry.  I don't have a handy powerpc environment around to test
> with. Can you try just deleting line 433?  (this should actually be
> the correct fix).

I just pushed that into my linux-next tree.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
