From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Mon, 6 Jul 2015 09:49:09 +0200
Message-ID: <559A32F5.2060408@redhat.com>
References: <20150706100858.649532b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150706100858.649532b5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org



On 06/07/2015 02:08, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
> kernel/sched/core.c
> 
> between commit:
> 
> 2ecd9d29abb1 ("sched, preempt_notifier: separate notifier
> registration from static_key inc/dec")
> 
> from Linus' tree and commit:
> 
> 6efde1d3716b ("sched/preempt, kvm: Fix KVM preempt_notifier
> usage")
> 
> from the tip tree.
> 
> I fixed it up (maybe - see below) and can carry the fix as
> necessary (no action is required).

The commit from the tip tree is obsolete.

Paolo
