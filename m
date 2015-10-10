From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL] strscpy powerpc fix for 3.4
Date: Sat, 10 Oct 2015 11:39:43 +1100
Message-ID: <20151010113943.5d124b42@canb.auug.org.au>
References: <20151008094444.10d9cc68@canb.auug.org.au>
	<5615B87A.80206@ezchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34475 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750753AbbJJAjp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 9 Oct 2015 20:39:45 -0400
In-Reply-To: <5615B87A.80206@ezchip.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Chris Metcalf <cmetcalf@ezchip.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Hi Linus,

On Wed, 7 Oct 2015 20:27:38 -0400 Chris Metcalf <cmetcalf@ezchip.com> wrote:
>
> On 10/7/2015 6:44 PM, Stephen Rothwell wrote:
> >
> > After merging Linus' tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > lib/string.c: In function 'strscpy':
> > lib/string.c:209:4: error: implicit declaration of function 'zero_bytemask' [-Werror=implicit-function-declaration]
> >      *(unsigned long *)(dest+res) = c & zero_bytemask(data);
> >      ^
> >
> > Caused by commit
> >
> >    30035e45753b ("string: provide strscpy()")
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
> git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile.git strscpy
> 
> Chris Metcalf (1):
>        arch/powerpc: provide zero_bytemask() for big-endian
> 
>   arch/powerpc/include/asm/word-at-a-time.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> -- 
> Chris Metcalf, EZChip Semiconductor
> http://www.ezchip.com

Can you please do this pull as most of the powerpc build testing is
failing at the moment ... :-(

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
