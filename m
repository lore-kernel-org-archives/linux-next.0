From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Wed, 14 Dec 2016 13:28:28 +1100
Message-ID: <20161214132828.1d128963@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753296AbcLNC2c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Dec 2016 21:28:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

fs/ubifs/dir.c: In function 'ubifs_readdir':
fs/ubifs/dir.c:629:13: warning: 'fstr_real_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
    fstr.len = fstr_real_len;
             ^

Introduced by commit

  f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")

This is a false positive because assignment and use are both protected by
"if (encrypted)".

I have no idea why this did not turn up earlier in my builds.

-- 
Cheers,
Stephen Rothwell
