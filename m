From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the arm tree
Date: Wed, 29 Nov 2017 10:16:37 +1100
Message-ID: <20171129101637.1e4c7af3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36729 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751496AbdK1XQk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 18:16:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@armlinux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Pitre <nico@linaro.org>, Robin Murphy <robin.murphy@arm.com>

Hi Russell,

After merging the arm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/vfp/vfphw.S: Assembler messages:
arch/arm/vfp/vfphw.S:158: Warning: conditional infixes are deprecated in unified syntax
arch/arm/vfp/vfphw.S:233: Warning: conditional infixes are deprecated in unified syntax
arch/arm/kernel/entry-common.S: Assembler messages:
arch/arm/kernel/entry-common.S:285: Warning: conditional infixes are deprecated in unified syntax
arch/arm/kernel/entry-common.S:286: Warning: conditional infixes are deprecated in unified syntax
arch/arm/kernel/entry-common.S:365: Warning: conditional infixes are deprecated in unified syntax

And many more similar.

Presumably introduced by commit

  cabcafe5d1a5 ("ARM: 8723/1: always assume the "unified" syntax for assembly code")

-- 
Cheers,
Stephen Rothwell
