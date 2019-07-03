Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA96CC0650E
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 16:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8867F2189E
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 16:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="sxU/W1OL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfGCQFW (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 12:05:22 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53597 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfGCQFV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jul 2019 12:05:21 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so2778245wmj.3
        for <linux-next@vger.kernel.org>; Wed, 03 Jul 2019 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ONZTHoeCBWeE/FhyqylPflbeGDTiiSnG+B4Jlm5QTCg=;
        b=sxU/W1OLej/6qDHyo/yKuS42GnrFolb5mAMQsWDh+0Po5j/52YaszMySe1Pp1/4p63
         /tEu01MaG0WHJT+/edtNSQ9nOygVG+QRVL98Mm3n4Ni1RH/dbsVFDk5lIMSHPCgRBEnR
         JmjX/JaYj1eiViQ2CVHh3zISkRSdywotOyf0cBdNh/Ceu/v69jXMVZ18HnFh7CNTC7NH
         923Y3k0Ff8Gv4L8QePGtj1fAzI8Z3w2BtvTBKmEog7972d35FJV9BC1hf2bMJnD4d6yr
         eAeefKUNzQUpsVgbhKWjUvbCuj1AY8dxwFFfB+10/Z0dlMee8+u2CstT8aJ+CamnJDOS
         ACMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ONZTHoeCBWeE/FhyqylPflbeGDTiiSnG+B4Jlm5QTCg=;
        b=GF0veyFIvgA5jkep8ZqnF2JQ76ObtwKKTzJxzhhV8wlEK4MixPT8xcYhQHfH57Igeq
         z4a07UCAU8ckvDVJfFTi5UxPSJw9IcNHQ2VJfadylXXVxQvaWTXcyesf8dhMEyOnLWU+
         ezZbzZU30rF9CH8wvC64n8fRCLYZxOLHSg9z0toQPtbgFOslnY8aNeVHUvjh75Fld3+2
         JbipPAUEXLWPhxFqcm1cZusvWuZ1JEKRsF20sYlWbPoTnLQBbkevDKkY4qs73SD0e8iK
         OpAGJjaneHMOEQ1FOJnGk93QnV+8NJIUCR7f4BPz2aXZxGzSBmTghPBP6/7O9XkJHRWD
         /pfA==
X-Gm-Message-State: APjAAAVdY3GCbhvBkgEr8Eza0c6mLYadljzf4QMCrXDdnYCL06GYhpHa
        n1WYjyRD5Jxy+JRpdWZIo6IHGrquIKy1LQ==
X-Google-Smtp-Source: APXvYqxKDPDpzeAeQuuqyTN9PAmQzGyc0rPvPlS2yCCdc6XLzlwR8qX3W8kP/PvJ8az78Mh/Ep2eyg==
X-Received: by 2002:a05:600c:2311:: with SMTP id 17mr8337989wmo.18.1562169912418;
        Wed, 03 Jul 2019 09:05:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l14sm3252460wrn.15.2019.07.03.09.05.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:05:11 -0700 (PDT)
Message-ID: <5d1cd237.1c69fb81.26087.2a94@mx.google.com>
Date:   Wed, 03 Jul 2019 09:05:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20190703
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 227 builds: 9 failed, 218 passed, 17 errors,
 388 warnings (next-20190703)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 227 builds: 9 failed, 218 passed, 17 errors, 388 warning=
s (next-20190703)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190703/

Tree: next
Branch: master
Git Describe: next-20190703
Git Commit: f9ca7f5a1eb9c24a5c0eb01090c7176b52fdcb3e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    ixp4xx_defconfig: (gcc-8) FAIL

mips:
    bigsur_defconfig: (gcc-8) FAIL
    cavium_octeon_defconfig: (gcc-8) FAIL
    ip27_defconfig: (gcc-8) FAIL
    loongson3_defconfig: (gcc-8) FAIL
    mips_paravirt_defconfig: (gcc-8) FAIL
    nlm_xlp_defconfig: (gcc-8) FAIL
    nlm_xlr_defconfig: (gcc-8) FAIL
    sb1250_swarm_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    defconfig (clang-8): 45 warnings
    defconfig (clang-8): 45 warnings
    defconfig (clang-8): 45 warnings
    defconfig (clang-8): 45 warnings

arm:
    allmodconfig (gcc-8): 13 warnings
    ixp4xx_defconfig (gcc-8): 5 errors, 2 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    pxa_defconfig (gcc-8): 1 warning

i386:

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 3 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 warning
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
    loongson3_defconfig (gcc-8): 5 errors, 5 warnings
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
    mtx1_defconfig (gcc-8): 2 warnings
    nlm_xlp_defconfig (gcc-8): 1 error, 3 warnings
    nlm_xlr_defconfig (gcc-8): 1 error, 1 warning
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 3 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 2 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 1 error, 2 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    rv32_defconfig (gcc-8): 4 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning

Errors summary:

    2    net/netfilter/ipvs/ip_vs_core.c:1638:10: error: implicit declarati=
on of function 'gre_calc_hlen' [-Werror=3Dimplicit-function-declaration]
    2    net/netfilter/ipvs/ip_vs_core.c:1631:23: error: 'GRE_CSUM' undecla=
red (first use in this function); did you mean 'NR_CPUS'?
    2    net/netfilter/ipvs/ip_vs_core.c:1631:12: error: dereferencing poin=
ter to incomplete type 'struct gre_base_hdr'
    2    net/netfilter/ipvs/ip_vs_core.c:1618:22: error: storage size of '_=
greh' isn't known
    2    (.text+0xafc): undefined reference to `arch_dma_prep_coherent'
    1    net/netfilter/ipvs/ip_vs_core.c:1638:24: error: implicit declarati=
on of function 'gre_flags_to_tnl_flags'; did you mean 'irq_clear_status_fla=
gs'? [-Werror=3Dimplicit-function-declaration]
    1    net/netfilter/ipvs/ip_vs_core.c:1638:24: error: implicit declarati=
on of function 'gre_flags_to_tnl_flags' [-Werror=3Dimplicit-function-declar=
ation]
    1    direct.c:(.text+0x934): undefined reference to `arch_dma_prep_cohe=
rent'
    1    /home/buildslave/workspace/workspace/kernel-build@5/linux/build/..=
/kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'
    1    /home/buildslave/workspace/workspace/kernel-build@10/linux/build/.=
./kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'
    1    /home/buildslave/workspace/workspace/kernel-build/linux/build/../k=
ernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'
    1    /home/buildslave/workspace/kernel-build@2/linux/build/../kernel/dm=
a/direct.c:144: undefined reference to `arch_dma_prep_coherent'

Warnings summary:

    149  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    12   drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is =
negative [-Wshift-count-negative]
    12   drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is =
negative [-Wshift-count-negative]
    12   drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is =
negative [-Wshift-count-negative]
    12   drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is =
negative [-Wshift-count-negative]
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
    6    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning =
(reg_format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 by=
tes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    6    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warn=
ing (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #=
size-cells value
    6    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warn=
ing (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #=
address-cells value
    6    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_=
reg): Failed prerequisite 'reg_format'
    6    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_devi=
ce_bus_num): Failed prerequisite 'reg_format'
    6    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_=
reg): Failed prerequisite 'reg_format'
    4    drivers/soc/rockchip/pm_domains.c:744:21: warning: shift count is =
negative [-Wshift-count-negative]
    4    drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'v=
ht_pfr' is used uninitialized whenever 'if' condition is false [-Wsometimes=
-uninitialized]
    4    drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize th=
e variable 'vht_pfr' to silence this warning
    4    41 warnings generated.
    4    1 warning generated.
    2    net/netfilter/ipvs/ip_vs_core.c:1618:22: warning: unused variable =
'_greh' [-Wunused-variable]
    2    cc1: some warnings being treated as errors
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
    1    warning: same module names found:
    1    drivers/net/ethernet/google/gve/gve_main.c:42:14: warning: 'start'=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
    1    drivers/net/ethernet/google/gve/gve_ethtool.c:109:14: warning: 'st=
art' may be used uninitialized in this function [-Wmaybe-uninitialized]
    1    drivers/net/ethernet/cadence/macb_main.c:48:39: warning: 'mgmt' de=
fined but not used [-Wunused-variable]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable '=
i' [-Wunused-variable]
    1    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable =
'i' [-Wunused-variable]
    1    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    /tmp/cc4Tg303.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cc4Tg303.s:18119: Warning: using r15 results in unpredictable=
 behaviour
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
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 13 warnings, 0 section =
mismatches

Warnings:
    /tmp/cc4Tg303.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cc4Tg303.s:18191: Warning: using r15 results in unpredictable beha=
viour
    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [=
-Wunused-variable]
    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-=
Wunused-variable]
    drivers/net/ethernet/google/gve/gve_main.c:42:14: warning: 'start' may =
be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/net/ethernet/google/gve/gve_ethtool.c:109:14: warning: 'start' =
may be used uninitialized in this function [-Wmaybe-uninitialized]
    warning: same module names found:
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
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

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
    /home/buildslave/workspace/kernel-build@2/linux/build/../kernel/dma/dir=
ect.c:144: undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 45 warnings, 0 section=
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
    drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'vht_pf=
r' is used uninitialized whenever 'if' condition is false [-Wsometimes-unin=
itialized]
    drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the var=
iable 'vht_pfr' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 45 warnings, 0 section mismatches

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
    drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'vht_pf=
r' is used uninitialized whenever 'if' condition is false [-Wsometimes-unin=
itialized]
    drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the var=
iable 'vht_pfr' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 45 warnings, 0 section mismatches

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
    drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'vht_pf=
r' is used uninitialized whenever 'if' condition is false [-Wsometimes-unin=
itialized]
    drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the var=
iable 'vht_pfr' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, clang-8) =E2=80=94 PASS, 0 errors, 45 warnings,=
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
    drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'vht_pf=
r' is used uninitialized whenever 'if' condition is false [-Wsometimes-unin=
itialized]
    drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the var=
iable 'vht_pfr' to silence this warning
    1 warning generated.

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
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    net/netfilter/ipvs/ip_vs_core.c:1618:22: error: storage size of '_greh'=
 isn't known
    net/netfilter/ipvs/ip_vs_core.c:1631:12: error: dereferencing pointer t=
o incomplete type 'struct gre_base_hdr'
    net/netfilter/ipvs/ip_vs_core.c:1631:23: error: 'GRE_CSUM' undeclared (=
first use in this function); did you mean 'NR_CPUS'?
    net/netfilter/ipvs/ip_vs_core.c:1638:10: error: implicit declaration of=
 function 'gre_calc_hlen' [-Werror=3Dimplicit-function-declaration]
    net/netfilter/ipvs/ip_vs_core.c:1638:24: error: implicit declaration of=
 function 'gre_flags_to_tnl_flags' [-Werror=3Dimplicit-function-declaration]

Warnings:
    net/netfilter/ipvs/ip_vs_core.c:1618:22: warning: unused variable '_gre=
h' [-Wunused-variable]
    cc1: some warnings being treated as errors

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 s=
ection mismatches

Errors:
    net/netfilter/ipvs/ip_vs_core.c:1618:22: error: storage size of '_greh'=
 isn't known
    net/netfilter/ipvs/ip_vs_core.c:1631:12: error: dereferencing pointer t=
o incomplete type 'struct gre_base_hdr'
    net/netfilter/ipvs/ip_vs_core.c:1631:23: error: 'GRE_CSUM' undeclared (=
first use in this function); did you mean 'NR_CPUS'?
    net/netfilter/ipvs/ip_vs_core.c:1638:10: error: implicit declaration of=
 function 'gre_calc_hlen' [-Werror=3Dimplicit-function-declaration]
    net/netfilter/ipvs/ip_vs_core.c:1638:24: error: implicit declaration of=
 function 'gre_flags_to_tnl_flags'; did you mean 'irq_clear_status_flags'? =
[-Werror=3Dimplicit-function-declaration]

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    net/netfilter/ipvs/ip_vs_core.c:1618:22: warning: unused variable '_gre=
h' [-Wunused-variable]
    cc1: some warnings being treated as errors

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
    /home/buildslave/workspace/workspace/kernel-build/linux/build/../kernel=
/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'

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
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
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
 errors, 6 warnings, 0 section mismatches

Warnings:
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
=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 =
warnings, 0 section mismatches

Warnings:
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warni=
ngs, 0 section mismatches

Warnings:
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
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 sect=
ion mismatches

Errors:
    /home/buildslave/workspace/workspace/kernel-build@10/linux/build/../ker=
nel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    /home/buildslave/workspace/workspace/kernel-build@5/linux/build/../kern=
el/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

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
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
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
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
tinyconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

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
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

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
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
