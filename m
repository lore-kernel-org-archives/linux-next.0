From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Oct 31 (vboxguest)
Date: Wed, 31 Oct 2018 22:41:20 +0100
Message-ID: <CAK8P3a3aygFrD3PyZ8P==JzeYamE-x--MWCL54xzXDE_8u_R6Q@mail.gmail.com>
References: <20181031145907.1ee2e866@canb.auug.org.au> <661e44c7-396a-6d58-efa7-ed292f2677c6@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <661e44c7-396a-6d58-efa7-ed292f2677c6@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Changbin Du <changbin.du@gmail.com>
List-Id: linux-next.vger.kernel.org

On 10/31/18, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/30/18 8:59 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v4.21/v5.1 code to your linux-next included trees
>> until after the merge window closes.
>>
>> Changes since 20181030:
>>
>
>
> on i386:
>
> ld: drivers/virt/vboxguest/vboxguest_core.o: in function
> `vbg_ioctl_hgcm_call':
> vboxguest_core.c:(.text+0x212b): undefined reference to `vbg_hgcm_call32'
>
>
> Full randconfig file is attached.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

I ran into the same thing, and lots of others like it; they all go back to
the -Og compiler option introduced in commit 94c7dfd01652 ("kernel
hacking: support building kernel with -Og optimization level").


I have patches for most of these, but I'd prefer if we could leave
that patch out of 4.20 for now, and have it in linux-next for merging
into the next merge window, to give us more time to fix up all the
regressions. This particular instance is fixed by the patch below.

Other symptoms caused by the change are tons of 'section mismatch'
warnings for functions that are no longer automatically inlined, and
sprintf format string overflow warnings when gcc fails to propagate
an upper bound on an integer argument that is printed into a fixed
length string.

     Arnd
---
>From 8172e650c6797b9cc64c6f7b1c9e5433156290cc Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 31 Oct 2018 16:24:35 +0100
Subject: [PATCH] vbox: fix link error with 'gcc -Og'

With the new CONFIG_CC_OPTIMIZE_FOR_DEBUGGING option, we get a link
error in the vboxguest driver, when that fails to optimize out the
call to the compat handler:

drivers/virt/vboxguest/vboxguest_core.o: In function `vbg_ioctl_hgcm_call':
vboxguest_core.c:(.text+0x1f6e): undefined reference to `vbg_hgcm_call32'

Another compile-time check documents better what we want and avoids
the error.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/virt/vboxguest/vboxguest_core.c
b/drivers/virt/vboxguest/vboxguest_core.c
index 3093655c7b92..1475ed5ffcde 100644
--- a/drivers/virt/vboxguest/vboxguest_core.c
+++ b/drivers/virt/vboxguest/vboxguest_core.c
@@ -1312,7 +1312,7 @@ static int vbg_ioctl_hgcm_call(struct vbg_dev *gdev,
 		return -EINVAL;
 	}

-	if (f32bit)
+	if (IS_ENABLED(CONFIG_COMPAT) && f32bit)
 		ret = vbg_hgcm_call32(gdev, client_id,
 				      call->function, call->timeout_ms,
 				      VBG_IOCTL_HGCM_CALL_PARMS32(call),
