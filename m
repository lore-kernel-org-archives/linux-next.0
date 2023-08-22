Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE90EE4996
	for <linux-next@archiver.kernel.org>; Tue, 22 Aug 2023 16:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbjHVQwr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 22 Aug 2023 12:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbjHVQwr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Aug 2023 12:52:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9B9128;
        Tue, 22 Aug 2023 09:52:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C90456251D;
        Tue, 22 Aug 2023 16:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84DBC433C8;
        Tue, 22 Aug 2023 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1692723164;
        bh=w1Gqg9Jf63sv7QBKA/8Ygoum7EQLvlr3HxIX8jOYfv4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aq6skD7vQmLC3SqAHv9DAN8xr6jcyUIF/qlaJ6+MaPOt0EI6OyBGSCqknLAFmlyTC
         5B6vn8HoehiBuUoMdD0B4RqvSPp/8Q4Pt6/+N2F2y7SG7+pWhVmDS8zObeRA6YuK+n
         XU9q2hbY5OoWGNASDjAiXMxXU9YCiyspavYx61V0=
Date:   Tue, 22 Aug 2023 09:52:43 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: linux-next: build warning after merge of the mm-stable tree
Message-Id: <20230822095243.2b2f5f96ebb6ea7024b8e619@linux-foundation.org>
In-Reply-To: <20230822165355.5eb8cac1@canb.auug.org.au>
References: <20230822165355.5eb8cac1@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 22 Aug 2023 16:53:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm-stable tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> mm/hugetlb.c:1: warning: no structured comments found
> 
> Introduced by commit
> 
>   9c5ccf2db04b ("mm: remove HUGETLB_PAGE_DTOR")

Seems we removed the last /** comment from hugetlb.c.

Probably htmldocs just shouldn't warn about this.

otoh, hugetlb.c has undocumented EXPORT_SYMBOLs, so a nice
fix would be to document at least those interfaces....
