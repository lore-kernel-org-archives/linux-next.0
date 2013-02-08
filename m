From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: linux-next build conflict between modules and metag trees (LOCKDEP_NOW_UNRELIABLE)
Date: Fri, 8 Feb 2013 10:46:24 +0530
Message-ID: <51148A28.4030307@synopsys.com>
References: <51138CFC.9000508@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51138CFC.9000508@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Thursday 07 February 2013 04:46 PM, James Hogan wrote:
> Hi Rusty,
> 
> The metag architecture tree adds an add_taint(TAINT_DIE) like other
> architectures do, and the modules-next tree adds the
> LOCKDEP_NOW_UNRELIABLE flag to all uses of add_taint (but obviously
> misses arch/metag since it doesn't exist yet), causing a compile error
> on metag in -next when the two are merged together.
> 
> Is it okay for me to merge your commit 373d4d0 ("taint: add explicit
> flag to show whether lock dep is still OK.") in modules-next into the
> base of the metag tree and expect it not to be rebased, so that I can
> then squash the fix into the metag tree?
> 
> The only commits this would include are:
> $ git log --oneline linus/master..373d4d0
> 373d4d0 taint: add explicit flag to show whether lock dep is still OK.
> 64748a2 module: printk message when module signature fail taints kernel.
> 
> Thanks
> James
> 

Being in the same situation as metag (ARC Port), what's the recommended practice
here - do we simply cherry-pick these changes into our tree - or do we merge the
"other" tree on top - ofcourse with premise that "other" tree will not rebase.

Thx,
-Vineet
