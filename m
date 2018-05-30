From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Wed, 30 May 2018 10:44:10 +0900
Message-ID: <CAK7LNAT9Cqhabc7xC11ZnRNPbDHEbpmb80hA362vEYDUo=vOpA@mail.gmail.com>
References: <20180530112942.2cfc2251@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530112942.2cfc2251@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

2018-05-30 10:29 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Masahiro,
>
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> make was continually spawning test compiles.
>
> I used the kbuild tree from next-20180529 for today.
>
> A (partial) strace seemed to show that it was testing for compiler flags
> (some more than once).
>

My bad - I need to insert some patches from Nicholas Piggin.

I will fix it for tomorrows' release.

Thanks for the report!




-- 
Best Regards
Masahiro Yamada
