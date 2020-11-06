Return-Path: <SRS0=qnOo=EM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BD3C388F7
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 02:46:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E0C22078E
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 02:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgKFCq4 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 5 Nov 2020 21:46:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgKFCq4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 21:46:56 -0500
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31A0F20782;
        Fri,  6 Nov 2020 02:46:54 +0000 (UTC)
Date:   Thu, 5 Nov 2020 21:46:52 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20201105214652.4105c050@oasis.local.home>
In-Reply-To: <20201106133902.2ec6a1e9@canb.auug.org.au>
References: <20201106133902.2ec6a1e9@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 6 Nov 2020 13:39:02 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I fixed it up (the latter removed the code updated by the former, so I
> just used the latter) and can carry the fix as necessary. This is now
> fixed as far as linux-next is concerned, but any non trivial conflicts
> should be mentioned to your upstream maintainer when your tree is
> submitted for merging.  You may also want to consider cooperating with
> the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen,

Yeah, updates caused errors that needed to be fixed, which we knew were
just a work around till the next merge window. Which is why that commit
had in the comments: "Nested is a workaround that will soon not be
needed." ;-)

-- Steve
