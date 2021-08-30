Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF38C432BE
	for <linux-next@archiver.kernel.org>; Mon, 30 Aug 2021 07:10:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D171D60FA0
	for <linux-next@archiver.kernel.org>; Mon, 30 Aug 2021 07:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbhH3HLj (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 30 Aug 2021 03:11:39 -0400
Received: from verein.lst.de ([213.95.11.211]:39493 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232855AbhH3HLi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 03:11:38 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id D698568AFE; Mon, 30 Aug 2021 09:10:42 +0200 (CEST)
Date:   Mon, 30 Aug 2021 09:10:42 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Gao Xiang <xiang@kernel.org>,
        Gao Xiang <hsiangkao@linux.alibaba.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Message-ID: <20210830071042.GA2498@lst.de>
References: <20210830170938.6fd8813d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830170938.6fd8813d@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Stephen,

the fixup looks good to me.
