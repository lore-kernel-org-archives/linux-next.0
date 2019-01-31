From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-01-30-15-02 uploaded (i386 build summary)
Date: Wed, 30 Jan 2019 19:15:27 -0800
Message-ID: <c19c92ac-2490-4342-4cc1-276b5bf5ea8f@infradead.org>
References: <20190130230305.d7osZ%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130230305.d7osZ%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 1/30/19 3:03 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2019-01-30-15-02 has been uploaded to
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
> 

argghh.  I guess nobody builds on i386 any more.

Summary from 8 i386 builds:
(ignoring "missing braces" in drm)

../kernel/dma/swiotlb.c:211:9: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘size_t’ [-Wformat=]
../kernel/dma/swiotlb.c:217:9: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘size_t’ [-Wformat=]

ld: drivers/mtd/nand/raw/meson_nand.o: in function `meson_nfc_setup_data_interface':
meson_nand.c:(.text+0x1f9): undefined reference to `__udivdi3'

../arch/x86/platform/olpc/olpc_dt.c:146:10: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘size_t’ [-Wformat=]

../mm/memcontrol.c:5629:52: error: ‘THP_FAULT_ALLOC’ undeclared (first use in this function)
../mm/memcontrol.c:5631:17: error: ‘THP_COLLAPSE_ALLOC’ undeclared (first use in this function)
../mm/memcontrol.c:5629:52: error: ‘THP_FAULT_ALLOC’ undeclared (first use in this function)
../mm/memcontrol.c:5631:17: error: ‘THP_COLLAPSE_ALLOC’ undeclared (first use in this function)


-- 
~Randy
