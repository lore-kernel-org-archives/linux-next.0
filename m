From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: [GIT PULL] strscpy powerpc fix for 3.4
Date: Wed, 7 Oct 2015 20:27:38 -0400
Message-ID: <5615B87A.80206@ezchip.com>
References: <20151008094444.10d9cc68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151008094444.10d9cc68@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

On 10/7/2015 6:44 PM, Stephen Rothwell wrote:
> Hi Linus,
>
> After merging Linus' tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> lib/string.c: In function 'strscpy':
> lib/string.c:209:4: error: implicit declaration of function 'zero_bytemask' [-Werror=implicit-function-declaration]
>      *(unsigned long *)(dest+res) = c & zero_bytemask(data);
>      ^
>
> Caused by commit
>
>    30035e45753b ("string: provide strscpy()")

I posted a change equivalent to yours earlier today:

http://lkml.kernel.org/r/1444229188-19640-1-git-send-email-cmetcalf@ezchip.com

I also did no testing, but since the rest of the PPC code is similar to the
asm-generic version, I believe the zero_bytemask() definition should be OK.

It probably should go through Linus' tree, like the previous set of patches.
I just pushed it up to the linux-tile tree for Linus to grab as:

git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile.git strscpy

Chris Metcalf (1):
       arch/powerpc: provide zero_bytemask() for big-endian

  arch/powerpc/include/asm/word-at-a-time.h | 5 +++++
  1 file changed, 5 insertions(+)

-- 
Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com
