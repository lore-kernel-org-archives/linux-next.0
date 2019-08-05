Return-Path: <SRS0=jfJ0=WB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EE2C433FF
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 09:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D95D2182B
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 09:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="yReCYmvv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfHEJks (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Aug 2019 05:40:48 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43648 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJkr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Aug 2019 05:40:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so9130778wru.10
        for <linux-next@vger.kernel.org>; Mon, 05 Aug 2019 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pFTGABq4kfeQAsl9f2enPHYQe58xl2V4lPJLk6uTft8=;
        b=yReCYmvvvT8DPJAZR6KjgUl6RiRc3Fs9Ean8+xTQXbegx1c9FtiLIGcGv8KU2w7ZGD
         4WJTYBKj4EFQna5NP9B6XDlrh1C7mIZSqzHYE3eSutu8AnZXMM3o69n3j6YIc+a4aEey
         nEt6sVzVFXf5IAnK41VXldEm2zVtiAH6y0ugUCIcO/6iSHlUI/7NPGsSnmSiysmnpeID
         U+2WQXAqXZIk5uIFa/iL6R9+gpC+doEI5nQ/ABsEoq7E0ZfuhmSEraObaFrRqFYM+7hj
         GdmCNd0wfalL3kL8W1VH98YnD7QW+q9jpawWv3oFXCm3PmcPXdUZx/0teL1Kovx079cB
         NCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pFTGABq4kfeQAsl9f2enPHYQe58xl2V4lPJLk6uTft8=;
        b=rMYnOQggQ/SHCYA0wG/BH4qazJ2y6D+TvXKdY+0UFYpWw0e+dQEd+0HtmD0Ctz7uSS
         DO24fWwd++45OfBETzzUSs7tTwHGYnG6ou9mmrRCNrEM0NTlZwwXxiDPLldBgtIdF2HQ
         AS9ZirclkBzpRbThxlPpLcrSAz+oxbWh5icbakic7MC29DtGCR12qD3CA/F+KKBWwIG7
         x8PJGTfmffrTtq8/usrBWuyE2E8Mgg4J8vnjtR9B/FHiwI3E82mFxXZQQQol4fLe69Ch
         ZKDmwG/C1nS5HgA4u4JZf4j8VVBtUCH37ECVi7GQ4eMGbzz13XPYhiKTLDDgNI8OySTM
         4FyA==
X-Gm-Message-State: APjAAAVA4JqpgpbhULG18FEXMWkqZJZHi22XbBOoGQF5Kis9iJoa0bbD
        vT3YiPYT3EoZr1fG6KUrQTXoFRVC
X-Google-Smtp-Source: APXvYqwbUL99mwOICO40EKqHqP/llGupyZrBRGSbR3I23PaYTnhKrVFZnT6gQc/0KP9NhlYV/FmdqQ==
X-Received: by 2002:a5d:50d1:: with SMTP id f17mr29492425wrt.124.1564998034313;
        Mon, 05 Aug 2019 02:40:34 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j17sm145512344wrb.35.2019.08.05.02.40.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 02:40:32 -0700 (PDT)
Message-ID: <5d47f990.1c69fb81.35920.c607@mx.google.com>
Date:   Mon, 05 Aug 2019 02:40:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190805
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
Subject: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 230 builds: 5 failed, 225 passed, 6 errors, 1344 warning=
s (next-20190805)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190805/

Tree: next
Branch: master
Git Describe: next-20190805
Git Commit: b1645c0cbd486ccebf76e0c3d4d2439f846316b0
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL
    fuloong2e_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    loongson3_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 2 warnings
    axs103_defconfig (gcc-8): 7 warnings
    axs103_smp_defconfig (gcc-8): 7 warnings
    haps_hs_defconfig (gcc-8): 6 warnings
    haps_hs_smp_defconfig (gcc-8): 6 warnings
    hsdk_defconfig (gcc-8): 6 warnings
    nsim_hs_defconfig (gcc-8): 6 warnings
    nsim_hs_defconfig (gcc-8): 14 warnings
    nsim_hs_smp_defconfig (gcc-8): 6 warnings
    nsimosci_hs_defconfig (gcc-8): 6 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 6 warnings
    tinyconfig (gcc-8): 2 warnings
    vdk_hs38_defconfig (gcc-8): 5 warnings
    vdk_hs38_smp_defconfig (gcc-8): 5 warnings

arm64:
    allmodconfig (gcc-8): 144 warnings
    allmodconfig (clang-8): 51 warnings
    allnoconfig (gcc-8): 1 warning
    defconfig (clang-8): 7 warnings
    defconfig (gcc-8): 141 warnings
    defconfig (gcc-8): 141 warnings
    defconfig (clang-8): 7 warnings
    defconfig (gcc-8): 141 warnings
    defconfig (clang-8): 7 warnings
    defconfig (clang-8): 7 warnings
    defconfig (gcc-8): 141 warnings
    tinyconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 2 errors, 16 warnings
    allnoconfig (gcc-8): 1 warning
    aspeed_g4_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 2 warnings
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 9 warnings
    badge4_defconfig (gcc-8): 2 warnings
    bcm2835_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 1 warning
    efm32_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    exynos_defconfig (gcc-8): 1 warning
    footbridge_defconfig (gcc-8): 1 warning
    gemini_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 2 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    lpc18xx_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (gcc-8): 3 warnings
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 3 warnings
    mmp2_defconfig (gcc-8): 1 warning
    moxart_defconfig (gcc-8): 1 warning
    mps2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 10 warnings
    multi_v7_defconfig (gcc-8): 10 warnings
    multi_v7_defconfig (gcc-8): 10 warnings
    multi_v7_defconfig (gcc-8): 10 warnings
    multi_v7_defconfig (gcc-8): 18 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 8 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    orion5x_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 3 warnings
    realview_defconfig (gcc-8): 2 warnings
    rpc_defconfig (gcc-8): 8 warnings
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 3 warnings
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 3 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 3 warnings
    tango4_defconfig (gcc-8): 1 warning
    tct_hammer_defconfig (gcc-8): 3 warnings
    tegra_defconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vf610m4_defconfig (gcc-8): 1 warning
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    zx_defconfig (gcc-8): 1 warning

i386:
    allnoconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 3 warnings
    i386_defconfig (gcc-8): 11 warnings
    tinyconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 6 warnings
    32r2el_defconfig (gcc-8): 14 warnings
    allnoconfig (gcc-8): 2 warnings
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 3 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 2 warnings
    bigsur_defconfig (gcc-8): 6 warnings
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 1 error, 3 warnings
    ci20_defconfig (gcc-8): 4 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 5 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 1 error, 3 warnings
    gcw0_defconfig (gcc-8): 2 warnings
    gpr_defconfig (gcc-8): 3 warnings
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 7 warnings
    ip28_defconfig (gcc-8): 6 warnings
    ip32_defconfig (gcc-8): 7 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 1 error, 3 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 1 error, 4 warnings
    malta_defconfig (gcc-8): 3 warnings
    malta_kvm_defconfig (gcc-8): 3 warnings
    malta_kvm_guest_defconfig (gcc-8): 3 warnings
    malta_qemu_32r6_defconfig (gcc-8): 5 warnings
    maltaaprp_defconfig (gcc-8): 3 warnings
    maltasmvp_defconfig (gcc-8): 3 warnings
    maltasmvp_eva_defconfig (gcc-8): 3 warnings
    maltaup_defconfig (gcc-8): 3 warnings
    maltaup_xpa_defconfig (gcc-8): 3 warnings
    markeins_defconfig (gcc-8): 3 warnings
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 3 warnings
    nlm_xlp_defconfig (gcc-8): 8 warnings
    nlm_xlr_defconfig (gcc-8): 11 warnings
    omega2p_defconfig (gcc-8): 3 warnings
    pic32mzda_defconfig (gcc-8): 3 warnings
    pistachio_defconfig (gcc-8): 3 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 4 warnings
    rb532_defconfig (gcc-8): 3 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 3 warnings
    rt305x_defconfig (gcc-8): 3 warnings
    sb1250_swarm_defconfig (gcc-8): 4 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 3 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    vocore2_defconfig (gcc-8): 3 warnings
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 3 warnings

riscv:
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 7 warnings
    tinyconfig (gcc-8): 1 warning

x86_64:
    allmodconfig (gcc-8): 5 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning

Errors summary:

    4    include/linux/page-flags-layout.h:95:2: error: #error "Not enough =
bits in page flags"
    1    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit =
declaration of function 'writeq'; did you mean 'writeb'? [-Werror=3Dimplici=
t-function-declaration]
    1    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit =
declaration of function 'readq'; did you mean 'readb'? [-Werror=3Dimplicit-=
function-declaration]

Warnings summary:

    315  arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    184  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    121  drivers/of/platform.c:650:18: warning: ?: using integer constants =
in boolean context [-Wint-in-bool-context]
    30   1 warning generated.
    26   drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused =
variable 'r' [-Wunused-variable]
    24   drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused vari=
able 'dev' [-Wunused-variable]
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
    15   mm/memcontrol.c:1160:11: warning: suggest parentheses around assig=
nment used as truth value [-Wparentheses]
    12   include/linux/compiler.h:328:5: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    12   arch/arc/kernel/unwind.c:836:20: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    12   arch/arc/kernel/unwind.c:827:20: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    9    printk(KERN_WARNING "SA1100 flash: unknown base address "
    9    include/linux/printk.h:309:2: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    9    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    7    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statem=
ent may fall through [-Wimplicit-fallthrough=3D]
    6    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    6    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    6    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects arg=
ument of type 'long unsigned int', but argument 5 has type 'unsigned int' [=
-Wformat=3D]
    6    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    6    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
    6    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    6    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
    6    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects arg=
ument of type 'long unsigned int', but argument 5 has type 'unsigned int' [=
-Wformat=3D]
    5    mm/memcontrol.c:1160:17: warning: using the result of an assignmen=
t as a condition without parentheses [-Wparentheses]
    5    mm/memcontrol.c:1160:17: note: place parentheses around the assign=
ment to silence this warning
    5    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
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
    5    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    4    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    4    2 warnings generated.
    3    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    arch/x86/kernel/cpu/mtrr/cyrix.c:99:6: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    2    arch/x86/kernel/apic/probe_32.c:146:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    mm/shmem.c:2734:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3136:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1646:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized =
when used within its own initialization [-Wuninitialized]
    1    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
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
    1    drivers/video/fbdev/acornfb.c:860:9: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/gadget/udc/lpc32xx_udc.c:2231:3: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/scsi/lpfc/lpfc_sli.c:11850:34: warning: variable 'done_q' =
is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_scsi.c:4559:34: warning: variable 'waitq' i=
s uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
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
    1    drivers/power/supply/ab8500_charger.c:738:6: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/pcmcia/db1xxx_ss.c:269:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/pcmcia/db1xxx_ss.c:257:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    drivers/net/usb/lan78xx.c:2662:34: warning: variable 'unlink_wakeu=
p' is uninitialized when used within its own initialization [-Wuninitialize=
d]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
.altinstr_replacement+0x36: redundant UACCESS disable
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
.altinstr_replacement+0x34: redundant UACCESS disable
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
.altinstr_replacement+0x1c: redundant UACCESS disable
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:1561:4: warni=
ng: variable 'asic_default_power_limit' is used uninitialized whenever '?:'=
 condition is false [-Wsometimes-uninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:1544:35: note=
: initialize the variable 'asic_default_power_limit' to silence this warning
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/arcturus_ppt.c:1346:4: war=
ning: variable 'asic_default_power_limit' is used uninitialized whenever '?=
:' condition is false [-Wsometimes-uninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/arcturus_ppt.c:1329:35: no=
te: initialize the variable 'asic_default_power_limit' to silence this warn=
ing
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    cc1: some warnings being treated as errors
    1    arch/mips/pci/ops-bcm63xx.c:474:6: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
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
    1    WARNING: unmet direct dependencies detected for MDIO_OCTEON
    1    /tmp/ccqIzQLN.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccqIzQLN.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1177:warning: override: UNWINDER_GUESS changes choice state

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 14 warni=
ngs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
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
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 16 warnings, 0 section =
mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit decla=
ration of function 'readq'; did you mean 'readb'? [-Werror=3Dimplicit-funct=
ion-declaration]
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit decla=
ration of function 'writeq'; did you mean 'writeb'? [-Werror=3Dimplicit-fun=
ction-declaration]

Warnings:
    WARNING: unmet direct dependencies detected for MDIO_OCTEON
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/power/supply/ab8500_charger.c:738:6: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    /tmp/ccqIzQLN.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccqIzQLN.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 144 warnings, 0 secti=
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
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: .alti=
nstr_replacement+0x1c: redundant UACCESS disable
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 51 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2734:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1646:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3136:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    mm/memcontrol.c:1160:17: warning: using the result of an assignment as =
a condition without parentheses [-Wparentheses]
    mm/memcontrol.c:1160:17: note: place parentheses around the assignment =
to silence this warning
    1 warning generated.
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/arcturus_ppt.c:1346:4: warning:=
 variable 'asic_default_power_limit' is used uninitialized whenever '?:' co=
ndition is false [-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../powerplay/arcturus_ppt.c:1329:35: note: i=
nitialize the variable 'asic_default_power_limit' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:1561:4: warning: v=
ariable 'asic_default_power_limit' is used uninitialized whenever '?:' cond=
ition is false [-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:1544:35: note: ini=
tialize the variable 'asic_default_power_limit' to silence this warning
    1 warning generated.
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    1 warning generated.
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    1 warning generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2662:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/lpfc/lpfc_sli.c:11850:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4559:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

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
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sect=
ion mismatches

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
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/pci/ops-bcm63xx.c:474:6: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

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
    include/linux/page-flags-layout.h:95:2: error: #error "Not enough bits =
in page flags"

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

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
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

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
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mismatch =
in conditional expression
    drivers/pcmcia/db1xxx_ss.c:257:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/pcmcia/db1xxx_ss.c:269:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]

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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section =
mismatches

Warnings:
    mm/memcontrol.c:1160:17: warning: using the result of an assignment as =
a condition without parentheses [-Wparentheses]
    mm/memcontrol.c:1160:17: note: place parentheses around the assignment =
to silence this warning
    1 warning generated.
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    1 warning generated.
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 141 warnings, 0 section =
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
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 141 warnings, 0 section mismatches

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
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 7 warnings, 0 section mismatches

Warnings:
    mm/memcontrol.c:1160:17: warning: using the result of an assignment as =
a condition without parentheses [-Wparentheses]
    mm/memcontrol.c:1160:17: note: place parentheses around the assignment =
to silence this warning
    1 warning generated.
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    1 warning generated.
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 141 warnings, 0 section mismatches

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
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 7 warnings, 0 section mismatches

Warnings:
    mm/memcontrol.c:1160:17: warning: using the result of an assignment as =
a condition without parentheses [-Wparentheses]
    mm/memcontrol.c:1160:17: note: place parentheses around the assignment =
to silence this warning
    1 warning generated.
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    1 warning generated.
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, clang-8) =E2=80=94 PASS, 0 errors, 7 warnings, =
0 section mismatches

Warnings:
    mm/memcontrol.c:1160:17: warning: using the result of an assignment as =
a condition without parentheses [-Wparentheses]
    mm/memcontrol.c:1160:17: note: place parentheses around the assignment =
to silence this warning
    1 warning generated.
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    1 warning generated.
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 141 warnings, =
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
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/arm64/include/asm/sysreg.h:837:2: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

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
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/arm/mach-ep93xx/crunch.c:46:3: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/watchdog/wdt285.c:170:3: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 se=
ction mismatches

Errors:
    include/linux/page-flags-layout.h:95:2: error: #error "Not enough bits =
in page flags"

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    arch/x86/kernel/apic/probe_32.c:146:7: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/cpu/mtrr/cyrix.c:99:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 11 warning=
s, 0 section mismatches

Warnings:
    arch/x86/kernel/apic/probe_32.c:146:7: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    arch/x86/kernel/cpu/mtrr/cyrix.c:99:6: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

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
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
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
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

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
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
ks8695_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/page-flags-layout.h:95:2: error: #error "Not enough bits =
in page flags"

Warnings:
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
loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 se=
ction mismatches

Errors:
    include/linux/page-flags-layout.h:95:2: error: #error "Not enough bits =
in page flags"

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/usb/gadget/udc/lpc32xx_udc.c:2231:3: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]

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
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    {standard input}:131: Warning: macro instruction expanded into multiple=
 instructions
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
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
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 10 warnings, 0 se=
ction mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
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
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 10 warnings, 0 section mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
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
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
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
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 10=
 warnings, 0 section mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
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
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 18 warn=
ings, 0 section mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
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
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 14 warni=
ngs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nuc910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
nuc950_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
nuc960_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sectio=
n mismatches

Warnings:
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
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

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
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

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
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]
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
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section =
mismatches

Warnings:
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
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused varia=
ble 'r' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
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
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/x86/kernel/ptrace.c:202:6: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1177:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/gpu/drm/pl111/pl111_display.c:551:17: warning: unused variable =
'dev' [-Wunused-variable]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    mm/memcontrol.c:1160:11: warning: suggest parentheses around assignment=
 used as truth value [-Wparentheses]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: .alti=
nstr_replacement+0x34: redundant UACCESS disable

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: .alti=
nstr_replacement+0x36: redundant UACCESS disable

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/of/platform.c:650:18: warning: ?: using integer constants in bo=
olean context [-Wint-in-bool-context]

---
For more info write to <info@kernelci.org>
