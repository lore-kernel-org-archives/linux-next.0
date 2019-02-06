From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: build failure after merge of the compiler-attributes tree
Date: Wed, 6 Feb 2019 22:48:13 +0100
Message-ID: <CANiq72k9VSdZzGcRhZn5JYJ8N6_JPStjQKcr4rac=DNrVfDYtw@mail.gmail.com>
References: <20190207083057.05b40e61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207083057.05b40e61@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, Feb 6, 2019 at 10:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Miguel,
>
> After merging the compiler-attributes tree, today's linux-next build
> (arm multi_v7_defconfig) failed like this:
>
> In file included from arch/arm/crypto/aes-neonbs-glue.c:17:
> include/linux/module.h:138:7: error: section of alias 'cleanup_module' must match section of its target
>   void cleanup_module(void) __exit __attribute__((alias(#exitfn)));
>        ^~~~~~~~~~~~~~
> arch/arm/crypto/aes-neonbs-glue.c:433:1: note: in expansion of macro 'module_exit'
>  module_exit(aes_exit);
>  ^~~~~~~~~~~
>
> Caused by commit
>
>   b31ca3fcca36 ("include/linux/module.h: mark init/cleanup_module aliases as __init/exit")
>
> I have used the compiler-attributes tree from next-20190206 for today.

Yeah, sorry about that! I saw it an hour ago from the build bot and
already took out the branch from -next.

I tested the change on a subset of modules before pushing, but it
turns out there are some modules that do not mark their functions with
__init/__exit and that, in turns, makes GCC complain.

I sent a message about it a few minutes ago:
https://lore.kernel.org/lkml/CANiq72=gS7=G6WbZ4jqybMBh44FeF7UeVEfeb1hN8uMAMt_2bw@mail.gmail.com/

Cheers,
Miguel
