From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the kbuild tree
Date: Wed, 17 Aug 2016 11:44:43 +1000
Message-ID: <20160817114443.67675413@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42854 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752345AbcHQBp2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Aug 2016 21:45:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>

Hi Michal,

After merging the kbuild tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings:

WARNING: 25 bad relocations
c000000000cf2570 R_PPC64_ADDR64    __crc___arch_hweight16
c000000000cf2578 R_PPC64_ADDR64    __crc___arch_hweight32
c000000000cf2580 R_PPC64_ADDR64    __crc___arch_hweight64
c000000000cf2588 R_PPC64_ADDR64    __crc___arch_hweight8
c000000000cf2678 R_PPC64_ADDR64    __crc___bswapdi2
c000000000cf2690 R_PPC64_ADDR64    __crc___clear_user
c000000000cf26b8 R_PPC64_ADDR64    __crc___copy_tofrom_user
c000000000cf2728 R_PPC64_ADDR64    __crc___csum_partial
c000000000cf3f90 R_PPC64_ADDR64    __crc_copy_page
c000000000cf40e0 R_PPC64_ADDR64    __crc_csum_partial_copy_generic
c000000000cf4100 R_PPC64_ADDR64    __crc_current_stack_pointer
c000000000cf4928 R_PPC64_ADDR64    __crc_empty_zero_page
c000000000cf4db0 R_PPC64_ADDR64    __crc_flush_dcache_range
c000000000cf4dc0 R_PPC64_ADDR64    __crc_flush_icache_range
c000000000cf6470 R_PPC64_ADDR64    __crc_load_fp_state
c000000000cf6488 R_PPC64_ADDR64    __crc_load_vr_state
c000000000cf68d0 R_PPC64_ADDR64    __crc_memchr
c000000000cf68e0 R_PPC64_ADDR64    __crc_memcmp
c000000000cf68e8 R_PPC64_ADDR64    __crc_memcpy
c000000000cf6900 R_PPC64_ADDR64    __crc_memmove
c000000000cf6988 R_PPC64_ADDR64    __crc_memset
c000000000cf9328 R_PPC64_ADDR64    __crc_store_fp_state
c000000000cf9330 R_PPC64_ADDR64    __crc_store_vr_state
c000000000cf93d0 R_PPC64_ADDR64    __crc_strncmp
c000000000cf93d8 R_PPC64_ADDR64    __crc_strncpy

Introduced by commit

  9445aa1a3062 ("ppc: move exports to definitions")

I have reverted that commit for today.

[cc-ing the ppc guys for clues - also involved is commit

  22823ab419d8 ("EXPORT_SYMBOL() for asm")
]

-- 
Cheers,
Stephen Rothwell
