Return-Path: <SRS0=pyx6=DB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45CAC4363D
	for <linux-next@archiver.kernel.org>; Thu, 24 Sep 2020 09:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D6222396E
	for <linux-next@archiver.kernel.org>; Thu, 24 Sep 2020 09:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgIXJ4c (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 24 Sep 2020 05:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgIXJ4c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 05:56:32 -0400
X-Greylist: delayed 3159 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Sep 2020 02:56:32 PDT
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1A6C0613CE;
        Thu, 24 Sep 2020 02:56:32 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id EAE83295; Thu, 24 Sep 2020 11:56:30 +0200 (CEST)
Date:   Thu, 24 Sep 2020 11:56:29 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Poonam Aggrwal <poonam.aggrwal@nxp.com>, robh@kernel.org,
        Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>, Zhiqiang.Hou@nxp.com
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20200924095629.GL27174@8bytes.org>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
> Yes, the issue was introduced by one of the changes in "dma-mapping:
> introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
> the dma-mapping/for-next branch anyway.

Okay, alright then.

