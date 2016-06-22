From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: build warnings after merge of the kspp tree
Date: Wed, 22 Jun 2016 10:39:30 -0700
Message-ID: <CAGXu5jLkJ8jm=MKhzA+e53dLzWLMqcsKJjiuoLxj0_uz0oC7Tg@mail.gmail.com>
References: <20160622151442.5684f922@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160622151442.5684f922@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 21, 2016 at 10:14 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> After merging the kspp tree, today's linux-next build (i386 defconfig)
> produced these warning:
>
> x86_64-linux-gcc: warning: '-mcpu=' is deprecated; use '-mtune=' or '-march=' instead
>
> (over 2000 of these)
>
> Introduced (maybe) by commit
>
>   e2135c84d5d2 ("kbuild: no gcc-plugins during cc-option tests")

This is fixed now in the kspp tree; sorry for the noise. If anyone
wants to manual fix this up for i386 builds:

index 2da7f8eed1d7..f585766989c2 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -109,7 +109,7 @@ as-instr = $(call try-run,\
        printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler
-o "$$TMP" -,$(2),$(3))

 # Do not attempt to build with gcc plugins during cc-option tests.
-CC_OPTION_CFLAGS := $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
+CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))

 # cc-option
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)


-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
