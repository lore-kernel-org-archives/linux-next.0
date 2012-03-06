From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in em-x270.c
Date: Tue, 6 Mar 2012 17:12:18 +0800
Message-ID: <CAN1soZxdT=N1BtK5Jf4+Qu3GGCHPuKK1BqgfEV-D7QorjnsLpg@mail.gmail.com>
References: <1330989122-6323-1-git-send-email-paul.gortmaker@windriver.com>
	<4F55CEDB.90909@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:47023 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173Ab2CFJMT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 04:12:19 -0500
Received: by vbbff1 with SMTP id ff1so4266428vbb.19
        for <linux-next@vger.kernel.org>; Tue, 06 Mar 2012 01:12:19 -0800 (PST)
In-Reply-To: <4F55CEDB.90909@compulab.co.il>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Igor Grinberg <grinberg@compulab.co.il>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Haojian Zhuang <haojian.zhuang@marvell.com>

On Tue, Mar 6, 2012 at 4:46 PM, Igor Grinberg <grinberg@compulab.co.il>=
 wrote:
> Also Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
>
> On 03/06/12 01:12, Paul Gortmaker wrote:
>> Commit 737f360d5bef5e01c6cfa755dca0b449a154c1e0 (linux-next)
>>
>> =A0 "regulator: Remove support for supplies specified by struct devi=
ce"
>>
>> caused this file to break, since it was still relying on the
>> device field to be present. =A0Strip them out here too.
>>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> CC: Mark Brown <broonie@opensource.wolfsonmicro.com>
>
> You've missed the scissors line:
> ---
>
> The patch itself:
>
> Acked-by: Igor Grinberg <grinberg@compulab.co.il>
>
> Thanks
>

Mark,

Could you pick up this patch since it's depend on latest change on regu=
lator?

Best Regards
Haojian
