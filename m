From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Date: Wed, 20 Dec 2017 07:06:51 +1100
Message-ID: <20171220070651.2816be29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44655 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750825AbdLSUGz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Dec 2017 15:06:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Commit

  44d5c715330c ("x86/mm: Create asm/invpcid.h")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
