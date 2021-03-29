Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ACFC433E3
	for <linux-next@archiver.kernel.org>; Mon, 29 Mar 2021 08:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1656460234
	for <linux-next@archiver.kernel.org>; Mon, 29 Mar 2021 08:48:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhC2IsN (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 29 Mar 2021 04:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:41004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235956AbhC2Ir4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Mar 2021 04:47:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D38A60234;
        Mon, 29 Mar 2021 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617007676;
        bh=uKsoIvfPCQyym8ZsIsyx6cMAB8DVSvAj2lQgJQ4dH+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eniDypj/6h4V96nAXfsyjYF4wRxli1rlswMGyiBHzpMXzfsKVUZdFPDa1qvrR17a+
         lZT9ayap7nxWOGoNWpoWwG0vurMsHlecv2Z5K4rsShdriruvyCrSqofHvOhlLuSCIq
         ZM3MkNmV91eYcc04VqBnzpPakFgcAM86B967fwa8KK0RoepHm5VIjfhnshI/0r4jVn
         1K388UZ0B5qr8i2XV3TE3Egc8GU473u9qzeQUSaZF0W+LvwRnkKBYt+jOvyBChwWSe
         6+JNSFn5nx9WTp82ruTqshz2Rwv/2N+5C8t1WmeRDYSERvAdwfrYIJWPcAFZk+s81v
         BwHdl08+8OsIQ==
Date:   Mon, 29 Mar 2021 09:47:52 +0100
From:   Will Deacon <will@kernel.org>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Qi Liu <liuqi115@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the arm-perf tree
Message-ID: <20210329084751.GA2965@willie-the-truck>
References: <20210326195240.7b937560@canb.auug.org.au>
 <c39fe821-3eee-9f2a-3539-6a1f2f415414@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c39fe821-3eee-9f2a-3539-6a1f2f415414@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 26, 2021 at 05:07:41PM +0800, Shaokun Zhang wrote:
> Apologies for the mistake.
> 
> Will, shall I send a new version v5 to fix this issue or other?

Please send additional patches on top now that these are queued.

Thanks,

Will
