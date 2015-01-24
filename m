From: Guenter Roeck <linux@roeck-us.net>
Subject: mmotm 2015-01-23-16-19: build failures due to 'mm/page_alloc.c:
 don't offset memmap for flatmem'
Date: Fri, 23 Jan 2015 23:03:41 -0800
Message-ID: <20150124070341.GA30638@roeck-us.net>
References: <54c2e51c.VbfIg4TfoWD0Qi0z%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <54c2e51c.VbfIg4TfoWD0Qi0z%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, Laura Abbott <lauraa@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 23, 2015 at 04:19:40PM -0800, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2015-01-23-16-19 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
New build failure:

mm/page_alloc.c: In function 'alloc_node_mem_map':
mm/page_alloc.c:4973: error: 'ARCH_PFN_OFFSET' undeclared (first use in this
function)
mm/page_alloc.c:4973: error: (Each undeclared identifier is reported only once
mm/page_alloc.c:4973: error: for each function it appears in.)
make[1]: *** [mm/page_alloc.o] Error 1

Culprit is c2ae2ed329 ("mm/page_alloc.c: don't offset memmap for flatmem").
While the code in question was already there, it is now also built if
CONFIG_FLATMEM is defined. Since the file defining ARCH_PFN_OFFSET
is not directly included, the build now fails for some architectures.

Affected:
	avr32:defconfig
	avr32:merisc_defconfig
	avr32:atngw100mkii_evklcd101_defconfig
	m68k:m5272c3_defconfig
	m68k:m5307c3_defconfig
	m68k:m5249evb_defconfig
	m68k:m5407c3_defconfig
	mn10300:asb2303_defconfig
	mn10300:asb2364_defconfig

Guenter

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
