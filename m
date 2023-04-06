Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD695C77B6F
	for <linux-next@archiver.kernel.org>; Thu,  6 Apr 2023 21:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238615AbjDFVxt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 6 Apr 2023 17:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238602AbjDFVxs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Apr 2023 17:53:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A4EAD2A;
        Thu,  6 Apr 2023 14:53:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D03D64733;
        Thu,  6 Apr 2023 21:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89577C433EF;
        Thu,  6 Apr 2023 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1680818026;
        bh=LGynFdLpXdAw06RcdZ1IJ8GRpyk9viwFXtp1CMy3Wds=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PfHJsdloNeSJFGbIpuAf8ez32Le6aBFxLwe2RLMpelS4FLIASRIXkDABBcuRJdqpt
         avXFdK5fJ+s/6YRl2MvorAusAvoSqw12YQ35vejlnQwr0eCshu50RCEDSFfMPf0+XD
         V9xXKrUuUxd81wn02Pss6/UcMwdiLXIfXQLAfCXA=
Date:   Thu, 6 Apr 2023 14:53:45 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mm/mprotect: Fix do_mprotect_pkey() return on error
Message-Id: <20230406145345.9c5e4c91461cbf42509a92a9@linux-foundation.org>
In-Reply-To: <20230406193050.1363476-1-Liam.Howlett@oracle.com>
References: <20230406193050.1363476-1-Liam.Howlett@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu,  6 Apr 2023 15:30:50 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> When the loop over the VMA is terminated early due to an error, the
> return code could be overwritten with ENOMEM.  Fix the return code by
> only setting the error on early loop termination when the error is not
> set.
> 
> Fixes: 2286a6914c77 ("mm: change mprotect_fixup to vma iterator")
> Cc: <stable@vger.kernel.org>

I do think we should always describe the user-visible effects when
proposing a backport.

a) so the -stable maintainers understand why we're recommending the
   backport and

b) to help some poor soul who is looking at the patch wondering if
   it will fix his customer's bug report.

How's this?

: User-visible effects include: attempts to run mprotect() against a special
: mapping or with a poorly-aligned hugetlb address should return -EINVAL,
: but they presently return -ENOMEM.

