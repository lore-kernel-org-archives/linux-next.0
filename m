From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the crypto tree with the kbuild tree
Date: Tue, 11 Apr 2017 16:51:08 +0900
Message-ID: <CAK7LNAQgXTZ2We3KXb1OuUDWUP=RmMfVAVGLBZ3xVqKhZH_Y4w@mail.gmail.com>
References: <20170411102119.102f4675@canb.auug.org.au> <20170411024215.GA10664@gondor.apana.org.au>
 <20170411150250.49996951@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:32023 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752827AbdDKHvM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Apr 2017 03:51:12 -0400
In-Reply-To: <20170411150250.49996951@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>

Hi Linus, Stephen,


2017-04-11 14:02 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Herbert,
>
> On Tue, 11 Apr 2017 10:42:15 +0800 Herbert Xu <herbert@gondor.apana.org.a=
u> wrote:
>>
>> Actually the patch in the kbuild tree should be reverted because
>> we have now increased the in-kernel length limit and this must not
>> be directly exposed to user-space or it'll break compatibility.
>
> So basically we need CRYPTO_MAX_ALG_NAME to be 64 in the exported
> header but 128 in the kernel header?  In which case the kbuild patch
> needs to be changed not removed.  Or the merge resolution needs to be
> cleverer.


In the development cycle for 4.12-rc1, some patches
from Kbuild cause conflicts in linux-next from time to time.

The patches in linux-kbuild/uapi branch touched some files
in other subsystems because they are prerequisites
to export the uapi directory as-is.

Most of the conflicts are trivial to fix-up,
and they are handled nicely thanks to Stephen.

But, today's one is hard:
https://lkml.org/lkml/2017/4/10/1208

As Herbert suggested, the easiest way is to revert
c394d1683, but reverting it will cause an error in Kbuild tree:
.../linux/cryptouser.h:58:16: error: =E2=80=98CRYPTO_MAX_ALG_NAME=E2=80=99 =
undeclared
here (not in a function)


So, I will rebase the linux-kbuild/uapi branch onto Linus's tree
(resolving all conflicts) after crypto changes are pulled
during the next merge window.

Then, I will send the kbuild/uapi pull request so that Linus can pull
it with no (less) conflicts.

The commit c394d1683 will effectively be dropped.

I think this is the cleanest way to fix the issue.

Please let me know if you see problems in this plan.

Thanks.


--=20
Best Regards
Masahiro Yamada
