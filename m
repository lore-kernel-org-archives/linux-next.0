From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: net tree build warnings
Date: Wed, 14 Oct 2009 22:55:41 -0300
Message-ID: <20091015015541.GC25141@ghostprotocols.net>
References: <20091014152000.15312908.sfr@canb.auug.org.au> <20091014153450.3110e34c.sfr@canb.auug.org.au> <20091014.151137.30359959.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760945AbZJOB4T@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091014.151137.30359959.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Em Wed, Oct 14, 2009 at 03:11:37PM -0700, David Miller escreveu:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 14 Oct 2009 15:34:50 +1100
> 
> > On Wed, 14 Oct 2009 15:20:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> Today's linux-next build (powerpc ppc44x_defconfig) produced these
> >> warnings:
> >> 
> >> In file included from net/socket.c:94:
> >> include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside parameter list
> >> 
> >> CONFIG_COMPAT is not set.
> >> 
> >> Caused by commit a2e2725541fad72416326798c2d7fa4dafb7d337 ("net:
> >> Introduce recvmmsg socket syscall").
>  ...
> > 
> > I also get these for i386 and sparc32 defconfig builds.
> 
> I've asked Arnaldo to work on fixing this.

I'll fix that early tomorrow.

- Arnaldo
