From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of most trees
Date: Thu, 22 Jun 2017 15:49:52 +1000
Message-ID: <20170622154952.0c66951b@roar.ozlabs.ibm.com>
References: <20170622152441.3704b3d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622152441.3704b3d9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

On Thu, 22 Jun 2017 15:24:41 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Dave,
> 
> After merging almost all the trees, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> arch/sparc/lib/hweight.o: In function `__arch_hweight8':
> (.text+0x0): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight8' defined in .text section in lib/hweight.o
> arch/sparc/lib/hweight.o: In function `__arch_hweight16':
> (.text+0xc): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight16' defined in .text section in lib/hweight.o
> arch/sparc/lib/hweight.o: In function `__arch_hweight32':
> (.text+0x18): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight32' defined in .text section in lib/hweight.o
> arch/sparc/lib/hweight.o: In function `__arch_hweight64':
> (.text+0x24): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight64' defined in .text section in lib/hweight.o
> 
> I though it may have been caused by the thin archive changes, but
> disabling CONFIG_THIN_ARCHIVE did not fix it. I have cc'd Nick and
> Masahiro just in case.

It could be this

https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=thin-ar&id=ec2c9c20f0efab37ae31de44fe0617aa61283905

    kbuild: handle libs-y archives separately from built-in.o archives

That touches the lib linking code regardless of CONFIG_THIN_ARCHIVE.
You should be able to revert it by itself (which will break a few
other archs, so you would also have to revert the default y patch
for thin archives to repair your tree if this is the cause).

I'll try to get around to it after I fix up some other arch breakage
caused by the series :)

Thanks,
Nick
