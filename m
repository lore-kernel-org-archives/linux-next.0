From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 20 Sep 2016 17:30:12 +1000
Message-ID: <20160920173012.1abe1d84@canb.auug.org.au>
References: <20160920164414.4062bb0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54092 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751297AbcITHaP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 03:30:15 -0400
In-Reply-To: <20160920164414.4062bb0b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>

Hi all,

On Tue, 20 Sep 2016 16:44:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> powerpc-linux-gcc: error: unrecognized command line option '-m'
> scripts/Makefile.build:290: recipe for target 'arch/powerpc/purgatory/printf.o' failed
> 
> and a few more like that.

OK, this is (most likely) caused by the CONFIG_WORD_SIZE -> BITS change
interacting with the KEXEC_FILE changes. Tomorrow I will do a better
merge conflict resolution patch that fixes all those.

-- 
Cheers,
Stephen Rothwell
