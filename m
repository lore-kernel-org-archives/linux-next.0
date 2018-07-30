From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Mon, 30 Jul 2018 17:37:23 +0100
Message-ID: <20180730163722.GD4276@arm.com>
References: <20180727190207.7ce1c9b0@canb.auug.org.au>
 <20180727190647.3525f5f7@canb.auug.org.au>
 <20180727205511.7c0f2e62@canb.auug.org.au>
 <20180727125522.GA6173@arm.com>
 <20180730173356.694fbf4e@canb.auug.org.au>
 <d2a8ceda-a0e7-66a3-4d47-66f1f5f4e839@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d2a8ceda-a0e7-66a3-4d47-66f1f5f4e839@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Laura,

On Mon, Jul 30, 2018 at 07:47:52AM -0700, Laura Abbott wrote:
> On 07/30/2018 12:33 AM, Stephen Rothwell wrote:
> >On Fri, 27 Jul 2018 13:55:22 +0100 Will Deacon <will.deacon@arm.com> wrote:
> >>On Fri, Jul 27, 2018 at 08:55:11PM +1000, Stephen Rothwell wrote:
> >>>Actually, it may have been caused by commit
> >>>
> >>>   0b3e336601b8 ("arm64: Add support for STACKLEAK gcc plugin")
> >>>
> >>>from the arm64 tree.
> >>
> >>Thanks, Stephen. I managed to reproduce this by merging for-next/kspp from
> >>Kees's tree and for-next/core from the arm64 tree. The failure happens when
> >>building the EFI stub, so the commit you mention above is almost certainly
> >>the culprit.
> >>
> >>We build the stub with the following GCC invocation:
> >>
> >>  gcc -Wp,-MD,drivers/firmware/efi/libstub/.efi-stub-helper.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -mcmodel=small -m64 -D__KERNEL__ -O2 -fPIC -fno-strict-aliasing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY -ffreestanding -fno-stack-protector -fplugin-arg-stackleak_plugin-disable   -fno-builtin      -DKBUILD_BASENAME='"efi_stub_helper"' -DKBUILD_MODNAME='"efi_stub_helper"' -c -o drivers/firmware/efi/libstub/.tmp_efi-stub-helper.o drivers/firmware/efi/libstub/e
 fi-stub-helper.c
> >>
> >>so given that we're not passing any -fplugin= option anyway (because we
> >>override KBUILD_CFLAGS for the stub), I don't understand why we need
> >>to the disable option at all.
> >>
> >>Laura?
> >
> >So today I am just trying reverting that arm64 tree commit.
> >
> 
> It looks like arm and arm64 start from the KBUILD_CFLAGS and
> then filter out vs. x86 which just specifies the CFLAGS individually,
> hence x86 picking up the disable when there's no plugin at all. This
> seems to be the simplest fix unless we want to change arm64 to not
> pick up all the KBUILD_CFLAGS to match x86. That seems like a more
> involved process though. If this is okay, I can send a patch
> that also sticks a comment in there explaining why fixing on arm64
> is necessary.

Indeed, I posted a very similar patch last week!

https://lore.kernel.org/lkml/CAGXu5jJ=0YBYKkQM3=KZRp1o3fT0yGY6-0UDkkit0WenFM3oDg@mail.gmail.com/T/#m1bd3d2de78e33da4d1f496fd82be7cf088ebaa06

If you send a version with a commit message, I'm happy to pick it up.

Cheers,

Will
