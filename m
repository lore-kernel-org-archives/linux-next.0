From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Tue, 31 Jul 2018 11:09:18 +0100
Message-ID: <20180731100918.GC23281@arm.com>
References: <20180727190207.7ce1c9b0@canb.auug.org.au>
 <20180727190647.3525f5f7@canb.auug.org.au>
 <20180727205511.7c0f2e62@canb.auug.org.au>
 <20180727125522.GA6173@arm.com>
 <20180730173356.694fbf4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730173356.694fbf4e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <keescook@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>, Laura Abbott <labbott@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 30, 2018 at 05:33:56PM +1000, Stephen Rothwell wrote:
> On Fri, 27 Jul 2018 13:55:22 +0100 Will Deacon <will.deacon@arm.com> wrote:
> > Thanks, Stephen. I managed to reproduce this by merging for-next/kspp from
> > Kees's tree and for-next/core from the arm64 tree. The failure happens when
> > building the EFI stub, so the commit you mention above is almost certainly
> > the culprit.
> > 
> > We build the stub with the following GCC invocation:
> > 
> >  gcc -Wp,-MD,drivers/firmware/efi/libstub/.efi-stub-helper.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -mcmodel=small -m64 -D__KERNEL__ -O2 -fPIC -fno-strict-aliasing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY -ffreestanding -fno-stack-protector -fplugin-arg-stackleak_plugin-disable   -fno-builtin      -DKBUILD_BASENAME='"efi_stub_helper"' -DKBUILD_MODNAME='"efi_stub_helper"' -c -o drivers/firmware/efi/libstub/.tmp_efi-stub-helper.o drivers/firmware/efi/libstub/ef
 i-stub-helper.c
> > 
> > so given that we're not passing any -fplugin= option anyway (because we
> > override KBUILD_CFLAGS for the stub), I don't understand why we need
> > to the disable option at all.
> > 
> > Laura?
> 
> So today I am just trying reverting that arm64 tree commit.

I've pushed out Laura's fix to the arm64 for-next/core branch, so this
should be resolved in the next next.

Will
