From: Ben Myers <bpm@sgi.com>
Subject: Re: Building tilegx defconfig gets init/exit section errors in xfs.
Date: Mon, 26 Mar 2012 16:53:44 -0500
Message-ID: <20120326215344.GX7762@sgi.com>
References: <4F6F61F3.40903@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:49311 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757364Ab2CZVxg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Mar 2012 17:53:36 -0400
Content-Disposition: inline
In-Reply-To: <4F6F61F3.40903@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: xfs@oss.sgi.com, linux-next@vger.kernel.org, cmetcalf@tilera.com

Hey Paul,

On Sun, Mar 25, 2012 at 02:20:35PM -0400, Paul Gortmaker wrote:
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

Yep, this is fixed in the xfs master branch, and we'll be requesting a pull
ASAP.  Thanks for reporting it!  ;)

Regards,
	Ben
