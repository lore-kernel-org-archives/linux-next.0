Return-Path: <SRS0=fDmY=VH=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2F5C74A36
	for <linux-next@archiver.kernel.org>; Wed, 10 Jul 2019 19:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0945920651
	for <linux-next@archiver.kernel.org>; Wed, 10 Jul 2019 19:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="OZ0FvYDh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfGJTKl (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 10 Jul 2019 15:10:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55011 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbfGJTKl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jul 2019 15:10:41 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so3362315wme.4
        for <linux-next@vger.kernel.org>; Wed, 10 Jul 2019 12:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=26yrh/4P00B+n2f/qP9i3pn35QBxh98TT7djzPxU62g=;
        b=OZ0FvYDhnYcgdgrsncFe4PmcrodHpYQWKE1tBFuz9NbVcl58gVS+gdHDL2wmIds5jE
         icOuxQAq4c/t3CGOYIuad4EmiY4KnggzyIIPHopXpGaxlvBPjZIvgDkxxEnCYWEv6f3h
         pA/g+1Bv4Qpt8yBzMJo967qdnodUtjYDvNaM8Yo4lI8SSV1xhMB/28ns7z51qZzDqVlw
         8h9b7VkG+PKGabixVnsYfMFKWIRXl0OcKZ/odJGLE1FOhhqwB2FFWQfV/gua9fXrKWZJ
         WiWbYRanofxHPmpWFEKrx8RS/ELLuq46DUtjPEZcGkK/rddOdntErcGdV/lgKj/GRQvM
         FKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=26yrh/4P00B+n2f/qP9i3pn35QBxh98TT7djzPxU62g=;
        b=NmqOUvFxf7gzHeqDO3kB8YsY76BkEcdmsPgQp74e4O8AalyzYLML0PROed/+LSjT48
         fzabKdOQF+ynaZZ5XY0m+nnhicWUIcUG236Tdmc6dD7Ne0+KLs12Qz/Dl8Cf4XEHIscH
         ldO6CsI2pLQZ317iqE4824pcIFZ0tJg/Wiw59xaIebMvHuh3eHo93HqZqGF2QNOquPOX
         xQ+IWiB+ztMqT7JgLZ1vpqZR4wTw0giat8o6+gLrcYwXzVGsV9J5zTuyHe/W1Uspk1F2
         p8oOnRDHyagqK4NENvPXIz2XLjIqrOladK+xaTs0pKrUqrnyww5rYBQGNmZYdl9rZsUX
         xr/Q==
X-Gm-Message-State: APjAAAVprHUH12b/O05/ZhNA3W9NhjrUqvpBbMoZQq6BiOnDxQbH9y3Q
        10MuFy7Dpl3CjtDqdjfB4SGMcmVO97pXNQ==
X-Google-Smtp-Source: APXvYqwzOyYj0HnpKOBTtvbfi20vrF5xP2rNoixleJYYr9xSkwhx+Gzm4NTd4vaBvAdcAiceTNKdOw==
X-Received: by 2002:a05:600c:303:: with SMTP id q3mr6775613wmd.130.1562785828680;
        Wed, 10 Jul 2019 12:10:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r21sm6809778wrc.83.2019.07.10.12.10.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 12:10:28 -0700 (PDT)
Message-ID: <5d263824.1c69fb81.9a3ed.6c3e@mx.google.com>
Date:   Wed, 10 Jul 2019 12:10:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.2-3342-g43c27ecab3ce
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 223 builds: 11 failed, 212 passed, 41 errors,
 1717 warnings (v5.2-3342-g43c27ecab3ce)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 223 builds: 11 failed, 212 passed, 41 errors, 171=
7 warnings (v5.2-3342-g43c27ecab3ce)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-3342-g43c27ecab3ce/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-3342-g43c27ecab3ce
Git Commit: 43c27ecab3ce227701e63bf96f36a1601878d072
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-8) FAIL

mips:
    ar7_defconfig: (gcc-8) FAIL
    ath79_defconfig: (gcc-8) FAIL
    bcm63xx_defconfig: (gcc-8) FAIL
    cavium_octeon_defconfig: (gcc-8) FAIL
    gpr_defconfig: (gcc-8) FAIL
    loongson1b_defconfig: (gcc-8) FAIL
    loongson1c_defconfig: (gcc-8) FAIL
    malta_kvm_defconfig: (gcc-8) FAIL
    mtx1_defconfig: (gcc-8) FAIL
    pistachio_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-8): 3 warnings
    axs103_smp_defconfig (gcc-8): 3 warnings
    haps_hs_defconfig (gcc-8): 3 warnings
    haps_hs_smp_defconfig (gcc-8): 3 warnings
    hsdk_defconfig (gcc-8): 3 warnings
    nsim_hs_defconfig (gcc-8): 3 warnings
    nsim_hs_defconfig (gcc-8): 3 warnings
    nsim_hs_smp_defconfig (gcc-8): 3 warnings
    nsimosci_hs_defconfig (gcc-8): 3 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 3 warnings
    vdk_hs38_defconfig (gcc-8): 3 warnings
    vdk_hs38_smp_defconfig (gcc-8): 3 warnings

arm64:
    allmodconfig (gcc-8): 147 warnings
    allnoconfig (gcc-8): 5 warnings
    defconfig (gcc-8): 153 warnings
    defconfig (gcc-8): 153 warnings
    defconfig (gcc-8): 153 warnings
    defconfig (gcc-8): 153 warnings
    tinyconfig (gcc-8): 5 warnings

arm:
    acs5k_defconfig (gcc-8): 3 warnings
    acs5k_tiny_defconfig (gcc-8): 3 warnings
    allnoconfig (gcc-8): 1 warning
    am200epdkit_defconfig (gcc-8): 3 warnings
    aspeed_g4_defconfig (gcc-8): 4 warnings
    aspeed_g5_defconfig (gcc-8): 8 warnings
    assabet_defconfig (gcc-8): 4 warnings
    at91_dt_defconfig (gcc-8): 7 warnings
    axm55xx_defconfig (gcc-8): 20 warnings
    badge4_defconfig (gcc-8): 4 warnings
    bcm2835_defconfig (gcc-8): 8 warnings
    cerfcube_defconfig (gcc-8): 4 warnings
    clps711x_defconfig (gcc-8): 3 warnings
    cm_x2xx_defconfig (gcc-8): 3 warnings
    cm_x300_defconfig (gcc-8): 3 warnings
    cns3420vb_defconfig (gcc-8): 3 warnings
    colibri_pxa270_defconfig (gcc-8): 5 warnings
    colibri_pxa300_defconfig (gcc-8): 3 warnings
    collie_defconfig (gcc-8): 4 warnings
    corgi_defconfig (gcc-8): 4 warnings
    davinci_all_defconfig (gcc-8): 3 warnings
    dove_defconfig (gcc-8): 3 warnings
    ebsa110_defconfig (gcc-8): 1 warning
    efm32_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 3 warnings
    ep93xx_defconfig (gcc-8): 4 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 11 warnings
    ezx_defconfig (gcc-8): 3 warnings
    footbridge_defconfig (gcc-8): 4 warnings
    gemini_defconfig (gcc-8): 2 warnings
    h3600_defconfig (gcc-8): 4 warnings
    h5000_defconfig (gcc-8): 3 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    hisi_defconfig (gcc-8): 3 warnings
    imote2_defconfig (gcc-8): 3 warnings
    imx_v4_v5_defconfig (gcc-8): 6 warnings
    imx_v6_v7_defconfig (gcc-8): 13 warnings
    integrator_defconfig (gcc-8): 3 warnings
    iop13xx_defconfig (gcc-8): 3 warnings
    iop32x_defconfig (gcc-8): 3 warnings
    iop33x_defconfig (gcc-8): 3 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 8 warnings
    ks8695_defconfig (gcc-8): 3 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 4 warnings
    lpd270_defconfig (gcc-8): 3 warnings
    lubbock_defconfig (gcc-8): 3 warnings
    magician_defconfig (gcc-8): 3 warnings
    mainstone_defconfig (gcc-8): 3 warnings
    milbeaut_m10v_defconfig (gcc-8): 8 warnings
    mini2440_defconfig (gcc-8): 6 warnings
    mmp2_defconfig (gcc-8): 5 warnings
    moxart_defconfig (gcc-8): 2 warnings
    mps2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 3 warnings
    multi_v5_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 47 warnings
    multi_v7_defconfig (gcc-8): 47 warnings
    multi_v7_defconfig (gcc-8): 47 warnings
    multi_v7_defconfig (gcc-8): 47 warnings
    multi_v7_defconfig (gcc-8): 47 warnings
    mv78xx0_defconfig (gcc-8): 4 warnings
    mvebu_v5_defconfig (gcc-8): 4 warnings
    mvebu_v7_defconfig (gcc-8): 9 warnings
    mxs_defconfig (gcc-8): 4 warnings
    neponset_defconfig (gcc-8): 4 warnings
    netwinder_defconfig (gcc-8): 3 warnings
    netx_defconfig (gcc-8): 3 warnings
    nhk8815_defconfig (gcc-8): 5 warnings
    nuc910_defconfig (gcc-8): 3 warnings
    nuc950_defconfig (gcc-8): 3 warnings
    nuc960_defconfig (gcc-8): 3 warnings
    omap1_defconfig (gcc-8): 13 warnings
    omap2plus_defconfig (gcc-8): 20 warnings
    orion5x_defconfig (gcc-8): 4 warnings
    oxnas_v6_defconfig (gcc-8): 9 warnings
    palmz72_defconfig (gcc-8): 3 warnings
    pcm027_defconfig (gcc-8): 3 warnings
    pleb_defconfig (gcc-8): 4 warnings
    prima2_defconfig (gcc-8): 3 warnings
    pxa168_defconfig (gcc-8): 3 warnings
    pxa255-idp_defconfig (gcc-8): 3 warnings
    pxa3xx_defconfig (gcc-8): 5 warnings
    pxa910_defconfig (gcc-8): 3 warnings
    pxa_defconfig (gcc-8): 10 warnings
    qcom_defconfig (gcc-8): 14 warnings
    realview_defconfig (gcc-8): 9 warnings
    rpc_defconfig (gcc-8): 10 warnings
    s3c2410_defconfig (gcc-8): 4 warnings
    s3c6400_defconfig (gcc-8): 5 warnings
    s5pv210_defconfig (gcc-8): 5 warnings
    sama5_defconfig (gcc-8): 7 warnings
    shannon_defconfig (gcc-8): 4 warnings
    shmobile_defconfig (gcc-8): 11 warnings
    simpad_defconfig (gcc-8): 4 warnings
    socfpga_defconfig (gcc-8): 10 warnings
    spear13xx_defconfig (gcc-8): 3 warnings
    spear3xx_defconfig (gcc-8): 3 warnings
    spear6xx_defconfig (gcc-8): 3 warnings
    spitz_defconfig (gcc-8): 4 warnings
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 11 warnings
    tango4_defconfig (gcc-8): 3 warnings
    tct_hammer_defconfig (gcc-8): 5 warnings
    tegra_defconfig (gcc-8): 11 warnings
    tinyconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 5 warnings
    u300_defconfig (gcc-8): 3 warnings
    u8500_defconfig (gcc-8): 23 warnings
    versatile_defconfig (gcc-8): 3 warnings
    vexpress_defconfig (gcc-8): 9 warnings
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 3 warnings
    vt8500_v6_v7_defconfig (gcc-8): 3 warnings
    xcep_defconfig (gcc-8): 3 warnings
    zeus_defconfig (gcc-8): 3 warnings
    zx_defconfig (gcc-8): 9 warnings

i386:
    allnoconfig (gcc-8): 3 warnings
    i386_defconfig (gcc-8): 5 warnings
    i386_defconfig (gcc-8): 5 warnings
    tinyconfig (gcc-8): 3 warnings

mips:
    ar7_defconfig (gcc-8): 1 error, 1 warning
    ath79_defconfig (gcc-8): 1 error, 1 warning
    bcm63xx_defconfig (gcc-8): 1 error, 1 warning
    cavium_octeon_defconfig (gcc-8): 1 error, 1 warning
    db1xxx_defconfig (gcc-8): 3 warnings
    gpr_defconfig (gcc-8): 6 errors, 1 warning
    ip22_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 2 warnings
    ip28_defconfig (gcc-8): 1 warning
    ip32_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 6 errors, 1 warning
    loongson1c_defconfig (gcc-8): 6 errors, 1 warning
    loongson3_defconfig (gcc-8): 1 warning
    malta_kvm_defconfig (gcc-8): 7 errors, 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    markeins_defconfig (gcc-8): 1 warning
    mtx1_defconfig (gcc-8): 6 errors, 1 warning
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 6 errors, 1 warning
    qi_lb60_defconfig (gcc-8): 1 warning
    rb532_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    tb0226_defconfig (gcc-8): 1 warning

riscv:
    rv32_defconfig (gcc-8): 4 warnings

x86_64:
    allmodconfig (gcc-8): 52 warnings
    allnoconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 3 warnings
    x86_64_defconfig (gcc-8): 2 warnings
    x86_64_defconfig (gcc-8): 2 warnings

Errors summary:

    18   arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement=
 may fall through [-Werror=3Dimplicit-fallthrough=3D]
    6    arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement =
may fall through [-Werror=3Dimplicit-fallthrough=3D]
    6    arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement =
may fall through [-Werror=3Dimplicit-fallthrough=3D]
    6    arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement =
may fall through [-Werror=3Dimplicit-fallthrough=3D]
    1    arch/mips/kvm/emulate.c:142:18: error: this statement may fall thr=
ough [-Werror=3Dimplicit-fallthrough=3D]
    1    arch/mips/cavium-octeon/executive/cvmx-pko.c:489:7: error: this st=
atement may fall through [-Werror=3Dimplicit-fallthrough=3D]
    1    arch/mips/bcm63xx/dev-flash.c:89:3: error: this statement may fall=
 through [-Werror=3Dimplicit-fallthrough=3D]
    1    arch/mips/ath79/setup.c:155:17: error: this statement may fall thr=
ough [-Werror=3Dimplicit-fallthrough=3D]
    1    arch/mips/ar7/setup.c:50:3: error: this statement may fall through=
 [-Werror=3Dimplicit-fallthrough=3D]

Warnings summary:

    315  arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    121  arch/arm/kernel/signal.c:598:12: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    113  arch/arm/mm/alignment.c:753:15: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    93   arch/arm/mm/alignment.c:688:6: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    34   drivers/perf/arm_pmu.c:726:3: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    28   arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    24   include/linux/compiler.h:78:22: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    24   arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    24   arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    24   arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    24   arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    24   arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    20   arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    15   drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this =
statement may fall through [-Wimplicit-fallthrough=3D]
    12   include/linux/compiler.h:323:5: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    12   arch/arc/kernel/unwind.c:836:20: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    12   arch/arc/kernel/unwind.c:827:20: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    11   drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    11   cc1: all warnings being treated as errors
    10   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    10   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    10   drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    10   drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    10   drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    9    printk(KERN_WARNING "SA1100 flash: unknown base address "
    9    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    9    arch/x86/events/intel/core.c:5008:8: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    9    arch/x86/events/intel/core.c:4959:8: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    8    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    7    include/linux/printk.h:309:2: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    7    include/linux/printk.h:302:2: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    7    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    7    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    7    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    6    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    6    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    6    drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    6    drivers/mfd/db8500-prcmu.c:1594:7: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    6    drivers/mfd/db8500-prcmu.c:1592:7: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    6    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:991:6: warning: this statem=
ent may fall through [-Wimplicit-fallthrough=3D]
    6    drivers/dma/imx-dma.c:542:6: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    6    arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    5    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:852:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:850:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:848:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3=
: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3=
: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3=
: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3=
: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:2=
4: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:2=
4: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:2=
4: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:2=
4: warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kernel/module.c:395:19: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kernel/module.c:328:19: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kernel/module.c:322:19: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kernel/module.c:316:19: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kernel/hw_breakpoint.c:544:7: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/kernel/hw_breakpoint.c:540:7: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    5    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    4    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    3    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    3    arch/arm/include/asm/io.h:93:22: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    2    drivers/watchdog/wdt977.c:400:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    2    drivers/net/ethernet/smsc/smc911x.c:677:7: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    2    arch/x86/kernel/cpu/mtrr/cyrix.c:99:6: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    2    arch/x86/kernel/apic/probe_32.c:183:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/ti/rx51.c:57:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    1    net/wireless/nl80211.c:6473:1: warning: the frame size of 2112 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5109:1: warning: the frame size of 2776 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2360:1: warning: the frame size of 4592 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1729:1: warning: the frame size of 2280 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: =
call to stackleak_track_stack() with UACCESS enabled
    1    include/linux/device.h:1491:2: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    1    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2224 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1204:1: warning: the frame size of 3368 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2616 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2080 =
bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dir.c:3080:1: warning: the frame size of 2056 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2112 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/watchdog/wdt285.c:170:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:449:23: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:1549:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:1547:3: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:1545:3: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:1543:3: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:1540:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:1538:3: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/omap/omapfb_main.c:1535:3: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/acornfb.c:860:9: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/host/ohci-tmio.c:103:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/host/ohci-tmio.c:101:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/gadget/udc/lpc32xx_udc.c:2231:3: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2924:1: warning: t=
he frame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/scsi/arm/fas216.c:913:6: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    1    drivers/scsi/arm/fas216.c:605:20: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/scsi/arm/fas216.c:1959:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/scsi/arm/fas216.c:1573:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/scsi/arm/fas216.c:1424:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/scsi/arm/fas216.c:1413:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/pcmcia/db1xxx_ss.c:269:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/pcmcia/db1xxx_ss.c:257:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:428:1: wa=
rning: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larg=
er-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the =
frame size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the=
 frame size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:26034=
:1: warning: the frame size of 2440 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16905=
:1: warning: the frame size of 3128 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16563=
:1: warning: the frame size of 3152 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:559:1: warning: the fra=
me size of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/intel/igb/igb_main.c:6692:6: warning: this st=
atement may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/net/ethernet/intel/i40e/i40e_xsk.c:217:3: warning: this st=
atement may fall through [-Wimplicit-fallthrough=3D]
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
    1    drivers/hsi/clients/ssi_protocol.c:466:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/hsi/clients/ssi_protocol.c:291:6: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size o=
f 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the =
frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/crypto/ux500/cryp/cryp.c:324:16: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    1    drivers/crypto/ux500/cryp/cryp.c:320:16: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    1    drivers/crypto/ux500/cryp/cryp.c:316:16: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    1    drivers/cpufreq/ti-cpufreq.c:79:20: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    arch/x86/kvm/x86.c:4297:1: warning: the frame size of 2168 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:342:1: warning: the frame size of 2=
856 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/arm/mach-rpc/riscpc.c:48:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    arch/arm/mach-ep93xx/crunch.c:46:3: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: =
warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: =
warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: =
warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: =
warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24:=
 warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24:=
 warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24:=
 warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24:=
 warning: this statement may fall through [-Wimplicit-fallthrough=3D]
    1    WARNING: EXPORT symbol "kernel_neon_begin" [vmlinux] version gener=
ation failed, symbol will not be versioned.
    1    .config:1171:warning: override: UNWINDER_GUESS changes choice state

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
acs5k_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
acs5k_tiny_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 0 errors, 147 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/printk.h:302:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:316:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:322:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:328:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:395:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:540:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:544:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    WARNING: EXPORT symbol "kernel_neon_begin" [vmlinux] version generation=
 failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 52 warnings, 0 secti=
on mismatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/cpu/mshyperv.c:342:1: warning: the frame size of 2856 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    arch/x86/kvm/x86.c:4297:1: warning: the frame size of 2168 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2080 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2112 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dir.c:3080:1: warning: the frame size of 2056 bytes is larger =
than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2616 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/super.c:1204:1: warning: the frame size of 3368 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2224 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: call =
to stackleak_track_stack() with UACCESS enabled
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1729:1: warning: the frame size of 2280 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6473:1: warning: the frame size of 2112 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2360:1: warning: the frame size of 4592 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5109:1: warning: the frame size of 2776 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size of 272=
0 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2840 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/ethernet/intel/i40e/i40e_xsk.c:217:3: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/igb_main.c:6692:6: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:559:1: warning: the frame si=
ze of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2924:1: warning: the fr=
ame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16563:1: w=
arning: the frame size of 3152 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16905:1: w=
arning: the frame size of 3128 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:26034:1: w=
arning: the frame size of 2440 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:428:1: warning=
: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section =
mismatches

Warnings:
    include/linux/printk.h:302:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section m=
ismatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    arch/mips/ar7/setup.c:50:3: error: this statement may fall through [-We=
rror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/ath79/setup.c:155:17: error: this statement may fall through =
[-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: warn=
ing: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: warn=
ing: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: warn=
ing: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: warn=
ing: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: warni=
ng: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: warni=
ng: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: warni=
ng: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: warni=
ng: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    arch/mips/bcm63xx/dev-flash.c:89:3: error: this statement may fall thro=
ugh [-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches

Errors:
    arch/mips/cavium-octeon/executive/cvmx-pko.c:489:7: error: this stateme=
nt may fall through [-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings,=
 0 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mismatch =
in conditional expression
    drivers/pcmcia/db1xxx_ss.c:257:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/pcmcia/db1xxx_ss.c:269:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 153 warnings, 0 section =
mismatches

Warnings:
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/printk.h:302:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:316:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:322:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:328:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:395:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:540:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:544:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 153 warnings, 0 section mismatches

Warnings:
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/printk.h:302:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:316:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:322:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:328:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:395:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:540:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:544:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 153 warnings, 0 section mismatches

Warnings:
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/printk.h:302:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:316:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:322:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:328:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:395:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:540:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:544:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 153 warnings, =
0 section mismatches

Warnings:
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: wa=
rning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: war=
ning: this statement may fall through [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/printk.h:302:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:806:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:316:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:322:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:328:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/module.c:395:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:540:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/arm64/kernel/hw_breakpoint.c:544:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/mach-ep93xx/crunch.c:46:3: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/watchdog/wdt285.c:170:3: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/watchdog/wdt977.c:400:3: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 1 warning, 0 section =
mismatches

Errors:
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/apic/probe_32.c:183:7: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/cpu/mtrr/cyrix.c:99:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings=
, 0 section mismatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/apic/probe_32.c:183:7: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/cpu/mtrr/cyrix.c:99:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/smsc/smc911x.c:677:7: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 13 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/smsc/smc911x.c:677:7: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
iop13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
iop33x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ks8695_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/lpc32xx_udc.c:2231:3: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 7 errors, 2 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kvm/emulate.c:142:18: error: this statement may fall through =
[-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:131: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, =
0 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 47 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1592:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1594:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:848:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:850:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:852:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:991:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 47 warnings, 0 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1592:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1594:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:848:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:850:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:852:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:991:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 47 warnings, 0 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1592:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1594:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:848:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:850:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:852:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:991:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 47=
 warnings, 0 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1592:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1594:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:848:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:850:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:852:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:991:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 47 warn=
ings, 0 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/arch_gicv3.h:175:40: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1592:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1594:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:848:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:850:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:852:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:991:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/watchdog/wdt977.c:400:3: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
netx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nuc910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nuc950_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nuc960_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 13 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:449:23: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:1535:3: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:1538:3: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:1540:6: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:1543:3: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:1545:3: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:1547:3: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/omap/omapfb_main.c:1549:6: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/cpufreq/ti-cpufreq.c:79:20: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    sound/soc/ti/rx51.c:57:6: warning: this statement may fall through [-Wi=
mplicit-fallthrough=3D]
    drivers/hsi/clients/ssi_protocol.c:291:6: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/hsi/clients/ssi_protocol.c:466:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may =
fall through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]
    arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may f=
all through [-Werror=3Dimplicit-fallthrough=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 10 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    include/linux/device.h:1491:2: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    drivers/usb/host/ohci-tmio.c:101:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/usb/host/ohci-tmio.c:103:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 14 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/adreno_gpu.c:423:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:150:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info' [-W=
unused-variable]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 10 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/mach-rpc/riscpc.c:48:13: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/scsi/arm/fas216.c:913:6: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/scsi/arm/fas216.c:1959:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/scsi/arm/fas216.c:1413:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/scsi/arm/fas216.c:1424:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/scsi/arm/fas216.c:1573:6: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/scsi/arm/fas216.c:605:20: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/acornfb.c:860:9: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2439:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2446:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2450:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:991:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/net/ethernet/intel/igb/e1000_82575.c:636:6: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section m=
ismatches

Warnings:
    include/linux/printk.h:302:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:822:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    .config:1171:warning: override: UNWINDER_GUESS changes choice state
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3261:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/mtd/nand/onenand/onenand_base.c:3285:17: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 23 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/crypto/ux500/cryp/cryp.c:316:16: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    drivers/crypto/ux500/cryp/cryp.c:320:16: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    drivers/crypto/ux500/cryp/cryp.c:324:16: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/io.h:93:22: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/io.h:93:22: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/include/asm/io.h:93:22: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1592:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/mfd/db8500-prcmu.c:1594:7: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    include/linux/compiler.h:323:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    arch/x86/events/intel/core.c:4959:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    arch/x86/events/intel/core.c:5008:8: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 section m=
ismatches

Warnings:
    arch/arm/kernel/signal.c:598:12: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:688:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    arch/arm/mm/alignment.c:753:15: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:609:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:613:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:544:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/compiler.h:78:22: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arm/kernel/hw_breakpoint.c:910:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/perf/arm_pmu.c:726:3: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]

---
For more info write to <info@kernelci.org>
