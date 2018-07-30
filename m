From: Laura Abbott <labbott@redhat.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Mon, 30 Jul 2018 07:47:52 -0700
Message-ID: <d2a8ceda-a0e7-66a3-4d47-66f1f5f4e839@redhat.com>
References: <20180727190207.7ce1c9b0@canb.auug.org.au>
 <20180727190647.3525f5f7@canb.auug.org.au>
 <20180727205511.7c0f2e62@canb.auug.org.au> <20180727125522.GA6173@arm.com>
 <20180730173356.694fbf4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730173356.694fbf4e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Will Deacon <will.deacon@arm.com>
Cc: Kees Cook <keescook@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: linux-next.vger.kernel.org

On 07/30/2018 12:33 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 27 Jul 2018 13:55:22 +0100 Will Deacon <will.deacon@arm.com> wrote:
>>
>> On Fri, Jul 27, 2018 at 08:55:11PM +1000, Stephen Rothwell wrote:
>>> On Fri, 27 Jul 2018 19:06:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>
>>>> On Fri, 27 Jul 2018 19:02:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>>
>>>>> After merging the kspp tree, today's linux-next build (x86_64
>>>>> allmodconfig) failed like this:
>>>>>
>>>>> cc1: error: plugin stackleak_plugin should be specified before -fplugin-arg-stackleak_plugin-disable in the command line
>>>>>
>>>>> Maybe caused by commit
>>>>>
>>>>>    a8b9eaddb9c0 ("gcc-plugins: Add STACKLEAK plugin for tracking the kernel stack")
>>>>>
>>>>> I have used the kspp tree from next-20180726 for today.
>>>>
>>>> Well, that obviously didn't work since the tree hasn't changed for a
>>>> few days.
>>>>
>>>> I can't see what has interacted to make this happen, so I have dropped
>>>> the kspp tree for today.
>>>
>>> Actually, it may have been caused by commit
>>>
>>>    0b3e336601b8 ("arm64: Add support for STACKLEAK gcc plugin")
>>>
>>> from the arm64 tree.
>>
>> Thanks, Stephen. I managed to reproduce this by merging for-next/kspp from
>> Kees's tree and for-next/core from the arm64 tree. The failure happens when
>> building the EFI stub, so the commit you mention above is almost certainly
>> the culprit.
>>
>> We build the stub with the following GCC invocation:
>>
>>   gcc -Wp,-MD,drivers/firmware/efi/libstub/.efi-stub-helper.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -mcmodel=small -m64 -D__KERNEL__ -O2 -fPIC -fno-strict-aliasing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY -ffreestanding -fno-stack-protector -fplugin-arg-stackleak_plugin-disable   -fno-builtin      -DKBUILD_BASENAME='"efi_stub_helper"' -DKBUILD_MODNAME='"efi_stub_helper"' -c -o drivers/firmware/efi/libstub/.tmp_efi-stub-helper.o drivers/firmware/efi/libstub/ef
 i-stub-helper.c
>>
>> so given that we're not passing any -fplugin= option anyway (because we
>> override KBUILD_CFLAGS for the stub), I don't understand why we need
>> to the disable option at all.
>>
>> Laura?
> 
> So today I am just trying reverting that arm64 tree commit.
> 

It looks like arm and arm64 start from the KBUILD_CFLAGS and
then filter out vs. x86 which just specifies the CFLAGS individually,
hence x86 picking up the disable when there's no plugin at all. This
seems to be the simplest fix unless we want to change arm64 to not
pick up all the KBUILD_CFLAGS to match x86. That seems like a more
involved process though. If this is okay, I can send a patch
that also sticks a comment in there explaining why fixing on arm64
is necessary.

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 25dd2a14560d..31f376279d5c 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -11,7 +11,8 @@ cflags-$(CONFIG_X86)		+= -m$(BITS) -D__KERNEL__ -O2 \
  				   -fPIC -fno-strict-aliasing -mno-red-zone \
  				   -mno-mmx -mno-sse -fshort-wchar
  
-cflags-$(CONFIG_ARM64)		:= $(subst -pg,,$(KBUILD_CFLAGS)) -fpie
+cflags-$(CONFIG_ARM64)		:= $(subst -pg,,$(KBUILD_CFLAGS)) -fpie \
+				   $(DISABLE_STACKLEAK_PLUGIN)
  cflags-$(CONFIG_ARM)		:= $(subst -pg,,$(KBUILD_CFLAGS)) \
  				   -fno-builtin -fpic -mno-single-pic-base
  
@@ -21,7 +22,6 @@ KBUILD_CFLAGS			:= $(cflags-y) -DDISABLE_BRANCH_PROFILING \
  				   -D__NO_FORTIFY \
  				   $(call cc-option,-ffreestanding) \
  				   $(call cc-option,-fno-stack-protector) \
-				   $(DISABLE_STACKLEAK_PLUGIN)
  
  GCOV_PROFILE			:= n
  KASAN_SANITIZE			:= n
