From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161205 build: 3 failures 4 warnings (next-20161205)
Date: Mon, 05 Dec 2016 07:56:06 +0000
Message-ID: <E1cDo86-0008IX-9W@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35434 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbcLEItf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2016 03:49:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161205
Git describe: next-20161205
Commit: cef87e9115 Add linux-next specific files for 20161205

Build Time: 12 min 33 sec

Passed:    7 / 10   ( 70.00 %)
Failed:    3 / 10   ( 30.00 %)

Errors: 17
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../arch/arm64/lib/clear_user.S:33: Error: bad or irreducible absolute expression
../arch/arm64/lib/clear_user.S:53: Error: bad or irreducible absolute expression
../arch/arm64/lib/clear_user.S:33: Error: attempt to move .org backwards
../arch/arm64/lib/clear_user.S:53: Error: attempt to move .org backwards
../arch/arm64/lib/copy_from_user.S:67: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_from_user.S:70: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_from_user.S:67: Error: attempt to move .org backwards
../arch/arm64/lib/copy_from_user.S:70: Error: attempt to move .org backwards
../arch/arm64/lib/copy_in_user.S:68: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_in_user.S:71: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_in_user.S:68: Error: attempt to move .org backwards
../arch/arm64/lib/copy_in_user.S:71: Error: attempt to move .org backwards
../arch/arm64/lib/copy_to_user.S:66: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_to_user.S:69: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_to_user.S:66: Error: attempt to move .org backwards
../arch/arm64/lib/copy_to_user.S:69: Error: attempt to move .org backwards

	arm64-allmodconfig
../arch/arm64/include/asm/probes.h:18:25: fatal error: asm/opcodes.h: No such file or directory

	arm64-defconfig
../arch/arm64/lib/clear_user.S:33: Error: bad or irreducible absolute expression
../arch/arm64/lib/clear_user.S:53: Error: bad or irreducible absolute expression
../arch/arm64/lib/clear_user.S:33: Error: attempt to move .org backwards
../arch/arm64/lib/clear_user.S:53: Error: attempt to move .org backwards
../arch/arm64/lib/copy_from_user.S:67: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_from_user.S:70: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_from_user.S:67: Error: attempt to move .org backwards
../arch/arm64/lib/copy_from_user.S:70: Error: attempt to move .org backwards
../arch/arm64/lib/copy_in_user.S:68: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_in_user.S:71: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_in_user.S:68: Error: attempt to move .org backwards
../arch/arm64/lib/copy_in_user.S:71: Error: attempt to move .org backwards
../arch/arm64/lib/copy_to_user.S:66: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_to_user.S:69: Error: bad or irreducible absolute expression
../arch/arm64/lib/copy_to_user.S:66: Error: attempt to move .org backwards
../arch/arm64/lib/copy_to_user.S:69: Error: attempt to move .org backwards

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 17
	  2 ../arch/arm64/lib/copy_to_user.S:69: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/copy_to_user.S:69: Error: attempt to move .org backwards
	  2 ../arch/arm64/lib/copy_to_user.S:66: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/copy_to_user.S:66: Error: attempt to move .org backwards
	  2 ../arch/arm64/lib/copy_in_user.S:71: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/copy_in_user.S:71: Error: attempt to move .org backwards
	  2 ../arch/arm64/lib/copy_in_user.S:68: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/copy_in_user.S:68: Error: attempt to move .org backwards
	  2 ../arch/arm64/lib/copy_from_user.S:70: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/copy_from_user.S:70: Error: attempt to move .org backwards
	  2 ../arch/arm64/lib/copy_from_user.S:67: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/copy_from_user.S:67: Error: attempt to move .org backwards
	  2 ../arch/arm64/lib/clear_user.S:53: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/clear_user.S:53: Error: attempt to move .org backwards
	  2 ../arch/arm64/lib/clear_user.S:33: Error: bad or irreducible absolute expression
	  2 ../arch/arm64/lib/clear_user.S:33: Error: attempt to move .org backwards
	  1 ../arch/arm64/include/asm/probes.h:18:25: fatal error: asm/opcodes.h: No such file or directory

Warnings Summary: 4
	  1 ../net/netfilter/nft_payload.c:261:15: warning: 'tsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/net/checksum.h:71:9: warning: 'fsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/apm/xgene/xgene_enet_cle.c:836:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 16 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/lib/clear_user.S:33: Error: bad or irreducible absolute expression
	../arch/arm64/lib/clear_user.S:53: Error: bad or irreducible absolute expression
	../arch/arm64/lib/clear_user.S:33: Error: attempt to move .org backwards
	../arch/arm64/lib/clear_user.S:53: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_from_user.S:67: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_from_user.S:70: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_from_user.S:67: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_from_user.S:70: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_in_user.S:68: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_in_user.S:71: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_in_user.S:68: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_in_user.S:71: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_to_user.S:66: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_to_user.S:69: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_to_user.S:66: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_to_user.S:69: Error: attempt to move .org backwards

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/probes.h:18:25: fatal error: asm/opcodes.h: No such file or directory

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../net/netfilter/nft_payload.c:261:15: warning: 'tsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/net/checksum.h:71:9: warning: 'fsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/apm/xgene/xgene_enet_cle.c:836:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 16 errors, 1 warnings, 0 section mismatches

Errors:
	../arch/arm64/lib/clear_user.S:33: Error: bad or irreducible absolute expression
	../arch/arm64/lib/clear_user.S:53: Error: bad or irreducible absolute expression
	../arch/arm64/lib/clear_user.S:33: Error: attempt to move .org backwards
	../arch/arm64/lib/clear_user.S:53: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_from_user.S:67: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_from_user.S:70: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_from_user.S:67: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_from_user.S:70: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_in_user.S:68: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_in_user.S:71: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_in_user.S:68: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_in_user.S:71: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_to_user.S:66: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_to_user.S:69: Error: bad or irreducible absolute expression
	../arch/arm64/lib/copy_to_user.S:66: Error: attempt to move .org backwards
	../arch/arm64/lib/copy_to_user.S:69: Error: attempt to move .org backwards

Warnings:
	../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
