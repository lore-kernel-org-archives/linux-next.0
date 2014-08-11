From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 11
Date: Mon, 11 Aug 2014 10:05:10 -0700
Message-ID: <20140811170510.GA19750@roeck-us.net>
References: <20140811155213.0aa083ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140811155213.0aa083ce@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Aug 11, 2014 at 03:52:13PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add code intended for v3.18 until after v3.17-rc1 is
> released.
> 
> Changes since 20140808:
> 
> The ext3 tree lost its build failure.
> 
> The pm tree gained conflicts against Linus' tree and a build failure for
> which I applied a merge fix patch.
> 
> The mmc-uh tree still had its build failure so I used the version from
> next-20140725.
> 
> The akpm tree lost several patches that turned up in Linus' tree.
> 
> Non-merge commits (relative to Linus' tree): 1547
>  1041 files changed, 31446 insertions(+), 15956 deletions(-)
> 

New build failures:

Building arm:s5pv210_defconfig ... failed
--------------
Error log:
arch/arm/mach-s5pv210/pm.c:150:12: error: 'suspend_valid_only_mem' undeclared
here (not in a function)
make[1]: *** [arch/arm/mach-s5pv210/pm.o] Error 1

Building arm:pxa910_defconfig ... failed
--------------
Error log:
arch/arm/mach-mmp/pm-pxa910.c: In function 'pxa910_pm_valid':
arch/arm/mach-mmp/pm-pxa910.c:243:65: error: expected ')' before ';' token
arch/arm/mach-mmp/pm-pxa910.c:244:1: error: expected ';' before '}' token
make[1]: *** [arch/arm/mach-mmp/pm-pxa910.o] Error 1

Guenter
