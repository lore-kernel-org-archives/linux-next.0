From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Mon, 27 Feb 2012 09:57:25 +0400
Message-ID: <20120227055725.GC1904@moon>
References: <20120227165356.6119ac92eabd7052fc56c741@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120227165356.6119ac92eabd7052fc56c741@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 27, 2012 at 04:53:56PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> arch/x86/syscalls/syscall_64.tbl between commit
> arch/x86/syscalls/syscall_64.tbl ("x32: Add x32 system calls to
> syscall/syscall_64.tbl") from the tip tree and commit "syscalls, x86: add
> __NR_kcmp syscall" from the akpm tree.
> 
> I fixed it up (see below) but did not know if this call should be marked
> "common".

Hi Stephen, letme fetch both trees to figure out what this new column means.
Will ping back shortly. Thanks!

	Cyrill
