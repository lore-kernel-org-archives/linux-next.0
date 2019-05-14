From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build failure after merge of the ecryptfs tree
Date: Tue, 14 May 2019 09:40:53 +0900
Message-ID: <CAK7LNAT_aJ4-abaNXe5VwvAYa2TOprjFL-vcUc730EDwHq80kw@mail.gmail.com>
References: <20190514100910.6996d2f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514100910.6996d2f5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tyler Hicks <tyhicks@canonical.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, May 14, 2019 at 9:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> I don't know why this suddenly appeared after mergeing the ecryptfs tree
> since nothin has changed in that tree for some time (and nothing in that
> tree seems relevant).
>
> After merging the ecryptfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> scripts/Makefile.modpost:112: target '.tmp_versions/asix.mod' doesn't match the target pattern
> scripts/Makefile.modpost:113: warning: overriding recipe for target '.tmp_versions/asix.mod'
> scripts/Makefile.modpost:100: warning: ignoring old recipe for target '.tmp_versions/asix.mod'
> scripts/Makefile.modpost:127: target '.tmp_versions/asix.mod' doesn't match the target pattern
> scripts/Makefile.modpost:128: warning: overriding recipe for target '.tmp_versions/asix.mod'
> scripts/Makefile.modpost:113: warning: ignoring old recipe for target '.tmp_versions/asix.mod'
> make[2]: Circular .tmp_versions/asix.mod <- __modpost dependency dropped.
> Binary file .tmp_versions/asix.mod matches: No such file or directory
> make[2]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
> make[1]: *** [Makefile:1290: modules] Error 2
>
> The only clue I can see is that asix.o gets built in two separate
> directories (drivers/net/{phy,usb}).


Module name should be unique.

If both are compiled as a module,
they have the same module names:

drivers/net/phy/asix.ko
drivers/net/usb/asix.ko


If you see .tmp_version directory,
you will see asix.mod

Perhaps, one overwrote the other,
or it already got broken somehow.

Thanks.




> I have the following files in the object directory:
>
> ./.tmp_versions/asix.mod
> ./drivers/net/usb/asix.ko
> ./drivers/net/usb/asix.mod.o
> ./drivers/net/usb/asix.o
> ./drivers/net/usb/asix_common.o
> ./drivers/net/usb/asix_devices.o
> ./drivers/net/usb/.asix.ko.cmd
> ./drivers/net/usb/.asix.mod.o.cmd
> ./drivers/net/usb/.asix.o.cmd
> ./drivers/net/usb/asix.mod.c
> ./drivers/net/usb/.asix_common.o.cmd
> ./drivers/net/usb/.asix_devices.o.cmd
> ./drivers/net/phy/asix.ko
> ./drivers/net/phy/asix.o
> ./drivers/net/phy/.asix.ko.cmd
> ./drivers/net/phy/.asix.mod.o.cmd
> ./drivers/net/phy/asix.mod.o
> ./drivers/net/phy/asix.mod.c
> ./drivers/net/phy/.asix.o.cmd
>
> ./.tmp_versions/asix.mod
>
> Looks like this:
>
> ------------------------------------------
> drivers/net/phy/asix.ko
> drivers/net/phy/asix.o
>
>
> ------------------------------------------
>
> What you can't see above are the 256 NUL bytes at the end of the file
> (followed by a NL).
>
> This is from a -j 80 build.  Surely there is a race condition here if the
> file in .tmp_versions is only named for the base name of the module and
> we have 2 modules with the same base name.
>
> I removed that file and redid the build and it succeeded.
>
> Mind you, I have no itdea why this file was begin rebuilt, the merge
> only touched these files:
>
> fs/ecryptfs/crypto.c
> fs/ecryptfs/keystore.c
>
> Puzzled ... :-(
>
> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
