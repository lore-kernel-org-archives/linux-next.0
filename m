From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: occassional build errors
Date: Thu, 4 Oct 2018 12:09:54 +0900
Message-ID: <CAK7LNAQsvtyU_2Lm4gPSU=q9KeAwjPCfQiwUeOjw=JjUpks_Pw@mail.gmail.com>
References: <20181003135038.24438d97@canb.auug.org.au> <CAK7LNARD6qxX1fz4XF7yj2vWZurayhtksQnGfHBEUtCTNLmGYw@mail.gmail.com>
 <20181003165534.4bc87bbe@canb.auug.org.au> <20181004103937.5601c02a@canb.auug.org.au>
 <20181004115653.6a97e131@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004115653.6a97e131@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,


On Thu, Oct 4, 2018 at 10:57 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> On Thu, 4 Oct 2018 10:39:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Wed, 3 Oct 2018 16:55:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > > >  The latest example is this:
> > > > >
> > > > > include/linux/kconfig.h: file not recognized: file format not recognized
> > > > > make[2]: *** [scripts/Makefile.build:492: crypto/crypto_user.o] Error 1
> > > > > make[1]: *** [Makefile:1057: crypto] Error 2
> > > > > make: *** [Makefile:152: sub-make] Error 2
> > > > > Command exited with non-zero status 2
> > > > >
> > > > > It is always complaining about a .h file ...
> > > > >
> > > > > Makefile:152 is the MAKE lien below:
> > > > >
> > > > > # Invoke a second make in the output directory, passing relevant variables
> > > > > sub-make:
> > > > >         $(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR) \
> > > > >         -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
> > > > >
> > > > > Makefile:1057 is the MAKE line below:
> > > > >
> > > > > PHONY += $(vmlinux-dirs)
> > > > > $(vmlinux-dirs): prepare scripts
> > > > >         $(Q)$(MAKE) $(build)=$@ need-builtin=1
> > > > >
> > > > > scripts/Makefile.build:492 is the if_changed line below:
> > > > >
> > > > > $(multi-used-m): FORCE
> > > > >         $(call if_changed,link_multi-m)
> > > > >         @{ echo $(@:.o=.ko); echo $(filter-out FORCE,$^); \
> > > > >            $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
> > > > > $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
> > > > >
> > > > > Not sure what else I can tell you.
> > > >
> > > > Does this happen only when building a module?
> > >
> > > I don't know, sorry, I build with -s and -j80, so it is hard to tell
> > > what it is currently up to.
> >
> > Today, I got this from the x86_64 allmodconfig build after merging the hid tree:
> >
> > x86_64-linux-gnu-ld: include/config/acpi.h: file not recognized: file truncated
> > make[4]: *** [/home/sfr/next/next/scripts/Makefile.build:492: drivers/hid/i2c-hid/i2c-hid.o] Error 1
> > make[3]: *** [/home/sfr/next/next/scripts/Makefile.build:520: drivers/hid/i2c-hid] Error 2
> > make[2]: *** [/home/sfr/next/next/scripts/Makefile.build:520: drivers/hid] Error 2
> > make[1]: *** [/home/sfr/next/next/Makefile:1057: drivers] Error 2
> > make: *** [Makefile:152: sub-make] Error 2
>
> OK, it seems to have to do with an object changing from a simple build
> to a multi object build.
>
> i.e. Tuesday's linux-next has these changes:
>
>  obj-$(CONFIG_CRYPTO_USER) += crypto_user.o
> +crypto_user-y := crypto_user_base.o crypto_user_stat.o
>  obj-$(CONFIG_CRYPTO_CMAC) += cmac.o
>
>  obj-$(CONFIG_I2C_HID)                          += i2c-hid.o
> +
> +i2c-hid-objs                                   =  i2c-hid-core.o
> +i2c-hid-$(CONFIG_DMI)                          += i2c-hid-dmi-quirks.o
>


OK, confirmed.


This is a regression of

commit bb5de5d28f730eeec0aa1ced51a6f11327cd1201
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu Sep 13 17:20:41 2018 +0900

    kbuild: remove unneeded link_multi_deps



I will fix like follows for tomorrow's linux-next.  Thanks!




diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d7fa203..f21b48d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -486,11 +486,11 @@ targets += $(obj)/lib-ksyms.o
 endif

 quiet_cmd_link_multi-m = LD [M]  $@
-cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter-out FORCE,$^)
$(cmd_secanalysis)
+cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
$(cmd_secanalysis)

 $(multi-used-m): FORCE
        $(call if_changed,link_multi-m)
-       @{ echo $(@:.o=.ko); echo $(filter-out FORCE,$^); \
+       @{ echo $(@:.o=.ko); echo $(filter %.o,$^); \
           $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)




-- 
Best Regards
Masahiro Yamada
