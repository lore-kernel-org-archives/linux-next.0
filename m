From: Guenter Roeck <linux@roeck-us.net>
Subject: Runtime problems since next-20151008 with qemu/beagle boards
Date: Sun, 25 Oct 2015 19:26:38 -0700
Message-ID: <20151026022638.GA13015@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53915 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752387AbbJZC0l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 Oct 2015 22:26:41 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org

Hi all,

ever since next-20101008, I am having trouble running beagle board
configurations in qemu. Example is multi_v7_defconfig with omap3-beagle
devicetree file, or with omap3-beagle-xm. The system just doesn't
boot anymore (no kernel log messages).

I have tried to bisect twice, but I don't get conclusive results.
The latest bisect log (from next-20151022) is below. I tried to bisect
into the merge commits; bisect specifically claims that the merge itself
is causing the problem, not any of the merged commits.

Couple of questions: Has anyone tried next-20151008 or later with above
configuration on a real system ?  If so, does it work ? If it doesn't work
on a real system, any idea what might be wrong in the code ?
If it works on a real system, any idea what might cause qemu to hang ?

Thanks,
Guenter

---
# bad: [6dcf94ff0c9e28e5790799e53641dd256745f425] Add linux-next specific files for 20151022
# good: [7379047d5585187d1288486d4627873170d0005a] Linux 4.3-rc6
git bisect start 'HEAD' 'v4.3-rc6'
# good: [c3d1cd2b1e542e5ba6a844fd40fa5e62a896cfc2] Merge remote-tracking branch 'block/for-next'
git bisect good c3d1cd2b1e542e5ba6a844fd40fa5e62a896cfc2
# good: [c3af8a28f43315fc46753465a4e77e5619dd9f30] staging: IB/hfi1: use TASK_COMM_LEN in hfi1_ctxtdata
git bisect good c3af8a28f43315fc46753465a4e77e5619dd9f30
# good: [41783383487fc80d2acdd78fb9133d441371510b] Merge remote-tracking branch 'driver-core/driver-core-next'
git bisect good 41783383487fc80d2acdd78fb9133d441371510b
# good: [1709035022efcdcf316010592537de2033335e4e] Merge remote-tracking branch 'target-merge/for-next-merge'
git bisect good 1709035022efcdcf316010592537de2033335e4e
# good: [641e7642617127da14e683da8ec690d8404ea83f] rbtree-clarify-documentation-of-rbtree_postorder_for_each_entry_safe-fix
git bisect good 641e7642617127da14e683da8ec690d8404ea83f
# bad: [a1a15239a59287d6d56cf43e84d3cc878bca828f] Merge remote-tracking branch 'clk/clk-next'
git bisect bad a1a15239a59287d6d56cf43e84d3cc878bca828f
# good: [87fd47bb754496a1ba005fca022eee1b30b3cee9] Merge remote-tracking branch 'pwm/for-next'
git bisect good 87fd47bb754496a1ba005fca022eee1b30b3cee9
# good: [caac0ef8414bfbe296e6617511908ba249f0ab92] Merge tag 'clk-samsung-4.4' of git://linuxtv.org/snawrocki/samsung into clk-next
git bisect good caac0ef8414bfbe296e6617511908ba249f0ab92
# good: [67d7188afe23e4b1b82ee6fed35c14387f169f74] Merge branch 'clk-bcm2835' into clk-next
git bisect good 67d7188afe23e4b1b82ee6fed35c14387f169f74
# good: [b1a0eeb4f6bbfb63c356578eaf76003faa58f56b] clk: xgene: Remove unused setup.h include
git bisect good b1a0eeb4f6bbfb63c356578eaf76003faa58f56b
# good: [eae14465de250be75021659789f138a70a553ac5] Merge tag 'tegra-for-4.4-clk' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into clk-next
git bisect good eae14465de250be75021659789f138a70a553ac5
# good: [254f9463c5d41a7ac9d35ca24e6c3196814cb890] Merge branch 'clk-shmobile-for-v4.4' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-next
git bisect good 254f9463c5d41a7ac9d35ca24e6c3196814cb890
# good: [1256f10fb26e5824fde12314b5f4690797478678] clk: berlin: bg2: remove CLK_IGNORE_UNUSED flag for sdio clk
git bisect good 1256f10fb26e5824fde12314b5f4690797478678
# good: [63243a4da7d0dfa19dcacd0a529782eeb2f86f92] clk: iproc: Fix PLL output frequency calculation
git bisect good 63243a4da7d0dfa19dcacd0a529782eeb2f86f92
# first bad commit: [a1a15239a59287d6d56cf43e84d3cc878bca828f] Merge remote-tracking branch 'clk/clk-next'

---
Bisect into the merge:

# bad: [a1a15239a59287d6d56cf43e84d3cc878bca828f] Merge remote-tracking branch 'clk/clk-next'
# good: [87fd47bb754496a1ba005fca022eee1b30b3cee9] Merge remote-tracking branch 'pwm/for-next'
git bisect start 'a1a15239a59287d6d56cf43e84d3cc878bca828f' 'a1a15239a59287d6d56cf43e84d3cc878bca828f~1'
# good: [caac0ef8414bfbe296e6617511908ba249f0ab92] Merge tag 'clk-samsung-4.4' of git://linuxtv.org/snawrocki/samsung into clk-next
git bisect good caac0ef8414bfbe296e6617511908ba249f0ab92
# good: [67d7188afe23e4b1b82ee6fed35c14387f169f74] Merge branch 'clk-bcm2835' into clk-next
git bisect good 67d7188afe23e4b1b82ee6fed35c14387f169f74
# good: [b1a0eeb4f6bbfb63c356578eaf76003faa58f56b] clk: xgene: Remove unused setup.h include
git bisect good b1a0eeb4f6bbfb63c356578eaf76003faa58f56b
# good: [eae14465de250be75021659789f138a70a553ac5] Merge tag 'tegra-for-4.4-clk' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into clk-next
git bisect good eae14465de250be75021659789f138a70a553ac5
# good: [254f9463c5d41a7ac9d35ca24e6c3196814cb890] Merge branch 'clk-shmobile-for-v4.4' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-next
git bisect good 254f9463c5d41a7ac9d35ca24e6c3196814cb890
# good: [1256f10fb26e5824fde12314b5f4690797478678] clk: berlin: bg2: remove CLK_IGNORE_UNUSED flag for sdio clk
git bisect good 1256f10fb26e5824fde12314b5f4690797478678
# good: [63243a4da7d0dfa19dcacd0a529782eeb2f86f92] clk: iproc: Fix PLL output frequency calculation
git bisect good 63243a4da7d0dfa19dcacd0a529782eeb2f86f92
# first bad commit: [a1a15239a59287d6d56cf43e84d3cc878bca828f] Merge remote-tracking branch 'clk/clk-next'
