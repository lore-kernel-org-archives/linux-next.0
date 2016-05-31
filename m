From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build warnings after merge of the sound-asoc tree
Date: Tue, 31 May 2016 09:16:26 +0100
Message-ID: <20160531081626.GI20422@localhost.localdomain>
References: <20160531114357.5010daa3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:59132 "EHLO
	mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755457AbcEaIQ3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 31 May 2016 04:16:29 -0400
Content-Disposition: inline
In-Reply-To: <20160531114357.5010daa3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 31, 2016 at 11:43:57AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> sound/soc/codecs/cs47l24.c: In function 'cs47l24_adsp2_irq'
> :
> sound/soc/codecs/cs47l24.c:1091:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>              (void *)i);
>              ^
> sound/soc/codecs/wm5110.c: In function 'wm5110_adsp2_irq':
> sound/soc/codecs/wm5110.c:2246:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>              (void *)i);
>              ^
> 
> Introduced by commit
> 
>   7baa7e2490e1 ("ASoC: arizona: Add event notification on voice trigger events")

Apologies I will get a fix out today.

Thanks,
Charles
