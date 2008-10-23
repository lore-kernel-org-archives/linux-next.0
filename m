From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Fri, 24 Oct 2008 00:31:22 +1100
Message-ID: <200810240031.22759.rusty@rustcorp.com.au>
References: <20081023155228.c8fa9da8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:46917 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751529AbYJWNbV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 09:31:21 -0400
In-Reply-To: <20081023155228.c8fa9da8.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@ozlabs.org>, Mike Travis <travis@sgi.com>, Arnd Bergmann <arnd@arndb.de>

On Thursday 23 October 2008 15:52:28 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> arch/powerpc/platforms/cell/spu_base.c: In function
> 'mm_needs_global_tlbie': arch/powerpc/platforms/cell/spu_base.c:117: error:
> implicit declaration of function '__cpus_setall'

OK, after discussions with Arnd I applied two fixes.  One is similar to yours 
but neater, and the other then changes NR_CPUS to nr_cpu_ids once it becomes 
available for UP.

Thanks,
Rusty.
