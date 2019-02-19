From: Changbin Du <changbin.du@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in Linus' tree
Date: Tue, 19 Feb 2019 01:58:43 +0000
Message-ID: <20190219015842.tkdahxo24wnu35nh@mail.google.com>
References: <20190219073345.11c39f70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219073345.11c39f70@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 19, 2019 at 07:33:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> [Just a note for some future improvement]
> 
> In commit
> 
>   2c4f1fcbef0b ("kprobe: Do not use uaccess functions to access kernel memory that can fault")
> 
> Fixes tag
> 
>   Fixes: 9da3f2b7405 ("x86/fault: BUG() when uaccess helpers fault on kernel addresses")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
> 
> --
Thanks for reminding. The scripts/checkpatch.pl does has such check but
it only checks the commit message body. I will try to extend it to
include tags, and hint how to configure git.

> Cheers,
> Stephen Rothwell



-- 
Cheers,
Changbin Du
