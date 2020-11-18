Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF59C63798
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 16:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F2E7247BE
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 16:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgKRQYe (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgKRQYe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 11:24:34 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FAEC0613D4;
        Wed, 18 Nov 2020 08:24:33 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9B16835A;
        Wed, 18 Nov 2020 16:24:33 +0000 (UTC)
Date:   Wed, 18 Nov 2020 09:24:32 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ftrace/documentation: Fix RST C code blocks
Message-ID: <20201118092432.1407b900@lwn.net>
In-Reply-To: <20201118105127.4a7b02ef@gandalf.local.home>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
        <20201118103502.24e90f7c@gandalf.local.home>
        <20201118105127.4a7b02ef@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 18 Nov 2020 10:51:27 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 18 Nov 2020 10:35:02 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > 
> > Some C code in the ftrace-users.rst document is missing RST C block
> > annotation, which has to be added.
> > 
> > Link: https://lore.kernel.org/r/20201116173502.392a769c@canb.auug.org.au
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> >  
> 
> Jon,
> 
> You want to take this through your tree?

The changes that created the warning in the first place are in the ftrace
tree, right?  So it seems that the fix should be there as well; it won't
apply to the docs tree.

Thanks,

jon
