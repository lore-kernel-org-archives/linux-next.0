From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: arm build failures
Date: Wed, 17 Jun 2009 09:34:31 +0100
Message-ID: <tnx3a9ztg14.fsf@pc1117.cambridge.arm.com>
References: <20090617162612.703adfd9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:52504 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752772AbZFQIej (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2009 04:34:39 -0400
In-Reply-To: <20090617162612.703adfd9.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Wed\, 17 Jun 2009 16\:26\:12 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Over the past few days, I have started getting some arm configs (at least
> iop13xx_defconfig and integrator_defconfig, but some others) failing to
> build getting this error:
>
>   SYSMAP  System.map
>   SYSMAP  .tmp_System.map
> Inconsistent kallsyms data
> Try setting CONFIG_KALLSYMS_EXTRA_PASS
>
> Is this something you have seen?  Could it be my toolchain (I am
> currently using gcc 4.4.0 and have not changed it recently)?

I reported an error with kallsysms on ARM this Monday leading to
inconsistent data:

http://lkml.org/lkml/2009/6/15/233

Could it be related?

-- 
Catalin
