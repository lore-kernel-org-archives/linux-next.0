From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing from a commit in the tip tree
Date: Thu, 27 Jul 2017 09:48:34 +1000
Message-ID: <20170727094834.371f005e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751078AbdGZXsh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Jul 2017 19:48:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Taeung Song <treeze.taeung@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi all,

Commit

  585d93c5ffcc ("perf annotate stdio: Fix --show-total-period")

has no Signed-off-by for its author.

-- 
Cheers,
Stephen Rothwell
