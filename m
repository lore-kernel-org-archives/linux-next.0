Return-Path: <SRS0=dTEO=DW=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5F0C433DF
	for <linux-next@archiver.kernel.org>; Thu, 15 Oct 2020 07:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1341F22243
	for <linux-next@archiver.kernel.org>; Thu, 15 Oct 2020 07:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbgJOHsZ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 15 Oct 2020 03:48:25 -0400
Received: from verein.lst.de ([213.95.11.211]:59488 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgJOHsZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 03:48:25 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7E64068B05; Thu, 15 Oct 2020 09:48:21 +0200 (CEST)
Date:   Thu, 15 Oct 2020 09:48:21 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, Christoph Hellwig <hch@lst.de>,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for
 IOMMU page tables
Message-ID: <20201015074821.GG14082@lst.de>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com> <20200924090349.GF27174@8bytes.org> <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com> <20200924092546.GJ27174@8bytes.org> <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com> <20200924095629.GL27174@8bytes.org> <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com> <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com> <20201011055258.22337d66@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201011055258.22337d66@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Oct 11, 2020 at 05:53:37AM +1100, Stephen Rothwell wrote:
> Hi Naresh,
> 
> Just adding Christoph and Jim to cc]

Well, a Cc doesn't help on its own.  Can you send an actual bug
report including the setup, warnings and error messages, a bisection
result and the usual suspects?
