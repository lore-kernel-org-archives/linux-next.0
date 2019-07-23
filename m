Return-Path: <SRS0=gC0j=VU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D80BC7618B
	for <linux-next@archiver.kernel.org>; Tue, 23 Jul 2019 07:37:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5DCC206B8
	for <linux-next@archiver.kernel.org>; Tue, 23 Jul 2019 07:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="TpBdShQN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfGWHhT (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 23 Jul 2019 03:37:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50990 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388423AbfGWHhS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jul 2019 03:37:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so37482741wml.0
        for <linux-next@vger.kernel.org>; Tue, 23 Jul 2019 00:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Jfas9MUpcPid7l4lmVbBlUYFJjTlYzANi17uC2bZjpE=;
        b=TpBdShQNMgWE5HPcnFq4NFAG89/oU9OLUX+IJ3ARtlom2EHv5M2Qiz+aD5S85B5AsY
         27Gsk9OwwJiLXlD5IirmNPbHJJWtauSBr/JUOYSJFIBT1x8VWCFjBWn6Nhi5YnUk7XOc
         5xbb+TzhmDR9SRmn/ouT0Bscn0xZtSnJPuCdtBWag7o7lWNbgZ6LL8/dAdHd8q+h/iK9
         JV6Pe8ucjCMQpwQa2DIii/RgtWQQyXN4qUmn1YevOwAakXheO3hXsTYit1/9VXXipwRh
         8cvU2JdoOYwApUm9BN+JK4CZs7kcHcPQ9mqybii2vYjwNJpI9k08bHN2mq7cT7EdHn1F
         ixxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Jfas9MUpcPid7l4lmVbBlUYFJjTlYzANi17uC2bZjpE=;
        b=PZ0EKGchJMMkPNByxCakcECVTqB34fE7Is/nfEuNZSatReVsoOdHkrI4/cWqaoQ//i
         fi8LUvpp8LyJ6BhCc368M9rFWhr/1UTyZqSEXk9hJnUjoJyTbfj3oYYwrGthLeRPHdZQ
         JknlZPr/NPmtgZtlsdeVpjwIYFiIOti7BIsQxxx+7s9PPSrbs18YqOGxUmCETdPAoZYJ
         OW9+30yZyo68Z7/yIW4H38uoztT7znq6CgRXZysmvw0P/+ptLvSQGIdp6jnEWQpjgSvq
         1CDDrzCxCES45yZyGyYC587qQKa2oh1qV0jG77KKNss/Ms5vfhVAv4Uf79vB0cQChj6R
         3Ywg==
X-Gm-Message-State: APjAAAWm8mKa//F5spiJEPJ9KLGCkMmbRdYi63Xbcls8py3dEyMvXXPR
        ND7f6UT4vIVvClU2QzmFvQBRGTmxtQk=
X-Google-Smtp-Source: APXvYqy/kXZkD7Tn0FmjKjsLQ8h5C3i1g5xx+IvMTTSNm1SbsEpVNZMgDlP9lzT4EOg4wzLvRWUO6g==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr64702355wma.107.1563867430267;
        Tue, 23 Jul 2019 00:37:10 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s10sm55381485wmf.8.2019.07.23.00.37.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 00:37:09 -0700 (PDT)
Message-ID: <5d36b925.1c69fb81.85fd7.a959@mx.google.com>
Date:   Tue, 23 Jul 2019 00:37:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-254-g9719e17bb9e9
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 222 builds: 0 failed, 222 passed,
 688 warnings (v5.3-rc1-254-g9719e17bb9e9)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 222 builds: 0 failed, 222 passed, 688 warnings (v=
5.3-rc1-254-g9719e17bb9e9)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc1-254-g9719e17bb9e9/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc1-254-g9719e17bb9e9
Git Commit: 9719e17bb9e9ddc1ecb1e3fca8cdf099a3de4e68
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 4 warnings
    axs103_smp_defconfig (gcc-8): 4 warnings
    haps_hs_defconfig (gcc-8): 4 warnings
    haps_hs_smp_defconfig (gcc-8): 4 warnings
    hsdk_defconfig (gcc-8): 4 warnings
    nsim_hs_defconfig (gcc-8): 4 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_smp_defconfig (gcc-8): 4 warnings
    nsimosci_hs_defconfig (gcc-8): 4 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 4 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 3 warnings
    vdk_hs38_smp_defconfig (gcc-8): 3 warnings

arm64:
    allmodconfig (gcc-8): 42 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings

arm:
    acs5k_defconfig (gcc-8): 2 warnings
    acs5k_tiny_defconfig (gcc-8): 2 warnings
    am200epdkit_defconfig (gcc-8): 2 warnings
    aspeed_g4_defconfig (gcc-8): 2 warnings
    aspeed_g5_defconfig (gcc-8): 2 warnings
    assabet_defconfig (gcc-8): 2 warnings
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    bcm2835_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    collie_defconfig (gcc-8): 2 warnings
    corgi_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 2 warnings
    ebsa110_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 2 warnings
    ezx_defconfig (gcc-8): 2 warnings
    footbridge_defconfig (gcc-8): 2 warnings
    gemini_defconfig (gcc-8): 2 warnings
    h3600_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 2 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    integrator_defconfig (gcc-8): 2 warnings
    iop13xx_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    iop33x_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    ks8695_defconfig (gcc-8): 2 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpd270_defconfig (gcc-8): 2 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    multi_v4t_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    neponset_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    nuc910_defconfig (gcc-8): 2 warnings
    nuc950_defconfig (gcc-8): 2 warnings
    nuc960_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 2 warnings
    realview_defconfig (gcc-8): 2 warnings
    rpc_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 2 warnings
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    spitz_defconfig (gcc-8): 2 warnings
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 2 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vf610m4_defconfig (gcc-8): 2 warnings
    viper_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings
    zx_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 2 warnings

mips:
    32r2el_defconfig (gcc-8): 5 warnings
    32r2el_defconfig (gcc-8): 3 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 4 warnings
    ath25_defconfig (gcc-8): 4 warnings
    ath79_defconfig (gcc-8): 4 warnings
    bcm47xx_defconfig (gcc-8): 4 warnings
    bcm63xx_defconfig (gcc-8): 3 warnings
    bigsur_defconfig (gcc-8): 8 warnings
    bmips_be_defconfig (gcc-8): 3 warnings
    bmips_stb_defconfig (gcc-8): 3 warnings
    capcella_defconfig (gcc-8): 4 warnings
    cavium_octeon_defconfig (gcc-8): 6 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 4 warnings
    db1xxx_defconfig (gcc-8): 4 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 4 warnings
    fuloong2e_defconfig (gcc-8): 8 warnings
    gcw0_defconfig (gcc-8): 3 warnings
    gpr_defconfig (gcc-8): 4 warnings
    ip22_defconfig (gcc-8): 4 warnings
    ip27_defconfig (gcc-8): 8 warnings
    ip28_defconfig (gcc-8): 8 warnings
    ip32_defconfig (gcc-8): 8 warnings
    jazz_defconfig (gcc-8): 4 warnings
    jmr3927_defconfig (gcc-8): 3 warnings
    lasat_defconfig (gcc-8): 3 warnings
    lemote2f_defconfig (gcc-8): 8 warnings
    loongson1b_defconfig (gcc-8): 4 warnings
    loongson1c_defconfig (gcc-8): 4 warnings
    loongson3_defconfig (gcc-8): 8 warnings
    malta_defconfig (gcc-8): 4 warnings
    malta_kvm_defconfig (gcc-8): 4 warnings
    malta_kvm_guest_defconfig (gcc-8): 4 warnings
    malta_qemu_32r6_defconfig (gcc-8): 5 warnings
    maltaaprp_defconfig (gcc-8): 4 warnings
    maltasmvp_defconfig (gcc-8): 4 warnings
    maltasmvp_eva_defconfig (gcc-8): 4 warnings
    maltaup_defconfig (gcc-8): 4 warnings
    maltaup_xpa_defconfig (gcc-8): 4 warnings
    markeins_defconfig (gcc-8): 4 warnings
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 4 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 4 warnings
    nlm_xlp_defconfig (gcc-8): 8 warnings
    nlm_xlr_defconfig (gcc-8): 4 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 4 warnings
    pistachio_defconfig (gcc-8): 4 warnings
    pnx8335_stb225_defconfig (gcc-8): 4 warnings
    qi_lb60_defconfig (gcc-8): 5 warnings
    rb532_defconfig (gcc-8): 5 warnings
    rbtx49xx_defconfig (gcc-8): 4 warnings
    rm200_defconfig (gcc-8): 4 warnings
    rt305x_defconfig (gcc-8): 4 warnings
    sb1250_swarm_defconfig (gcc-8): 6 warnings
    tb0219_defconfig (gcc-8): 4 warnings
    tb0226_defconfig (gcc-8): 4 warnings
    tb0287_defconfig (gcc-8): 4 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 4 warnings
    xway_defconfig (gcc-8): 4 warnings

riscv:
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 4 warnings
    defconfig (gcc-8): 2 warnings
    rv32_defconfig (gcc-8): 8 warnings
    tinyconfig (gcc-8): 1 warning

x86_64:
    allmodconfig (gcc-8): 46 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 2 warnings


Warnings summary:

    202  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    179  drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_p=
aged_buf' defined but not used [-Wunused-function]
    179  drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_=
paged_buf' defined but not used [-Wunused-function]
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
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:428:1: wa=
rning: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larg=
er-than=3D]
    2    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame s=
ize of 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame s=
ize of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame s=
ize of 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/cxd2841er.c:3630:1: warning: the frame=
 size of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size o=
f 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/wireless/nl80211.c:6481:1: warning: the frame size of 2128 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:6481:1: warning: the frame size of 2112 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5117:1: warning: the frame size of 2784 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5117:1: warning: the frame size of 2776 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2363:1: warning: the frame size of 4640 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2363:1: warning: the frame size of 4584 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1732:1: warning: the frame size of 2280 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1732:1: warning: the frame size of 2272 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2256 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2512 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2688 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: =
call to stackleak_track_stack() with UACCESS enabled
    1    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2352 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2224 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1186:1: warning: the frame size of 3184 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1186:1: warning: the frame size of 3176 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:2050:1: warning: the frame size of 2080 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2616 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2592 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2112 =
bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2080 =
bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dir.c:3080:1: warning: the frame size of 2056 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2128 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2112 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: t=
he frame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: t=
he frame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the =
frame size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the=
 frame size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:26023=
:1: warning: the frame size of 2528 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:26023=
:1: warning: the frame size of 2440 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894=
:1: warning: the frame size of 3136 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894=
:1: warning: the frame size of 3128 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552=
:1: warning: the frame size of 3168 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552=
:1: warning: the frame size of 3152 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2352 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/bonding/bond_netlink.c:686:1: warning: the frame size =
of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/bonding/bond_netlink.c:686:1: warning: the frame size =
of 2072 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 28=
48 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 28=
40 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the fra=
me size of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the fra=
me size of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/i2c/tvp5150.c:253:1: warning: the frame size of 3968=
 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/i2c/tvp5150.c:253:1: warning: the frame size of 3952=
 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/i2c/mt9t112.c:480:1: warning: the frame size of 2096=
 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame s=
ize of 2104 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame s=
ize of 2808 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame s=
ize of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame s=
ize of 5888 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame s=
ize of 5880 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame s=
ize of 2328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame s=
ize of 2320 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame s=
ize of 2576 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame s=
ize of 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame s=
ize of 3288 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame s=
ize of 3280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame s=
ize of 3016 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame s=
ize of 3008 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame s=
ize of 5320 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame s=
ize of 5312 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3123:1: warning: the frame=
 size of 2736 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3123:1: warning: the frame=
 size of 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the =
frame size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the =
frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    arch/x86/kvm/x86.c:4338:1: warning: the frame size of 2160 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:342:1: warning: the frame size of 2=
856 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    .config:1175:warning: override: UNWINDER_GUESS changes choice state

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
acs5k_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
acs5k_tiny_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 42 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2112 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/aops.c:1892:1: warning: the frame size of 2128 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:2050:1: warning: the frame size of 2080 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1677:1: warning: the frame size of 2592 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/super.c:1186:1: warning: the frame size of 3184 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2352 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2688 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2512 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2256 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size of 272=
0 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1732:1: warning: the frame size of 2272 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6481:1: warning: the frame size of 2128 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2363:1: warning: the frame size of 4640 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5117:1: warning: the frame size of 2784 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:253:1: warning: the frame size of 3968 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame size o=
f 3008 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame size o=
f 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame size o=
f 2320 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame size o=
f 3280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame size o=
f 5312 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame size o=
f 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame size o=
f 2576 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame size o=
f 5888 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame size o=
f 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/mt9t112.c:480:1: warning: the frame size of 2096 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3123:1: warning: the frame size=
 of 2736 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3630:1: warning: the frame size=
 of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2848 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/bonding/bond_netlink.c:686:1: warning: the frame size of 20=
80 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2352 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: the fr=
ame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3168 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3136 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:26023:1: w=
arning: the frame size of 2528 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:428:1: warning=
: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 46 warnings, 0 secti=
on mismatches

Warnings:
    arch/x86/kvm/x86.c:4338:1: warning: the frame size of 2160 bytes is lar=
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
    fs/ocfs2/super.c:1186:1: warning: the frame size of 3176 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2224 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: call =
to stackleak_track_stack() with UACCESS enabled
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size of 272=
0 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1732:1: warning: the frame size of 2280 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6481:1: warning: the frame size of 2112 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2363:1: warning: the frame size of 4584 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5117:1: warning: the frame size of 2776 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:253:1: warning: the frame size of 3952 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/bonding/bond_netlink.c:686:1: warning: the frame size of 20=
72 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:428:1: warning=
: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: the fr=
ame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop33x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ks8695_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    {standard input}:131: Warning: macro instruction expanded into multiple=
 instructions
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

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
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
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
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nuc910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nuc950_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nuc960_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info' [-W=
unused-variable]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, =
0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1175:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

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
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    drivers/base/firmware_loader/firmware.h:145:12: warning: 'fw_map_paged_=
buf' defined but not used [-Wunused-function]
    drivers/base/firmware_loader/firmware.h:144:12: warning: 'fw_grow_paged=
_buf' defined but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
