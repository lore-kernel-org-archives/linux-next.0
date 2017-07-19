From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the kbuild tree
Date: Wed, 19 Jul 2017 10:05:28 +1000
Message-ID: <20170719100528.5670ae4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46177 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751962AbdGSAFc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Jul 2017 20:05:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

WARNING: drivers/atm/fore_200e.o(.rodata+0x2258): Section mismatch in reference from the variable fore200e_bus to the function .init.text:fore200e_pca_prom_read()
The variable fore200e_bus references
the function __init fore200e_pca_prom_read()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/auxdisplay/panel.o(.rodata+0x560): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/auxdisplay/panel.o(.rodata+0x568): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/auxdisplay/panel.o(.rodata+0x570): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/auxdisplay/panel.o(.rodata+0x578): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/auxdisplay/panel.o(.rodata+0x580): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/auxdisplay/panel.o(.rodata+0x588): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3700): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3708): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3710): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3718): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3720): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3728): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3730): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3738): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/amd64_edac_mod.o(.rodata+0x3740): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27c0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27c8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27d8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27e0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27f0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x27f8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/edac_mce_amd.o(.rodata+0x2800): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/sb_edac.o(.rodata+0x2d00): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/sb_edac.o(.rodata+0x2d08): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/sb_edac.o(.rodata+0x2d10): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/sb_edac.o(.rodata+0x2d18): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/sb_edac.o(.rodata+0x2d20): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/skx_edac.o(.rodata+0x1160): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/skx_edac.o(.rodata+0x1168): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/skx_edac.o(.rodata+0x1170): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/skx_edac.o(.rodata+0x1178): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/skx_edac.o(.rodata+0x1180): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/edac/skx_edac.o(.rodata+0x1188): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x10): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x18): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x20): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x28): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x30): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x38): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x40): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x48): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x50): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x58): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x3e8): Section mismatch in reference from the (unknown reference) (unknown) to the function .init.text:ibft_init()
The variable (unknown) references
the function __init ibft_init()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x3f0): Section mismatch in reference from the (unknown reference) (unknown) to the function .init.text:ibft_init()
The variable (unknown) references
the function __init ibft_init()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x3f8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x400): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x408): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x410): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x418): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x880): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x888): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x890): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x898): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x8a0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/firmware/iscsi_ibft.o(.rodata+0x8a8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/iio/imu/inv_mpu6050/inv-mpu6050-i2c.o(.rodata+0x8e0): Section mismatch in reference from the variable inv_mpu_dev_list to the function .init.text:asus_t100_matched()
The variable inv_mpu_dev_list references
the function __init asus_t100_matched()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1400): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1408): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1410): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1418): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1420): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1428): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1430): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1438): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1440): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1448): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1450): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1458): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1460): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1468): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1470): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1478): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1480): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1488): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1490): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1498): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14a0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14a8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14b0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14b8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14c0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14c8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14d8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14e0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14f0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x14f8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1500): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1508): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1510): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1518): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1520): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1528): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/isdn/hisax/hisax.o(.rodata+0x1530): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xb80): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xb88): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xb90): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xb98): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xba0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xba8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xbb0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/irda/smsc-ircc2.o(.rodata+0xbb8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x18e0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x18e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x18f0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x18f8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1900): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1908): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1910): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1918): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1920): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1928): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1930): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1938): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1940): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1948): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/wireless/mac80211_hwsim.o(.rodata+0x1950): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ec0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ec8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ed0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ed8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ee0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ee8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ef0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1ef8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f00): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f08): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f10): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f18): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f20): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f28): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f30): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f38): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f40): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/ips.o(.rodata+0x1f48): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/qla1280.o(.rodata+0x1800): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/qla1280.o(.rodata+0x1808): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/qla1280.o(.rodata+0x1810): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/qla1280.o(.rodata+0x1818): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/qla1280.o(.rodata+0x1820): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/thermal/qcom/qcom_tsens.o(.rodata+0x9a0): Section mismatch in reference from the variable ops_8916 to the function .init.text:init_common()
The variable ops_8916 references
the function __init init_common()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/thermal/qcom/qcom_tsens.o(.rodata+0xb60): Section mismatch in reference from the variable ops_8974 to the function .init.text:init_common()
The variable ops_8974 references
the function __init init_common()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/thermal/qcom/qcom_tsens.o(.rodata+0xd20): Section mismatch in reference from the variable ops_8996 to the function .init.text:init_common()
The variable ops_8996 references
the function __init init_common()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7c0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7c8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7d8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7e0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7f0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x7f8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x800): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x808): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/tty/mxser.o(.rodata+0x810): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/ibmasr.o(.rodata+0x360): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/ibmasr.o(.rodata+0x368): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/ibmasr.o(.rodata+0x370): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/ibmasr.o(.rodata+0x378): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/ibmasr.o(.rodata+0x380): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8a8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8b0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8b8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8c0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8c8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8d8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8e0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8f0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x8f8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x900): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x908): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x910): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x918): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x920): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x928): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x930): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x938): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x940): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/watchdog/w83627hf_wdt.o(.rodata+0x948): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .init.text:(unknown)
The variable (unknown) references
the (unknown reference) __init (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Introduced by commit

  6a007e0e602b ("kbuild: modpost: Warn about references from rodata to __init text")

It's usual to do a test build and fix as many warnings as possible before
introducing changes like this to warn about future problems.  So now that
you have a set of things to fix, I am reverting that change (since it
will keep popping up in slightly different forms all through my builds).

-- 
Cheers,
Stephen Rothwell
