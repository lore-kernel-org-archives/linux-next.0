From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Tue, 2 Jan 2018 18:04:30 +1100
Message-ID: <20180102180430.3420b704@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55675 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750787AbeABHEd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jan 2018 02:04:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: vmlinux: 'abort' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'abort' exported twice. Previous export was in vmlinux

Introduced by commit

  3ff677e9abdf ("kernel/exit.c: export abort() to modules")

EXPORT_SYMBOL(abort) already exists in

arch/arc/kernel/traps.c
arch/arm/kernel/traps.c
arch/m32r/kernel/traps.c
arch/unicore32/kernel/traps.c

-- 
Cheers,
Stephen Rothwell
