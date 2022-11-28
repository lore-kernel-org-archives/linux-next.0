Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9E7C433FE
	for <linux-next@archiver.kernel.org>; Mon, 28 Nov 2022 02:12:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiK1CMr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 27 Nov 2022 21:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiK1CMm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Nov 2022 21:12:42 -0500
Received: from out30-42.freemail.mail.aliyun.com (out30-42.freemail.mail.aliyun.com [115.124.30.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B99B5591;
        Sun, 27 Nov 2022 18:12:40 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VVnRYts_1669601556;
Received: from 30.221.131.211(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0VVnRYts_1669601556)
          by smtp.aliyun-inc.com;
          Mon, 28 Nov 2022 10:12:37 +0800
Message-ID: <863d66e8-e6d3-d266-7660-a64e54330bdd@linux.alibaba.com>
Date:   Mon, 28 Nov 2022 10:12:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: linux-next: manual merge of the vfs tree with the erofs tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Gao Xiang <hsiangkao@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
References: <20221128091323.246f8ce1@canb.auug.org.au>
From:   Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20221128091323.246f8ce1@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 11/28/22 6:13 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/erofs/fscache.c
> 
> between commit:
> 
>   313e9413d512 ("erofs: switch to prepare_ondemand_read() in fscache mode")
> 
> from the erofs tree and commit:
> 
>   de4eda9de2d9 ("use less confusing names for iov_iter direction initializers")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

It looks good to me.  Thanks.


-- 
Thanks,
Jingbo
