Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E75C433DB
	for <linux-next@archiver.kernel.org>; Wed, 24 Mar 2021 15:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65428619FF
	for <linux-next@archiver.kernel.org>; Wed, 24 Mar 2021 15:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236751AbhCXPqg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:46:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:57720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236575AbhCXPqS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Mar 2021 11:46:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48CF761A09;
        Wed, 24 Mar 2021 15:46:17 +0000 (UTC)
Date:   Wed, 24 Mar 2021 15:46:14 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64 tree
Message-ID: <20210324154613.GA3709@arm.com>
References: <20210324081445.7db17c31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324081445.7db17c31@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 24, 2021 at 08:14:45AM +1100, Stephen Rothwell wrote:
> Commits
> 
>   b17f265bb4cc ("kselftest/arm64: mte: Fix MTE feature detection")
>   4dfc9d30a8ab ("kselftest/arm64: mte: common: Fix write() warnings")
> 
> are missing a Signed-off-by from their author.

Thanks Stephen. Now fixed.

-- 
Catalin
