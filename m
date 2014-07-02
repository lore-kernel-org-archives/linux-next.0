From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-07-02-15-07 uploaded (stack protector)
Date: Wed, 02 Jul 2014 16:21:06 -0700
Message-ID: <53B493E2.2030905@infradead.org>
References: <53b482d3.gR7nYB/K7hPREviI%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48882 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753175AbaGBXVI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2014 19:21:08 -0400
In-Reply-To: <53b482d3.gR7nYB/K7hPREviI%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, Andi Kleen <ak@linux.intel.com>

On 07/02/14 15:08, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2014-07-02-15-07 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.

Hi Andi,

Here is an extract from 10 randconfig builds:


$ grep STACKPROTECTOR_STRONG config-r*
config-r8735:CONFIG_CC_STACKPROTECTOR_STRONG=y
config-r8736:CONFIG_CC_STACKPROTECTOR_STRONG=y
config-r8737:# CONFIG_CC_STACKPROTECTOR_STRONG is not set
config-r8738:# CONFIG_CC_STACKPROTECTOR_STRONG is not set
config-r8739:CONFIG_CC_STACKPROTECTOR_STRONG=y
config-r8740:CONFIG_CC_STACKPROTECTOR_STRONG=y
config-r8741:CONFIG_CC_STACKPROTECTOR_STRONG=y
config-r8742:# CONFIG_CC_STACKPROTECTOR_STRONG is not set
config-r8743:# CONFIG_CC_STACKPROTECTOR_STRONG is not set
config-r8744:# CONFIG_CC_STACKPROTECTOR_STRONG is not set


but the captured output for each one says:

grep STACKPROTECTOR_STRONG  build*.out
build-r8735.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8736.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8736.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8737.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8739.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8740.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8740.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8741.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8741.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler
build-r8742.out:/local/lnx/MM/mmotm-2014-0702-1507/Makefile:662: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong not supported by compiler


then the build goes on to produce many errors like this one:

  CC      init/do_mounts.o
gcc: error: unrecognized command line option '-fstack-protector-strong'


Can you explain this, please?  or even better yet, fix it.

thanks,

-- 
~Randy
