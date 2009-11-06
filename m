From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: Tree for November 5
Date: Fri, 6 Nov 2009 14:00:42 -0800
Message-ID: <20091106140042.1e29d82b@jbarnes-piketon>
References: <20091105190426.c9cadada.sfr@canb.auug.org.au>
	<4AF2AB23.9000907@in.ibm.com>
	<200911050931.04838.bjorn.helgaas@hp.com>
	<200911051017.12135.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759843AbZKFWAf@vger.kernel.org>
In-Reply-To: <200911051017.12135.bjorn.helgaas@hp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Cc: Sachin Sant <sachinp@in.ibm.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 5 Nov 2009 11:17:11 -0600
Bjorn Helgaas <bjorn.helgaas@hp.com> wrote:

> On Thursday 05 November 2009 09:31:04 am Bjorn Helgaas wrote:
> > On Thursday 05 November 2009 03:38:27 am Sachin Sant wrote:
> > > Today's next tree fails to build on i386 with
> > > 
> > > arch/x86/pci/built-in.o: In function `align_resource':
> > > arch/x86/pci/acpi.c:82: undefined reference to `__udivdi3'
> > > 
> > > The code in question was added by commit
> > > 03db42adfeeabe856dbb6894dd3aaff55838330a.
> > 
> > I'll look into this.  I did build and test a 32-bit x86 kernel, but
> > I built it on an x86_64 box using "linux32 make ...", which looks
> > like it used gcc 4.3.2.
> 
> Can you try the patch below, please?
> 
> 
> commit 00f16f0a2f4826eadec0565e4b454ab8bc7824cc
> Author: Bjorn Helgaas <bjorn.helgaas@hp.com>
> Date:   Thu Nov 5 10:03:57 2009 -0700
> 
>     x86/PCI: remove 64-bit division
>     
>     The roundup() caused a build error (undefined reference to
> `__udivdi3'). We're aligning to power-of-two boundaries, so it's
> simpler to just use ALIGN() anyway, which avoids the division.
>     
>     Signed-off-by: Bjorn Helgaas <bjorn.helgaas@hp.com>

Applied with Randy's ack.  Thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
