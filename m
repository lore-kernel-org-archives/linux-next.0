Return-Path: <SRS0=4Ai6=DO=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6499BC41604
	for <linux-next@archiver.kernel.org>; Wed,  7 Oct 2020 15:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1A4C2176B
	for <linux-next@archiver.kernel.org>; Wed,  7 Oct 2020 15:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2KWnUFh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgJGPrG (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 7 Oct 2020 11:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49070 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726129AbgJGPrG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2020 11:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602085625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0Aa1KCvlfUQGWUsGkUKS4sAmJdaBzy1cWEwvYw2yGIs=;
        b=S2KWnUFhkO1CgytLPlH/vXdjJ5HdywDZohSJO4/IjWPtj91kNIkJXOUJp77cjk86u6BzO4
        by6yPe2lpL1/Kof9Qicgs/0QEI5AIFV7TbS9VGlq1Qig2c4esK/1X64z0cL1HnwJYQ/eVN
        gWOwPO0m68B8kRBmymBrjF7e++0zXws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-6YZw2zieNkWq5WRL6DuGcw-1; Wed, 07 Oct 2020 11:47:03 -0400
X-MC-Unique: 6YZw2zieNkWq5WRL6DuGcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE02104D3E5;
        Wed,  7 Oct 2020 15:46:40 +0000 (UTC)
Received: from treble (ovpn-113-148.rdu2.redhat.com [10.10.113.148])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id DB6CD7A41F;
        Wed,  7 Oct 2020 15:46:38 +0000 (UTC)
Date:   Wed, 7 Oct 2020 10:46:33 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20201007154633.akspeclzc3z7urd6@treble>
References: <20200924183038.3c6da86e@canb.auug.org.au>
 <20200924200807.GU3421308@ZenIV.linux.org.uk>
 <20200925220128.1604f09b@canb.auug.org.au>
 <20200925133820.GW3421308@ZenIV.linux.org.uk>
 <20200929041056.uj6gedgm6hfjaxrx@treble>
 <20201006143012.fgpyujguzvcwszp4@treble>
 <20201007080405.5e90a579@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201007080405.5e90a579@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 07, 2020 at 08:04:05AM +1100, Stephen Rothwell wrote:
> Hi Josh,
> 
> On Tue, 6 Oct 2020 09:30:12 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > On Mon, Sep 28, 2020 at 11:10:56PM -0500, Josh Poimboeuf wrote:
> > > > Josh, any ideas?  We could, of course, make it "r"(size), but that would
> > > > be unpleasant in all existing callers...  
> > > 
> > > Sorry, I've been traveling.  I'd just vote for making it "r".
> > > 
> > > array_index_nospec() is always called after a usercopy.  I don't think
> > > anyone will notice the extra mov, for the cases where it would be
> > > propagated as an immediate.  And the argument *is* an unsigned long
> > > after all.
> > > 
> > > Stephen, can you confirm this fixes it?  
> > 
> > Still traveling, I didn't see an update on this.  Any objections to the
> > below?  I assume it fixes Stephen's build issue.
> 
> Yes, it does fix my x86_64 allnoconfig build.

Stephen, thanks!

Al, do you want to fold that change in?  Or shall I post another
version?

-- 
Josh

