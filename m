From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Tue, 25 Nov 2008 03:37:41 +1030
Message-ID: <200811250337.41393.rusty@rustcorp.com.au>
References: <20081124143158.6de384f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42754 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752841AbYKXRHs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 12:07:48 -0500
In-Reply-To: <20081124143158.6de384f8.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

On Monday 24 November 2008 14:01:58 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> arch/powerpc/kernel/irq.c: In function 'fixup_irqs':
> arch/powerpc/kernel/irq.c:240: error: incompatible type for argument 2 of
> 'irq_desc[irq].chip->set_affinity' arch/powerpc/sysdev/mpic.c: In function
> 'mpic_alloc':

Not sure how these got through.  I did another sweep.

Thanks,
Rusty.
