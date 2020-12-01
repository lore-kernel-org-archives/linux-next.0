Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF1FC64E7A
	for <linux-next@archiver.kernel.org>; Tue,  1 Dec 2020 07:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE94C2168B
	for <linux-next@archiver.kernel.org>; Tue,  1 Dec 2020 07:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgLAHrG (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 1 Dec 2020 02:47:06 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:55076 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726314AbgLAHrG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 02:47:06 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0UH7dQ8L_1606808694;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UH7dQ8L_1606808694)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 01 Dec 2020 15:44:55 +0800
Subject: Re: BUG: KASAN: null-ptr-deref in workingset_eviction+0xf2/0x1e0
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        inux-kernel@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
        Cgroups <cgroups@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <guro@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Muchun Song <songmuchun@bytedance.com>,
        alexander.h.duyck@linux.intel.com,
        Yafang Shao <laoar.shao@gmail.com>, richard.weiyang@gmail.co,
        Michal Hocko <mhocko@suse.com>,
        Vlastimil Babka <vbabka@suse.cz>
References: <CA+G9fYtk3fKy7ct-rT=T8iFDhE4CbjGgdfxsOBrKT9y8ntwXyg@mail.gmail.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <58f66f22-fd5f-685d-e608-99c35d89c1a3@linux.alibaba.com>
Date:   Tue, 1 Dec 2020 15:44:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYtk3fKy7ct-rT=T8iFDhE4CbjGgdfxsOBrKT9y8ntwXyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



在 2020/12/1 上午3:52, Naresh Kamboju 写道:
> Crash log:
> -----------
> ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg1
> [  285.862123] ==================================================================
> [  285.863025] BUG: KASAN: null-ptr-deref in workingset_eviction+0xf2/0x1e0
> [  285.863025] Read of size 4 at addr 00000000000000c8 by task kswapd0/245

Hi Naresh,

Good to know you again. :)

Would you like to use command to check whichh line cause the panic:

scripts/faddr2line vmlinux workingset_eviction+0xf2/0x1e0

I can't reproduce it. and my gcc version mismatch with yours.

Thanks
Alex
