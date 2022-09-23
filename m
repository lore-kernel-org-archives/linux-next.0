Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB43ECAAD8
	for <linux-next@archiver.kernel.org>; Fri, 23 Sep 2022 10:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiIWK1G (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 23 Sep 2022 06:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbiIWK04 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Sep 2022 06:26:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1352B128883;
        Fri, 23 Sep 2022 03:26:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C584EB82190;
        Fri, 23 Sep 2022 10:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4FBC433C1;
        Fri, 23 Sep 2022 10:26:50 +0000 (UTC)
Date:   Fri, 23 Sep 2022 11:26:47 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoffer Dall <cdall@cs.columbia.edu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <Yy2J52TLL7i2laSZ@arm.com>
References: <20220919140531.3741d146@canb.auug.org.au>
 <87fsgnlopt.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsgnlopt.wl-maz@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 19, 2022 at 10:04:30AM +0100, Marc Zyngier wrote:
> On Mon, 19 Sep 2022 05:05:31 +0100,
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the kvm-arm tree got a conflict in:
> > 
> >   arch/arm64/kvm/sys_regs.c
> > 
> > between commit:
> > 
> >   55adc08d7e64 ("arm64/sysreg: Add _EL1 into ID_AA64PFR0_EL1 definition names")
> > 
> > from the arm64 tree and commit:
> > 
> >   cdd5036d048c ("KVM: arm64: Drop raz parameter from read_id_reg()")
> > 
> > from the kvm-arm tree.
[...]
> Catalin, Will: in order to avoid further conflicts, I've taken the
> liberty to merge the arm64/for-next/sysreg branch into kvmarm/next.
> Let me know if that's a problem.

No problem.

> Also, I've resolved the conflict in a slightly different way. Not that
> the above was wrong in any way, but we might as well fix it in a more
> idiomatic way:
> 
>  	/* We can only differ with CSV[23], and anything else is an error */
>  	val ^= read_id_reg(vcpu, rd);
> -	val &= ~((0xFUL << ID_AA64PFR0_CSV2_SHIFT) |
> -		 (0xFUL << ID_AA64PFR0_CSV3_SHIFT));
> +	val &= ~(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_CSV2) |
> +		 ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_CSV3));
>  	if (val)
>  		return -EINVAL;

It looks fine, thanks.

-- 
Catalin
