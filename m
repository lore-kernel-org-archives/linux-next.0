From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: build failure after merge of the arm-current tree
Date: Wed, 18 Apr 2018 18:54:43 +0100
Message-ID: <20180418175442.GA7234@flint.armlinux.org.uk>
References: <20180418133155.0931baf7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180418133155.0931baf7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 18, 2018 at 01:31:55PM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> After merging the arm-current tree, today's linux-next build
> (lots of configs) failed like this:
> 
> /bin/sh: 1: arithmetic expression: expecting primary: " "
> (lots of these)
> 
> Caused by commit
> 
>   fe680ca02c1e ("ARM: replace unnecessary perl with sed and the shell $(( )) operator")
> 
> (pointed out by Michael Ellerman)
> 
> Our /bin/sh is dash not bash ...

I tested this on 32-bit ARM with dash:

foo# dash
# echo $(($(nm /boot/vmlinux-4.16.0+ | sed -n -e 's/^\([^ ]*\) B __bss_start$/-0x\1/p' -e 's/^\([^ ]*\) B __bss_stop$/+0x\1/p') ))
6409680
#

Any clues what '/bin/sh: 1: arithmetic expression: expecting primary: " "'
actually means in reality?

I don't see why you should end up with lots of them either, unless maybe
the sed expression isn't working for you.

The sed expression should end up producing output such as:

-0xc09138c4
+0xc0f30694

and that's it, two values, one preceded by a + and the other by a -.

-- 
Russell King
ARM architecture Linux Kernel maintainer
