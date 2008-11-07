From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: next-20081106: undefined reference to `__per_cpu_start'
Date: Fri, 7 Nov 2008 08:44:37 +0300
Message-ID: <20081107054437.GA21421@x200.localdomain>
References: <20081106173645.e7e79071.sfr@canb.auug.org.au> <20081106183939.GA26925@x200.localdomain> <Pine.LNX.4.64.0811061310350.6009@quilx.com> <20081107162114.2a41c623.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753562AbYKGFlc@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081107162114.2a41c623.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au, Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 07, 2008 at 04:21:14PM +1100, Stephen Rothwell wrote:
> Hi Christoph,
> 
> On Thu, 6 Nov 2008 13:15:07 -0600 (CST) Christoph Lameter <cl@linux-foundation.org> wrote:
> >
> > On Thu, 6 Nov 2008, Alexey Dobriyan wrote:
> > 
> > > On blackfin-BF526-EZBRD and other blackfins:
> > >
> > >   LD      .tmp_vmlinux1
> > > mm/built-in.o: In function `cpu_alloc_init':
> > > (.init.text+0x1486): undefined reference to `__per_cpu_start'
> > > mm/built-in.o: In function `cpu_alloc_init':
> > > (.init.text+0x148c): undefined reference to `__per_cpu_start'
> > > mm/built-in.o: In function `cpu_alloc_init':
> > > (.init.text+0x1492): undefined reference to `__per_cpu_end'
> > > mm/built-in.o: In function `cpu_alloc_init':
> > > (.init.text+0x1496): undefined reference to `__per_cpu_end'
> > 
> > Any contigencies for __per_cpu_start/end in your blackfin vmlinux.lds.h?
> > That is where these symbols are defined
> > 
> > Or did you use generic percpu support and set
> > CONFIG_HAVE_ZERO_BASED_PER_CPU?
> 
> Also a avr32 allnoconfig
> (http://kisskb.ellerman.id.au/kisskb/buildresult/53233/) gets:
> 
> backing-dev.c:(.init.text+0xc4c): undefined reference to `__per_cpu_start'
> backing-dev.c:(.init.text+0xc50): undefined reference to `__per_cpu_end'
> 
> and avr32 defconfig
> (http://kisskb.ellerman.id.au/kisskb/buildresult/53225/) gets:
> 
> vmstat.c:(.init.text+0xff0): undefined reference to `__per_cpu_start'
> vmstat.c:(.init.text+0xff4): undefined reference to `__per_cpu_end'

BTW, on alpha I get

mm/cpu_alloc.c:146:1: error: pasting "per_cpu__" and "(" does not give a valid preprocessing token
