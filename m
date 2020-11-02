Return-Path: <SRS0=YLCN=EI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F095C00A89
	for <linux-next@archiver.kernel.org>; Mon,  2 Nov 2020 10:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E44FB2071E
	for <linux-next@archiver.kernel.org>; Mon,  2 Nov 2020 10:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iCGmG442"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgKBK11 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 2 Nov 2020 05:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgKBK11 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 05:27:27 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29289C0617A6;
        Mon,  2 Nov 2020 02:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=chyZPXcPEyftbKLXMlXQpUobVD4NM6uuWUEYM6jzZNM=; b=iCGmG442EfucMcTK1LSK+U23GI
        kMK1F9AjY28qTha7x5hJJWoFArFEjstM3urLt9nLcDk/17d2cNV6bjwO+kHKthVN+rTGnALJ66FOo
        CjUEPX3ceQvSm4Gir7JtoBKIjlEP2GMhqQInBZ5w+iuj0kJD5MNpYoj1/7V+vvilMxP16XCXytVka
        jrPgzILWDbTyoE8zYtXJMv2DVPBoACIgO4c2ioi3l6zUagyPPhu6MrXtMMAkmbS1YmOe7mCn+GD+2
        RfUToqhXuJ8DKaLLrkViO/1EKjPt9GTAnJsS6i2DCMNANIH47yryu1tmabxC/M9PUf+pmn8JGzDJH
        KBuKDK+g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kZX3P-0007Ua-Em; Mon, 02 Nov 2020 10:27:11 +0000
Date:   Mon, 2 Nov 2020 10:27:11 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@infradead.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian K??nig <christian.koenig@amd.com>,
        Joerg Roedel <jroedel@suse.de>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102102711.GA28511@infradead.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -5,6 +5,9 @@
> >  #include <linux/dma-direction.h>
> >  #include <linux/init.h>
> >  #include <linux/types.h>
> > +#ifndef CONFIG_SWIOTLB
> > +#include <linux/limits.h>
> > +#endif

No conditional includes please.  And the proper fix for the reported
issue is to stop poking into swiotlb internals in random drivers..
