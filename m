Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F784C4708E
	for <linux-next@archiver.kernel.org>; Fri,  6 Jan 2023 01:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjAFB2w (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 5 Jan 2023 20:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjAFB23 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2023 20:28:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF2265AC3;
        Thu,  5 Jan 2023 17:22:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3545B61CCB;
        Fri,  6 Jan 2023 01:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937C5C433F0;
        Fri,  6 Jan 2023 01:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672967875;
        bh=OGL6YW0r34cWAP5Rdp2MfncGZ2agFD/y+WoU6qLBfuA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=t8RoS2vQd1sq6g7iDnFNEot8pP/kmfa9fI+7/G+V6AA8b2RgXaNI/eD70dipuICsW
         mSxB4ozfpRn4ehN0OARs0JhOqazZuFucFDVVbclgaIBPXYSWEEa7DFDxw6jrhY56aE
         BqfMnR0JrZIiIbK6tnLjeBe7x6twMhzWN7wQrt19Z2JUc8EUG6IS3fCLRt98TvRT+q
         j9HMIyiZ0w1GQYqFvd9yBub5+Ah+YOdGEH114efr5XOzNLSb+pRgyfBs0lGobiU5Qc
         XTxANnM9DVt5v3SNQdoidm1kAVc+wrb5lOLi9Nk0oPHMKfcq8KfMynhPdhK1wnzrir
         /iwadIo0g8g2A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 3B5605C0544; Thu,  5 Jan 2023 17:17:55 -0800 (PST)
Date:   Thu, 5 Jan 2023 17:17:55 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, David Teigland <teigland@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the rcu tree
Message-ID: <20230106011755.GL4028633@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230106115656.2f2845bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106115656.2f2845bd@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 06, 2023 at 11:56:56AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in other trees included in linux-next as
> different commits (but the same patches):
> 
>   5ae8fe77d8fe ("block: Remove "select SRCU"")
>   5707ec3b444f ("fs/dlm: Remove "select SRCU"")
> 
> The first is in the block tree and the second is in the dlm tree.

Very good!

I have dropped these from the -rcu tree, and if testing goes well they
will also be gone from the rcu/next branch.  (One never gets to make
only two changes...)

							Thanx, Paul
