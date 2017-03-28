From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Tue, 28 Mar 2017 12:58:40 +0900
Message-ID: <CAK7LNARQ_ntP1yr_BsCU4-NJMW63=8v9CO3RKF7f74tWg-J20A@mail.gmail.com>
References: <20170328143134.186d91e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170328143134.186d91e1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cyril Bur <cyrilbur@gmail.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,


2017-03-28 12:31 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> ./usr/include/linux/aspeed-lpc-ctrl.h:44: found __[us]{8,16,32,64} type without #include <linux/types.h>
>
> Introduced by commit
>
>   6c4e97678501 ("drivers/misc: Add Aspeed LPC control driver")
>
> Probably exposed by commit
>
>   65017bab8a9e ("uapi: export all headers under uapi directories")
>
> from the kbuild tree (since this header had not been explicitly exported).


I think we need to do a similar fixup as the following commit:


commit a9e9c248a03abae123b301804d367ad278dad3a8
Author: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Date:   Mon Mar 27 14:20:11 2017 +0200

    uapi: includes linux/types.h before exporting files


-- 
Best Regards
Masahiro Yamada
