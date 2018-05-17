From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Thu, 17 May 2018 22:45:29 +0900
Message-ID: <CAK7LNATLOynDva0M4LkmubTY1492G_7uabREwiUEUh_rRkkruA@mail.gmail.com>
References: <20180515155038.7387bf2c@canb.auug.org.au> <CAK7LNASNMZbz=re1sRzh8Ffkt8g78=ddV7d_TZm4MVq1+JS-hA@mail.gmail.com>
 <20180516172601.03188b22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180516172601.03188b22@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

Stephen,

2018-05-16 16:26 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Masahiro,
>
> On Wed, 16 May 2018 15:01:38 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>
>> How should I handle your fix-up?
>>
>> May I squash into the original one if you ack to do it,
>> or is it better to keep it as a separate patch?
>
> Either way is fine by me, but the former reduces the bisection gap.  So
> it depends on whether you want to rebase your tree or not.
>
> Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>
>

Thanks!  Squashed now.




> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
