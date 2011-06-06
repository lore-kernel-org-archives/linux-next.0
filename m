From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 6 (frontswap)
Date: Mon, 6 Jun 2011 13:06:28 -0700
Message-ID: <20110606130628.e0110e18.randy.dunlap@oracle.com>
References: <20110606132036.aebd73a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110606132036.aebd73a4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 6 Jun 2011 13:20:36 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110603:


Does frontswap need to depend on SWAP?

When SWAP is not enabled:

mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467c1): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467ce): undefined reference to `swap_list'
mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467e6): undefined reference to `swap_info'
mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467fe): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x4688d): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x46898): undefined reference to `swap_list'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x468b6): undefined reference to `swap_info'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x4690d): undefined reference to `swap_info'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x469d3): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x469ec): undefined reference to `try_to_unuse'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x46a1c): undefined reference to `swap_lock'
mm/built-in.o: In function `__frontswap_flush_area':
(.text+0x46aa4): undefined reference to `swap_info'
mm/built-in.o: In function `__frontswap_get_page':
(.text+0x46b1f): undefined reference to `swap_info'
mm/built-in.o: In function `__frontswap_put_page':
(.text+0x46bf8): undefined reference to `swap_info'
mm/built-in.o: In function `__frontswap_flush_page':
(.text+0x46d86): undefined reference to `swap_info'
mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467c1): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467ce): undefined reference to `swap_list'
mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467e6): undefined reference to `swap_info'
mm/built-in.o: In function `frontswap_curr_pages':
(.text+0x467fe): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x4688d): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x46898): undefined reference to `swap_list'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x468b6): undefined reference to `swap_info'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x4690d): undefined reference to `swap_info'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x469d3): undefined reference to `swap_lock'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x469ec): undefined reference to `try_to_unuse'
mm/built-in.o: In function `frontswap_shrink':
(.text+0x46a1c): undefined reference to `swap_lock'
mm/built-in.o: In function `__frontswap_flush_area':
(.text+0x46aa4): undefined reference to `swap_info'
mm/built-in.o: In function `__frontswap_get_page':
(.text+0x46b1f): undefined reference to `swap_info'
mm/built-in.o: In function `__frontswap_put_page':
(.text+0x46bf8): undefined reference to `swap_info'
mm/built-in.o: In function `__frontswap_flush_page':
(.text+0x46d86): undefined reference to `swap_info'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
