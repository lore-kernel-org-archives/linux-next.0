Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FAFC4361B
	for <linux-next@archiver.kernel.org>; Mon, 14 Dec 2020 21:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2C5020731
	for <linux-next@archiver.kernel.org>; Mon, 14 Dec 2020 21:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387395AbgLNVek (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 14 Dec 2020 16:34:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:44464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502979AbgLNVej (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 16:34:39 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE82C20731;
        Mon, 14 Dec 2020 21:33:58 +0000 (UTC)
Date:   Mon, 14 Dec 2020 16:33:57 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20201214163357.6413989c@gandalf.local.home>
In-Reply-To: <20201215073725.42abe121@canb.auug.org.au>
References: <20201208160222.04ad114f@canb.auug.org.au>
        <20201215073725.42abe121@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 15 Dec 2020 07:37:25 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:


> > + 			check_buffer(cpu_buffer, info, CHECK_FULL_PAGE);
> >   		return rb_move_tail(cpu_buffer, tail, info);
> >   	}
> >     
> 
> Just a reminder that this conflict still exists.
> 

Thanks for the reminder. Both updates were done by me, and I assumed that
the fix was trivial enough for Linus to figure out.

But I'll try to remember to include a note about it before sending to Linus.

Cheers,

-- Steve

