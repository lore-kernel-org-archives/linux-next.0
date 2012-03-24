From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: bad merge in "Merge branch 'rmobile-fixes-for-linus'" ?
Date: Sat, 24 Mar 2012 13:37:32 -0400
Message-ID: <20120324173732.GA7509@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:38517 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754725Ab2CXRhx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 24 Mar 2012 13:37:53 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: arnd@arndb.de
Cc: linux-next@vger.kernel.org

Hi Arnd,

I fed this failure to git bisect:

arch/arm/mach-shmobile/setup-sh7372.c:63:2: error: implicit declaration
of function 'init_consistent_dma_size' 

http://kisskb.ellerman.id.au/kisskb/buildresult/5941296/

and it came back with your merge below.  Can you have a look and see if
that makes sense?

Thanks,
Paul.
--

commit 1b12178157470221e98511e6aa687a53feb29963
Merge: 5cd9eb2 e9dd7ed
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Mar 22 22:02:16 2012 +0000

    Merge branch 'rmobile-fixes-for-linus' of git://github.com/pmundt/linux-sh into renesas/soc
    
    Conflicts:
        arch/arm/mach-shmobile/board-ap4evb.c
    
    This moves the addition of init_consistent_dma_size() from the board
    files into the common sh7372_map_io() functions where all the other
    contents of the board specific map_io calls have gone.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>


git bisect start
# good: [fde7d9049e55ab85a390be7f415d74c9f62dd0f9] Linux 3.3-rc7
git bisect good fde7d9049e55ab85a390be7f415d74c9f62dd0f9
# bad: [079afb9b013ffd40e6a45dffd2c9f0be90322e8c] Add linux-next specific files for 20120323
git bisect bad 079afb9b013ffd40e6a45dffd2c9f0be90322e8c
# good: [0a2eb3f1b5fad192e5a156a5526df8af85a7a9f2] Merge remote-tracking branch 'ext3/for_next'
git bisect good 0a2eb3f1b5fad192e5a156a5526df8af85a7a9f2
# good: [9566c47ff8a47246624cac534b04e63fb910600b] Merge remote-tracking branch 'mfd/for-next'
git bisect good 9566c47ff8a47246624cac534b04e63fb910600b
# good: [95ae6c7260c73082bfcfcb823d107d19932d0777] Merge remote-tracking branch 'tip/auto-latest'
git bisect good 95ae6c7260c73082bfcfcb823d107d19932d0777
# bad: [9f8c56c2dd30796e5e97e77b5ead2b3c67d68724] Merge branch 'next/soc2' into for-next
git bisect bad 9f8c56c2dd30796e5e97e77b5ead2b3c67d68724
# good: [f4aea255b4478f481b1af36f5feee4c0fb4b7441] Merge branch 'next/boards' into for-next
git bisect good f4aea255b4478f481b1af36f5feee4c0fb4b7441
# good: [f4eb28340771c12cdbf8b5ec149dbd3b0eef1687] Merge branch 'for-3.4/dt' of git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra into next/dt2
git bisect good f4eb28340771c12cdbf8b5ec149dbd3b0eef1687
# good: [4788d72ce6c0d71220c06a242f935a056eccf424] Merge branch 'next/soc-exynos5250-gpio' of git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung into next/drivers
git bisect good 4788d72ce6c0d71220c06a242f935a056eccf424
# good: [ae525e18258424c962be5deac171f96aaef31de5] Merge branch 'next/dt' into for-next
git bisect good ae525e18258424c962be5deac171f96aaef31de5
# good: [6f71e9213c1dd31c44824e95ea4441883fceaf9c] ARM: iop13xx: fix missing declaration of iop13xx_init_early
git bisect good 6f71e9213c1dd31c44824e95ea4441883fceaf9c
# good: [8942fdfdff095366a315eab60799c17abcabd270] Merge branch 'next/clk' into for-next
git bisect good 8942fdfdff095366a315eab60799c17abcabd270
# good: [853a0231e057c04255a848f6998f84faaa635c58] Merge branch 'samsung/soc' into next/soc2
git bisect good 853a0231e057c04255a848f6998f84faaa635c58
# good: [bc57f2ea99798f9c918b36aabd2c05e5322041f9] [arm-soc internal] add back contents file
git bisect good bc57f2ea99798f9c918b36aabd2c05e5322041f9
# bad: [1b12178157470221e98511e6aa687a53feb29963] Merge branch 'rmobile-fixes-for-linus' of git://github.com/pmundt/linux-sh into renesas/soc
git bisect bad 1b12178157470221e98511e6aa687a53feb29963
# good: [e9dd7ed2a365b021cdbb35b5cad62f6ab6aeb5d2] ARM: mach-shmobile: ap4evb: Reserve DMA memory for the frame buffer
git bisect good e9dd7ed2a365b021cdbb35b5cad62f6ab6aeb5d2
