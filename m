Return-Path: <SRS0=K3uQ=UU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90F2C43613
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 13:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A49321530
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 13:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="ow4J2si/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfFUN0y (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 21 Jun 2019 09:26:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42865 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUN0y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jun 2019 09:26:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so6566395wrl.9
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2019 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qmPG27Tr5AlrdXHRz4ToFjzSoUg1eYbPzQlstNGciAo=;
        b=ow4J2si/hn7IhoG/5SDYJPeqhiDhZDRABfMw7S/FWXfDEuH4ECTJXt1Ccz1aibc7lf
         cryGJ5YXggj6lz4v6i8ceOln2DC7OB+Op9ngz08he4EscJSmXHd/PT6I5IpncKytTD3+
         ors+KzFPpyn0riNfBVbz02v8ATdim9xH8gB5v3dSpK6ePKBp3uCR6v1hHlzqUKPqwthZ
         ArMwy3OjWdC3UmmpZuUu1IocXtDnzrGE7U2FE3CsHVEJP/Bu/+ZppMyNXWOuqqJszGw4
         w67a93L9C+tw776E88jnlcM3KCNCzuSs2YbQuE46iIyleEgq2LW2lmhaukYGGVnVhNhc
         Yxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qmPG27Tr5AlrdXHRz4ToFjzSoUg1eYbPzQlstNGciAo=;
        b=QyIwB6tpSWDIExrxBksjQlcP2p7Ard3f0SNMYWOUz2nxYFoiL9kSHiUorzLEThROH/
         bmfAD4AYI4+yJY4iCUDvSNvDcsQ7BECP+gA36xVjU+74JJLh2qUyL9tCGItnljgcN4Qv
         c644920OeQ/Zv3mIW6IzyeN6zNNSRKnVLsLGZ5+29cKmlBoewjehFlLo3s5Tj8D6r9qF
         NBq2FwdFFKzx+mND6yEnCG8U6aLbAbbc8JTM2c5Nj6j2kAGLc62MbU5Mvq6Be7BCxqVH
         0+BijTQ1hTeBiOiHrPioQcoEvEL1AcxUb3MEFqdjAPppQ1O64qHOnkAqoFH9SMU76ycu
         ATfw==
X-Gm-Message-State: APjAAAUVavafMxkJ/wmPY+Eqlkm+SDKzOtPteO7GJMiSDtTZ6z9isNhh
        ipcfpZVW3VE4ocbTqAHaIe7vg0S7CTcWMw==
X-Google-Smtp-Source: APXvYqz0/MvlrAvcvnJXQN9nmm+KXVeQgR4eW+EGAv6/G4/YIFdXmvIWcT8StKpRqdp1ossX8wGK7Q==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr5433956wrs.105.1561123602351;
        Fri, 21 Jun 2019 06:26:42 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y19sm3764908wmc.21.2019.06.21.06.26.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 06:26:41 -0700 (PDT)
Message-ID: <5d0cdb11.1c69fb81.cdee2.586c@mx.google.com>
Date:   Fri, 21 Jun 2019 06:26:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20190621
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 230 builds: 107 failed, 123 passed, 510 errors,
 977 warnings (next-20190621)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 230 builds: 107 failed, 123 passed, 510 errors, 977 warn=
ings (next-20190621)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190621/

Tree: next
Branch: master
Git Describe: next-20190621
Git Commit: e2d28c40292bdc35553d599e5bbbeaefbab49416
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    haps_hs_defconfig: (gcc-8) FAIL
    haps_hs_smp_defconfig: (gcc-8) FAIL
    nsim_hs_defconfig: (gcc-8) FAIL
    nsim_hs_smp_defconfig: (gcc-8) FAIL
    nsimosci_hs_defconfig: (gcc-8) FAIL
    nsimosci_hs_smp_defconfig: (gcc-8) FAIL

arm64:
    allmodconfig: (clang-8) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    acs5k_defconfig: (gcc-8) FAIL
    acs5k_tiny_defconfig: (gcc-8) FAIL
    allmodconfig: (gcc-8) FAIL
    allnoconfig: (gcc-8) FAIL
    am200epdkit_defconfig: (gcc-8) FAIL
    aspeed_g4_defconfig: (gcc-8) FAIL
    aspeed_g5_defconfig: (gcc-8) FAIL
    assabet_defconfig: (gcc-8) FAIL
    at91_dt_defconfig: (gcc-8) FAIL
    badge4_defconfig: (gcc-8) FAIL
    bcm2835_defconfig: (gcc-8) FAIL
    cerfcube_defconfig: (gcc-8) FAIL
    clps711x_defconfig: (gcc-8) FAIL
    cm_x2xx_defconfig: (gcc-8) FAIL
    cm_x300_defconfig: (gcc-8) FAIL
    cns3420vb_defconfig: (gcc-8) FAIL
    colibri_pxa270_defconfig: (gcc-8) FAIL
    colibri_pxa300_defconfig: (gcc-8) FAIL
    collie_defconfig: (gcc-8) FAIL
    corgi_defconfig: (gcc-8) FAIL
    davinci_all_defconfig: (gcc-8) FAIL
    dove_defconfig: (gcc-8) FAIL
    ebsa110_defconfig: (gcc-8) FAIL
    efm32_defconfig: (gcc-8) FAIL
    em_x270_defconfig: (gcc-8) FAIL
    ep93xx_defconfig: (gcc-8) FAIL
    eseries_pxa_defconfig: (gcc-8) FAIL
    ezx_defconfig: (gcc-8) FAIL
    footbridge_defconfig: (gcc-8) FAIL
    gemini_defconfig: (gcc-8) FAIL
    h3600_defconfig: (gcc-8) FAIL
    h5000_defconfig: (gcc-8) FAIL
    hackkit_defconfig: (gcc-8) FAIL
    imote2_defconfig: (gcc-8) FAIL
    imx_v4_v5_defconfig: (gcc-8) FAIL
    integrator_defconfig: (gcc-8) FAIL
    iop13xx_defconfig: (gcc-8) FAIL
    iop32x_defconfig: (gcc-8) FAIL
    iop33x_defconfig: (gcc-8) FAIL
    ixp4xx_defconfig: (gcc-8) FAIL
    jornada720_defconfig: (gcc-8) FAIL
    ks8695_defconfig: (gcc-8) FAIL
    lart_defconfig: (gcc-8) FAIL
    lpc18xx_defconfig: (gcc-8) FAIL
    lpc32xx_defconfig: (gcc-8) FAIL
    lpd270_defconfig: (gcc-8) FAIL
    lubbock_defconfig: (gcc-8) FAIL
    magician_defconfig: (gcc-8) FAIL
    mainstone_defconfig: (gcc-8) FAIL
    mini2440_defconfig: (gcc-8) FAIL
    mmp2_defconfig: (gcc-8) FAIL
    moxart_defconfig: (gcc-8) FAIL
    mps2_defconfig: (gcc-8) FAIL
    multi_v4t_defconfig: (gcc-8) FAIL
    multi_v5_defconfig: (gcc-8) FAIL
    multi_v7_defconfig+CONFIG_SMP=3Dn: (gcc-8) FAIL
    mv78xx0_defconfig: (gcc-8) FAIL
    mvebu_v5_defconfig: (gcc-8) FAIL
    mxs_defconfig: (gcc-8) FAIL
    neponset_defconfig: (gcc-8) FAIL
    netwinder_defconfig: (gcc-8) FAIL
    nhk8815_defconfig: (gcc-8) FAIL
    nuc910_defconfig: (gcc-8) FAIL
    nuc950_defconfig: (gcc-8) FAIL
    nuc960_defconfig: (gcc-8) FAIL
    omap1_defconfig: (gcc-8) FAIL
    orion5x_defconfig: (gcc-8) FAIL
    palmz72_defconfig: (gcc-8) FAIL
    pcm027_defconfig: (gcc-8) FAIL
    pleb_defconfig: (gcc-8) FAIL
    pxa168_defconfig: (gcc-8) FAIL
    pxa255-idp_defconfig: (gcc-8) FAIL
    pxa3xx_defconfig: (gcc-8) FAIL
    pxa910_defconfig: (gcc-8) FAIL
    pxa_defconfig: (gcc-8) FAIL
    rpc_defconfig: (gcc-8) FAIL
    s3c2410_defconfig: (gcc-8) FAIL
    s3c6400_defconfig: (gcc-8) FAIL
    s5pv210_defconfig: (gcc-8) FAIL
    sama5_defconfig: (gcc-8) FAIL
    shannon_defconfig: (gcc-8) FAIL
    simpad_defconfig: (gcc-8) FAIL
    spear3xx_defconfig: (gcc-8) FAIL
    spear6xx_defconfig: (gcc-8) FAIL
    spitz_defconfig: (gcc-8) FAIL
    stm32_defconfig: (gcc-8) FAIL
    tct_hammer_defconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL
    trizeps4_defconfig: (gcc-8) FAIL
    u300_defconfig: (gcc-8) FAIL
    versatile_defconfig: (gcc-8) FAIL
    vf610m4_defconfig: (gcc-8) FAIL
    viper_defconfig: (gcc-8) FAIL
    vt8500_v6_v7_defconfig: (gcc-8) FAIL
    xcep_defconfig: (gcc-8) FAIL
    zeus_defconfig: (gcc-8) FAIL

mips:
    32r2el_defconfig+kselftest: (gcc-8) FAIL
    db1xxx_defconfig: (gcc-8) FAIL
    mpc30x_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_defconfig (gcc-8): 2 errors
    haps_hs_smp_defconfig (gcc-8): 2 errors
    nsim_hs_defconfig (gcc-8): 2 errors
    nsim_hs_smp_defconfig (gcc-8): 2 errors
    nsimosci_hs_defconfig (gcc-8): 2 errors
    nsimosci_hs_smp_defconfig (gcc-8): 2 errors
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 47 warnings
    allmodconfig (gcc-8): 1 warning
    defconfig (clang-8): 49 warnings
    defconfig (gcc-8): 7 warnings
    defconfig (gcc-8): 8 warnings
    defconfig (clang-8): 49 warnings
    defconfig (gcc-8): 7 warnings
    defconfig (clang-8): 49 warnings
    defconfig (gcc-8): 7 warnings
    defconfig (clang-8): 49 warnings

arm:
    acs5k_defconfig (gcc-8): 4 errors, 4 warnings
    acs5k_tiny_defconfig (gcc-8): 5 errors, 5 warnings
    allmodconfig (gcc-8): 2 errors, 13 warnings
    allnoconfig (gcc-8): 3 errors, 1 warning
    am200epdkit_defconfig (gcc-8): 9 errors, 7 warnings
    aspeed_g4_defconfig (gcc-8): 8 errors, 6 warnings
    aspeed_g5_defconfig (gcc-8): 5 errors, 5 warnings
    assabet_defconfig (gcc-8): 3 errors, 3 warnings
    at91_dt_defconfig (gcc-8): 5 errors, 5 warnings
    badge4_defconfig (gcc-8): 5 errors, 5 warnings
    bcm2835_defconfig (gcc-8): 5 errors, 5 warnings
    cerfcube_defconfig (gcc-8): 5 errors, 5 warnings
    clps711x_defconfig (gcc-8): 8 errors, 6 warnings
    cm_x2xx_defconfig (gcc-8): 5 errors, 5 warnings
    cm_x300_defconfig (gcc-8): 6 errors, 6 warnings
    cns3420vb_defconfig (gcc-8): 4 errors, 4 warnings
    colibri_pxa270_defconfig (gcc-8): 5 errors, 5 warnings
    colibri_pxa300_defconfig (gcc-8): 6 errors, 6 warnings
    collie_defconfig (gcc-8): 5 errors, 5 warnings
    corgi_defconfig (gcc-8): 5 errors, 5 warnings
    davinci_all_defconfig (gcc-8): 6 errors, 6 warnings
    dove_defconfig (gcc-8): 4 errors, 4 warnings
    ebsa110_defconfig (gcc-8): 3 errors, 3 warnings
    efm32_defconfig (gcc-8): 5 errors, 5 warnings
    em_x270_defconfig (gcc-8): 8 errors, 6 warnings
    ep93xx_defconfig (gcc-8): 5 errors, 5 warnings
    eseries_pxa_defconfig (gcc-8): 5 errors, 5 warnings
    ezx_defconfig (gcc-8): 5 errors, 5 warnings
    footbridge_defconfig (gcc-8): 5 errors, 5 warnings
    gemini_defconfig (gcc-8): 6 errors, 6 warnings
    h3600_defconfig (gcc-8): 4 errors, 4 warnings
    h5000_defconfig (gcc-8): 6 errors, 6 warnings
    hackkit_defconfig (gcc-8): 3 errors, 3 warnings
    imote2_defconfig (gcc-8): 5 errors, 5 warnings
    imx_v4_v5_defconfig (gcc-8): 9 errors, 7 warnings
    integrator_defconfig (gcc-8): 5 errors, 5 warnings
    iop13xx_defconfig (gcc-8): 5 errors, 5 warnings
    iop32x_defconfig (gcc-8): 3 errors, 3 warnings
    iop33x_defconfig (gcc-8): 4 errors, 4 warnings
    ixp4xx_defconfig (gcc-8): 5 errors, 5 warnings
    jornada720_defconfig (gcc-8): 3 errors, 3 warnings
    ks8695_defconfig (gcc-8): 6 errors, 6 warnings
    lart_defconfig (gcc-8): 4 errors, 4 warnings
    lpc18xx_defconfig (gcc-8): 5 errors, 5 warnings
    lpc32xx_defconfig (gcc-8): 7 errors, 5 warnings
    lpd270_defconfig (gcc-8): 4 errors, 4 warnings
    lubbock_defconfig (gcc-8): 10 errors, 8 warnings
    magician_defconfig (gcc-8): 6 errors, 6 warnings
    mainstone_defconfig (gcc-8): 4 errors, 4 warnings
    mini2440_defconfig (gcc-8): 8 errors, 6 warnings
    mmp2_defconfig (gcc-8): 5 errors, 5 warnings
    moxart_defconfig (gcc-8): 5 errors, 5 warnings
    mps2_defconfig (gcc-8): 5 errors, 5 warnings
    multi_v4t_defconfig (gcc-8): 6 errors, 6 warnings
    multi_v5_defconfig (gcc-8): 5 errors, 5 warnings
    multi_v7_defconfig (gcc-8): 4 errors, 4 warnings
    mv78xx0_defconfig (gcc-8): 6 errors, 6 warnings
    mvebu_v5_defconfig (gcc-8): 5 errors, 5 warnings
    mxs_defconfig (gcc-8): 6 errors, 6 warnings
    neponset_defconfig (gcc-8): 3 errors, 3 warnings
    netwinder_defconfig (gcc-8): 5 errors, 5 warnings
    nhk8815_defconfig (gcc-8): 6 errors, 6 warnings
    nuc910_defconfig (gcc-8): 8 errors, 6 warnings
    nuc950_defconfig (gcc-8): 8 errors, 6 warnings
    nuc960_defconfig (gcc-8): 5 errors, 5 warnings
    omap1_defconfig (gcc-8): 6 errors, 6 warnings
    orion5x_defconfig (gcc-8): 7 errors, 5 warnings
    palmz72_defconfig (gcc-8): 6 errors, 6 warnings
    pcm027_defconfig (gcc-8): 8 errors, 6 warnings
    pleb_defconfig (gcc-8): 4 errors, 4 warnings
    pxa168_defconfig (gcc-8): 6 errors, 6 warnings
    pxa255-idp_defconfig (gcc-8): 4 errors, 4 warnings
    pxa3xx_defconfig (gcc-8): 5 errors, 5 warnings
    pxa910_defconfig (gcc-8): 5 errors, 5 warnings
    pxa_defconfig (gcc-8): 5 errors, 5 warnings
    rpc_defconfig (gcc-8): 4 errors, 4 warnings
    s3c2410_defconfig (gcc-8): 4 errors, 4 warnings
    s3c6400_defconfig (gcc-8): 4 errors, 4 warnings
    s5pv210_defconfig (gcc-8): 5 errors, 5 warnings
    sama5_defconfig (gcc-8): 5 errors, 5 warnings
    shannon_defconfig (gcc-8): 3 errors, 3 warnings
    simpad_defconfig (gcc-8): 3 errors, 3 warnings
    spear3xx_defconfig (gcc-8): 4 errors, 4 warnings
    spear6xx_defconfig (gcc-8): 5 errors, 5 warnings
    spitz_defconfig (gcc-8): 5 errors, 5 warnings
    stm32_defconfig (gcc-8): 5 errors, 5 warnings
    tct_hammer_defconfig (gcc-8): 3 errors, 3 warnings
    tinyconfig (gcc-8): 5 errors, 3 warnings
    trizeps4_defconfig (gcc-8): 5 errors, 5 warnings
    u300_defconfig (gcc-8): 5 errors, 5 warnings
    versatile_defconfig (gcc-8): 2 errors, 2 warnings
    vf610m4_defconfig (gcc-8): 6 errors, 6 warnings
    viper_defconfig (gcc-8): 6 errors, 6 warnings
    vt8500_v6_v7_defconfig (gcc-8): 3 errors, 3 warnings
    xcep_defconfig (gcc-8): 5 errors, 5 warnings
    zeus_defconfig (gcc-8): 5 errors, 5 warnings

i386:

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 4 errors, 5 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 6 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 6 warnings
    ci20_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 errors, 2 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 6 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 6 warnings
    ip28_defconfig (gcc-8): 6 warnings
    ip32_defconfig (gcc-8): 6 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 6 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 6 warnings
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
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 1 error, 1 warning
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 2 warnings
    nlm_xlp_defconfig (gcc-8): 6 warnings
    nlm_xlr_defconfig (gcc-8): 2 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 3 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 2 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 4 warnings
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
    allmodconfig (gcc-8): 48 warnings
    tinyconfig (gcc-8): 1 warning

Errors summary:

    375  arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration =
of function 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=
=3Dimplicit-function-declaration]
    86   arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration =
of function 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimp=
licit-function-declaration]
    14   arch/arm/kernel/setup.c:596:22: error: lvalue required as left ope=
rand of assignment
    14   arch/arm/kernel/setup.c:594:21: error: lvalue required as left ope=
rand of assignment
    6    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahas=
h'
    6    arc-elf32-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `c=
rypto_has_ahash'
    4    include/linux/kprobes.h:477:9: error: implicit declaration of func=
tion 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Werror=3Di=
mplicit-function-declaration]
    1    mips-linux-gnu-ld: gc.c:(.text+0x495c): undefined reference to `__=
udivdi3'
    1    gc.c:(.text+0x48f0): undefined reference to `__umoddi3'
    1    ERROR: "__bad_udelay" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
    1    ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!
    1    (.text+0x43c): undefined reference to `crypto_has_ahash'

Warnings summary:

    463  cc1: some warnings being treated as errors
    167  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    15   drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is =
negative [-Wshift-count-negative]
    15   drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is =
negative [-Wshift-count-negative]
    15   drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is =
negative [-Wshift-count-negative]
    15   drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_=
format): /cbb/aconnect:ranges: "ranges" property has invalid length (16 byt=
es) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-c=
ells =3D=3D 1)
    8    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (=
ranges_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid le=
ngth (84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=
=3D 3, #size-cells =3D=3D 2)
    8    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (=
ranges_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid le=
ngth (84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=
=3D 3, #size-cells =3D=3D 2)
    8    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (=
ranges_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid le=
ngth (84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=
=3D 3, #size-cells =3D=3D 2)
    8    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (=
ranges_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid le=
ngth (84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=
=3D 3, #size-cells =3D=3D 2)
    8    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (=
ranges_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid le=
ngth (84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=
=3D 3, #size-cells =3D=3D 2)
    8    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (=
ranges_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid le=
ngth (84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=
=3D 3, #size-cells =3D=3D 2)
    5    drivers/soc/rockchip/pm_domains.c:747:21: warning: shift count is =
negative [-Wshift-count-negative]
    5    41 warnings generated.
    2    warning: same module names found:
    2    drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val'=
 defined but not used [-Wunused-function]
    2    drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: "CONFIG_ACP=
I" is not defined, evaluates to 0 [-Wundef]
    2    cc1: all warnings being treated as errors
    2    arch/arc/kernel/unwind.c:187:14: warning: 'unw_hdr_alloc' defined =
but not used [-Wunused-function]
    2    WARNING: EXPORT symbol "kernel_neon_begin" [vmlinux] version gener=
ation failed, symbol will not be versioned.
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    1 warning generated.
    2    ./usr/include/mtd/mtd-abi.h:116:28: warning: // comments are not a=
llowed in this language [-Wcomment]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/wireless/nl80211.c:6481:1: warning: the frame size of 2112 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5117:1: warning: the frame size of 2776 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2363:1: warning: the frame size of 4592 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1732:1: warning: the frame size of 2280 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: =
call to stackleak_track_stack() with UACCESS enabled
    1    include/drm/drm_print.h:366:2: warning: 'real_hz' may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    1    include/drm/drm_print.h:366:2: warning: 'real_clk_hz' may be used =
uninitialized in this function [-Wmaybe-uninitialized]
    1    include/drm/drm_print.h:366:2: warning: 'div' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
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
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: t=
he frame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:431:1: wa=
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
    1    drivers/mtd/nand/raw/au1550nd.c:447:57: warning: pointer type mism=
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
    1    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable '=
i' [-Wunused-variable]
    1    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable =
'i' [-Wunused-variable]
    1    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size o=
f 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the =
frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/armada/armada_crtc.c:890:22: warning: 'desired_clk=
_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
    1    drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:96:17: war=
ning: format '%lx' expects argument of type 'long unsigned int', but argume=
nt 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=3D]
    1    drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:140:18: wa=
rning: format '%ld' expects argument of type 'long int', but argument 4 has=
 type 'size_t' {aka 'unsigned int'} [-Wformat=3D]
    1    drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:31:36: warning: l=
eft shift count >=3D width of type [-Wshift-count-overflow]
    1    drivers/ata/pata_rb532_cf.c:165:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    arch/x86/kvm/x86.c:4300:1: warning: the frame size of 2168 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:342:1: warning: the frame size of 2=
856 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    /tmp/cccZL0he.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cccZL0he.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1163:warning: override: UNWINDER_GUESS changes choice state

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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 5 warnin=
gs, 0 section mismatches

Errors:
    include/linux/kprobes.h:477:9: error: implicit declaration of function =
'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Werror=3Dimplic=
it-function-declaration]
    include/linux/kprobes.h:477:9: error: implicit declaration of function =
'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Werror=3Dimplic=
it-function-declaration]
    include/linux/kprobes.h:477:9: error: implicit declaration of function =
'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Werror=3Dimplic=
it-function-declaration]
    include/linux/kprobes.h:477:9: error: implicit declaration of function =
'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Werror=3Dimplic=
it-function-declaration]

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
acs5k_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
acs5k_tiny_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 0 errors, 47 warnings, 0 sect=
ion mismatches

Warnings:
    ./usr/include/mtd/mtd-abi.h:116:28: warning: // comments are not allowe=
d in this language [-Wcomment]
    1 warning generated.
    ./usr/include/mtd/mtd-abi.h:116:28: warning: // comments are not allowe=
d in this language [-Wcomment]
    1 warning generated.
    drivers/soc/rockchip/pm_domains.c:747:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    WARNING: EXPORT symbol "kernel_neon_begin" [vmlinux] version generation=
 failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: EXPORT symbol "kernel_neon_begin" [vmlinux] version generation=
 failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 13 warnings, 0 section =
mismatches

Errors:
    ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!
    ERROR: "__bad_udelay" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Warnings:
    /tmp/cccZL0he.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cccZL0he.s:18191: Warning: using r15 results in unpredictable beha=
viour
    drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:96:17: warning:=
 format '%lx' expects argument of type 'long unsigned int', but argument 3 =
has type 'size_t' {aka 'unsigned int'} [-Wformat=3D]
    drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:140:18: warning=
: format '%ld' expects argument of type 'long int', but argument 4 has type=
 'size_t' {aka 'unsigned int'} [-Wformat=3D]
    drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:31:36: warning: left s=
hift count >=3D width of type [-Wshift-count-overflow]
    include/drm/drm_print.h:366:2: warning: 'div' may be used uninitialized=
 in this function [-Wmaybe-uninitialized]
    include/drm/drm_print.h:366:2: warning: 'real_hz' may be used uninitial=
ized in this function [-Wmaybe-uninitialized]
    include/drm/drm_print.h:366:2: warning: 'real_clk_hz' may be used unini=
tialized in this function [-Wmaybe-uninitialized]
    drivers/gpu/drm/armada/armada_crtc.c:890:22: warning: 'desired_clk_hz' =
may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [=
-Wunused-variable]
    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-=
Wunused-variable]
    drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: "CONFIG_ACPI" is=
 not defined, evaluates to 0 [-Wundef]
    drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defi=
ned but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 48 warnings, 0 secti=
on mismatches

Warnings:
    arch/x86/kvm/x86.c:4300:1: warning: the frame size of 2168 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    arch/x86/kernel/cpu/mshyperv.c:342:1: warning: the frame size of 2856 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2080 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2112 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dir.c:3080:1: warning: the frame size of 2056 bytes is larger =
than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2616 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/super.c:1186:1: warning: the frame size of 3176 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2224 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: call =
to stackleak_track_stack() with UACCESS enabled
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1732:1: warning: the frame size of 2280 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6481:1: warning: the frame size of 2112 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2363:1: warning: the frame size of 4592 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5117:1: warning: the frame size of 2776 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size of 272=
0 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:431:1: warning=
: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: the fr=
ame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defi=
ned but not used [-Wunused-function]
    warning: same module names found:
    warning: same module names found:

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
allnoconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 section mis=
matches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 FAIL, 9 errors, 7 warnings, 0 =
section mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 8 errors, 6 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
badge4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
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
cerfcube_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 FAIL, 8 errors, 6 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings,=
 0 section mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings,=
 0 section mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 =
section mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    gc.c:(.text+0x48f0): undefined reference to `__umoddi3'
    mips-linux-gnu-ld: gc.c:(.text+0x495c): undefined reference to `__udivd=
i3'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/mtd/nand/raw/au1550nd.c:447:57: warning: pointer type mismatch =
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
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 49 warnings, 0 section=
 mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:747:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 8 warnings, 0 section mismatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: "CONFIG_ACPI" is=
 not defined, evaluates to 0 [-Wundef]
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 49 warnings, 0 section mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:747:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 7 warnings, 0 section mismatches

Warnings:
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 49 warnings, 0 section mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:747:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 =
section mismatches

Warnings:
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, clang-8) =E2=80=94 PASS, 0 errors, 49 warnings,=
 0 section mismatches

Warnings:
    drivers/soc/rockchip/pm_domains.c:747:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:752:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:790:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:793:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:794:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:795:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:796:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:818:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:819:22: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:820:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:821:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:822:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:832:20: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:833:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:834:21: warning: shift count is negat=
ive [-Wshift-count-negative]
    41 warnings generated.
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:71.4-50: Warning (ranges_forma=
t): /cbb/aconnect:ranges: "ranges" property has invalid length (16 bytes) (=
parent #address-cells =3D=3D 1, child #address-cells =3D=3D 1, #size-cells =
=3D=3D 1)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1160.4-1162.65: Warning (range=
s_format): /cbb/pcie@14100000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1206.4-1208.65: Warning (range=
s_format): /cbb/pcie@14120000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1252.4-1254.65: Warning (range=
s_format): /cbb/pcie@14140000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1298.4-1300.65: Warning (range=
s_format): /cbb/pcie@14160000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1344.4-1346.65: Warning (range=
s_format): /cbb/pcie@14180000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)
    arch/arm64/boot/dts/nvidia/tegra194.dtsi:1391.4-1393.65: Warning (range=
s_format): /cbb/pcie@141a0000:ranges: "ranges" property has invalid length =
(84 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 3, =
#size-cells =3D=3D 2)

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 8 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 =
section mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 section =
mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
gemini_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-elf32-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-elf32-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

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
imote2_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 9 errors, 7 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
iop13xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
iop33x_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
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
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
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
jornada720_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ks8695_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
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
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 7 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 FAIL, 10 errors, 8 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
mini2440_defconfig (arm, gcc-8) =E2=80=94 FAIL, 8 errors, 6 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
mmp2_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    (.text+0x43c): undefined reference to `crypto_has_ahash'

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 =
warnings, 0 section mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 section =
mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-elf32-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-elf32-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-elf32-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings=
, 0 section mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-elf32-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
nuc910_defconfig (arm, gcc-8) =E2=80=94 FAIL, 8 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nuc950_defconfig (arm, gcc-8) =E2=80=94 FAIL, 8 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nuc960_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
orion5x_defconfig (arm, gcc-8) =E2=80=94 FAIL, 7 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 FAIL, 8 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
pleb_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
pxa168_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 section =
mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
    drivers/ata/pata_rb532_cf.c:165:24: warning: unused variable 'info' [-W=
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
rpc_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 section =
mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
s3c2410_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
shannon_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
spear3xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
    .config:1163:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 3 warnings, 0 section mis=
matches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/kernel/setup.c:594:21: error: lvalue required as left operand =
of assignment
    arch/arm/kernel/setup.c:596:22: error: lvalue required as left operand =
of assignment
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/arc/kernel/unwind.c:187:14: warning: 'unw_hdr_alloc' defined but n=
ot used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/arc/kernel/unwind.c:187:14: warning: 'unw_hdr_alloc' defined but n=
ot used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0=
 section mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
xcep_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 FAIL, 5 errors, 5 warnings, 0 section=
 mismatches

Errors:
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'ip6_local_out'? [-Werror=3Dimplicit=
-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]
    arch/arm/include/asm/smp_plat.h:79:7: error: implicit declaration of fu=
nction 'cpu_logical_map'; did you mean 'get_logical_index'? [-Werror=3Dimpl=
icit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
