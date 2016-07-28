From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Thu, 28 Jul 2016 12:40:04 +1000
Message-ID: <8737mutri3.fsf@concordia.ellerman.id.au>
References: <20160728120814.59e42bc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160728120814.59e42bc8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Michal,
>
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
...
> arch/powerpc/mm/hash_utils_64.c:929:10: note: in expansion of macro 'IS_ENABLED'
>   else if IS_ENABLED(CONFIG_PPC_NATIVE)
>           ^
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   7353644fa9df ("powerpc/mm: Fix build break when PPC_NATIVE=n")
>
> from the powerpc tree interacting with commit
>
>   5e8754fd80b0 ("kconfig.h: allow to use IS_{ENABLE,REACHABLE} in macro expansion")
>
> from the kbuild tree.

**expletive deleted**

I was wary of IS_ENABLED(), I should have trusted my instincts.

> I have applied the following fix patch (that should be applied to the
> powerpc tree):

Applied, thanks.

cheers
