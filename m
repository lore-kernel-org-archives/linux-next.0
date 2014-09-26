From: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: manual merge of the tip tree with the audit tree
Date: Fri, 26 Sep 2014 11:01:57 -0400
Message-ID: <20140926150157.GU1992@madcap2.tricolour.ca>
References: <20140924153857.191a97a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140924153857.191a97a4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Eric Paris <eparis@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>
List-Id: linux-next.vger.kernel.org

On 14/09/24, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> arch/x86/kernel/entry_64.S between commit b4f0d3755c5e ("audit: x86:
> drop arch from __audit_syscall_entry() interface") from the audit tree
> and commit 1dcf74f6edfc ("x86_64, entry: Use split-phase
> syscall_trace_enter for 64-bit syscalls") from the tip tree.
> 
> I fixed it up (probably incorrectly - I removed the auditsys section
> as that is what the latter did) and can carry the fix as necessary (no
> action is required).

The fix looks fine to me.  The auditsys section was no longer needed
since it was taken care of via the phase1 and phase2 calls.  It was the
part in ptrace.c that was important (it would not have compiled) and you
updated that fine to remove the arch arg.

Thanks, Stephen.

> Stephen Rothwell                    sfr@canb.auug.org.au



- RGB

--
Richard Guy Briggs <rbriggs@redhat.com>
Senior Software Engineer, Kernel Security, AMER ENG Base Operating Systems, Red Hat
Remote, Ottawa, Canada
Voice: +1.647.777.2635, Internal: (81) 32635, Alt: +1.613.693.0684x3545
