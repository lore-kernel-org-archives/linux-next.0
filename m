Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7257E776CE
	for <linux-next@archiver.kernel.org>; Mon,  2 Oct 2023 22:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjJBWOe (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 2 Oct 2023 18:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjJBWOe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Oct 2023 18:14:34 -0400
X-Greylist: delayed 475 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 02 Oct 2023 15:14:31 PDT
Received: from out-199.mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD43991
        for <linux-next@vger.kernel.org>; Mon,  2 Oct 2023 15:14:31 -0700 (PDT)
Date:   Mon, 2 Oct 2023 15:06:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1696284394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZEY9SxAIE8pwzuAQoIBCO5YWA98xQxOlqIWFVS/2M1I=;
        b=Vvr2iKAkPzZQLD9VqcfIlV0sg3xjtI4K8hu+bxCUYvnmd6j0nT4AhTOn0CS6YsuhCA0gmf
        +IH8GSi36LjjcWG1PBLR571DZ9H87slWd9OW+XlWLg3wqhg4ojgsKH6aMk3s8QFtPRgnUa
        hIabfPn7qrEIloMozagpH56qAJj51xU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Roman Gushchin <roman.gushchin@linux.dev>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the mm tree
Message-ID: <ZRs-5gMPrpzONDEQ@P9FQF9L96D>
References: <20231003075522.0284d2b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003075522.0284d2b1@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 03, 2023 at 07:55:22AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   e47f255f6365 ("mm-kmem-add-direct-objcg-pointer-to-task_struct-fix")
> 
> is missing a Signed-off-by from its author.

Hi Stephen,

this commit is a fixup which will be merged into the main commit before
the final merge.

Thank you!
