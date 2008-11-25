From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Tue, 25 Nov 2008 22:17:36 +1030
Message-ID: <200811252217.37125.rusty@rustcorp.com.au>
References: <20081125174554.dbd84cde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:39253 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751029AbYKYLro (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 06:47:44 -0500
In-Reply-To: <20081125174554.dbd84cde.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Christian Borntraeger <borntraeger@de.ibm.com>

On Tuesday 25 November 2008 17:15:54 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> arch/powerpc/sysdev/mpic.c:809: error: conflicting types for
> 'mpic_set_affinity' arch/powerpc/sysdev/mpic.h:39: error: previous
> declaration of 'mpic_set_affinity' was here

Thanks, fixed.  Grepping found some more sparc ones, too.

> The declaration in the header file was missed.
>
> Also, the x86_64 allmodconfig build failed like this:
>
> ERROR: "hvc_resize" [drivers/char/virtio_console.ko] undefined!
>
> hvc_resize is currently not exported to modules.
>
> I have dropped the rr tree again.

OK, I've dropped Christian's patch for the moment until he fixes this.  I'm 
travelling to Sydney for the day so I won't get a chance to fix this if it 
breaks tomorrow :(

Rusty.
