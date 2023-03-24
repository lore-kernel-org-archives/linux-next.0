Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AF4C6FD20
	for <linux-next@archiver.kernel.org>; Fri, 24 Mar 2023 12:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjCXMUm (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 24 Mar 2023 08:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbjCXMUl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Mar 2023 08:20:41 -0400
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBAA193F3;
        Fri, 24 Mar 2023 05:20:39 -0700 (PDT)
Received: from zn.tnic (p5de8e687.dip0.t-ipconnect.de [93.232.230.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8A0E01EC06EE;
        Fri, 24 Mar 2023 13:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1679660438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=W7qwz7Ql7y7CV+DirWFnBRzptHWgqPcBxmus4kwAOTg=;
        b=PhGk/z8D7U2+nhlADXeZGtohYvLDCk6nTNVf6CtMFzafVsnYzPNjSYXdxPRj8BdRNSOJ0r
        d2gbUILHNX98yiIbs6uSt6GRRBC0BTWdcanF2wdeJQqMhr9fDPYCKDBfuWrocNlViMEtPk
        XhGcskfkG9ds+PK9wW7LkxelS7xoQKk=
Date:   Fri, 24 Mar 2023 13:20:32 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the edac tree
Message-ID: <20230324122032.GBZB2VkNymL51ObPt+@fat_crate.local>
References: <20230324101812.37f2fe5b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230324101812.37f2fe5b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 24, 2023 at 10:18:12AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   44fe68df7832 ("EDAC/amd64: Rename debug_display_dimm_sizes()")
> 
> is missing a Signed-off-by from its committer.

Fixed.

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
