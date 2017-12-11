From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Date: Mon, 11 Dec 2017 09:22:20 +0900
Message-ID: <CAK7LNAQ=PE2yL8T8AaBqovf54Lo_M7Nq+LpQc9VSKBJUHx67dQ@mail.gmail.com>
References: <20171211095228.21562f56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171211095228.21562f56@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Bart Van Assche <bart.vanassche@wdc.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Hannes Reinecke <hare@suse.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

2017-12-11 7:52 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Masahiro,
>
> After merging the kbuild tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice


I had noticed this before merging it.

I expect somebody will fix drivers/usb/gadget/Kconfig.



> Exposed by commit
>
>   2c37e08464a8 ("kconfig: Warn if choice default is not in choice")
>
> Introduced by commit
>
>   7a9618a22aad ("usb: gadget: allow to enable legacy drivers without USB_ETH")
>
> --
> Cheers,
> Stephen Rothwell






-- 
Best Regards
Masahiro Yamada
