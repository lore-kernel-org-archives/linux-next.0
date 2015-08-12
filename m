From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the crypto tree with the imx-mxs tree
Date: Wed, 12 Aug 2015 13:40:56 +0800
Message-ID: <CAAQ0ZWQU+jiUYpHKWh=qh6O4qbtj7kpHiw1LRyE58vdPXfq2vA@mail.gmail.com>
References: <20150812132239.0ce1fe80@canb.auug.org.au>
	<20150812051830.GB6258@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:34805 "EHLO
	mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933579AbbHLFk4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 01:40:56 -0400
Received: by iodb91 with SMTP id b91so9826785iod.1
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2015 22:40:56 -0700 (PDT)
In-Reply-To: <20150812051830.GB6258@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Victoria Milhoan <vicki.milhoan@freescale.com>, Shengjiu Wang <shengjiu.wang@freescale.com>

Herbert,

On Wed, Aug 12, 2015 at 1:18 PM, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Wed, Aug 12, 2015 at 01:22:39PM +1000, Stephen Rothwell wrote:
>>
>> Today's linux-next merge of the crypto tree got a conflict in:
>>
>>   arch/arm/configs/imx_v6_v7_defconfig
>>
>> between commit:
>>
>>   351265f46291 ("ARM: imx_v6_v7_defconfig: build in audio driver")
>>
>> from the imx-mxs tree and commit:
>>
>>   ab86ca0755ec ("ARM: imx_v6_v7_defconfig: Select CAAM")
>>
>> from the crypto tree.
>>
>> I fixed it up (they both removed the same line) and can carry the fix
>> as necessary (no action is required).

Please leave i.MX architecture patches (i.MX patches under arch/arm/)
to me to handle in the future, so that we can avoid such unnecessary
merge conflict.

Shawn
