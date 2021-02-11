Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2BCC433E0
	for <linux-next@archiver.kernel.org>; Thu, 11 Feb 2021 21:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 568AB64D9C
	for <linux-next@archiver.kernel.org>; Thu, 11 Feb 2021 21:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhBKVWw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 11 Feb 2021 16:22:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:34224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhBKVWh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 16:22:37 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C77CE64D9C;
        Thu, 11 Feb 2021 21:21:55 +0000 (UTC)
Date:   Thu, 11 Feb 2021 16:21:54 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Tom Zanussi <zanussi@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20210211162154.33d71924@gandalf.local.home>
In-Reply-To: <20210212075728.36941e15@canb.auug.org.au>
References: <20210212075728.36941e15@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 12 Feb 2021 07:57:28 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   b5e7014fe1c4 ("selftests/ftrace: Update synthetic event syntax errors")
> 
> Fixes tag
> 
>   Fixes: 81ff92a93d95 (selftests/ftrace: Add test case for synthetic
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
> 
> Please do not split Fixes tags over more than one line.  Also, keep all
> the commit message tags together at the end of the message.
> 

Thanks, I didn't even notice that :-/

Tom, FYI for next time ;-)

-- Steve
