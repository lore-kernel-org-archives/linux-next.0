From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the kbuild tree with the
 input-current tree
Date: Tue, 28 Mar 2017 09:52:27 +0900
Message-ID: <CAK7LNARP8-KrytLc80YgeAWDjeY6JDgY2+DwyjG0NYySoYyoZg@mail.gmail.com>
References: <20170328095532.04abad61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170328095532.04abad61@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Naohiro Aota <naota@elisp.net>
List-Id: linux-next.vger.kernel.org

Hi Stephen,


2017-03-28 7:55 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Masahiro,
>
> Today's linux-next merge of the kbuild tree got a conflict in:
>
>   include/uapi/linux/Kbuild
>
> between commit:
>
>   5659495a7a14 ("uapi: add missing install of userio.h")
>
> from the input-current tree and commit:
>
>   65017bab8a9e ("uapi: export all headers under uapi directories")
>
> from the kbuild tree.
>
> I fixed it up (the latter supercedes the former, so I just used it) and
> can carry the fix as necessary.

Right.  header-y is no longer needed to export headers.
Thanks!


-- 
Best Regards
Masahiro Yamada
