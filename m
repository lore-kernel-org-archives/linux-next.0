Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EE7C47094
	for <linux-next@archiver.kernel.org>; Thu, 10 Jun 2021 15:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADD04613E1
	for <linux-next@archiver.kernel.org>; Thu, 10 Jun 2021 15:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhFJPIh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:08:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231469AbhFJPIh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Jun 2021 11:08:37 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 376EA61246;
        Thu, 10 Jun 2021 15:06:40 +0000 (UTC)
Date:   Thu, 10 Jun 2021 11:06:38 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20210610110638.7e84912d@oasis.local.home>
In-Reply-To: <YMHMv0huf6D0PZjD@hirez.programming.kicks-ass.net>
References: <20210610180825.2aa4435f@canb.auug.org.au>
        <YMHMv0huf6D0PZjD@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 10 Jun 2021 10:26:39 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Jun 10, 2021 at 06:08:25PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the ftrace tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > Cannot find symbol for section 255: .text.opal_int_set_mfrr.
> > arch/powerpc/platforms/powernv/opal-call.o: failed
> > 
> > and many more similar.
> > 
> > Caused by commit
> > 
> >   9e419de4c678 ("recordmcount: Correct st_shndx handling")  
> 
> Argh.. lemme try and reproduce :/

I'll go and revert this patch, and wait for a new version from Peter.

Hmm, crap, this is also sent to Linus. I'll stop that too.

-- Steve
