Return-Path: <SRS0=UXhA=CY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205C4C43461
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 13:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B226220B1F
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 13:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nq5Ql2gY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgIONNH (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 15 Sep 2020 09:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIONKw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 09:10:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1636C061788;
        Tue, 15 Sep 2020 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=PQS+OUQVC2DCSJ/qIQHJnim90z7D45tT/9wfG1v63FQ=; b=Nq5Ql2gY/B/cix0nzLYhOKO36Y
        sbarGBIkQc7eSpfJaj47/EXqpAB0AdzoDEdGw4aoiw6mA7ej9Zf5c4vDg3n2v9FbxtqsJWiVvDzqP
        AnXnDyCNw+ckUuZ6fU0jXM+rEGhJCw3tkyrYJlHizNRgqGFX7oKObZACoyyB4n2Oa5i0ZxkUbmM5p
        NIelgNxipN9R8eWvgt5pKGdtWk2Uu2frTZ+j3zlqIWuWABvTDVJI9uM2Mv+KldqCFoasbJTgUm4YS
        OWUWhs4UZPzquI4w0PS2umG4WYlhMGOr3/o3N+l+WDSfU+A4HRg+3VzHA/cfqFxgiKiUssprsl+UW
        i8dMk6ug==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIAjQ-00012k-DB; Tue, 15 Sep 2020 13:10:48 +0000
Date:   Tue, 15 Sep 2020 14:10:48 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, linux-fsdevel@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        William Kucharski <william.kucharski@oracle.com>,
        gandalf@winds.org, Qian Cai <cai@lca.pw>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Michal Hocko <mhocko@suse.com>, Yang Shi <shy828301@gmail.com>,
        Shakeel Butt <shakeelb@google.com>
Subject: Re: BUG: kernel NULL pointer dereference, address: RIP:
 0010:shmem_getpage_gfp.isra.0+0x470/0x750
Message-ID: <20200915131048.GF5449@casper.infradead.org>
References: <CA+G9fYvmut-pJT-HsFRCxiEzOnkOjC8UcksX4v8jUvyLYeXTkQ@mail.gmail.com>
 <20200914115559.GN6583@casper.infradead.org>
 <20200915165243.58379eb7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915165243.58379eb7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 15, 2020 at 04:52:43PM +1000, Stephen Rothwell wrote:
> I have applied that to linux-next today.

Thanks!  Can you also pick up these two:

https://lore.kernel.org/linux-mm/20200914112738.GM6583@casper.infradead.org/
https://lore.kernel.org/linux-mm/20200914165032.GS6583@casper.infradead.org/

