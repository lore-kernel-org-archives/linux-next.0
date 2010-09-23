From: Pekka Enberg <penberg@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the slab tree
Date: Thu, 23 Sep 2010 12:33:14 +0300
Message-ID: <AANLkTim=uZuC1gt6qL7+KMdgnnx4e4Hh2Zs=SdjJXv5W@mail.gmail.com>
References: <20100923134414.7aa7f696.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:52272 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752124Ab0IWJdP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Sep 2010 05:33:15 -0400
In-Reply-To: <20100923134414.7aa7f696.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

On Thu, Sep 23, 2010 at 6:44 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Today's linux-next merge of the tip tree got a conflict in
> include/linux/percpu.h between commit
> 6fc80ef491b981f59233beaf6aeaccc0c947031d ("percpu: use percpu allocat=
or
> on UP too") from the slab tree and commit
> 8b8e2ec1eeca7f6941bc81cefc9663018d6ceb57 ("percpu: Add {get,put}
> _cpu_ptr") from the tip tree.
>
> Just context changes. =A0I fixed it up (see below) and can carry the =
fix as
> necessary.

Why are we seeing a merge conflict here? I cherry-picked patches from
Tejun's for-next branch but didn't modify them.

> diff --cc include/linux/percpu.h
> index aeeeef1,0eb5083..0000000
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@@ -39,8 -39,19 +39,17 @@@
> =A0 =A0 =A0 =A0preempt_enable(); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> =A0} while (0)
>
> + #define get_cpu_ptr(var) ({ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 \
> + =A0 =A0 =A0 preempt_disable(); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 this_cpu_ptr(var); })
> +
> + #define put_cpu_ptr(var) do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> + =A0 =A0 =A0 (void)(var); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 preempt_enable(); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> + } while (0)
> +
> =A0-#ifdef CONFIG_SMP
> =A0-
> =A0/* minimum unit size, also is the maximum supported allocation siz=
e */
> =A0-#define PCPU_MIN_UNIT_SIZE =A0 =A0 =A0 =A0 =A0 =A0PFN_ALIGN(64 <<=
 10)
> =A0+#define PCPU_MIN_UNIT_SIZE =A0 =A0 =A0 =A0 =A0 =A0PFN_ALIGN(32 <<=
 10)
>
> =A0/*
> =A0 * Percpu allocator can serve percpu allocations before slab is
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
