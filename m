Return-Path: <SRS0=H6Dq=AV=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D9BC433E1
	for <linux-next@archiver.kernel.org>; Fri, 10 Jul 2020 12:25:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5316220772
	for <linux-next@archiver.kernel.org>; Fri, 10 Jul 2020 12:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lao89gJb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgGJMZD (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 10 Jul 2020 08:25:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51377 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726950AbgGJMZD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 08:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594383901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=L0hOyZUN+03GuTp9OTs3UI1n+mDLLNwC0EajqWUs9a0=;
        b=Lao89gJbXhhSZFSRiM2SeRBGG0jZp7ubbE5L2TzvnfbN2fn6GQQkTO6ZRVp0BEY2MY9Kws
        QXpvo3g/ZSUCp917YLvHXwWDKIABu6St3lbrYIwSXab6//BVft7paDIEKqpNG04VKwhgnR
        4h0TLf9gBDqhypjU08KRT7AqEsn3KxE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-isWt5DBpN4iNstNBEaMOJQ-1; Fri, 10 Jul 2020 08:25:00 -0400
X-MC-Unique: isWt5DBpN4iNstNBEaMOJQ-1
Received: by mail-qk1-f200.google.com with SMTP id q192so4244578qka.13
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 05:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L0hOyZUN+03GuTp9OTs3UI1n+mDLLNwC0EajqWUs9a0=;
        b=AhByGPJDbFlLe9+G+eljzvkxQco0kLyV1ok1EH4J7rYyx1EbyS65MJXGldqTQQWuCa
         cByPgvgAcBklsmKvGp/KF5A2Nh+xM9y0l+ZV5QuIQGcKrYsbDNP+gFsXzeec7E7UAgct
         H4HYlyPvfI5lo4tWIS8s8aSkkcfyvqUeZq737zAU9+5BstJ0bcfLDoaW6q1SlwqOKTQB
         LuLoQfkaWZWhqCLoSF9m1zI4Lg/vmJZkJTtlm/cPtu8kceJt+V8TFrFu3HxFH+dvLUq1
         ZhyVF+TrCPrPPIZ0S0CZOP8Gj0aJfNmJnxQ8b1zhDvyVpyoOX5JObfZzt2c4HH+GPjkM
         LMyg==
X-Gm-Message-State: AOAM531Xhci1jtQ+kPpHYRW0ti03MIEH+/MR0AzCyRaRbniWpZZ2UHb5
        7rGzLum0Z6qduIc1DCAUglJzpoNYXWdDpF4a5WvARf0rsL485SxoRgc5d+BBgadhMS6biNjWzFU
        QsYXPwXKWqPc879qa7njAuA==
X-Received: by 2002:a37:5c04:: with SMTP id q4mr69897703qkb.192.1594383899628;
        Fri, 10 Jul 2020 05:24:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZCEam4ITHLazo8LlqpUBa3bRvYodX8117NUGTyJ0/4vVQlviNcOv4NGAru2IbJa8w8CcoAA==
X-Received: by 2002:a37:5c04:: with SMTP id q4mr69897670qkb.192.1594383899322;
        Fri, 10 Jul 2020 05:24:59 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c8:6f::1f4f])
        by smtp.gmail.com with ESMTPSA id u27sm7435925qkm.121.2020.07.10.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 05:24:58 -0700 (PDT)
Date:   Fri, 10 Jul 2020 08:24:57 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: Re: Build failure in -next with get_user_pages_remote() API change
Message-ID: <20200710122457.GK199122@xz-x1>
References: <20200710113201.GC5653@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710113201.GC5653@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 10, 2020 at 12:32:01PM +0100, Mark Brown wrote:
> Today's -next fails to build in various arm64 configs with:
> 
> arch/arm64/kernel/mte.c:225:23: error: too many arguments to function call, expected 7, have 8
>                                             &page, &vma, NULL);
>                                                          ^~~~
> ./include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
> #define NULL ((void *)0)
>              ^~~~~~~~~~~
> ./include/linux/mm.h:1705:6: note: 'get_user_pages_remote' declared here
> long get_user_pages_remote(struct mm_struct *mm,
>      ^
> 1 error generated.
> 
> caused by b7363b0ab88d66d3c (mm/gup: remove task_struct pointer for all
> gup code) which updated the signature of get_user_pages_remote() without
> updating the caller in mte.c.

We should need to squash into "mm/gup: remove task_struct pointer for all gup
code" with:

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 934639ab225d..11e558b02a05 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -221,7 +221,7 @@ static int __access_remote_tags(struct task_struct *tsk, struct mm_struct *mm,
                void *maddr;
                struct page *page = NULL;
 
-               ret = get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
+               ret = get_user_pages_remote(mm, addr, 1, gup_flags,
                                            &page, &vma, NULL);
                if (ret <= 0)
                        break;

Seems to be a new caller merged recently, so it got left behind during the
rebases...  Sorry for not noticing that.

Thanks,

-- 
Peter Xu

