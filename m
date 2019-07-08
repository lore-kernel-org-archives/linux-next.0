Return-Path: <SRS0=9mSK=VF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DACC0650E
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 03:06:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 360E120665
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 03:06:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUcaenE6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbfGHDGn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 7 Jul 2019 23:06:43 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38981 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728329AbfGHDGn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 7 Jul 2019 23:06:43 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so7480707pls.6
        for <linux-next@vger.kernel.org>; Sun, 07 Jul 2019 20:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+zg+0M0zkNAS0SuHOqKWegA1UTS858+qaWUpu9/V+wc=;
        b=CUcaenE6Hx+EaXJxuc3PpZbSKFOcvV3wAO1qF677ZeX7CPozttghUC9sAXVHaac9F1
         CN0hg9r8TE99GbWcEw25GtVDBckGb4MpYj9cVYmgkCr4S11Ehn5ikHl4H2zz+oXPiOnp
         y1n8Zvqq6wUW7tLPIgFtBvqZUSEtrBZDr5OGNXq+etn1dqQb9kTEe5b4WxXcCXhtrpSQ
         VmlU1BMzN30KZgDhA91ctY/P1soIj2MEbNbA927kfEBteOsOuUH8/iUhI+U71ijrOqXM
         HHqg0hT4BsdU6MRIm3t8WIArdXZVd6sKRTbojnLXIsWaHH5DqYcZeREs5NnmPMykGIJ6
         AuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+zg+0M0zkNAS0SuHOqKWegA1UTS858+qaWUpu9/V+wc=;
        b=HYzGcXx/nj688f4HtX+yGlVkjvebDuQy4XXR54y/RMnY8YjELLQ0yXiSmGc57PVpBE
         N+wZB1ZdUAtDycQedi/PUJsljrIrnqWFvP58biZMpYgGd/ZgU9QNnr5MyBwejeTzvcHx
         bzbvfFumhHOKI7OQccnqre/zIHUYrneXuZy45mEfg/RrZCyBMVj1MNkmVHrXkOe6THnp
         YndZKpEocdamQNIS/KKpcvv+EFua/uSEBungSx5z2vN6886TsFRYCMm+SX79Fq2LWqcq
         ixQ6FviZ8Nxi7iLEQLVhJbvFz3zlxvIUrdCh12ZXFJDqImNSc8IfcAcFGkT8C/ydrwjA
         UL4w==
X-Gm-Message-State: APjAAAVerHGSzbWd6+Yxz9FocxQC8qJNcywRsl4dinY+7EYFUjvq+P5p
        cbAytM9lb7CHDsi9FQeG0xs65A==
X-Google-Smtp-Source: APXvYqyaNb4cwCnEUR+/K1nlLNKEXvbD9jPwAQ59GBUnx1G24lQHQXxkRgnNgcOqxJhvMh6If2WsdA==
X-Received: by 2002:a17:902:1101:: with SMTP id d1mr21610634pla.212.1562555202857;
        Sun, 07 Jul 2019 20:06:42 -0700 (PDT)
Received: from ?IPv6:240e:362:491:e600:9d32:a013:72ad:b4a4? ([240e:362:491:e600:9d32:a013:72ad:b4a4])
        by smtp.gmail.com with ESMTPSA id y8sm17811763pfn.52.2019.07.07.20.06.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jul 2019 20:06:42 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the slave-dma tree
To:     Robin Gong <yibin.gong@nxp.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Vinod Koul <vkoul@kernel.org>,
        John Garry <john.garry@huawei.com>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Angelo Dureghello <angelo@sysam.it>
References: <20190704173108.0646eef8@canb.auug.org.au>
 <VE1PR04MB6638080C43EC68EFF9F7B38A89F60@VE1PR04MB6638.eurprd04.prod.outlook.com>
From:   zhangfei <zhangfei.gao@linaro.org>
Message-ID: <58c9b815-9bfc-449c-6017-c6da582dffc5@linaro.org>
Date:   Mon, 8 Jul 2019 11:06:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6638080C43EC68EFF9F7B38A89F60@VE1PR04MB6638.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi, Robin

On 2019/7/8 上午9:22, Robin Gong wrote:
> Hi Stephen,
> 	That's caused by 'of_irq_count' NOT export to global symbol, and I'm curious why it has been
> here for so long since Zhangfei found it in 2015. https://patchwork.kernel.org/patch/7404681/
> Hi Rob,
> 	Is there something I miss so that Zhangfei's patch not accepted finally?
>
>

I remembered Rob suggested us not using of_irq_count and use 
platform_get_irq etc.
https://lkml.org/lkml/2015/11/18/466

So we remove of_irq_count
commit 8c77dca011125b795bfa1c86f85a80132feee578
Author: John Garry <john.garry@huawei.com>
Date:   Thu Nov 19 20:23:59 2015 +0800

     hisi_sas: Remove dependency on of_irq_count

Thanks
