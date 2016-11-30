From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161130 build: 2 failures 20 warnings (next-20161130)
Date: Wed, 30 Nov 2016 08:58:46 +0000
Message-ID: <E1cC0iy-0000y9-Pi@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49902 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757610AbcK3I65 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 03:58:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161130
Git describe: next-20161130
Commit: 59ab008349 Add linux-next specific files for 20161130

Build Time: 151 min 57 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 16
Warnings: 20
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "cnstr_shdsc_ablkcipher_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_xts_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_xts_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4106_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4106_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4543_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4543_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_gcm_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_gcm_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_null_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_null_encap" [drivers/crypto/caam/caamalg.ko] undefined!

	arm-allmodconfig
ERROR: "cnstr_shdsc_ablkcipher_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_xts_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_xts_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4106_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4106_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4543_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_rfc4543_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_gcm_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_gcm_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_encap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_null_decap" [drivers/crypto/caam/caamalg.ko] undefined!
ERROR: "cnstr_shdsc_aead_null_encap" [drivers/crypto/caam/caamalg.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
     18 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 16
	  2 ERROR: "cnstr_shdsc_xts_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_xts_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_rfc4543_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_rfc4543_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_rfc4106_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_rfc4106_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_gcm_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_gcm_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_aead_null_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_aead_null_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_aead_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_aead_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_aead_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_ablkcipher_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	  2 ERROR: "cnstr_shdsc_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!

Warnings Summary: 20
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	  1 ../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/crypto/caam/caamalg_desc.c:918:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:848:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:776:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:705:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:67:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:629:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:539:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:236:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:228:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:143:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1271:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1219:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1148:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1143:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1079:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1074:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1014:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/crypto/caam/caamalg_desc.c:1009:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 16 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "cnstr_shdsc_ablkcipher_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_xts_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_xts_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4106_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4106_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4543_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4543_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_gcm_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_gcm_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_null_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_null_encap" [drivers/crypto/caam/caamalg.ko] undefined!

Warnings:
	../include/linux/kern_levels.h:4:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 16 errors, 18 warnings, 0 section mismatches

Errors:
	ERROR: "cnstr_shdsc_ablkcipher_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_xts_ablkcipher_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_xts_ablkcipher_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4106_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4106_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4543_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_rfc4543_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_gcm_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_gcm_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_givencap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_encap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_null_decap" [drivers/crypto/caam/caamalg.ko] undefined!
	ERROR: "cnstr_shdsc_aead_null_encap" [drivers/crypto/caam/caamalg.ko] undefined!

Warnings:
	../drivers/crypto/caam/caamalg_desc.c:67:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:143:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:228:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:236:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:539:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:629:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:705:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:776:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:848:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:918:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1009:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1014:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1074:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1079:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1143:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1148:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1219:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/caamalg_desc.c:1271:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
