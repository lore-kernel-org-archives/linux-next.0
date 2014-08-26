From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] KVM: Only export kvm_ple_window for x86_64
Date: Tue, 26 Aug 2014 09:54:44 -0400
Message-ID: <20140826095444.5f2b2423@gandalf.local.home>
References: <20140825191035.59673878@gandalf.local.home>
	<53FC6A15.5090209@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53FC6A15.5090209@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 26 Aug 2014 13:05:57 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Il 26/08/2014 01:10, Steven Rostedt ha scritto:
> > Commit 7b46268d2954 "KVM: trace kvm_ple_window grow/shrink"
> > Added the tracepoint kvm_ple_window under a #ifdef CONFIG_X86_64 but
> > left the export for that tracepoint unprotected, which would cause it
> > to fail to compile when X86_32 is set.
> > 
> > Link: http://lkml.kernel.org/p/20140825172204.769ab4e6@gandalf.local.home
> > 
> > Reported-by: Jim Davis <jim.epost@gmail.com>
> > tested-by: Jim Davis <jim.epost@gmail.com>
> > Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> 
> The current KVM branch should have fixed this already---it leaves the
> tracepoint outside CONFIG_X86_64, which was the right thing to do in the
> first place.
> 

Fair enough. I was wondering why this was unique to x86_64.

-- Steve
