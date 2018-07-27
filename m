From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Fri, 27 Jul 2018 09:00:19 -0700
Message-ID: <CAGXu5jJ=0YBYKkQM3=KZRp1o3fT0yGY6-0UDkkit0WenFM3oDg@mail.gmail.com>
References: <20180727190207.7ce1c9b0@canb.auug.org.au> <20180727190647.3525f5f7@canb.auug.org.au>
 <20180727205511.7c0f2e62@canb.auug.org.au> <20180727125522.GA6173@arm.com>
 <20180727130106.GB6173@arm.com> <20180727132742.GB28549@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727132742.GB28549@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>, Laura Abbott <labbott@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 27, 2018 at 6:27 AM, Will Deacon <will.deacon@arm.com> wrote:
> On Fri, Jul 27, 2018 at 02:01:06PM +0100, Will Deacon wrote:
>> On Fri, Jul 27, 2018 at 01:55:22PM +0100, Will Deacon wrote:
>> > On Fri, Jul 27, 2018 at 08:55:11PM +1000, Stephen Rothwell wrote:
>> > > On Fri, 27 Jul 2018 19:06:47 +1000 Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
>> > > >
>> > > > On Fri, 27 Jul 2018 19:02:07 +1000 Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
>> > > > >
>> > > > > After merging the kspp tree, today's linux-next build (x86_64
>> > > > > allmodconfig) failed like this:
>> > > > >
>> > > > > cc1: error: plugin stackleak_plugin should be specified before -=
fplugin-arg-stackleak_plugin-disable in the command line
>> > > > >
>> > > > > Maybe caused by commit
>> > > > >
>> > > > >   a8b9eaddb9c0 ("gcc-plugins: Add STACKLEAK plugin for tracking =
the kernel stack")
>> > > > >
>> > > > > I have used the kspp tree from next-20180726 for today.
>> > > >
>> > > > Well, that obviously didn't work since the tree hasn't changed for=
 a
>> > > > few days.
>> > > >
>> > > > I can't see what has interacted to make this happen, so I have dro=
pped
>> > > > the kspp tree for today.
>> > >
>> > > Actually, it may have been caused by commit
>> > >
>> > >   0b3e336601b8 ("arm64: Add support for STACKLEAK gcc plugin")
>> > >
>> > > from the arm64 tree.
>> >
>> > Thanks, Stephen. I managed to reproduce this by merging for-next/kspp =
from
>> > Kees's tree and for-next/core from the arm64 tree. The failure happens=
 when
>> > building the EFI stub, so the commit you mention above is almost certa=
inly
>> > the culprit.
>> >
>> > We build the stub with the following GCC invocation:
>> >
>> >  gcc -Wp,-MD,drivers/firmware/efi/libstub/.efi-stub-helper.o.d  -nostd=
inc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include=
 -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./=
arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi=
 -include ./include/linux/kconfig.h -include ./include/linux/compiler_types=
.h -D__KERNEL__ -mcmodel=3Dsmall -m64 -D__KERNEL__ -O2 -fPIC -fno-strict-al=
iasing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -DDISABLE_BRANCH_PROFI=
LING -D__NO_FORTIFY -ffreestanding -fno-stack-protector -fplugin-arg-stackl=
eak_plugin-disable   -fno-builtin      -DKBUILD_BASENAME=3D'"efi_stub_helpe=
r"' -DKBUILD_MODNAME=3D'"efi_stub_helper"' -c -o drivers/firmware/efi/libst=
ub/.tmp_efi-stub-helper.o drivers/firmware/efi/libstub/efi-stub-helper.c
>> >
>> > so given that we're not passing any -fplugin=3D option anyway (because=
 we
>> > override KBUILD_CFLAGS for the stub), I don't understand why we need
>> > to the disable option at all.
>> >
>> > Laura?
>>
>> ... ah, but arm and arm64 inherit the old KBUILD_CFLAGS via the
>> cflags-$(CONFIG_ARM64) and cflags-$(CONFIG_ARM) definitions, so they
>> would be the places where we need to disable the plugin.
>
> i.e. something like the diff below.
>
> Will
>
> --->8
>
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi=
/libstub/Makefile
> index 25dd2a14560d..f3700fe08908 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -11,9 +11,11 @@ cflags-$(CONFIG_X86)         +=3D -m$(BITS) -D__KERNEL=
__ -O2 \
>                                    -fPIC -fno-strict-aliasing -mno-red-zo=
ne \
>                                    -mno-mmx -mno-sse -fshort-wchar
>
> -cflags-$(CONFIG_ARM64)         :=3D $(subst -pg,,$(KBUILD_CFLAGS)) -fpie
> +cflags-$(CONFIG_ARM64)         :=3D $(subst -pg,,$(KBUILD_CFLAGS)) -fpie=
 \
> +                                  $(DISABLE_STACKLEAK_PLUGIN)
>  cflags-$(CONFIG_ARM)           :=3D $(subst -pg,,$(KBUILD_CFLAGS)) \
> -                                  -fno-builtin -fpic -mno-single-pic-bas=
e
> +                                  -fno-builtin -fpic -mno-single-pic-bas=
e \
> +                                  $(DISABLE_STACKLEAK_PLUGIN)
>
>  cflags-$(CONFIG_EFI_ARMSTUB)   +=3D -I$(srctree)/scripts/dtc/libfdt
>
> @@ -21,7 +23,6 @@ KBUILD_CFLAGS                 :=3D $(cflags-y) -DDISABL=
E_BRANCH_PROFILING \
>                                    -D__NO_FORTIFY \
>                                    $(call cc-option,-ffreestanding) \
>                                    $(call cc-option,-fno-stack-protector)=
 \
> -                                  $(DISABLE_STACKLEAK_PLUGIN)
>
>  GCOV_PROFILE                   :=3D n
>  KASAN_SANITIZE                 :=3D n

Ah! Thanks for tracking this down!

-Kees

--=20
Kees Cook
Pixel Security
