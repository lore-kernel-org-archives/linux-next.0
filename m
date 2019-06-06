Return-Path: <SRS0=OytO=UF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBF1C04AB5
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 09:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C442520693
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 09:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="YRtEt6bv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbfFFJpu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 6 Jun 2019 05:45:50 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38144 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727702AbfFFJpu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2019 05:45:50 -0400
Received: by mail-wm1-f68.google.com with SMTP id t5so1699616wmh.3
        for <linux-next@vger.kernel.org>; Thu, 06 Jun 2019 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oAxLHjJssB1bSmkbkIo0w0gk8oCeScGmbzh4qDJ//FA=;
        b=YRtEt6bvNxZUE3uG2tLlB531P+BExhE7HmLumQ1Yc220TJ51Lrwv6at+XZUyUlEFyR
         64LZqeSVpRCMhcXrzP2+Lnev/xgEDoMVB4Mh0VGvgL+/1o3S/DhW1OHMev43CbGXUkwm
         8W+WqL/rNxZ3f2eB9jghGJ8CtjsX2Kxd1J4GvqAu3fPy4YRI5F9Wcd8QuxWKN1UdLbfX
         CVqqWC1VD4OTnu4RiRcOF5J0w9Y9VxxQ/hlndI8xxcFCzMZxqKxv6/txcGHMyLXXNaLB
         sPHFUg/pzL+3Gq5R/W9tKVRg4IVDwrmy3rGMcjBckyELQqviGvfdyYapszBqJQF51L1+
         oGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oAxLHjJssB1bSmkbkIo0w0gk8oCeScGmbzh4qDJ//FA=;
        b=IjR1PTqFcD8BfapLuNQYU3ACUApGvxwfYeaN/oAor9ccvkLTgA42jl6gkbyISLir9e
         v+cqemIhI4uflMc825g/BswjxQMxQsVecAXbjyclmvPgjBQcyHfyOJdLffRz2iuCM6Oc
         qaI+I0IQTz130AmAfpebeBLME8vHonoa/tBYMK5eKbE1DGNlfYctlxBqyR6jiH2e4jte
         e/i7t5MC57VPo0kTSbjidWNx/wfHqxuwr/7UigT3cJTYA4CJBHpvt/k5jeSSjRKgeieX
         6fgP7fEpmZUHy0CoJUCDr0El09XesgWS1WkKfjHpfl4d7chDHs4GOzHx2p5zwCDO7Zys
         VKzA==
X-Gm-Message-State: APjAAAVwxOla7ZW4xVThpgxQz17RXvTKVDEL1p0oKXoIKrp93OmoEUE9
        nFlA83+A30BpjkcrSlOUZ2Oxj/Or2MMcKQ==
X-Google-Smtp-Source: APXvYqyMBcDZXmuUTJfxyUZaQ8vLYKTCalujgcB8ROLnnUjGh3hfIFpfig7WNJOwc6PeTQzfrNL67Q==
X-Received: by 2002:a1c:5546:: with SMTP id j67mr14996657wmb.80.1559814343215;
        Thu, 06 Jun 2019 02:45:43 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u13sm1260647wrq.62.2019.06.06.02.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 02:45:42 -0700 (PDT)
Message-ID: <5cf8e0c6.1c69fb81.7d0e4.78a9@mx.google.com>
Date:   Thu, 06 Jun 2019 02:45:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20190606
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 231 builds: 8 failed, 223 passed, 14 errors,
 459 warnings (next-20190606)
To:     linux-next@vger.kernel.org, clang-built-linux@googlegroups.com
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 231 builds: 8 failed, 223 passed, 14 errors, 459 warning=
s (next-20190606)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190606/

Tree: next
Branch: master
Git Describe: next-20190606
Git Commit: 8b4d1d5740481f10addc3620c6bcfaf00437caa7
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

arm:
    xcep_defconfig: (gcc-8) FAIL

mips:
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
    allmodconfig (gcc-8): 54 warnings
    allmodconfig (clang-8): 117 warnings
    defconfig (clang-8): 44 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (clang-8): 44 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (clang-8): 44 warnings
    defconfig (clang-8): 44 warnings
    defconfig (gcc-8): 2 warnings

arm:
    allmodconfig (gcc-8): 20 warnings
    aspeed_g4_defconfig (gcc-8): 2 warnings
    aspeed_g5_defconfig (gcc-8): 2 warnings
    integrator_defconfig (gcc-8): 2 warnings
    multi_v4t_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 2 warnings
    realview_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 1 error

i386:

mips:
    db1xxx_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
    mpc30x_defconfig (gcc-8): 1 error
    rb532_defconfig (gcc-8): 1 warning

riscv:
    rv32_defconfig (gcc-8): 4 warnings

x86_64:
    allmodconfig (gcc-8): 57 warnings
    tinyconfig (gcc-8): 1 warning

Errors summary:

    6    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahas=
h'
    6    arc-linux-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `c=
rypto_has_ahash'
    1    xfrm_algo.c:(.text+0x344): undefined reference to `crypto_has_ahas=
h'
    1    (.text+0x43c): undefined reference to `crypto_has_ahash'

Warnings summary:

    29   warning: same module names found:
    20   arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets=
_property): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in no=
de /soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
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
    8    1 warning generated.
    7    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-W=
unused-variable]
    7    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-W=
unused-variable]
    6    drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'da=
ta' [-Wunused-variable]
    5    drivers/vhost/vhost.h:112:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    5    drivers/soc/rockchip/pm_domains.c:747:21: warning: shift count is =
negative [-Wshift-count-negative]
    5    41 warnings generated.
    4    mm/zsmalloc.c:648:17: warning: unused variable 'entry' [-Wunused-v=
ariable]
    3    include/linux/mfd/stmfx.h:7:9: warning: 'MFD_STMFX_H' is used as a=
 header guard here, followed by #define of a different macro [-Wheader-guar=
d]
    3    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable '=
i' [-Wunused-variable]
    3    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable =
'i' [-Wunused-variable]
    2    kernel/trace/bpf_trace.c:581:13: warning: 'do_bpf_send_signal' def=
ined but not used [-Wunused-function]
    2    drivers/vhost/vhost.c:967:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:962:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:831:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:737:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:729:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:638:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:486:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:302:5: warning: macro expansion producing 'd=
efined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:2085:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:2064:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1849:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1828:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1469:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1444:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1421:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1396:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1370:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1345:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1281:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1255:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1227:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/vhost/vhost.c:1199:5: warning: macro expansion producing '=
defined' has undefined behavior [-Wexpansion-to-defined]
    2    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:431:1: wa=
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
    2    arch/arc/kernel/unwind.c:187:14: warning: 'unw_hdr_alloc' defined =
but not used [-Wunused-function]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    23 warnings generated.
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/codecs/rt1011.c:2123:4: warning: this decimal constant i=
s unsigned only in ISO C90
    1    sound/soc/codecs/rt1011.c:1291:3: warning: this decimal constant i=
s unsigned only in ISO C90
    1    net/wireless/nl80211.c:6473:1: warning: the frame size of 2128 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:6473:1: warning: the frame size of 2112 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5109:1: warning: the frame size of 2784 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5109:1: warning: the frame size of 2776 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2360:1: warning: the frame size of 4640 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2360:1: warning: the frame size of 4592 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1729:1: warning: the frame size of 2280 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1729:1: warning: the frame size of 2272 byt=
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
    1    fs/ocfs2/super.c:1204:1: warning: the frame size of 3376 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1204:1: warning: the frame size of 3368 bytes is =
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
    1    fs/btrfs/props.c:389:4: warning: 'num_bytes' may be used uninitial=
ized in this function [-Wmaybe-uninitialized]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2924:1: warning: t=
he frame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2924:1: warning: t=
he frame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/staging/kpc2000/kpc_dma/fileops.c:57:35: warning: format '=
%ld' expects argument of type 'long int', but argument 8 has type 'size_t' =
{aka 'unsigned int'} [-Wformat=3D]
    1    drivers/staging/kpc2000/kpc2000/core.c:245:4: warning: format '%lx=
' expects argument of type 'long unsigned int', but argument 4 has type 'lo=
ng long int' [-Wformat=3D]
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
    1    drivers/mtd/nand/raw/au1550nd.c:447:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast t=
o pointer from integer of different size [-Wint-to-pointer-cast]
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
    1    drivers/ata/pata_rb532_cf.c:165:24: warning: unused variable 'info=
' [-Wunused-variable]
    1    arch/x86/kvm/x86.c:4299:1: warning: the frame size of 2168 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:344:1: warning: the frame size of 2=
856 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    2 warnings generated.
    1    /tmp/ccqnYgV5.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccqnYgV5.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1163:warning: override: UNWINDER_GUESS changes choice state

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
acs5k_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
acs5k_tiny_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 section =
mismatches

Warnings:
    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunuse=
d-variable]
    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunuse=
d-variable]
    /tmp/ccqnYgV5.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccqnYgV5.s:18191: Warning: using r15 results in unpredictable beha=
viour
    mm/zsmalloc.c:648:17: warning: unused variable 'entry' [-Wunused-variab=
le]
    sound/soc/codecs/rt1011.c:1291:3: warning: this decimal constant is uns=
igned only in ISO C90
    sound/soc/codecs/rt1011.c:2123:4: warning: this decimal constant is uns=
igned only in ISO C90
    drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'data' [=
-Wunused-variable]
    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [=
-Wunused-variable]
    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-=
Wunused-variable]
    drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast to poi=
nter from integer of different size [-Wint-to-pointer-cast]
    drivers/staging/kpc2000/kpc2000/core.c:245:4: warning: format '%lx' exp=
ects argument of type 'long unsigned int', but argument 4 has type 'long lo=
ng int' [-Wformat=3D]
    drivers/staging/kpc2000/kpc_dma/fileops.c:57:35: warning: format '%ld' =
expects argument of type 'long int', but argument 8 has type 'size_t' {aka =
'unsigned int'} [-Wformat=3D]
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 54 warnings, 0 sectio=
n mismatches

Warnings:
    mm/zsmalloc.c:648:17: warning: unused variable 'entry' [-Wunused-variab=
le]
    fs/btrfs/props.c:389:4: warning: 'num_bytes' may be used uninitialized =
in this function [-Wmaybe-uninitialized]
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
    fs/ocfs2/super.c:1204:1: warning: the frame size of 3376 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2352 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'data' [=
-Wunused-variable]
    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [=
-Wunused-variable]
    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-=
Wunused-variable]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1729:1: warning: the frame size of 2272 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6473:1: warning: the frame size of 2128 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2360:1: warning: the frame size of 4640 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5109:1: warning: the frame size of 2784 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size of 272=
0 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/mt9t112.c:480:1: warning: the frame size of 2096 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2352 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:431:1: warning=
: the frame size of 4208 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2924:1: warning: the fr=
ame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 57 warnings, 0 secti=
on mismatches

Warnings:
    arch/x86/kernel/cpu/mshyperv.c:344:1: warning: the frame size of 2856 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    arch/x86/kvm/x86.c:4299:1: warning: the frame size of 2168 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    mm/zsmalloc.c:648:17: warning: unused variable 'entry' [-Wunused-variab=
le]
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
    lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common()+0x59: call =
to stackleak_track_stack() with UACCESS enabled
    net/caif/cfctrl.c:549:1: warning: the frame size of 2608 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1505:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'data' [=
-Wunused-variable]
    net/ieee802154/nl802154.c:548:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:198:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tinydrm/ili9225.c:289:1: warning: the frame size of 272=
0 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1729:1: warning: the frame size of 2280 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:6473:1: warning: the frame size of 2112 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2360:1: warning: the frame size of 4592 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5109:1: warning: the frame size of 2776 bytes is=
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
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2924:1: warning: the fr=
ame size of 2792 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 117 warnings, 0 sec=
tion mismatches

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
    mm/zsmalloc.c:648:17: warning: unused variable 'entry' [-Wunused-variab=
le]
    1 warning generated.
    drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'data' [=
-Wunused-variable]
    1 warning generated.
    drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [=
-Wunused-variable]
    drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-=
Wunused-variable]
    2 warnings generated.
    include/linux/mfd/stmfx.h:7:9: warning: 'MFD_STMFX_H' is used as a head=
er guard here, followed by #define of a different macro [-Wheader-guard]
    1 warning generated.
    include/linux/mfd/stmfx.h:7:9: warning: 'MFD_STMFX_H' is used as a head=
er guard here, followed by #define of a different macro [-Wheader-guard]
    1 warning generated.
    include/linux/mfd/stmfx.h:7:9: warning: 'MFD_STMFX_H' is used as a head=
er guard here, followed by #define of a different macro [-Wheader-guard]
    1 warning generated.
    drivers/vhost/vhost.h:112:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    1 warning generated.
    drivers/vhost/vhost.h:112:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    1 warning generated.
    drivers/vhost/vhost.h:112:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    1 warning generated.
    drivers/vhost/vhost.h:112:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:302:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:486:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:638:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:729:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:737:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:831:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:962:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:967:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1199:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1227:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1255:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1281:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1345:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1370:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1396:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1421:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1444:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1469:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1828:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1849:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:2064:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:2085:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    23 warnings generated.
    drivers/vhost/vhost.h:112:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:302:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:486:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:638:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:729:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:737:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:831:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:962:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:967:5: warning: macro expansion producing 'define=
d' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1199:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1227:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1255:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1281:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1345:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1370:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1396:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1421:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1444:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1469:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1828:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:1849:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:2064:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    drivers/vhost/vhost.c:2085:5: warning: macro expansion producing 'defin=
ed' has undefined behavior [-Wexpansion-to-defined]
    23 warnings generated.
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    warning: same module names found:
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/trace/bpf_trace.c:581:13: warning: 'do_bpf_send_signal' defined =
but not used [-Wunused-function]
    drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'data' [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/trace/bpf_trace.c:581:13: warning: 'do_bpf_send_signal' defined =
but not used [-Wunused-function]
    drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'data' [=
-Wunused-variable]

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
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/mtd/nand/raw/au1550nd.c:447:57: warning: pointer type mismatch =
in conditional expression

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
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 44 warnings, 0 section=
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
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 44 warnings, 0 section mismatches

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
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, clang-8) =E2=80=94 PASS, 0 erro=
rs, 44 warnings, 0 section mismatches

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
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, clang-8) =E2=80=94 PASS, 0 errors, 44 warnings,=
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
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
    arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_prop=
erty): /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node /s=
oc@0/clock-controller@1800000 or bad phandle (referred from resets[0])

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
haps_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-linux-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-linux-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
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
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunuse=
d-variable]
    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunuse=
d-variable]

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
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    {standard input}:131: Warning: macro instruction expanded into multiple=
 instructions
    {standard input}:134: Warning: macro instruction expanded into multiple=
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
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
mpc30x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    (.text+0x43c): undefined reference to `crypto_has_ahash'

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunuse=
d-variable]
    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunuse=
d-variable]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunuse=
d-variable]
    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunuse=
d-variable]

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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

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
netx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-linux-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
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
    arc-linux-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-linux-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings=
, 0 section mismatches

Errors:
    xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto_has_ahash'
    arc-linux-ld: xfrm_algo.c:(.text+0x1e6): undefined reference to `crypto=
_has_ahash'

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
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/ata/pata_rb532_cf.c:165:24: warning: unused variable 'info' [-W=
unused-variable]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunuse=
d-variable]
    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunuse=
d-variable]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunuse=
d-variable]
    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunuse=
d-variable]

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
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
    .config:1163:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

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
tinyconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunuse=
d-variable]
    arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunuse=
d-variable]

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
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
xcep_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    xfrm_algo.c:(.text+0x344): undefined reference to `crypto_has_ahash'

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
