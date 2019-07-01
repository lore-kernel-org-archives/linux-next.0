Return-Path: <SRS0=aGcV=U6=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE4CC5B578
	for <linux-next@archiver.kernel.org>; Mon,  1 Jul 2019 21:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B91621479
	for <linux-next@archiver.kernel.org>; Mon,  1 Jul 2019 21:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="O9zLReEy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfGAVOn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 1 Jul 2019 17:14:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32853 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfGAVOn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jul 2019 17:14:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so15382813wru.0
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2019 14:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UBTO6Ak70WRDstn/ys/naLinzsU4OBTkOsQZe3PSQjU=;
        b=O9zLReEymhJvNleV0p5duNJHSdL76+vsJ2rye+Lx2iAq2tH4b4/MOFHALAAOLgrlKw
         KhwVeZMKIKvlkn5Hrmoc8Cfjsnc98O72cGiBtnrIewR/sLLuBr1ujuOaQfG5P+3DKVEp
         pRGXngN6hqrB5UKzDZi59YjNSIhMRXj5SH18mpPytHflzMJwsyI2dDqtVMGM4ehHgsxH
         NrSxECZwR2z/AB2EpEBcdWNITLk0f2kn9fAOad9l1UhKUJbw5l+aiN85RkgUxFizytvX
         IKoB34uO5+ojPi6R65CH6iEaIb64iBAusVxg+5woZ2HqZju44theTiAMnxDvYOa0Eakd
         llEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UBTO6Ak70WRDstn/ys/naLinzsU4OBTkOsQZe3PSQjU=;
        b=TF1yDIMi10mIeYEKIRPhyN4nztb8gQ8uT1qqMGdWyTKia4lLEXdiol+G0kONWZr4Zn
         13LnxMrbE/kxvBzHSm/Vf8EwsWA/VFrPAnSTwRlnwqM6cFvp6j7lEKQjnuOg+4GIctN4
         Y8UCCB2KTDd8venh0mhcUKphogncDEYntR5ujAd9F6FGvIqeSjhVh6ZTuUXf1expz64W
         er16z4NlyqHH/YTZ6Sj1SK73f+nO4LLfDyqBXVqFRRfLQH6oCXWg3ulnvVUMmzeFpvMT
         pizvcb9BawtNED/r068Wvc5kwMgi0IJQA9Ha1ICujvcWmZNOfC28sh2Mo/HC5aehG+Zs
         NXrA==
X-Gm-Message-State: APjAAAV8MXm5M3NilGwbzinP0d+rl1lJEpIUBXWsnMZQDj9sDqasGl1F
        JSFlI3ruCXO3tbLffZs/wCF/4UJ2khg=
X-Google-Smtp-Source: APXvYqzQmEFdnwWCz7+oFxIIFqjBNG6d852Hgt2a28f4A9a5zzy5FSR4odmUQuvz8pg9ryhm0CBbVg==
X-Received: by 2002:adf:e705:: with SMTP id c5mr21072748wrm.270.1562015672267;
        Mon, 01 Jul 2019 14:14:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o185sm427235wmo.45.2019.07.01.14.14.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 14:14:31 -0700 (PDT)
Message-ID: <5d1a77b7.1c69fb81.ef244.2c0a@mx.google.com>
Date:   Mon, 01 Jul 2019 14:14:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20190701
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 230 builds: 34 failed, 196 passed, 34 errors,
 452 warnings (next-20190701)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 230 builds: 34 failed, 196 passed, 34 errors, 452 warnin=
gs (next-20190701)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190701/

Tree: next
Branch: master
Git Describe: next-20190701
Git Commit: 48a8a5f9a326d1c1a5505d51fb98086e5003f37e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-8) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (gcc-8) FAIL
    assabet_defconfig: (gcc-8) FAIL
    badge4_defconfig: (gcc-8) FAIL
    cerfcube_defconfig: (gcc-8) FAIL
    collie_defconfig: (gcc-8) FAIL
    ep93xx_defconfig: (gcc-8) FAIL
    h3600_defconfig: (gcc-8) FAIL
    hackkit_defconfig: (gcc-8) FAIL
    jornada720_defconfig: (gcc-8) FAIL
    lart_defconfig: (gcc-8) FAIL
    neponset_defconfig: (gcc-8) FAIL
    nuc910_defconfig: (gcc-8) FAIL
    nuc950_defconfig: (gcc-8) FAIL
    nuc960_defconfig: (gcc-8) FAIL
    omap1_defconfig: (gcc-8) FAIL
    pleb_defconfig: (gcc-8) FAIL
    shannon_defconfig: (gcc-8) FAIL
    simpad_defconfig: (gcc-8) FAIL
    u8500_defconfig: (gcc-8) FAIL

mips:
    bcm63xx_defconfig: (gcc-8) FAIL
    bigsur_defconfig: (gcc-8) FAIL
    cavium_octeon_defconfig: (gcc-8) FAIL
    ip27_defconfig: (gcc-8) FAIL
    loongson3_defconfig: (gcc-8) FAIL
    mips_paravirt_defconfig: (gcc-8) FAIL
    nlm_xlp_defconfig: (gcc-8) FAIL
    nlm_xlr_defconfig: (gcc-8) FAIL
    omega2p_defconfig: (gcc-8) FAIL
    rt305x_defconfig: (gcc-8) FAIL
    sb1250_swarm_defconfig: (gcc-8) FAIL
    vocore2_defconfig: (gcc-8) FAIL
    xway_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 1 error, 9 warnings
    allmodconfig (gcc-8): 1 error, 1 warning
    defconfig (clang-8): 44 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (clang-8): 44 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (clang-8): 44 warnings
    defconfig (clang-8): 44 warnings
    defconfig (gcc-8): 2 warnings

arm:
    allmodconfig (gcc-8): 1 error, 1 warning
    assabet_defconfig (gcc-8): 1 error
    badge4_defconfig (gcc-8): 1 error
    cerfcube_defconfig (gcc-8): 1 error
    collie_defconfig (gcc-8): 1 error
    ep93xx_defconfig (gcc-8): 1 error
    exynos_defconfig (gcc-8): 2 warnings
    h3600_defconfig (gcc-8): 1 error
    hackkit_defconfig (gcc-8): 1 error
    jornada720_defconfig (gcc-8): 1 error
    lart_defconfig (gcc-8): 1 error
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    neponset_defconfig (gcc-8): 1 error
    nuc910_defconfig (gcc-8): 1 error
    nuc950_defconfig (gcc-8): 1 error
    nuc960_defconfig (gcc-8): 1 error
    omap1_defconfig (gcc-8): 1 error
    pleb_defconfig (gcc-8): 1 error
    pxa_defconfig (gcc-8): 3 warnings
    shannon_defconfig (gcc-8): 1 error
    simpad_defconfig (gcc-8): 1 error
    tegra_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 1 error, 1 warning

i386:

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 3 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 error, 1 warning
    bigsur_defconfig (gcc-8): 1 error, 3 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 1 error, 3 warnings
    ci20_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 6 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 1 error, 3 warnings
    ip28_defconfig (gcc-8): 6 warnings
    ip32_defconfig (gcc-8): 6 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 6 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 1 error, 3 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 4 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 1 error, 3 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 4 warnings
    nlm_xlp_defconfig (gcc-8): 1 error, 5 warnings
    nlm_xlr_defconfig (gcc-8): 1 error, 1 warning
    omega2p_defconfig (gcc-8): 1 error, 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 3 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 2 warnings
    rt305x_defconfig (gcc-8): 1 error, 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 error, 2 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 error, 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 1 error, 1 warning

riscv:
    rv32_defconfig (gcc-8): 4 warnings

x86_64:
    allmodconfig (gcc-8): 47 warnings
    tinyconfig (gcc-8): 1 warning

Errors summary:

    22   drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_h=
w' follows non-static declaration
    3    drivers/hwtracing/coresight/coresight.c:1051:11: error: passing ar=
gument 4 of 'bus_find_device' from incompatible pointer type [-Werror=3Dinc=
ompatible-pointer-types]
    2    (.text+0xafc): undefined reference to `arch_dma_prep_coherent'
    1    drivers/hwtracing/coresight/coresight.c:1051:11: error: incompatib=
le pointer types passing 'int (struct device *, void *)' to parameter of ty=
pe 'int (*)(struct device *, const void *)' [-Werror,-Wincompatible-pointer=
-types]
    1    direct.c:(.text+0x934): undefined reference to `arch_dma_prep_cohe=
rent'
    1    /home/buildslave/workspace/workspace/kernel-build@9/linux/build/..=
/kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'
    1    /home/buildslave/workspace/workspace/kernel-build@5/linux/build/..=
/kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'
    1    /home/buildslave/workspace/kernel-build@2/linux/build/../kernel/dm=
a/direct.c:144: undefined reference to `arch_dma_prep_coherent'
    1    /home/buildslave/workspace/kernel-build/linux/build/../kernel/dma/=
direct.c:144: undefined reference to `arch_dma_prep_coherent'
    1    (.text+0xb84): undefined reference to `arch_dma_prep_coherent'

Warnings summary:

    147  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    15   drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used un=
initialized in this function [-Wmaybe-uninitialized]
    12   drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is =
negative [-Wshift-count-negative]
    12   drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is =
negative [-Wshift-count-negative]
    12   drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is =
negative [-Wshift-count-negative]
    12   drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is =
negative [-Wshift-count-negative]
    12   drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uni=
nitialized in this function [-Wmaybe-uninitialized]
    8    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is =
negative [-Wshift-count-negative]
    7    1 warning generated.
    5    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning =
(reg_format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 by=
tes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    5    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warn=
ing (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #=
size-cells value
    5    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warn=
ing (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #=
address-cells value
    5    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_=
reg): Failed prerequisite 'reg_format'
    5    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_devi=
ce_bus_num): Failed prerequisite 'reg_format'
    5    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_=
reg): Failed prerequisite 'reg_format'
    4    drivers/soc/rockchip/pm_domains.c:744:21: warning: shift count is =
negative [-Wshift-count-negative]
    4    drivers/gpu/drm/drm_connector.c:144:15: warning: address of array =
'mode->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
    4    41 warnings generated.
    3    drivers/hwmon/lm90.c:597:42: warning: 'config_orig' may be used un=
initialized in this function [-Wmaybe-uninitialized]
    3    cc1: some warnings being treated as errors
    2    arch/arc/kernel/unwind.c:184:14: warning: 'unw_hdr_alloc' defined =
but not used [-Wunused-function]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/wireless/nl80211.c:6481:1: warning: the frame size of 2112 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5117:1: warning: the frame size of 2776 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2363:1: warning: the frame size of 4584 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1732:1: warning: the frame size of 2280 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    mm/shmem.c:2719:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: =
call to stackleak_track_stack() with UACCESS enabled
    1    fs/proc/proc_sysctl.c:701:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1876:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2224 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1186:1: warning: the frame size of 3176 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2616 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2080 =
bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dir.c:3080:1: warning: the frame size of 2056 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2112 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/namei.c:3136:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1646:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: t=
he frame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:428:1: wa=
rning: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larg=
er-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the =
frame size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the=
 frame size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:26023=
:1: warning: the frame size of 2440 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894=
:1: warning: the frame size of 3128 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552=
:1: warning: the frame size of 3152 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/cadence/macb_main.c:48:39: warning: 'mgmt' de=
fined but not used [-Wunused-variable]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 28=
40 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the fra=
me size of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/i2c/tvp5150.c:253:1: warning: the frame size of 3952=
 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame s=
ize of 2104 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame s=
ize of 2808 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame s=
ize of 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame s=
ize of 5880 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame s=
ize of 2328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame s=
ize of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame s=
ize of 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame s=
ize of 3288 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame s=
ize of 3016 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame s=
ize of 5320 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame s=
ize of 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3630:1: warning: the frame=
 size of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3123:1: warning: the frame=
 size of 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size o=
f 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the =
frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    arch/x86/kvm/x86.c:4323:1: warning: the frame size of 2160 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:340:1: warning: the frame size of 2=
856 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    2 warnings generated.
    1    .config:1175:warning: override: UNWINDER_GUESS changes choice state

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
acs5k_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
acs5k_tiny_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 1 error, 9 warnings, 0 sectio=
n mismatches

Errors:
    drivers/hwtracing/coresight/coresight.c:1051:11: error: incompatible po=
inter types passing 'int (struct device *, void *)' to parameter of type 'i=
nt (*)(struct device *, const void *)' [-Werror,-Wincompatible-pointer-type=
s]

Warnings:
    mm/shmem.c:2719:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/base.c:1876:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:701:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1646:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3136:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    drivers/hwtracing/coresight/coresight.c:1051:11: error: passing argumen=
t 4 of 'bus_find_device' from incompatible pointer type [-Werror=3Dincompat=
ible-pointer-types]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    drivers/hwtracing/coresight/coresight.c:1051:11: error: passing argumen=
t 4 of 'bus_find_device' from incompatible pointer type [-Werror=3Dincompat=
ible-pointer-types]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 47 warnings, 0 secti=
on mismatches

Warnings:
    arch/x86/kernel/cpu/mshyperv.c:340:1: warning: the frame size of 2856 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    arch/x86/kvm/x86.c:4323:1: warning: the frame size of 2160 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2080 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2112 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dir.c:3080:1: warning: the frame size of 2056 bytes is larger =
than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2616 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/super.c:1186:1: warning: the frame size of 3176 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2224 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: call =
to stackleak_track_stack() with UACCESS enabled
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/hwmon/lm90.c:597:42: warning: 'config_orig' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    net/wireless/nl80211.c:1732:1: warning: the frame size of 2280 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6481:1: warning: the frame size of 2112 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2363:1: warning: the frame size of 4584 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5117:1: warning: the frame size of 2776 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size of 272=
0 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame size o=
f 3016 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame size o=
f 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame size o=
f 2328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame size o=
f 2104 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame size o=
f 3288 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame size o=
f 5320 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame size o=
f 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame size o=
f 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame size o=
f 2808 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame size o=
f 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame size o=
f 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame size o=
f 5880 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame size o=
f 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3123:1: warning: the frame size=
 of 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3630:1: warning: the frame size=
 of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:253:1: warning: the frame size of 3952 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2840 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3152 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3128 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:26023:1: w=
arning: the frame size of 2440 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:428:1: warning=
: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: the fr=
ame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 secti=
on mismatches

Errors:
    (.text+0xafc): undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, =
0 section mismatches

Errors:
    /home/buildslave/workspace/workspace/kernel-build@9/linux/build/../kern=
el/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mismatch =
in conditional expression

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 44 warnings, 0 section=
 mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:744:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    drivers/gpu/drm/drm_connector.c:144:15: warning: address of array 'mode=
->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 44 warnings, 0 section mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:744:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    drivers/gpu/drm/drm_connector.c:144:15: warning: address of array 'mode=
->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 44 warnings, 0 section mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:744:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    drivers/gpu/drm/drm_connector.c:144:15: warning: address of array 'mode=
->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, clang-8) =E2=80=94 PASS, 0 errors, 44 warnings,=
 0 section mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:744:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    drivers/gpu/drm/drm_connector.c:144:15: warning: address of array 'mode=
->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
iop13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
iop33x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 section=
 mismatches

Errors:
    direct.c:(.text+0x934): undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ks8695_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 se=
ction mismatches

Errors:
    (.text+0xb84): undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    {standard input}:131: Warning: macro instruction expanded into multiple=
 instructions
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, =
0 section mismatches

Errors:
    /home/buildslave/workspace/kernel-build@2/linux/build/../kernel/dma/dir=
ect.c:144: undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/hwmon/lm90.c:597:42: warning: 'config_orig' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_=
format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bu=
s_num): Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #addre=
ss-cells value
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-=
cells value

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 8 warnings, 0 section mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_=
format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bu=
s_num): Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #addre=
ss-cells value
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-=
cells value

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_=
format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bu=
s_num): Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #addre=
ss-cells value
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-=
cells value

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 =
warnings, 0 section mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_=
format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bu=
s_num): Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #addre=
ss-cells value
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-=
cells value

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warni=
ngs, 0 section mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_=
format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bu=
s_num): Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #addre=
ss-cells value
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-=
cells value

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 5 warnings, 0 sect=
ion mismatches

Errors:
    /home/buildslave/workspace/workspace/kernel-build@5/linux/build/../kern=
el/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/hwmon/lm90.c:597:42: warning: 'config_orig' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    /home/buildslave/workspace/kernel-build/linux/build/../kernel/dma/direc=
t.c:144: undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nuc910_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
nuc950_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
nuc960_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
    drivers/net/ethernet/cadence/macb_main.c:48:39: warning: 'mgmt' defined=
 but not used [-Wunused-variable]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info' [-W=
unused-variable]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0=
 section mismatches

Errors:
    (.text+0xafc): undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/hwmon/lm90.c:597:42: warning: 'config_stop' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
    drivers/hwmon/lm90.c:598:3: warning: 'config_orig' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1175:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/hwtracing/coresight/coresight.c:1051:11: error: passing argumen=
t 4 of 'bus_find_device' from incompatible pointer type [-Werror=3Dincompat=
ible-pointer-types]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/arc/kernel/unwind.c:184:14: warning: 'unw_hdr_alloc' defined but n=
ot used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/arc/kernel/unwind.c:184:14: warning: 'unw_hdr_alloc' defined but n=
ot used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/clk/clk.h:36:23: error: static declaration of '__clk_get_hw' fo=
llows non-static declaration

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
