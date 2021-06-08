Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3329BC47082
	for <linux-next@archiver.kernel.org>; Tue,  8 Jun 2021 20:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07C1861008
	for <linux-next@archiver.kernel.org>; Tue,  8 Jun 2021 20:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbhFHUPT (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 8 Jun 2021 16:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbhFHUPT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 16:15:19 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:12e:520::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68DFC061787
        for <linux-next@vger.kernel.org>; Tue,  8 Jun 2021 13:13:25 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1lqi6F-0004gG-4o; Tue, 08 Jun 2021 22:13:23 +0200
Date:   Tue, 8 Jun 2021 22:13:23 +0200
From:   Florian Westphal <fw@strlen.de>
To:     coverity-bot <keescook@chromium.org>
Cc:     Florian Westphal <fw@strlen.de>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: nf_tables_addchain(): Memory - corruptions
Message-ID: <20210608201323.GJ20020@breakpoint.cc>
References: <202106081047.A1AA0551EB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106081047.A1AA0551EB@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

coverity-bot <keescook@chromium.org> wrote:
> 2186     	nft_trans_chain_policy(trans) = NFT_CHAIN_POLICY_UNSET;
> 2187     	if (nft_is_base_chain(chain)) {
> vvv     CID 1505166:  Memory - corruptions  (UNINIT)
> vvv     Using uninitialized value "basechain".
> 2188     		basechain->ops.hook_ops_type = NF_HOOK_OP_NF_TABLES;
> 2189     		nft_trans_chain_policy(trans) = policy;

Hmm, I do not see how is_base_chain() can be true while basechain
pointer is garbage.

However its probably better for readability to move the NF_HOOK_OP_...
assignment closer to where the basechain ops are allocated.
