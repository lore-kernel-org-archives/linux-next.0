Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28524EB64D7
	for <linux-next@archiver.kernel.org>; Tue, 13 Jun 2023 15:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbjFMP7a (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 13 Jun 2023 11:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235140AbjFMP73 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2023 11:59:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EF6E79;
        Tue, 13 Jun 2023 08:59:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C566363500;
        Tue, 13 Jun 2023 15:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1176DC433F0;
        Tue, 13 Jun 2023 15:59:25 +0000 (UTC)
Date:   Tue, 13 Jun 2023 16:59:22 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>, Baoquan He <bhe@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the arm64 tree
Message-ID: <ZIiSWjO2GNouHBKe@arm.com>
References: <20230613162344.1dcb6ac0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613162344.1dcb6ac0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 13, 2023 at 04:23:44PM +1000, Stephen Rothwell wrote:
> After merging the arm64 tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/arm64/kdump.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commit
> 
>   03dc0e05407f ("Documentation: add kdump.rst to present crashkernel reservation on arm64")

Thanks. I have a patch already from Baoquan, I'll push it later today.

-- 
Catalin
