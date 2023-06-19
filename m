Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730E5EB64D9
	for <linux-next@archiver.kernel.org>; Mon, 19 Jun 2023 21:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjFSVjr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 19 Jun 2023 17:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjFSVjq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2023 17:39:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF151AC;
        Mon, 19 Jun 2023 14:39:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B723760EFB;
        Mon, 19 Jun 2023 21:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE6AC433C8;
        Mon, 19 Jun 2023 21:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1687210785;
        bh=LmVkQX/PSgud5C5kaFd8Qi9HycDPJy7pU+bGS1katlc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Mlg4an2EPq/y60fm8q9ztbq7AQ6sDIaeGahpxiwBcr6i3CkcqiIjF3YlDbvXVC1lS
         pxuHV/BIMzgVdwklNyQhrtNRzmghjYPtxCU17osbQYiZJ9QNvhFQhXIs5v8fmCLwlB
         xbWoPLvRsYSdlCMBfHsMs14TAqiEtlnSsUhuz0tk=
Date:   Mon, 19 Jun 2023 14:39:44 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Will Deacon <will@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        catalin.marinas@arm.com
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
Message-Id: <20230619143944.fb445cb3f28bb839942ed4ae@linux-foundation.org>
In-Reply-To: <20230619204309.GA13937@willie-the-truck>
References: <20230619092355.133c5cdb@canb.auug.org.au>
        <20230619204309.GA13937@willie-the-truck>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 19 Jun 2023 21:43:11 +0100 Will Deacon <will@kernel.org> wrote:

> >   	/*
> >   	 * Do not downgrade mmap_lock if we are next to VM_GROWSDOWN or
> >   	 * VM_GROWSUP VMA. Such VMAs can change their size under
> 
> This resolution seems to be causing horrible problems on arm64 with 16k
> pages. I see things like the crash below, but the two branches being merged
> are fine on their own.

I've dropped the mm.git side of this conflict so next -next should
be better.
