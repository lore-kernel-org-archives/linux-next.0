From: Hugo Lefeuvre <hle@owl.eu.com>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Date: Tue, 19 Feb 2019 08:45:19 +0100
Message-ID: <20190219074519.GA2294@behemoth.owl.eu.com.local>
References: <20190219173654.47e9bc36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219173654.47e9bc36@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen, Arnd,

> After merging the asm-generic tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> ...
> Caused by commit
> 
>   8e074c243ed3 ("iomap: add missing const to ioread*/iowrite addr arg")

I have prepared a patch addressing this issue, and am currently building it
with a powerpc cross compiler. I'll submit it once it's done. Please tell
me if I should update the initial patch instead.

> The const qualifiers are also missing in:
> 
> arch/parisc/lib/iomap.c
> arch/sh/kernel/iomap.c

I also have patches for these architectures, but it is more complicated for
me to test them with a cross compiler. Should I still submit them?

> I have reverted that commit for today.
> 
> BTW, that commit only added the const to the ioread* functions ...

Yes, and it does not even make sense to add a const qualifier to the addr
argument in the iowrite case. That was a bad commit message.

Thanks, and sorry for the trouble.

regards,
 Hugo

-- 
                Hugo Lefeuvre (hle)    |    www.owl.eu.com
RSA4096_ 360B 03B3 BF27 4F4D 7A3F D5E8 14AA 1EB8 A247 3DFD
ed25519_ 37B2 6D38 0B25 B8A2 6B9F 3A65 A36F 5357 5F2D DC4C
