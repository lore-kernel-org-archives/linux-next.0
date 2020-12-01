Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00797C64E8A
	for <linux-next@archiver.kernel.org>; Tue,  1 Dec 2020 08:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97AB2206D8
	for <linux-next@archiver.kernel.org>; Tue,  1 Dec 2020 08:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgLAIie (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 1 Dec 2020 03:38:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:52172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727253AbgLAIid (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 03:38:33 -0500
Received: from gaia (unknown [95.146.230.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85CCC2054F;
        Tue,  1 Dec 2020 08:37:51 +0000 (UTC)
Date:   Tue, 1 Dec 2020 08:37:48 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the arm64-fixes
 tree
Message-ID: <20201201083747.GA31404@gaia>
References: <20201201100547.16b07093@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201100547.16b07093@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 01, 2020 at 10:05:47AM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/include/asm/exception.h
> index 0756191f44f6,2a8aa1884d8a..000000000000
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@@ -31,13 -31,8 +31,13 @@@ static inline u32 disr_to_esr(u64 disr
>   	return esr;
>   }
>   
>  +asmlinkage void noinstr enter_el1_irq_or_nmi(struct pt_regs *regs);
>  +asmlinkage void noinstr exit_el1_irq_or_nmi(struct pt_regs *regs);
>   asmlinkage void enter_from_user_mode(void);
>  +asmlinkage void exit_to_user_mode(void);
>  +void arm64_enter_nmi(struct pt_regs *regs);
>  +void arm64_exit_nmi(struct pt_regs *regs);
> - void do_mem_abort(unsigned long addr, unsigned int esr, struct pt_regs *regs);
> + void do_mem_abort(unsigned long far, unsigned int esr, struct pt_regs *regs);
>   void do_undefinstr(struct pt_regs *regs);
>   void do_bti(struct pt_regs *regs);
>   asmlinkage void bad_mode(struct pt_regs *regs, int reason, unsigned int esr);

Thanks Stephen. It looks alright.

-- 
Catalin
