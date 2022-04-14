Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B04CC433EF
	for <linux-next@archiver.kernel.org>; Thu, 14 Apr 2022 15:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237859AbiDNQCE (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 14 Apr 2022 12:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357857AbiDNPdC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Apr 2022 11:33:02 -0400
X-Greylist: delayed 458 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Apr 2022 08:10:56 PDT
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1940F897A
        for <linux-next@vger.kernel.org>; Thu, 14 Apr 2022 08:10:55 -0700 (PDT)
Received: from [192.168.1.101] (abxj52.neoplus.adsl.tpnet.pl [83.9.3.52])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 82EBD3F769;
        Thu, 14 Apr 2022 17:03:14 +0200 (CEST)
Message-ID: <b20bc969-96e6-5368-e3f5-ba2748dae2a0@somainline.org>
Date:   Thu, 14 Apr 2022 17:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220414074005.18cb9ed7@canb.auug.org.au>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220414074005.18cb9ed7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 13.04.2022 23:40, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   5827e2830467 ("arm64: dts: qcom: msm8994: Fix sleep clock name")
> 
> Fixes tag
> 
>   Fixes: 9204da57cd65 ("arm64: dts: qcom: msm8994: Provide missing "xo_board" and "sleep_clk" to GCC")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 4dd1ad619274 ("arm64: dts: qcom: msm8994: Provide missing "xo_board" and "sleep_clk" to GCC")
Yes, precisely this. Sorry for that, I probably forgot to rebase my local tree before checking that commit hash..

Bjorn, could you please fix that up directly in your tree?

Konrad
> 
> Also, please keep all the commit message tags together at the end of
> the commit message.
> 
