Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543F5C5519F
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 16:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09A312485A
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 16:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgKRQo5 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:44:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:34366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgKRQo5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 11:44:57 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05DF520780;
        Wed, 18 Nov 2020 16:44:55 +0000 (UTC)
Date:   Wed, 18 Nov 2020 11:44:54 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ftrace/documentation: Fix RST C code blocks
Message-ID: <20201118114454.052b94f3@gandalf.local.home>
In-Reply-To: <20201118092827.583e3db9@lwn.net>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
        <20201118103502.24e90f7c@gandalf.local.home>
        <20201118105127.4a7b02ef@gandalf.local.home>
        <20201118092432.1407b900@lwn.net>
        <20201118112651.0b1c9944@gandalf.local.home>
        <20201118092827.583e3db9@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 18 Nov 2020 09:28:27 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> On Wed, 18 Nov 2020 11:26:51 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > OK, I'll take it, but can you give an ack?  
> 
> Acked-by: Jonathan Corbet <corbet@lwn.net>

Thanks Jon!

-- Steve

