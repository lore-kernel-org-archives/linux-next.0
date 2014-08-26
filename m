From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] KVM: Only export kvm_ple_window for x86_64
Date: Tue, 26 Aug 2014 13:05:57 +0200
Message-ID: <53FC6A15.5090209@redhat.com>
References: <20140825191035.59673878@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:2490 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755724AbaHZLGR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2014 07:06:17 -0400
In-Reply-To: <20140825191035.59673878@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Gleb Natapov <gleb@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>

Il 26/08/2014 01:10, Steven Rostedt ha scritto:
> Commit 7b46268d2954 "KVM: trace kvm_ple_window grow/shrink"
> Added the tracepoint kvm_ple_window under a #ifdef CONFIG_X86_64 but
> left the export for that tracepoint unprotected, which would cause it
> to fail to compile when X86_32 is set.
> 
> Link: http://lkml.kernel.org/p/20140825172204.769ab4e6@gandalf.local.home
> 
> Reported-by: Jim Davis <jim.epost@gmail.com>
> tested-by: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

The current KVM branch should have fixed this already---it leaves the
tracepoint outside CONFIG_X86_64, which was the right thing to do in the
first place.

Paolo
