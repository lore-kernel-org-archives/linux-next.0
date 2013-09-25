From: Timur Tabi <timur@tabi.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 24 Sep 2013 20:21:50 -0500
Message-ID: <CAOZdJXUGD2dTpEodRgMfMVGQ8xor-RUYOGLAuECHMQVQGOuxvg@mail.gmail.com>
References: <20130925110643.db5fa154bea3838ed6affa45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130925110643.db5fa154bea3838ed6affa45@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, lkml <linux-kernel@vger.kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Timur Tabi <timur@freescale.com>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 24, 2013 at 8:06 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> After merging the akpm tree, linux-next builds (powerpc allmodconfig)
> fail like this:
>
> drivers/tty/ehv_bytechan.c:362:1: error: type defaults to 'int' in declaration of 'console_initcall' [-Werror=implicit-int]
>
> Caused by commit 0f01cf96c2d4 ("./Makefile: enable -Werror=implicit-int
> and -Werror=strict-prototypes by default") which has bee in linux-next
> since Aug 16.  This commit exposed that fact that
> drivers/tty/ehv_bytechan.c can be built as a module, but has a
> console_initcall (which is not available to modules).

Is this something new?  This code hasn't changed in over two years, so
I'm surprised it suddenly broke.

> This was
> originally introduced in commit dcd83aaff1c8 ("tty/powerpc: introduce the
> ePAPR embedded hypervisor byte channel driver") in v3.2.
>
> Anyone got a good solution?

How about:

#ifndef MODULE

static int __init ehv_bc_console_init(void)
{
    ...
}
console_initcall(ehv_bc_console_init);
#endif
