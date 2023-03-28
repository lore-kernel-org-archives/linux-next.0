Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624ADC76196
	for <linux-next@archiver.kernel.org>; Tue, 28 Mar 2023 23:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjC1XY3 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 28 Mar 2023 19:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjC1XXb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Mar 2023 19:23:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FA7359C;
        Tue, 28 Mar 2023 16:22:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00DDD619F2;
        Tue, 28 Mar 2023 23:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA66C433D2;
        Tue, 28 Mar 2023 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1680045768;
        bh=itQ+O9nrWrCrQaO9Cf5goSUi9N4Vu8/dsNZjEYWCHwM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JxeWUHmO4rT1sO3+Iz2+Wf/mCj8Y9UqumVVqO+O4DDgRwALAwTeZhfRLNSbasV6gl
         96sENzuAtbWxIxh+E2GE0tCECV/bldhzdJTPr6xVWJQhJASPEAZh9bve8+yuPeV77b
         D2jrZRf5Wg6s2QIGlzL4M33p461SBP5bjDcVaJeg=
Date:   Tue, 28 Mar 2023 16:22:47 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the arm64 tree
Message-Id: <20230328162247.88a61cbd2c12223b7575f727@linux-foundation.org>
In-Reply-To: <20230329093206.6711826e@canb.auug.org.au>
References: <20230329093206.6711826e@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 29 Mar 2023 09:32:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the mm tree as a different commit (but
> the same patch):
> 
>   bfa7965b33ab ("mm,kfence: decouple kfence from page granularity mapping judgement")
> 
> This is commit
> 
>   1224b9c78773 ("mm,kfence: decouple kfence from page granularity mapping judgement")
> 
> in the mm tree.

Thanks, I'll drop the mm.git copy now I know the patch is safe ;)

