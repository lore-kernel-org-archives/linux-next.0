From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: linux-next: Tree for Dec 11
Date: Tue, 11 Dec 2018 11:04:37 -0700
Message-ID: <20181211180437.GA28010@flashbox>
References: <20181211182627.42b79e40@canb.auug.org.au>
 <20181211173851.GA29028@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181211173851.GA29028@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 11, 2018 at 09:38:51AM -0800, Guenter Roeck wrote:
> On Tue, Dec 11, 2018 at 06:26:27PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20181210:
> > 
> > The arm64 tree gained a conflict against Linus' tree.
> > 
> > The f2fs tree gained a conflict against the fscrypt tree.
> > 
> > The ubifs tree gained a conflict against the fscrypt tree.
> > 
> > The rdma tree still had its build failure so I used the version from
> > next-20181203.
> > 
> > The tip tree gained a conflict against the hwmon-staging tree.
> > 
> > The gpio tree lost its build failure.
> > 
> > The akpm-current tree lost its build failure but gained conflist against
> > the arm64 tree.
> > 
> > Non-merge commits (relative to Linus' tree): 7744
> >  8462 files changed, 365061 insertions(+), 211977 deletions(-)
> > 
> 
> Build results:
> 	total: 152 pass: 150 fail: 2
> Failed builds: 
> 	arm:allmodconfig 
> 	arm64:allmodconfig 
> Qemu test results:
> 	total: 337 pass: 137 fail: 200
> 
> Build failures:
> 
> arm:
> 
> In file included from drivers/media/pci/ddbridge/ddbridge.h:22:0,
>                  from drivers/media/pci/ddbridge/ddbridge-ci.c:19:
> arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> 

Just FYI, I noticed this one yesterday on next-20181210 and sent a patch:
https://lore.kernel.org/linux-media/20181210233514.3069-1-natechancellor@gmail.com/

> arm64:
> 
> arch/arm64/kernel/entry-ftrace.o:(_kprobe_blacklist+0x0): dangerous relocation:
> 	unsupported relocation
> 
> The latter is with gcc 7.3.0. I'll build and try with gcc 7.4.0 and
> the most recent binutils later.
> 
> Most of the failing qemu tests fail with something like
> 
> Starting init: /sbin/init exists but couldn't execute it (error -95)
> 
> Others (such as aarch64) crash silently.
> 
> Has anyone reported this already, or do I need to run bisect ?
> 
> Guenter

Thanks,
Nathan
