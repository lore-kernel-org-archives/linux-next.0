Return-Path: <SRS0=aXXK=DF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BFCC2D0A8
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 10:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CAA920BED
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 10:16:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ehzyN1qD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgI1KQK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 28 Sep 2020 06:16:10 -0400
Received: from crapouillou.net ([89.234.176.41]:45896 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbgI1KQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 06:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601288167; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eaezfrc/4eiOR0LrVt+JJpCAEUdt+IaeF8unx2pm0xI=;
        b=ehzyN1qDWZTP83bJZcoPKfxN4GLfTJP7C7io1/Emz9nxPArsA9zFA3/UXMFqLh7cnRHTY9
        CIw6MCvQFWJBCvuTP3bHtn3qjbo5foPRCbbgCu3Q/XGgJG5Okf1CtvYQYzlxOS87KB5QL+
        8LhTVU4lqOp6jtu8yEN+M90m7ixPgnU=
Date:   Mon, 28 Sep 2020 12:15:56 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-Id: <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
In-Reply-To: <20200928060427.GA15041@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
        <20200928060427.GA15041@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Christoph,

Le lun. 28 sept. 2020 =E0 8:04, Christoph Hellwig <hch@lst.de> a =E9crit :
> On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
>>  Hi all,
>>=20
>>  After merging the drm tree, today's linux-next build (x86_64=20
>> allmodconfig)
>>  failed like this:
>=20
> The driver needs to switch do dma_alloc_noncoherent + dma_sync_single*
> like the other drivers converted in the dma tree.  Paul, let me know=20
> if
> you have any questions.

I don't dma_alloc* anything, DRM core does. I use the=20
DMA_ATTR_NON_CONSISTENT attr with dma_mmap_attrs(). Is there a=20
replacement for that?

-Paul


