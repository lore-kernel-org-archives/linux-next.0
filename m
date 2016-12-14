From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 14 Dec 2016 08:24:11 +0100
Message-ID: <20161214072411.GA1635@gmail.com>
References: <20161214132828.1d128963@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161214132828.1d128963@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> fs/ubifs/dir.c: In function 'ubifs_readdir':
> fs/ubifs/dir.c:629:13: warning: 'fstr_real_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
>     fstr.len = fstr_real_len;
>              ^
> 
> Introduced by commit
> 
>   f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
> 
> This is a false positive because assignment and use are both protected by
> "if (encrypted)".
> 
> I have no idea why this did not turn up earlier in my builds.

FYI, f4f61d2cc6d8 is not in the -tip tree, so it cannot possibly have introduced 
this warning.

Thanks,

	Ingo
