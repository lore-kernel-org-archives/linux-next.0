From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Mon, 4 Jun 2018 10:39:46 +0200
Message-ID: <CAK8P3a0K_=dHfsJOkFd5DWMs6i6bxm+2vRbYAc3UEr1bYpNb5g@mail.gmail.com>
References: <20180531084037.2f8b4c1e@canb.auug.org.au> <CAK7LNAQjVCPwfJ-opUkW3+XTM0uk9PSo3XiyGwCAMKkK05WnxA@mail.gmail.com>
 <CAGXu5jK8OSJXT5eGK=J0msL9kc+fjOxFUyv=5NYbOH8savc5Xw@mail.gmail.com>
 <CAGXu5jKb9f7Or9z3eBzAUci2teE6ULVjkuqv00O_j3VuowwbJw@mail.gmail.com>
 <CAK7LNASYTVNque5kgq7FnyOSjX4byBsWhfB-0Jy9Fp0ZmpuqYA@mail.gmail.com>
 <CAGXu5jK8F_R-CAt8h92ZG51s5eSnV+6FASLmYCWWgRX_2_m8zA@mail.gmail.com> <CAK8P3a2h1WZ=Jg4MAHoyCt_YLNRCCBG-JRUfy2qZpQ6trRHesg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2h1WZ=Jg4MAHoyCt_YLNRCCBG-JRUfy2qZpQ6trRHesg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, Jun 2, 2018 at 10:39 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> I ran into the same thing indepently and bisected it (which led me to
> arrive at this thread).
> One additional bit of information I have is that this happens with all
> versions of
> gcc-7 for me, but not gcc-6.3 or older.
>
> Another finding was the particular instance I noticed:
>
> fs/ext4/inode.c: In function 'ext4_inode_csum':
> fs/ext4/inode.c:83:1: warning: the frame size of 1688 bytes is larger
> than 500 bytes [-Wframe-larger-than=]
>
> comes from inlining the same function multiple times; ext4_inode_csum()
> repeatedly calls ext4_chksum(), which has a struct on the stack. Apparently
> this normally only takes up stack space only once, but when initializing it
> to zero, each instance takes an additional two CRYPTO_MINALIGN bytes
> of stack space (the size of the locally defined structure).

Two more things:

* I believe we still want to leave
  CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL depending on
  !COMPILE_TEST indefinitely. The reason is that it effectively turns off
  -Wmaybe-uninitialized warnings by initializing all structures, so we would
  miss those warnings in allmodconfig builds otherwise. Obviously
  that shouldn't stop of from fixing the excessive stack usage.

* Here is the full list of instances in which a function stack usage grows
   beyond the warning limit with CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
   enabled, after several hundred randconfig builds on arm32/arm64/x86:

drivers/media/dvb-core/dvb_frontend.c: In function 'dvb_frontend_handle_ioctl':
drivers/media/dvb-core/dvb_frontend.c:2647:1: error: the frame size of
1032 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
fs/ext4/super.c: In function 'ext4_group_desc_csum':
fs/ext4/super.c:2306:1: error: the frame size of 1160 bytes is larger
than 1024 bytes [-Werror=frame-larger-than=]
fs/ext4/xattr.c: In function 'ext4_xattr_block_csum':
fs/ext4/xattr.c:147:1: error: the frame size of 1168 bytes is larger
than 1024 bytes [-Werror=frame-larger-than=]
fs/f2fs/inode.c: In function 'f2fs_inode_chksum':
fs/f2fs/inode.c:156:1: error: the frame size of 1424 bytes is larger
than 1024 bytes [-Werror=frame-larger-than=]
net/bluetooth/l2cap_core.c: In function 'l2cap_recv_frame':
net/bluetooth/l2cap_core.c:6976:1: error: the frame size of 2240 bytes
is larger than 2048 bytes [-Werror=frame-larger-than=]
drivers/media/i2c/soc_camera/ov9740.c: In function 'ov9740_set_res':
drivers/media/i2c/soc_camera/ov9740.c:668:1: error: the frame size of
2768 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]

I did not see the brcmsmac warning on my builds though, so presumably there are
some others as well.

     Arnd
