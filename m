From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: Tree for Apr 7 (build failure: mips:bcm63xx_defconfig)
Date: Tue, 07 Apr 2015 10:26:19 -0700
Message-ID: <5524133B.5040707@gmail.com>
References: <20150407220808.56b0d332@canb.auug.org.au> <20150407171649.GA3209@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34333 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529AbbDGR1Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2015 13:27:16 -0400
In-Reply-To: <20150407171649.GA3209@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org

On 07/04/15 10:16, Guenter Roeck wrote:
> On Tue, Apr 07, 2015 at 10:08:08PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150402:
>>
>> The arm-soc tree gained a build failure for which I reverted a commit.
>>
>> The omap tree gained a build failure for which I applied a merge fix
>> patch.
>>
>> The arm64 tree gained a conflict against the arm-soc tree.
>>
>> The net-next tree gained conflicts against the net tree.
>>
>> The vfs tree gained conflicts against the ext4 and v9fs trees.
>>
>> The drm tree gained a conflict against Linus' tree.
>>
>> The spi tree gained a build failure so I used the version from
>> next-20150402.
>>
>> The tip tree gained conflicts against the net-next tree and a build
>> failure so I used the version from next-20150402.
>>
>> The kvm tree gained a conflict against the mips tree.
>>
>> The kvms390 tree gained a conflict against the kvm tree.
>>
>> The tty tree gained a conflict against the slave-dma tree.
>>
>> The akpm-current tree gained conflicts against the tile tree.  I also
>> removed a patch as requested due to reported failures.
>>
>> Non-merge commits (relative to Linus' tree): 8802
>>  7861 files changed, 364548 insertions(+), 179283 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
> 
> Building mips:bcm63xx_defconfig ... failed
> --------------
> Error log:
> mm/page_alloc.c: In function 'free_area_init_nodes':
> mm/page_alloc.c:5412:34: warning: array subscript is below array bounds [-Warray-bounds]
> arch/mips/built-in.o: In function `mips_dma_sync_single_for_device':
> dma-default.c:(.text+0xf644): undefined reference to `plat_dma_addr_to_phys'
> arch/mips/built-in.o: In function `mips_dma_map_sg':
> dma-default.c:(.text+0xf7bc): undefined reference to `plat_map_dma_mem_page'
> arch/mips/built-in.o: In function `mips_dma_map_page':
> dma-default.c:(.text+0xf8ac): undefined reference to `plat_map_dma_mem_page'
> dma-default.c:(.text+0xf8f0): undefined reference to `plat_map_dma_mem_page'
> dma-default.c:(.text+0xf924): undefined reference to `plat_map_dma_mem_page'
> arch/mips/built-in.o: In function `mips_dma_alloc_coherent':
> dma-default.c:(.text+0xfbbc): undefined reference to `plat_map_dma_mem'
> arch/mips/built-in.o: In function `dma_alloc_noncoherent':
> (.text+0xfce8): undefined reference to `plat_map_dma_mem'
> make: *** [vmlinux] Error 1
> 
> Bisect results:
> 
> # bad: [44bf159dfed5558083f97d792cb4bebdbcbf3061] Add linux-next specific files for 20150407
> # good: [f22e6e847115abc3a0e2ad7bb18d243d42275af1] Linux 4.0-rc7
> git bisect start 'HEAD' 'v4.0-rc7'
> # bad: [16e2e34a62e94f3ab00e8db509529c77eeb031ea] Merge remote-tracking branch 'drm/drm-next'
> git bisect bad 16e2e34a62e94f3ab00e8db509529c77eeb031ea
> # bad: [fefe503874f0113d582056b8bb392baeda5f4f19] Merge remote-tracking branch 'file-locks/linux-next'
> git bisect bad fefe503874f0113d582056b8bb392baeda5f4f19
> # good: [e5a6058af54727023a6e1765fd167ca4ae1782eb] Merge remote-tracking branch 'samsung/for-next'
> git bisect good e5a6058af54727023a6e1765fd167ca4ae1782eb
> # bad: [084998d2aa97730be0b322c4c46a14c2f909e975] Merge remote-tracking branch 'mips/mips-for-linux-next'
> git bisect bad 084998d2aa97730be0b322c4c46a14c2f909e975
> # bad: [c1382bfac2628d24b9e9a0a9b8a7b2b35b1311c3] Merge branch '4.1-fp' into mips-for-linux-next
> git bisect bad c1382bfac2628d24b9e9a0a9b8a7b2b35b1311c3
> # good: [f45e388ff0f90b922b77bef959a2cfb0645cffbe] MIPS: Provide fallback reboot/poweroff/halt implementations
> git bisect good f45e388ff0f90b922b77bef959a2cfb0645cffbe
> # bad: [635c7028b7b07e7c632ecb841795e43fb375ee7e] MIPS: mipsregs.h: Remove broken comments
> git bisect bad 635c7028b7b07e7c632ecb841795e43fb375ee7e
> # good: [b0abf36ffdc2b7efbb74e02b9dad99b40e85ec3b] MIPS: Octeon: Set appropriate endianness in L2C registers
> git bisect good b0abf36ffdc2b7efbb74e02b9dad99b40e85ec3b
> # good: [1f8d271385d542796ab7917692908beef10acdc9] MIPS: Lasat: Remove unused function from sysctl code.
> git bisect good 1f8d271385d542796ab7917692908beef10acdc9
> # good: [9d4b5b9e869677154bc5dd27f9cb57c8141deca5] MIPS: SEAD3: sead3-net is not a module.
> git bisect good 9d4b5b9e869677154bc5dd27f9cb57c8141deca5
> # good: [612544fbde1b3cf60eb1c06ce1b6640c5d61bcdd] MIPS: SEAD3: Combine all platform device registrations in one file.
> git bisect good 612544fbde1b3cf60eb1c06ce1b6640c5d61bcdd
> # bad: [6fb7566baa012b66b0c58df7df794922b2c6f030] MIPS: BCM63xx: Utilize bmips-dma-coherence.h
> git bisect bad 6fb7566baa012b66b0c58df7df794922b2c6f030
> # good: [0c8741360c66a68314e2ce60d0701d57d44fde71] MIPS: BMIPS: Create bmips-dma-coherence.h
> git bisect good 0c8741360c66a68314e2ce60d0701d57d44fde71
> # first bad commit: [6fb7566baa012b66b0c58df7df794922b2c6f030] MIPS: BCM63xx: Utilize bmips-dma-coherence.h
> 
> Reverting commit 6fb7566baa012 fixes the problem.

I could reproduce that on mips-for-linux-next, looking into it now.

Thanks!
-- 
Florian
