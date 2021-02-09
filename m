Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541F9C433DB
	for <linux-next@archiver.kernel.org>; Tue,  9 Feb 2021 16:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16D6B64EB8
	for <linux-next@archiver.kernel.org>; Tue,  9 Feb 2021 16:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhBIQHK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 9 Feb 2021 11:07:10 -0500
Received: from verein.lst.de ([213.95.11.211]:47225 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232658AbhBIQHJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 11:07:09 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 64E3567373; Tue,  9 Feb 2021 17:06:27 +0100 (CET)
Date:   Tue, 9 Feb 2021 17:06:27 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <20210209160627.GA9188@lst.de>
References: <20210209210843.3af66662@canb.auug.org.au> <YCKnRPRTDyfGxnBC@gunter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCKnRPRTDyfGxnBC@gunter>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 09, 2021 at 04:16:20PM +0100, Jessica Yu wrote:
> Hmm, these errors don't look like it's related to that particular commit. I was
> able to reproduce these weird autoksym errors even without any modules-next
> patches applied, and on a clean v5.11-rc7 tree.

I OTOH can't reproduce it at all with either linux-next or module-next
and the powerpc allyesconfig..
