From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 8 Apr 2015 17:13:51 +0200
Message-ID: <20150408151350.GA8490@gmail.com>
References: <20150408184954.1356280d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150408184954.1356280d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> arch/x86/kernel/cpu/common.c between commit 6b51311c9765
> ("x86/asm/entry/64: Use a define for an invalid segment selector") from
> the tip tree and commit f28c11e4b695 ("arch/x86/kernel/cpu/common.c:
> fix warning") from the akpm tree.

So f28c11e4b695 doesn't appear to be in linux-next as fetched a minute 
ago:

 triton:~/linux.trees.git> git log f28c11e4b695 --
 fatal: bad revision 'f28c11e4b695'
 triton:~/linux.trees.git> git describe
 next-20150408

How am I supposed to fetch and interpret such sha1's?

Thanks,

	Ingo
