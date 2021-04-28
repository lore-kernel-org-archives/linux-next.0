Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BDAC433B4
	for <linux-next@archiver.kernel.org>; Wed, 28 Apr 2021 04:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40AEE613B3
	for <linux-next@archiver.kernel.org>; Wed, 28 Apr 2021 04:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhD1Ekm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-next@archiver.kernel.org>);
        Wed, 28 Apr 2021 00:40:42 -0400
Received: from out28-124.mail.aliyun.com ([115.124.28.124]:60712 "EHLO
        out28-124.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhD1Ekm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Apr 2021 00:40:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1873538|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0136063-0.000116433-0.986277;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=ren_guo@c-sky.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.K5KZhek_1619584796;
Received: from 30.225.212.191(mailfrom:ren_guo@c-sky.com fp:SMTPD_---.K5KZhek_1619584796)
          by smtp.aliyun-inc.com(10.147.41.121);
          Wed, 28 Apr 2021 12:39:56 +0800
Content-Type: text/plain;
        charset=gb2312
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: linux-next: Signed-off-by missing for commit in the csky tree
From:   Guo Ren <ren_guo@c-sky.com>
In-Reply-To: <20210421214136.2aa5d34b@canb.auug.org.au>
Date:   Wed, 28 Apr 2021 12:39:55 +0800
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <2961F7A8-4BB4-4963-8E57-DDD88020CBDC@c-sky.com>
References: <20210421214136.2aa5d34b@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3445.104.11)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thx, I’ll fixup it.

Best Regards
  Guo Ren



> 在 2021年4月21日，下午7:41，Stephen Rothwell <sfr@canb.auug.org.au> 写道：
> 
> Hi all,
> 
> Commit
> 
>  8bfe70e69658 ("csky: fix syscache.c fallthrough warning")
> 
> is missing a Signed-off-by from its committer.
> 
> -- 
> Cheers,
> Stephen Rothwell

