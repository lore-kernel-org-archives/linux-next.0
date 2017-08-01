From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 1 Aug 2017 20:50:54 +1000
Message-ID: <20170801205054.17c8579f@canb.auug.org.au>
References: <20170801163904.7d49881a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801163904.7d49881a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zi Yan <zi.yan@cs.rutgers.edu>
List-Id: linux-next.vger.kernel.org

Hi all,

On Tue, 1 Aug 2017 16:39:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the akpm tree, today's linux-next build (sparc defconfig)
> failed like this:
> 
> In file included from mm/vmscan.c:55:0:
> include/linux/swapops.h: In function 'swp_entry_to_pmd':
> include/linux/swapops.h:226:9: error: implicit declaration of function '__pmd' [-Werror=implicit-function-declaration]
>   return __pmd(0);
>          ^
> include/linux/swapops.h:226:9: error: incompatible types when returning type 'int' but 'pmd_t {aka struct <anonymous>}' was expected
> 
> Caused by commit
> 
>   9bb18490758c ("mm-thp-enable-thp-migration-in-generic-path-fix")
> 
> It looks like sparc 32 bit has no __pmd() ...
> 
> I have reverted that commit for today.

OK, that is a pain as it causes many build warnings some of which are
treated as errors :-(  (see e.g.
http://kisskb.ellerman.id.au/kisskb/buildresult/13112192/).  So maybe
we need to fix sthe sparc32 build instead?  Are there any other
architectures/platforms that do not define __pmd() ?

-- 
Cheers,
Stephen Rothwell
