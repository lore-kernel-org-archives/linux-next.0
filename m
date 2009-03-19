From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: cpus4096 tree build failure
Date: Thu, 19 Mar 2009 21:37:14 +1030
Message-ID: <200903192137.15209.rusty@rustcorp.com.au>
References: <20090319215300.1833d28e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:54341 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754816AbZCSLHY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 07:07:24 -0400
In-Reply-To: <20090319215300.1833d28e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@ozlabs.org>

On Thursday 19 March 2009 21:23:00 Stephen Rothwell wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 19 Mar 2009 21:35:24 +1100
> Subject: [PATCH] powerpc: mmzone.h needs cpumask_t to be defined
> 
> Commit 082edb7bf443eb8eda15b482d16ad9dd8137ad24 ("numa,cpumask: move
> numa_node_id default implementation to topology.h") removed the include
> of linux/topology.h from linux/mmzone.h which exposed this lack.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Ingo, please apply.

Apparently sparc is similarly broken :(

Rusty.
