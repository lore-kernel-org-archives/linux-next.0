From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 30 (media/common/tuners/max2165)
Date: Wed, 2 Dec 2009 10:04:06 -0800
Message-ID: <20091202100406.e25b2322.randy.dunlap@oracle.com>
References: <20091130175346.3f3345ed.sfr@canb.auug.org.au>
	<4B1409D9.1050901@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755263AbZLBSE2@vger.kernel.org>
In-Reply-To: <4B1409D9.1050901@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 30 Nov 2009 10:07:21 -0800 Randy Dunlap wrote:

> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20091127:
> > 
> > The v4l-dvb tree lost its conflict.
> 
> 
> on i386 (X86_32):
> 
> a 'double' variable is used, causing:
> 
> ERROR: "__floatunsidf" [drivers/media/common/tuners/max2165.ko] undefined!
> ERROR: "__adddf3" [drivers/media/common/tuners/max2165.ko] undefined!
> ERROR: "__fixunsdfsi" [drivers/media/common/tuners/max2165.ko] undefined!


linux-next-20091202:

still have this one (above) and similar with
drivers/media/dvb/frontends/atbm8830.c:

drivers/built-in.o: In function `atbm8830_init':
atbm8830.c:(.text+0x9012f9): undefined reference to `__udivdi3'
atbm8830.c:(.text+0x901384): undefined reference to `__floatunsidf'
atbm8830.c:(.text+0x901395): undefined reference to `__muldf3'
atbm8830.c:(.text+0x9013a5): undefined reference to `__floatunsidf'
atbm8830.c:(.text+0x9013b2): undefined reference to `__divdf3'
atbm8830.c:(.text+0x9013c3): undefined reference to `__muldf3'
atbm8830.c:(.text+0x9013cd): undefined reference to `__fixunsdfsi'

---
~Randy
