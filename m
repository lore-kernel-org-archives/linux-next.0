From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: Tree for December 9 (hwpoison)
Date: Wed, 9 Dec 2009 18:25:55 +0100
Message-ID: <20091209172555.GG18989@one.firstfloor.org>
References: <20091209174738.3b8c28a6.sfr@canb.auug.org.au> <20091209090921.a3293706.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20091209090921.a3293706.rdunlap@xenotime.net>
Sender: owner-linux-mm@kvack.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andi Kleen <andi@firstfloor.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

On Wed, Dec 09, 2009 at 09:09:21AM -0800, Randy Dunlap wrote:
> On Wed, 9 Dec 2009 17:47:38 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > My usual call for calm: please do not put stuff destined for 2.6.34 into
> > linux-next trees until after 2.6.33-rc1.
> > 
> > Changes since 20091208:
> > 
> > 
> > The hwpoison tree lost its build failure.
> 
> 
> CONFIG_PROC_PAGE_MONITOR is not enabled:
> 
> 
> mm/built-in.o: In function `hwpoison_filter':
> (.text+0x43cce): undefined reference to `stable_page_flags'

Thanks. Fengguang fixed that already, but I haven't pushed out 
an update tree yet. Will do soon.
-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
