Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC06C5519F
	for <linux-next@archiver.kernel.org>; Wed, 25 Nov 2020 08:36:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C3CA206F9
	for <linux-next@archiver.kernel.org>; Wed, 25 Nov 2020 08:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgKYIg4 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 25 Nov 2020 03:36:56 -0500
Received: from verein.lst.de ([213.95.11.211]:57877 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726361AbgKYIg4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Nov 2020 03:36:56 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id D831068BEB; Wed, 25 Nov 2020 09:36:52 +0100 (CET)
Date:   Wed, 25 Nov 2020 09:36:52 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Christoph Hellwig <hch@lst.de>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with the arm-soc tree
Message-ID: <20201125083652.GA31753@lst.de>
References: <20201125123351.16954b02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125123351.16954b02@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 25, 2020 at 12:33:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got a conflict in:
> 
>   include/linux/dma-mapping.h
> 
> between commit:
> 
>   16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")
> 
> from the arm-soc tree and commit:
> 
>   172292be01db ("dma-mapping: remove dma_virt_ops")
> 
> from the rdma tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the trivial fixup looks obviously good.
