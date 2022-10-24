Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27CAC3A59D
	for <linux-next@archiver.kernel.org>; Mon, 24 Oct 2022 06:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJXGe0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 24 Oct 2022 02:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJXGeZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Oct 2022 02:34:25 -0400
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5785D0C1;
        Sun, 23 Oct 2022 23:34:19 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VSt0AJb_1666593256;
Received: from 192.168.199.158(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0VSt0AJb_1666593256)
          by smtp.aliyun-inc.com;
          Mon, 24 Oct 2022 14:34:16 +0800
Message-ID: <a49605d6-6e1f-78c8-9774-423891089052@linux.alibaba.com>
Date:   Sun, 23 Oct 2022 23:34:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: linux-next: Signed-off-by missing for commit in the
 kbuild-current tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221023124810.51b1201b@canb.auug.org.au>
From:   Dan Li <ashimida@linux.alibaba.com>
In-Reply-To: <20221023124810.51b1201b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 10/22/22 18:48, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>    9a21115ca50e ("Documentation: kbuild: Add description of git for reproducible builds")
> 
> is missing a Signed-off-by from its committer.
> 
> Also, I am guessing (I haven't actually done the build, yet) that this
> will produce a new build warning from (e.g.) "make htmldocs", as the
> underlining of the new "Git" header line is longer than it should be.

Oh yes, I didn't see a warning when compiling, but it should be aligned
here, sorry for the typo.

To Masahiro:
Do I need to submit a V2 to remove the extra underscore here? I'm willing
to if needed :)

Thanks, Dan.

> 
