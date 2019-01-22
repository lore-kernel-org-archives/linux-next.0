From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the akpm tree with the kbuild tree
Date: Tue, 22 Jan 2019 14:30:20 +0900
Message-ID: <CAK7LNAQAL0zm+OpHDpKdufznZ_nSqyOcEh_Pes3oCMs1CtA9Cw@mail.gmail.com>
References: <20190122150231.0191e8d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122150231.0191e8d4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 22, 2019 at 1:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm tree got a conflict in:
>
>   Makefile
>
> between commit:
>
>   b57304bb03de ("kbuild: remove meaningless prepare2 target")
>
> from the kbuild tree and patch:
>
>   "locking/atomics: build atomic headers as required"


This has been sitting around since the previous development cycle.
The relevant patches were not sent to Linus in the previous MW.

I believe those should be dropped entirely,
and re-implemented cleanly/correctly if Mark Rutland wants this change.

People already pointed out the scripts are so slow,
but that is not the only problem.

[1] I see annoying log message
    "Nothing to be done for 'all'"
    for every incremental build

[2] Dependencies might not be sufficient.
    For example, nothing is rebuilt when scripts/atomic/fallbacks/* is touched.

[3] I do not understand why scripts/Makefile.genheader must be added.






> from the akpm tree.
>
> I fixed it up (I hope - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc Makefile
> index 004a190e3ece,bd0f79d8295e..000000000000
> --- a/Makefile
> +++ b/Makefile
> @@@ -1077,8 -1077,12 +1077,8 @@@ ifneq ($(KBUILD_SRC),
>         fi;
>   endif
>
> - prepare1: prepare3 outputmakefile asm-generic $(version_h) $(autoksyms_h) \
> -                                               include/generated/utsrelease.h
>  -# prepare2 creates a makefile if using a separate output directory.
>  -# From this point forward, .config has been reprocessed, so any rules
>  -# that need to depend on updated CONFIG_* values can be checked here.
>  -prepare2: prepare3 outputmakefile asm-generic genheader
>  -
>  -prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h
> ++prepare1: prepare3 outputmakefile asm-generic genheader $(version_h) \
> ++                              $(autoksyms_h) include/generated/utsrelease.h
>         $(cmd_crmodverdir)
>
>   archprepare: archheaders archscripts prepare1 scripts



-- 
Best Regards
Masahiro Yamada
