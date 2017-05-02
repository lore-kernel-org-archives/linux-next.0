From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build warnings
Date: Tue, 02 May 2017 19:53:25 +1000
Message-ID: <878tmfega2.fsf@concordia.ellerman.id.au>
References: <20170502160530.34b680b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50465 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751420AbdEBJxb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 05:53:31 -0400
In-Reply-To: <20170502160530.34b680b7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> The linux-next build (powerpc allyesconfig) produced these warnings
> (and have for a while):
>
> arch/powerpc/kvm/book3s_pr_papr.c: In function 'kvmppc_h_pr_enter':
> arch/powerpc/kvm/book3s_pr_papr.c:53:2: warning: ignoring return value of 'copy_from_user', declared with attribute warn_unused_result [-Wunused-result]
>   copy_from_user(pteg, (void __user *)pteg_addr, sizeof(pteg));
>   ^

Thanks, I had seen them, but they're KVM so I'll leave them to Paul to
fix up.

Though we are supposed to be building with -Werror, so those should be
breaking the build. I assume you have turned Werror off?

cheers
