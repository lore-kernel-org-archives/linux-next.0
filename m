From: Dave Chinner <david@fromorbit.com>
Subject: Re: Building tilegx defconfig gets init/exit section errors in xfs.
Date: Tue, 27 Mar 2012 08:59:19 +1100
Message-ID: <20120326215919.GN5091@dastard>
References: <4F6F61F3.40903@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail06.adl2.internode.on.net ([150.101.137.129]:50391 "EHLO
	ipmail06.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757584Ab2CZV7i (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Mar 2012 17:59:38 -0400
Content-Disposition: inline
In-Reply-To: <4F6F61F3.40903@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: xfs@oss.sgi.com, linux-next@vger.kernel.org, cmetcalf@tilera.com

On Sun, Mar 25, 2012 at 02:20:35PM -0400, Paul Gortmaker wrote:
> Hi All,
> 
> Recently the tilegx defconfig was added to the linux-next build
> coverage, which exposed this.
>  
> LD      .tmp_vmlinux1
> `xfs_qm_exit' referenced in section `.init.text' of fs/built-in.o:
>  defined in discarded section `.exit.text' of fs/built-in.o
> make[1]: *** [.tmp_vmlinux1] Error 1
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/5941293/
> 
> It seemed odd to me, since I didn't think there was anything arch
> specific in the init/exit sectioning, so I thought I'd mention it
> here, just in case it hasn't been brought up before.

Already been reported, a patch has been provided, too. So the fix
is underway.

Thanks for reporting the problem anyway, Paul.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
