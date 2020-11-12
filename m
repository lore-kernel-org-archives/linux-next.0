Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCF1C2D0E4
	for <linux-next@archiver.kernel.org>; Thu, 12 Nov 2020 21:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FC44216C4
	for <linux-next@archiver.kernel.org>; Thu, 12 Nov 2020 21:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgKLVOJ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 12 Nov 2020 16:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgKLVOJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2020 16:14:09 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC9CC0613D1;
        Thu, 12 Nov 2020 13:14:09 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kdJux-004ZYO-Pz; Thu, 12 Nov 2020 21:14:07 +0000
Date:   Thu, 12 Nov 2020 21:14:07 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20201112211407.GE3576660@ZenIV.linux.org.uk>
References: <20201113080239.2fbbc615@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113080239.2fbbc615@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 13, 2020 at 08:02:39AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   5f85b351d3d6 ("fix return values of seq_read_iter()")
> 
> Fixes tag
> 
>   Fixes: d4d50710a8b (seq_file: add seq_read_iter)
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long

Dealt with and force-pushed...

>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
> 
> Also, just use
> 
>   git log -1 --format='Fixes: %h ("%s")' <commit>
> 
> to generate Fixes tags.

OK, will keep that in mind next time...
