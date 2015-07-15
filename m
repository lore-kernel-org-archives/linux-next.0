From: Guenter Roeck <linux@roeck-us.net>
Subject: Crash in -next due to 'MIPS: Move FP usage checks into
 protected_{save, restore}_fp_context'
Date: Wed, 15 Jul 2015 09:09:18 -0700
Message-ID: <20150715160918.GA27653@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48637 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751877AbbGOQJd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2015 12:09:33 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-next@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org

Hi,

my qemu test for mipsel crashes with next-20150715 as follows.

...
Btrfs loaded
console [netcon0] enabled
netconsole: network logging started
Freeing unused kernel memory: 284K (808f9000 - 80940000)
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000008

Bisect points to commit 'MIPS: Move FP usage checks into protected_{save,
restore}_fp_context'. Bisect log is as follows.

The problem is not seen with bit endian qemu test.

Please let me know if there is anything I can do to help debugging
this problem.

Thanks,
Guenter
---

# bad: [f4d61b2d73c1e4964ad68df238af5005485469af] Add linux-next specific files for 20150715
# good: [bc0195aad0daa2ad5b0d76cce22b167bc3435590] Linux 4.2-rc2
git bisect start 'HEAD' 'v4.2-rc2'
# bad: [897f492ee766d354b949f3838cbfda8978cfd3cd] Merge remote-tracking branch 'crypto/master'
git bisect bad 897f492ee766d354b949f3838cbfda8978cfd3cd
# bad: [687fe9993e4fbe728113086eb9525360465694e6] Merge remote-tracking branch 'mips/mips-for-linux-next'
git bisect bad 687fe9993e4fbe728113086eb9525360465694e6
# good: [a06e5ae4e8d6d5846809e94d0d45afcc5a9eaf35] Merge remote-tracking branch 'omap/for-next'
git bisect good a06e5ae4e8d6d5846809e94d0d45afcc5a9eaf35
# good: [badbfaedef0876d3cffb3264512aaec8cc162c61] Merge remote-tracking branch 'tegra/for-next'
git bisect good badbfaedef0876d3cffb3264512aaec8cc162c61
# bad: [88841d986cebe1207a47cd7422f5069b2616b194] MIPS: Advertise MSA support via HWCAP when present
git bisect bad 88841d986cebe1207a47cd7422f5069b2616b194
# good: [7c1f7b83170bc14a3e461a9b5595fcecf857da70] MIPS: octeon: Replace the homebrewn flow handler
git bisect good 7c1f7b83170bc14a3e461a9b5595fcecf857da70
# good: [186a699fdf6f0866ca980bcf5e79f54922fe52c2] MIPS: Introduce accessors for MSA vector registers
git bisect good 186a699fdf6f0866ca980bcf5e79f54922fe52c2
# bad: [1793cdaa84ed5c4025a36793f350b07b49555b57] MIPS: Skip odd double FP registers when copying FP32 sigcontext
git bisect bad 1793cdaa84ed5c4025a36793f350b07b49555b57
# good: [8a6bb0ab74eaca5f2a4e60f94df2ea5b08cdfd63] MIPS: Simplify EVA FP context handling code
git bisect good 8a6bb0ab74eaca5f2a4e60f94df2ea5b08cdfd63
# good: [6f47ebd751531249fe0e2b4d3afdfcbf9f66dbd8] MIPS: Use struct mips_abi offsets to save FP context
git bisect good 6f47ebd751531249fe0e2b4d3afdfcbf9f66dbd8
# bad: [fa3156ca734cb65f23df0f844433e75ea1da37f3] MIPS: Move FP usage checks into protected_{save, restore}_fp_context
git bisect bad fa3156ca734cb65f23df0f844433e75ea1da37f3
# first bad commit: [fa3156ca734cb65f23df0f844433e75ea1da37f3] MIPS: Move FP usage checks into protected_{save, restore}_fp_context
