From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Tue, 24 Jul 2018 10:29:00 +0100
Message-ID: <20180724092859.GE19324@arm.com>
References: <20180724085015.029efd54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724085015.029efd54@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Paul Kocialkowski <contact@paulk.fr>, Laura Abbott <labbott@redhat.com>, Greg Hackmann <ghackmann@android.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, Jul 24, 2018 at 08:50:15AM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/Makefile
> 
> between commits:
> 
>   38fc42486775 ("arm64: Use aarch64elf and aarch64elfb emulation mode variants")
>   2893af07e507 ("arm64: add endianness option to LDFLAGS instead of LD")
>   96f95a17c1cf ("Revert "arm64: Use aarch64elf and aarch64elfb emulation mode variants"")
> 
> from Linus' tree and commit:
> 
>   c931d34ea085 ("arm64: build with baremetal linker target instead of Linux when available")
> 
> from the arm64 tree.
> 
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks; that is the correct resolution.

Will
