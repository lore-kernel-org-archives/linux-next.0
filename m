Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DC4C2B9F4
	for <linux-next@archiver.kernel.org>; Thu, 17 Jun 2021 22:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DCEC61185
	for <linux-next@archiver.kernel.org>; Thu, 17 Jun 2021 22:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232390AbhFQWdB (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 17 Jun 2021 18:33:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231224AbhFQWdA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 18:33:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9665761185;
        Thu, 17 Jun 2021 22:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623969051;
        bh=0DPca4+6nKZMwfRDTQKeyWKDhxvpWaI5u4ztdfJv4V0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=sYpKnyytn0nVZC+qzzuUNaxYT8IN0YXZHD4Ed2hs+JEzn9GpGVyu3Ve4Cmbs9Lb8P
         GWGdPQDDuUJI+/vrwak8ys56Iev+kg/ncfBisj7rCsgNp0s0VyiuW051wSrMLUZO2X
         3BTMT7TClyh7P8aKBYoasCPLjvgs9XcN6gYO1gwuZbEq88k5wB3hRHdmvMkQ82aAs5
         KtuD7peWQR2AygNGbR92aCvwlB59h20eC6xGtCfZR0Sl8D0o9ZZ7c8KWSQgK6W7U6j
         Eet1wQeYSJ6TnOp2i+rasPXDX+QTrkqqjZtYR9a5wkn8VpCmpUygFBg5rvcPAivIcS
         FrdoDijo0tBkw==
Date:   Thu, 17 Jun 2021 17:30:50 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci-current
 tree
Message-ID: <20210617223050.GA3140717@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618082303.58fc5edc@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 18, 2021 at 08:23:03AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   d19b0ea16f45 ("PCI: aardvark: Fix kernel panic during PIO transfer")
> 
> is missing a Signed-off-by from its committer.

Fixed, sorry!
