Return-Path: <SRS0=UXhA=CY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B0CC433E2
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 13:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77AB220829
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 13:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c4ffScwj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgIONJn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 15 Sep 2020 09:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgIONJO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 09:09:14 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308C3C06174A
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=kwi5xTW8GuxsUKcivQn36NFaCt8761GZDrxY8Oy02ps=; b=c4ffScwjfqCWw+EdTDmxxD0/Md
        YVp4M/VSs7XaKf7niEJ7dzN51KxWBBeS4Bt/m867fSCGf0zVWC10Fx+mLWpxMzcjJw3rcb7pzwxJG
        1OlgT1smvxIQ2XLtD80u6Nn3mkF2r/DdKiQ7uyz3AP9pQbl4zOvLY/ds84QxVFBWQpJC/dW9N9kYQ
        6XcIrikGD4tlrj9wK7VvwGe5ggR8XZCTKculT8VAfSklViHBrPslJAH2umvg57m9FxNl6zV/ZyIT6
        AxCsofUr9omwct1yz40TlKwfqus5qAYhy2eV1shZxesO8zs8391YEV4tlerCyksSyZz2vB1NP1FLF
        yp/GMkyA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIAhn-0000sv-NA; Tue, 15 Sep 2020 13:09:07 +0000
Date:   Tue, 15 Sep 2020 14:09:07 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.9.0-rc5-20200914] Kernel crash while running LTP(mlock201)
Message-ID: <20200915130907.GE5449@casper.infradead.org>
References: <3DCED508-4DC0-42AA-9CFF-3AB260ED1E9A@linux.vnet.ibm.com>
 <87o8m7p9jd.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8m7p9jd.fsf@mpe.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 15, 2020 at 09:24:38PM +1000, Michael Ellerman wrote:
> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> > While running LTP tests (specifically mlock201) against next-20200914 tree
> > on a POWER9 LPAR results in following crash.
> 
> Looks the same as:
> 
> https://lore.kernel.org/linux-mm/20200914085545.GB28738@shao2-debian/

https://lore.kernel.org/linux-mm/20200914112738.GM6583@casper.infradead.org/
