Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A6DEB64DA
	for <linux-next@archiver.kernel.org>; Thu, 22 Jun 2023 22:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjFVWss (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 22 Jun 2023 18:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjFVWsp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2023 18:48:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF1E1BD7;
        Thu, 22 Jun 2023 15:48:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE76061924;
        Thu, 22 Jun 2023 22:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86077C433C8;
        Thu, 22 Jun 2023 22:48:42 +0000 (UTC)
Date:   Thu, 22 Jun 2023 18:48:40 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ftrace tree
Message-ID: <20230622184840.1dd4e945@gandalf.local.home>
In-Reply-To: <20230623083456.1aa36194@canb.auug.org.au>
References: <20230623083456.1aa36194@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 23 Jun 2023 08:35:50 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commits
> 
>   e46ad59233cf ("selftests/ftrace: Add new test case which checks for optimized probes")
>   bd2cdc432190 ("selftests/ftrace: Add new test case which adds multiple consecutive probes in a function")
> 
> are missing a Signed-off-by from their committer.
> 

Masami, can you rebase and fix those commits?

-- Steve
