From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Nov 27 (mm stuff)
Date: Fri, 27 Nov 2015 18:17:39 +0900
Message-ID: <20151127091739.GB585@swordfish>
References: <20151127160514.7b2022f2@canb.auug.org.au>
 <56580097.8050405@infradead.org>
 <20151127091047.GA585@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20151127091047.GA585@swordfish>
Sender: owner-linux-mm@kvack.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Vladimir Davydov <vdavydov@virtuozzo.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
List-Id: linux-next.vger.kernel.org

Cc Vladimir, Kirill, Andrew

On (11/27/15 18:10), Sergey Senozhatsky wrote:
> On (11/26/15 23:04), Randy Dunlap wrote:
> > 
> > on i386:
> > 
> > mm/built-in.o: In function `page_referenced_one':
> > rmap.c:(.text+0x362a2): undefined reference to `pmdp_clear_flush_young'
> > mm/built-in.o: In function `page_idle_clear_pte_refs_one':
> > page_idle.c:(.text+0x4b2b8): undefined reference to `pmdp_test_and_clear_young'
> > 
> 
> Hello,
> 
> https://lkml.org/lkml/2015/11/24/160
> 
> corresponding patch mm-add-page_check_address_transhuge-helper-fix.patch added
> to -mm tree.
> 

my bad, it's in -next already.


:commit 97f71bd28a93f54791cb6a7d3832299832ea6194
:Author: Vladimir Davydov
:Date:   Thu Nov 26 12:58:01 2015 +1100
:
:    mm-add-page_check_address_transhuge-helper-fix
:    
:    mm/built-in.o: In function `page_referenced_one':
:    rmap.c:(.text+0x32070): undefined reference to `pmdp_clear_flush_young'


seems it doesn't work for you.

	-ss

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
