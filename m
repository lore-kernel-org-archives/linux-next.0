From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure after merge of the modules tree
Date: Fri, 27 Nov 2015 13:27:34 +1030
Message-ID: <87bnagrvxd.fsf@rustcorp.com.au>
References: <20151127122623.06c052fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59167 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753757AbbK0Dtl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2015 22:49:41 -0500
In-Reply-To: <20151127122623.06c052fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Rusty,
>
> After merging the modules tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from include/linux/kexec.h:26:0,
>                  from include/linux/crash_dump.h:5,
>                  from arch/powerpc/platforms/powernv/pci-ioda.c:16:
> include/linux/module.h:770:15: error: return type defaults to 'int' [-Werror=return-type]

Thanks, this typo hit all archs which don't do RO module protection by
default.

Maybe PPC should do that?

I've fixed it (and some others found by 0-day) and rebased.

Thanks,
Rusty.
