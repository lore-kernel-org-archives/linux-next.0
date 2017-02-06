From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the qcom tree
Date: Mon, 6 Feb 2017 11:44:18 +0000
Message-ID: <20170206114418.GB19939@arm.com>
References: <20170206102329.04879df9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55906 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751001AbdBFLoS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Feb 2017 06:44:18 -0500
Content-Disposition: inline
In-Reply-To: <20170206102329.04879df9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Andy Gross <andy.gross@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 06, 2017 at 10:23:29AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got conflicts in:
> 
>   arch/arm/kernel/armksyms.c
>   arch/arm64/kernel/arm64ksyms.c
>   arch/arm64/kernel/smccc-call.S
>   include/linux/arm-smccc.h
> 
> between commits:
> 
>   0a0c5b832751 ("arm: kernel: Add SMC structure parameter")
>   9c96e7f72029 ("firmware: qcom: scm: Fix interrupted SCM calls")
> 
> from the qcom tree and commits:
> 
>   680a0873e193 ("arm: kernel: Add SMC structure parameter")
>   82bcd087029f ("firmware: qcom: scm: Fix interrupted SCM calls")
> 
> from the arm64 tree.
> 
> I fixed it up (please check the final resolution when it is released,
> or fix these up) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Thanks Stephen, although if looks like you've resolved the conflict to
be what is in the qcom tree, which is in fact an earlier version of this
patch series.

Andy, please can you drop your stuff from -next now that a newer version
is queued via arm64? (and also please check that you're happy with what
I've got queued).

Thanks,

Will
