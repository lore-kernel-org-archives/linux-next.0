From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Tue, 30 Nov 2010 10:05:29 +1030
Message-ID: <201011301005.29532.rusty@rustcorp.com.au>
References: <4CE2F914.9070106@free.fr> <20101129181542.GA11630@home.goodmis.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20101129181542.GA11630@home.goodmis.org>
Sender: linux-security-module-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: matthieu castet <castet.matthieu@free.fr>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, Kees Cook <kees.cook@canonical.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>
List-Id: linux-next.vger.kernel.org

On Tue, 30 Nov 2010 04:45:42 am Steven Rostedt wrote:
> This patch breaks function tracer:
...
> Here we set the text read only before we call the notifiers. The
> function tracer changes the calls to mcount into nops via a notifier
> call so this must be done after the module notifiers.

That seems fine.

I note that both before and after this patch we potentially execute code
in the module (via parse_args) before we set it ro & nx.  But fixing this
last bit of coverage is probably not worth the pain...

Cheers,
Rusty.
