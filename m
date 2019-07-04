Return-Path: <SRS0=xL23=VB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AD5C0651F
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 16:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 889E4218A3
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 16:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="RCE32OMV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfGDQVZ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 4 Jul 2019 12:21:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55427 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfGDQVZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jul 2019 12:21:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so6268481wmj.5
        for <linux-next@vger.kernel.org>; Thu, 04 Jul 2019 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LKN+WDNUc4C2Hb4MmR5i9gKvqVxvJdyBSQxwy/L86k0=;
        b=RCE32OMVgQ6HLTuMqGJzy0AZNRtARIZanwNsxo0VzlhMGQphgxYawvvtmALIeYtRo0
         xmPnLRsVF2e2tmJx+2cq3chc7uzh3kbAGE4QBq0Was04yAOiMAxogfdyZgqracuM6ZTL
         eEJu7w1VomuBd0Y9tGaEiJMw95fJI2sOByRC3Ejr8RBVJFxxGsPYOKU/V9y3Lr4QdNP7
         6dLpuIB82rGAyrUMQa2jtywhl9Q0w54RowhHnQgDtoe4g2kovw7z6oVkHUCZwg5XSfne
         TUhUbH0gUK2fD4XMXAXTg7UURsRjwJN/h6eXfREZhOXLbR6Nsn1VS9SIdbj1bOrvvSBG
         EcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LKN+WDNUc4C2Hb4MmR5i9gKvqVxvJdyBSQxwy/L86k0=;
        b=i4Z8UiYZ9zL5eeNaPVJHHWVPSQx9PgnxkcthuIBjzEDL+NKfvxwgeLlHjtW33tf2DV
         0lSfKYqFFcOS3P7S98VVfs0t4OiodEHwTLcrLTVwiFH79rIS3Wxq9kmzv0QhwO75BWrI
         YlRfjT03AGP/de55b12jqNpf+jFKyr3B+O3HRt2i4jLLX4+8lvErtSR6Plcv2z3cnQe7
         GgcVJmNHFV23U36tQ3KWkpmlZHYUahamUW3N/cUOFOJRhG5A1DHOmk+MHpFmI9WtU0Nh
         2eX+n7+15OK3jLXMMbqyM/UZKwIT3Yv/LvwXZUPio2fv+5am9MCFRgAeYzir6LvBJJVy
         VJyQ==
X-Gm-Message-State: APjAAAVBHuJytfXXWIfpuLFS/zM0xzW3cZLmV7sPkqFQgcH8TXcOSzbV
        M2X6J06Xc1DM1k3dF0uxZtcY2w02oJJfZQ==
X-Google-Smtp-Source: APXvYqxIsNaDTyCV1WjGq+TuGhnYz0uJPhzxKvbzcsUsV53vRAA1hM3bwDZqfQ3HsbClE1Lhm5Gqxg==
X-Received: by 2002:a1c:c549:: with SMTP id v70mr209077wmf.135.1562257273454;
        Thu, 04 Jul 2019 09:21:13 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f10sm7743801wru.31.2019.07.04.09.21.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 09:21:12 -0700 (PDT)
Message-ID: <5d1e2778.1c69fb81.1064.d328@mx.google.com>
Date:   Thu, 04 Jul 2019 09:21:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20190704
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 229 builds: 0 failed, 229 passed,
 632 warnings (next-20190704)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 229 builds: 0 failed, 229 passed, 632 warnings (next-201=
90704)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190704/

Tree: next
Branch: master
Git Describe: next-20190704
Git Commit: 16c474c9ba39ede5fd1cd835ac52b3760d7820b7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-8): 44 warnings
    allmodconfig (clang-8): 108 warnings
    defconfig (clang-8): 45 warnings
    defconfig (clang-8): 45 warnings
    defconfig (clang-8): 45 warnings
    defconfig (clang-8): 45 warnings

arm:
    allmodconfig (gcc-8): 12 warnings
    aspeed_g4_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    imx_v4_v5_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 3 warnings
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
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
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
    loongson1b_defconfig (gcc-8): 3 warnings
    loongson1c_defconfig (gcc-8): 3 warnings
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
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 2 warnings
    nlm_xlp_defconfig (gcc-8): 6 warnings
    nlm_xlr_defconfig (gcc-8): 2 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 3 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 3 warnings
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
    allmodconfig (gcc-8): 49 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning


Warnings summary:

    168  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    31   fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-=
variable]
    21   1 warning generated.
    15   drivers/soc/rockchip/pm_domains.c:829:20: warning: shift count is =
negative [-Wshift-count-negative]
    15   drivers/soc/rockchip/pm_domains.c:817:21: warning: shift count is =
negative [-Wshift-count-negative]
    15   drivers/soc/rockchip/pm_domains.c:816:22: warning: shift count is =
negative [-Wshift-count-negative]
    15   drivers/soc/rockchip/pm_domains.c:815:22: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:831:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:830:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:819:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:818:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:793:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:792:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:791:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:790:22: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:789:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:788:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:787:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:786:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:785:21: warning: shift count is =
negative [-Wshift-count-negative]
    10   drivers/soc/rockchip/pm_domains.c:749:21: warning: shift count is =
negative [-Wshift-count-negative]
    8    2 warnings generated.
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
    5    mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in thi=
s function [-Wmaybe-uninitialized]
    5    drivers/soc/rockchip/pm_domains.c:744:21: warning: shift count is =
negative [-Wshift-count-negative]
    5    drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'v=
ht_pfr' is used uninitialized whenever 'if' condition is false [-Wsometimes=
-uninitialized]
    5    drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize th=
e variable 'vht_pfr' to silence this warning
    5    41 warnings generated.
    4    fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'r=
et' [-Wunused-variable]
    3    fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined=
 but not used [-Wunused-label]
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
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    warning: same module names found:
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
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
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
    1    mm/shmem.c:2719:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: =
call to stackleak_track_stack() with UACCESS enabled
    1    fs/proc/proc_sysctl.c:701:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1876:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/orangefs/orangefs-debugfs.c:193:1: warning: unused label 'out' =
[-Wunused-label]
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
    1    fs/nfs/dir.c:451:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:1573:34: warning: variable 'wq' is uninitialized when=
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
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: t=
he frame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: t=
he frame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/scsi/lpfc/lpfc_sli.c:11850:34: warning: variable 'done_q' =
is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_scsi.c:4559:34: warning: variable 'waitq' i=
s uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
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
    1    drivers/net/usb/lan78xx.c:2663:34: warning: variable 'unlink_wakeu=
p' is uninitialized when used within its own initialization [-Wuninitialize=
d]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2352 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/cadence/macb_main.c:48:39: warning: 'mgmt' de=
fined but not used [-Wunused-variable]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
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
    1    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the =
frame size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the =
frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:995:39: warni=
ng: implicit conversion from enumeration type 'PPCLK_e' to different enumer=
ation type 'enum smu_clk_type' [-Wenum-conversion]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:3023:8: warni=
ng: variable 'current_rpm' is used uninitialized whenever '?:' condition is=
 false [-Wsometimes-uninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:3020:22: note=
: initialize the variable 'current_rpm' to silence this warning
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:1031:39: warn=
ing: implicit conversion from enumeration type 'PPCLK_e' to different enume=
ration type 'enum smu_clk_type' [-Wenum-conversion]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:1016:39: warn=
ing: implicit conversion from enumeration type 'PPCLK_e' to different enume=
ration type 'enum smu_clk_type' [-Wenum-conversion]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/smu_v11_0.c:1102:10: warni=
ng: variable 'freq' is used uninitialized whenever '?:' condition is false =
[-Wsometimes-uninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/smu_v11_0.c:1095:15: note:=
 initialize the variable 'freq' to silence this warning
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:905:26: warni=
ng: suggest braces around initialization of subobject [-Wmissing-braces]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:601:33: warni=
ng: suggest braces around initialization of subobject [-Wmissing-braces]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/amdgpu_smu.c:1376:30: warn=
ing: implicit conversion from enumeration type 'enum pp_clock_type' to diff=
erent enumeration type 'enum smu_clk_type' [-Wenum-conversion]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/amdgpu_smu.c:1375:30: warn=
ing: implicit conversion from enumeration type 'enum pp_clock_type' to diff=
erent enumeration type 'enum smu_clk_type' [-Wenum-conversion]
    1    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.c=
:421:14: warning: implicit conversion from enumeration type 'enum amd_pp_cl=
ock_type' to different enumeration type 'enum smu_clk_type' [-Wenum-convers=
ion]
    1    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.c=
:336:8: warning: implicit conversion from enumeration type 'enum smu_clk_ty=
pe' to different enumeration type 'enum amd_pp_clock_type' [-Wenum-conversi=
on]
    1    drivers/gpu/drm/amd/amdgpu/../amdgpu/mes_v10_1.h:24:9: warning: '_=
_MES_V10_1_H__' is used as a header guard here, followed by #define of a di=
fferent macro [-Wheader-guard]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    arch/x86/kvm/x86.c:4344:1: warning: the frame size of 2160 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:342:1: warning: the frame size of 2=
856 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    4 warnings generated.
    1    /tmp/cczQqDnd.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cczQqDnd.s:18119: Warning: using r15 results in unpredictable=
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
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 12 warnings, 0 section =
mismatches

Warnings:
    /tmp/cczQqDnd.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cczQqDnd.s:18191: Warning: using r15 results in unpredictable beha=
viour
    fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined but =
not used [-Wunused-label]
    fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [=
-Wunused-variable]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 49 warnings, 0 secti=
on mismatches

Warnings:
    mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this fun=
ction [-Wmaybe-uninitialized]
    arch/x86/kernel/cpu/mshyperv.c:342:1: warning: the frame size of 2856 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    arch/x86/kvm/x86.c:4344:1: warning: the frame size of 2160 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
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
    fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined but =
not used [-Wunused-label]
    fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [=
-Wunused-variable]
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: call =
to stackleak_track_stack() with UACCESS enabled
    net/wireless/nl80211.c:1732:1: warning: the frame size of 2280 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6481:1: warning: the frame size of 2112 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2363:1: warning: the frame size of 4584 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5117:1: warning: the frame size of 2776 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: the fr=
ame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 44 warnings, 0 sectio=
n mismatches

Warnings:
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2688 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2512 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2256 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined but =
not used [-Wunused-label]
    fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [=
-Wunused-variable]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2352 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2764:1: warning: the fr=
ame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 108 warnings, 0 sec=
tion mismatches

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
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/nfs/dir.c:451:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1573:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../amdgpu/mes_v10_1.h:24:9: warning: '__MES_=
V10_1_H__' is used as a header guard here, followed by #define of a differe=
nt macro [-Wheader-guard]
    1 warning generated.
    fs/orangefs/orangefs-debugfs.c:193:1: warning: unused label 'out' [-Wun=
used-label]
    fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [=
-Wunused-variable]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/amdgpu_smu.c:1375:30: warning: =
implicit conversion from enumeration type 'enum pp_clock_type' to different=
 enumeration type 'enum smu_clk_type' [-Wenum-conversion]
    drivers/gpu/drm/amd/amdgpu/../powerplay/amdgpu_smu.c:1376:30: warning: =
implicit conversion from enumeration type 'enum pp_clock_type' to different=
 enumeration type 'enum smu_clk_type' [-Wenum-conversion]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/smu_v11_0.c:1102:10: warning: v=
ariable 'freq' is used uninitialized whenever '?:' condition is false [-Wso=
metimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../powerplay/smu_v11_0.c:1095:15: note: init=
ialize the variable 'freq' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:995:39: warning: i=
mplicit conversion from enumeration type 'PPCLK_e' to different enumeration=
 type 'enum smu_clk_type' [-Wenum-conversion]
    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:1016:39: warning: =
implicit conversion from enumeration type 'PPCLK_e' to different enumeratio=
n type 'enum smu_clk_type' [-Wenum-conversion]
    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:1031:39: warning: =
implicit conversion from enumeration type 'PPCLK_e' to different enumeratio=
n type 'enum smu_clk_type' [-Wenum-conversion]
    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:3023:8: warning: v=
ariable 'current_rpm' is used uninitialized whenever '?:' condition is fals=
e [-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../powerplay/vega20_ppt.c:3020:22: note: ini=
tialize the variable 'current_rpm' to silence this warning
    4 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:601:33: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
    drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:905:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.c:336:=
8: warning: implicit conversion from enumeration type 'enum smu_clk_type' t=
o different enumeration type 'enum amd_pp_clock_type' [-Wenum-conversion]
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.c:421:=
14: warning: implicit conversion from enumeration type 'enum amd_pp_clock_t=
ype' to different enumeration type 'enum smu_clk_type' [-Wenum-conversion]
    2 warnings generated.
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2663:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'vht_pf=
r' is used uninitialized whenever 'if' condition is false [-Wsometimes-unin=
itialized]
    drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the var=
iable 'vht_pfr' to silence this warning
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
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this fun=
ction [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this fun=
ction [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
 errors, 7 warnings, 0 section mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
=94 PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 =
warnings, 0 section mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warni=
ngs, 0 section mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
    drivers/net/ethernet/cadence/macb_main.c:48:39: warning: 'mgmt' defined=
 but not used [-Wunused-variable]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]
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
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-varia=
ble]

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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this fun=
ction [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this fun=
ction [-Wmaybe-uninitialized]

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
