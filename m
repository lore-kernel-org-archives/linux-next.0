Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36EBC433DB
	for <linux-next@archiver.kernel.org>; Wed, 17 Mar 2021 19:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9003F64E42
	for <linux-next@archiver.kernel.org>; Wed, 17 Mar 2021 19:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbhCQTS6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 17 Mar 2021 15:18:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:41830 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233060AbhCQTSp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 15:18:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 065B1ABD7;
        Wed, 17 Mar 2021 19:18:44 +0000 (UTC)
Date:   Wed, 17 Mar 2021 20:18:47 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ian Rogers <irogers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210317191847.GG32135@zn.tnic>
References: <20210317150858.02b1bbc8@canb.auug.org.au>
 <20210317105432.GA32135@zn.tnic>
 <CAP-5=fWKCtJq-9zd5A-XALJWNf8tsds44m-G07sc+kCUoXB8zg@mail.gmail.com>
 <20210317180236.GF32135@zn.tnic>
 <20210318054921.64c0fc75@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210318054921.64c0fc75@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 18, 2021 at 05:49:21AM +1100, Stephen Rothwell wrote:
> That fixes the powerpc build for me, thanks.

Thx, adding your Tested-by and pushing out.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
