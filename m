From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Fri, 24 Oct 2008 00:02:00 +1100
Message-ID: <200810240002.00541.rusty@rustcorp.com.au>
References: <20081023155159.0c12743e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:54314 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752015AbYJWNB6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 09:01:58 -0400
In-Reply-To: <20081023155159.0c12743e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

On Thursday 23 October 2008 15:51:59 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> arch/x86/xen/smp.c: In function 'xen_smp_send_call_function_ipi':
> arch/x86/xen/smp.c:423: error: incompatible type for argument 1 of
> 'xen_send_IPI_mask' arch/x86/kernel/smp.c: In function
> 'native_send_call_func_ipi':
> arch/x86/kernel/smp.c:140: error: incompatible type for argument 1 of
> 'genapic->send_IPI_mask'
>
> Caused by a interaction between commit
> ae74da38ccdad1c0d724fc9343b917bc63ed6fc3 ("x86: reduce stack requirements
> for send_call_func_ipi") from the cpus4096 tree and commit
> b93ce7906b8546093696e03e9a3797da8cef2274 ("x86 smp: modify send_IPI_mask
> interface to accept cpumask_t pointers") from the rr tree.
>
> Fixed up in the patch below.

Yep, genuine conflict, fix is correct.

Thanks,
Rusty.
