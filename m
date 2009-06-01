From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree with the
	tracing tree
Date: Mon, 1 Jun 2009 21:46:24 +0200
Message-ID: <20090601194624.GA29610@elte.hu>
References: <20090601175539.67317265.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:44463 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752685AbZFATqg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2009 15:46:36 -0400
Content-Disposition: inline
In-Reply-To: <20090601175539.67317265.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the kmemcheck tree got a conflict in
> kernel/trace/ring_buffer.c between commit
> aa20ae8444fc6c318272c643f856d8d8ad3e198d ("ring-buffer: move big if
> statement down") from the tracing tree and commits
> 9b7ff384ee76ced9638ab236db588a6f13916336 ("trace: annotate bitfields in
> struct ring_buffer_event") and 3467e18b1cf34c7d316af5717e7053ce845d014e
> ("kmemcheck: make bitfield annotations be valid C") from the kmemcheck
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Would be nice if you indicated whether you cross-checked it against 
tip:master, which had most of these conflicts resolved already (for 
weeks).

( this has relevance for the x86 and tracing tree conflicts - 
  kmemleak is not in -tip)

	Ingo
