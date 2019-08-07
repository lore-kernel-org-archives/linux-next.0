Return-Path: <SRS0=ikMb=WD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C366C19759
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 07:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC8B921E6C
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 07:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G/pio6E5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfHGHIh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 7 Aug 2019 03:08:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41206 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbfHGHIh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 03:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6oMBJ81nXRB0KFK8KufiKsptCeJsMRRDmyRxvUsPSkQ=; b=G/pio6E5CwweDYTkjY9WyrZyx
        99Og40vF25oNzLL1D4O5lJXOoKtPMSBDBW4UM44fi1NFlerY07eGBN8LZy1Fk7l0osC4S/3hNaI5/
        YkbMubYPzOZfO0zW3EroHHlcanjeqQGDWkHcE81nxYlTVqMKgB3X6xNicXZ3bqTA4KOR+pQRTCIIQ
        BSDpW/THFBljSd46XrrghAsf7Q26y6OeCtqa8fBX2oVeIk5xA5H9gPgVW6eDJ29R9cM/4DGLicTbR
        a+lxRJtA/fV5nMT+E6+h005dvSSAv0Ef8D1r0Wr5LbKgC3xLu4FimAkoc+tsJS2/v/vTgD8Dsttmh
        qsRpkAJ/Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hvG3m-0007yE-Qu; Wed, 07 Aug 2019 07:08:34 +0000
Date:   Wed, 7 Aug 2019 00:08:34 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tao Zhou <tao.zhou1@amd.com>
Cc:     amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
        hawking.zhang@amd.com, dennis.li@amd.com, broonie@kernel.org,
        akpm@linux-foundation.org, christian.koenig@amd.com,
        linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-build-reports@lists.linaro.org
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807070834.GA24792@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 07, 2019 at 10:56:40AM +0800, Tao Zhou wrote:
> readq/writeq are not supported on all architectures

NAK.  You must not use atomic_* on __iomem (MMIO) memory.
