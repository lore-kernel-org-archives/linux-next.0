Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67684C4338F
	for <linux-next@archiver.kernel.org>; Fri, 23 Jul 2021 11:14:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4260A60EE2
	for <linux-next@archiver.kernel.org>; Fri, 23 Jul 2021 11:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbhGWKeO (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 23 Jul 2021 06:34:14 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:37862 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbhGWKeO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jul 2021 06:34:14 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 3701A1FF8B;
        Fri, 23 Jul 2021 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1627038887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BgKU+oVyDpJDVR2LplS5YDMjtUltq++qUxahmBkDXCc=;
        b=XnubrHlo4Oq6lHWPxFowlPnyqUjSREs+3a7pReuDNRTdBXBPiiUaUUMC0D5dvRlCrsh/lu
        CX1BfKat0PrKKkDJq6JxKHJHqqP37gtxDDeISxyMQu9RuNqHUTUjerm+LsPtsvfHSzN/0L
        izi+YxhYIe9+15kUHoIR/LcX/TpKUQ0=
Received: from suse.cz (unknown [10.100.224.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 18600A3B8F;
        Fri, 23 Jul 2021 11:14:47 +0000 (UTC)
Date:   Fri, 23 Jul 2021 13:14:46 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chris Down <chris@chrisdown.name>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <YPqkpsc/k0tXfISe@alley>
References: <20210720174300.018cc765@canb.auug.org.au>
 <20210723090136.04ca2091@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723090136.04ca2091@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 2021-07-23 09:01:36, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 20 Jul 2021 17:43:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the printk tree, today's linux-next build (mips allnoconfig)
> > failed like this:
> > 
> > arch/mips/kernel/genex.o: In function `handle_mcheck_int':
> > (.text+0x190c): undefined reference to `printk'
> > arch/mips/kernel/genex.o: In function `handle_reserved_int':
> > (.text+0x1c8c): undefined reference to `printk'
> > 
> > Caused by commit
> > 
> >   337015573718 ("printk: Userspace format indexing support")
> 
> I am still getting these failures.

I have just pushed the proposed fix into printk/linux.git,
branch for-5.15-printk-index.

I am sorry for the delay. I waited for a patch with reasonable commit
message from Chris. I did it myself after all.

Thanks for the report.

Best Regards,
Petr
