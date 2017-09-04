From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the powerpc tree
Date: Mon, 4 Sep 2017 18:53:41 +1000
Message-ID: <20170904185341.58e3ff62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53663 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753318AbdIDIxo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Sep 2017 04:53:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

WARNING: vmlinux.o(.text+0xa7cb8): Section mismatch in reference from the function .xive_spapr_init() to the function .init.text:.xive_core_init()
The function .xive_spapr_init() references
the function __init .xive_core_init().
This is often because .xive_spapr_init lacks a __init 
annotation or the annotation of .xive_core_init is wrong.

Introduced by commit

  eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")

-- 
Cheers,
Stephen Rothwell
