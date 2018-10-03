From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: occassional build errors
Date: Wed, 3 Oct 2018 13:31:54 +0900
Message-ID: <CAK7LNARD6qxX1fz4XF7yj2vWZurayhtksQnGfHBEUtCTNLmGYw@mail.gmail.com>
References: <20181003135038.24438d97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181003135038.24438d97@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, Oct 3, 2018 at 12:51 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> I don't know if that has anything to changes in the kbuild system, but
> since Tuesday, I have been getting random build errors that go away after
> I remove the object directory and build again.


I have no idea.

Is it fine if you use kbuild tree from the last week?


I added 4 kbuild patches this week, but they look irrelevant.

masahiro@pug:~/ref/linux-next$ git log  --oneline
next-20180928..next-20181002  | grep kbuild
4712eca8 Merge remote-tracking branch 'kbuild/for-next'
ae5c311 Merge remote-tracking branch 'kbuild-current/fixes'
7163c4d Merge branch 'kbuild' into for-next
7c59867 kbuild: simplify command line creation in scripts/mkmakefile
23d86e8 kbuild: do not pass $(objtree) to scripts/mkmakefile
166011a kbuild: remove user ID check in scripts/mkmakefile
e4db0f7 kbuild: remove VERSION and PATCHLEVEL from $(objtree)/Makefile



>  The latest example is this:
>
> include/linux/kconfig.h: file not recognized: file format not recognized
> make[2]: *** [scripts/Makefile.build:492: crypto/crypto_user.o] Error 1
> make[1]: *** [Makefile:1057: crypto] Error 2
> make: *** [Makefile:152: sub-make] Error 2
> Command exited with non-zero status 2
>
> It is always complaining about a .h file ...
>
> Makefile:152 is the MAKE lien below:
>
> # Invoke a second make in the output directory, passing relevant variables
> sub-make:
>         $(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR) \
>         -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
>
> Makefile:1057 is the MAKE line below:
>
> PHONY += $(vmlinux-dirs)
> $(vmlinux-dirs): prepare scripts
>         $(Q)$(MAKE) $(build)=$@ need-builtin=1
>
> scripts/Makefile.build:492 is the if_changed line below:
>
> $(multi-used-m): FORCE
>         $(call if_changed,link_multi-m)
>         @{ echo $(@:.o=.ko); echo $(filter-out FORCE,$^); \
>            $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
> $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
>
> Not sure what else I can tell you.
>


Does this happen only when building a module?

Can you provide a procedure
to reproduce this?



-- 
Best Regards
Masahiro Yamada
