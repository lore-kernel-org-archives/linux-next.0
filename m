From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Fri, 31 Mar 2017 11:32:54 +0200
Message-ID: <CAK8P3a0nSKFrp7n3CDvh29vYUiH+4mmHr5jnTv4UgchBnpqvpg@mail.gmail.com>
References: <20170331140217.3c0fc28f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170331140217.3c0fc28f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 31, 2017 at 5:02 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   arch/arm64/include/asm/bug.h
>
> between commit:
>
>   f13d52cb3fad ("arm64: define BUG() instruction without CONFIG_BUG")
>
> from the arm64 tree and commit:
>
>   19d436268dde ("debug: Add _ONCE() logic to report_bug()")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/arm64/include/asm/bug.h
> index 0bfe1df12b19,a9be1072933c..000000000000
> --- a/arch/arm64/include/asm/bug.h
> +++ b/arch/arm64/include/asm/bug.h
> @@@ -42,27 -45,19 +42,26 @@@
>   _BUGVERBOSE_LOCATION(__FILE__, __LINE__)              \
>                 ".short " #flags "\n\t"                 \
>                 ".popsection\n"                         \
>  -                                                      \
>  -      "1:     brk %[imm]"                             \
>  -              :: [imm] "i" (BUG_BRK_IMM)              \
>  -)
>  +      "1:     "
>  +#else
>  +#define __BUG_ENTRY(flags) ""
>  +#endif
>  +
>  +#define __BUG_FLAGS(flags)                            \
>  +      asm volatile (                                  \
>  +              __BUG_ENTRY(flags)                      \
>  +              "brk %[imm]" :: [imm] "i" (BUG_BRK_IMM) \
>  +      );
>
>  -#define BUG() do {                            \
>  -      _BUG_FLAGS(0);                          \
>  -      unreachable();                          \
>  +
>  +#define BUG() do {                                    \
>  +      __BUG_FLAGS(0);                                 \
>  +      unreachable();                                  \
>   } while (0)
>
> - #define __WARN_TAINT(taint)                           \
> -       __BUG_FLAGS(BUGFLAG_TAINT(taint))
> + #define __WARN_FLAGS(flags) _BUG_FLAGS(BUGFLAG_WARNING|(flags))
>
>  -#endif /* ! CONFIG_GENERIC_BUG */
>  +#define HAVE_ARCH_BUG

Mark Brown's build bot now reports this build failure:

        arm64-defconfig
../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of
function '_BUG_FLAGS' [-Werror=implicit-function-declaration]

I think the last line needs s/_BUG_FLAGS/__BUG_FLAGS/
aside from that, the merge looks right to me, but I wonder if
there is a way to prevent the conflict from showing up later
for Linus.

      Arnd
