From: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Dec 11
Date: Thu, 20 Dec 2018 09:43:46 -0200
Message-ID: <20181220094337.36d9aed3@coco.lan>
References: <20181211182627.42b79e40@canb.auug.org.au>
        <20181211173851.GA29028@roeck-us.net>
        <20181211180437.GA28010@flashbox>
        <20181212093632.774c0603@canb.auug.org.au>
        <20181219144423.089e46b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219144423.089e46b9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Em Wed, 19 Dec 2018 14:44:23 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> On Wed, 12 Dec 2018 09:36:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Tue, 11 Dec 2018 11:04:37 -0700 Nathan Chancellor <natechancellor@gmail.com> wrote:  
> > >
> > > On Tue, Dec 11, 2018 at 09:38:51AM -0800, Guenter Roeck wrote:    
> > > > Build results:
> > > > 	total: 152 pass: 150 fail: 2
> > > > Failed builds: 
> > > > 	arm:allmodconfig 
> > > > 	arm64:allmodconfig 
> > > > Qemu test results:
> > > > 	total: 337 pass: 137 fail: 200
> > > > 
> > > > Build failures:
> > > > 
> > > > arm:
> > > > 
> > > > In file included from drivers/media/pci/ddbridge/ddbridge.h:22:0,
> > > >                  from drivers/media/pci/ddbridge/ddbridge-ci.c:19:
> > > > arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> > > >       
> > > 
> > > Just FYI, I noticed this one yesterday on next-20181210 and sent a patch:
> > > https://lore.kernel.org/linux-media/20181210233514.3069-1-natechancellor@gmail.com/    
> > 
> > I have added that patch after the v4l-dvb tree for today.  
> 
> I am still applying that patch ...

Sorry for taking so long with that. Patch applied, thanks!

Thanks,
Mauro
