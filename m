Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6D9C433EF
	for <linux-next@archiver.kernel.org>; Thu, 24 Feb 2022 20:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbiBXUVh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 24 Feb 2022 15:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiBXUVg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2022 15:21:36 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE12CB3E6B
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 12:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=92ex6WBiBtLTmwGV37I7WsH60lUrZ0uC77TFThWwYe0=; b=T8ENdmRCsZuAjK7xOAqlOYucq8
        ZAN0KH+kh4p5p8WcjDw4aNOYPmkxrPJHdhLHuip2CE+uPAYIg/aQlxIRgQyJqmrnUO22Puq8gyeWJ
        dru4c+USDQLghtrK9PxBhA7dUnOO69Y2DV4B7zwy4BywIxO9QoVcE6NWu3oxpP9mIwip8SXochatj
        Vwf2rRgDt5cSKXLyeMO7FFZkNM+Pdit8ygVNXQlYVFmOmzcj1gIwgZwJ7/DKAlei4490bsnbXgjxK
        zK8PxsWUH5qbiissNRJ/aKe91SHw2Xt7g9MKX2CNSDfSrSkh1pbtQO7V/amLct5JrIVS84oh9Tapx
        VYG0ksPg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nNKbg-0056pR-4M; Thu, 24 Feb 2022 20:20:56 +0000
Date:   Thu, 24 Feb 2022 20:20:56 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: Please add for-next/execve
Message-ID: <YhfoqF8nj7lQxGDe@casper.infradead.org>
References: <202202232131.809767F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202232131.809767F@keescook>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 23, 2022 at 09:37:51PM -0800, Kees Cook wrote:
> As part of Eric and I stepping up to officially[1] be the execve and
> binfmt maintainers, please add my for-next/execve tree to linux-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/execve
> 
> This tree currently contains all the exec and binfmt patches from mmotm
> as well as at least one newly reviewed change[2].

Hey Kees, Stephen's on holiday this week.  Mark's stepping into his
shoes for another couple of days.
