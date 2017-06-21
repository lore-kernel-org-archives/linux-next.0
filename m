From: Anup Patel <anup.patel@broadcom.com>
Subject: Re: linux-next: build warnings after merge of the clk tree
Date: Wed, 21 Jun 2017 20:45:27 +0530
Message-ID: <CAALAos-MZxMWS9yePDf0RZvp7FMpkqGAMrvncRq9qziPDewwkQ@mail.gmail.com>
References: <20170621093423.695ba952@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:35139 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752854AbdFUPP3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jun 2017 11:15:29 -0400
Received: by mail-ua0-f169.google.com with SMTP id j53so101845917uaa.2
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2017 08:15:28 -0700 (PDT)
In-Reply-To: <20170621093423.695ba952@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>

On Wed, Jun 21, 2017 at 5:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
>
> WARNING: drivers/clk/bcm/built-in.o(.text+0x4022): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll3_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll3_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/bcm/built-in.o(.text+0x4069): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll_pcie_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll_pcie_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/bcm/built-in.o(.text+0x40b9): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll1_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll1_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/bcm/built-in.o(.text+0x4109): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/bcm/built-in.o(.text+0x4159): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll5_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll5_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/bcm/built-in.o(.text+0x41a9): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll4_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll4_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/bcm/built-in.o(.text+0x41f9): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/built-in.o(.text+0x14bf2): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll3_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll3_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/built-in.o(.text+0x14c39): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll_pcie_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll_pcie_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/built-in.o(.text+0x14c89): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll1_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll1_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/built-in.o(.text+0x14cd9): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/built-in.o(.text+0x14d29): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll5_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll5_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/built-in.o(.text+0x14d79): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll4_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll4_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/clk/built-in.o(.text+0x14dc9): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/built-in.o(.text+0x13e3a2): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll3_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll3_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/built-in.o(.text+0x13e3e9): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll_pcie_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll_pcie_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/built-in.o(.text+0x13e439): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll1_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll1_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/built-in.o(.text+0x13e489): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/built-in.o(.text+0x13e4d9): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll5_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll5_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/built-in.o(.text+0x13e529): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll4_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll4_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: drivers/built-in.o(.text+0x13e579): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: vmlinux.o(.text+0x819132): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll3_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll3_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: vmlinux.o(.text+0x819179): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll_pcie_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll_pcie_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: vmlinux.o(.text+0x8191c9): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll1_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll1_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: vmlinux.o(.text+0x819219): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_lcpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_lcpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: vmlinux.o(.text+0x819269): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll5_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll5_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: vmlinux.o(.text+0x8192b9): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll4_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll4_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> WARNING: vmlinux.o(.text+0x819309): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> The function sr_genpll0_clk_init() references
> the function __init iproc_pll_clk_setup().
> This is often because sr_genpll0_clk_init lacks a __init
> annotation or the annotation of iproc_pll_clk_setup is wrong.
>
> Introduced by commit
>
>   654cdd3229cd ("clk: bcm: Add clocks for Stingray SOC")

All sr_xxx_init() had __init attribute but we had removed it based on
review comments.

The iproc_pll_xxx() APIs are shared across various clk drivers of iproc SoCs.

I suggest we bring back __init attribute for all sr_xxx_init() in sr_clk.c ??

Regards,
Anup
