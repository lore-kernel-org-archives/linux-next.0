From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [GIT PULL] strscpy powerpc fix for 3.4
Date: Thu, 8 Oct 2015 11:45:41 -0700
Message-ID: <20151008184541.GA8373@roeck-us.net>
References: <20151008094444.10d9cc68@canb.auug.org.au>
 <5615B87A.80206@ezchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51250 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753935AbbJHSpo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2015 14:45:44 -0400
Content-Disposition: inline
In-Reply-To: <5615B87A.80206@ezchip.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@ezchip.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Wed, Oct 07, 2015 at 08:27:38PM -0400, Chris Metcalf wrote:
> On 10/7/2015 6:44 PM, Stephen Rothwell wrote:
> >Hi Linus,
> >
> >After merging Linus' tree, today's linux-next build (powerpc
> >ppc64_defconfig) failed like this:
> >
> >lib/string.c: In function 'strscpy':
> >lib/string.c:209:4: error: implicit declaration of function 'zero_bytemask' [-Werror=implicit-function-declaration]
> >     *(unsigned long *)(dest+res) = c & zero_bytemask(data);
> >     ^
> >
> >Caused by commit
> >
> >   30035e45753b ("string: provide strscpy()")
> 
> I posted a change equivalent to yours earlier today:
> 
> http://lkml.kernel.org/r/1444229188-19640-1-git-send-email-cmetcalf@ezchip.com
> 
> I also did no testing, but since the rest of the PPC code is similar to the
> asm-generic version, I believe the zero_bytemask() definition should be OK.
> 
> It probably should go through Linus' tree, like the previous set of patches.
> I just pushed it up to the linux-tile tree for Linus to grab as:
> 
Wonder if Linus is going to realize that you meant 4.3 in your subject line,
not 3.4.

Guenter

> git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile.git strscpy
> 
> Chris Metcalf (1):
>       arch/powerpc: provide zero_bytemask() for big-endian
> 
>  arch/powerpc/include/asm/word-at-a-time.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> -- 
> Chris Metcalf, EZChip Semiconductor
> http://www.ezchip.com
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
