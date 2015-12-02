From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure after merge of the modules tree
Date: Wed, 02 Dec 2015 13:53:26 +1030
Message-ID: <878u5djzyp.fsf@rustcorp.com.au>
References: <20151201202312.d791b81fa0accaaf5b2f7ab5@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58817 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752550AbbLBTw2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Dec 2015 14:52:28 -0500
In-Reply-To: <20151201202312.d791b81fa0accaaf5b2f7ab5@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>

Mark Brown <broonie@kernel.org> writes:
> Hi Rusty,
>
> After merging the modules tree, today's linux-next x86 allmodconfig build (20151201) failed like this:
>
> /home/broonie/next/next/arch/x86/kernel/livepatch.c: In function 'klp_write_module_reloc':
> /home/broonie/next/next/arch/x86/kernel/livepatch.c:75:22: error: 'struct module' has no member named 'core_ro_size'
>   if (loc < core + mod->core_ro_size)

Yep, I missed that one.

I also missed an ARM case, so I'll rebase the tree (it's near the top
anyway).

Cheers,
Rusty.
