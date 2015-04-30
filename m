From: Bard Liao <bardliao@realtek.com>
Subject: RE: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 30 Apr 2015 02:14:52 +0000
Message-ID: <ABFD875FF5FB574BA706497D987D48D701066634@RTITMBSV03.realtek.com.tw>
References: <20150430120534.366bed94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rtits2.realtek.com ([60.250.210.242]:43078 "EHLO
	rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbbD3CPG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Apr 2015 22:15:06 -0400
In-Reply-To: <20150430120534.366bed94@canb.auug.org.au>
Content-Language: zh-TW
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Dear All,

I will send a patch to fix it immediately.

Thanks.

Bard Liao

Computer Peripherals Business Unit
Realtek Semiconductor Corp.
886-3-578-0211 ext. 3334
bardliao@realtek.com


> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Thursday, April 30, 2015 10:06 AM
> To: Mark Brown; Liam Girdwood
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Bard Liao
> Subject: linux-next: build failure after merge of the sound-asoc tree
> 
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> sound/soc/codecs/rt5645.c: In function 'rt5645_set_jack_detect':
> sound/soc/codecs/rt5645.c:2555:2: error: implicit declaration of function
> 'rt5645_irq_detection' [-Werror=implicit-function-declaration]
>   rt5645_irq_detection(rt5645);
>   ^
> sound/soc/codecs/rt5645.c: At top level:
> sound/soc/codecs/rt5645.c:2591:12: error: static declaration of
> 'rt5645_irq_detection' follows non-static declaration  static int
> rt5645_irq_detection(struct rt5645_priv *rt5645)
>             ^
> sound/soc/codecs/rt5645.c:2555:2: note: previous implicit declaration of
> 'rt5645_irq_detection' was here
>   rt5645_irq_detection(rt5645);
>   ^
> sound/soc/codecs/rt5645.c:2591:12: warning: 'rt5645_irq_detection'
> defined but not used [-Wunused-function]  static int
> rt5645_irq_detection(struct rt5645_priv *rt5645)
>             ^
> 
> Caused by commit 6e747d5311fc ("ASoC: rt5645: Adds push button
> support for rt5650").
> 
> I have used the sound-asoc tree from next-20150429 for today.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> ------Please consider the environment before printing this e-mail.
