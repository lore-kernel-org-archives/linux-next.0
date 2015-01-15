From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH 1/2 v2] ftrace: don't allow IPMODIFY without proper
 compiler support
Date: Thu, 15 Jan 2015 10:34:48 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1501151032280.4162@pobox.suse.cz>
References: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz> <20141223094607.GA16445@infradead.org> <20141223151056.GA4789@treble.redhat.com> <20141226155613.36dd95b9@canb.auug.org.au> <20150107144317.61ab2080877a4d8227990551@linux-foundation.org>
 <alpine.LNX.2.00.1501072346400.15299@pobox.suse.cz> <20150107153006.60ed354e3458f402e6819b9e@linux-foundation.org> <alpine.LNX.2.00.1501080037030.15299@pobox.suse.cz> <20150107155701.4839545f63701412003edd88@linux-foundation.org>
 <alpine.LNX.2.00.1501080104190.15299@pobox.suse.cz> <54B3C1DD.6090400@hitachi.com> <alpine.LNX.2.00.1501132345080.4162@pobox.suse.cz> <20150113211223.18908f21@grimm.local.home> <alpine.LNX.2.00.1501140945520.4162@pobox.suse.cz>
 <54B73549.3090405@hitachi.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46248 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752281AbbAOJew (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2015 04:34:52 -0500
In-Reply-To: <54B73549.3090405@hitachi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org

On Thu, 15 Jan 2015, Masami Hiramatsu wrote:

> Hmm, if this binary doesn't support IPMODIFY, it should return -ENOTSUPP.

Good poing, will send v3.

> And also, IMHO, we'd better reject registering ftrace_ops with IPMODIFY 
> in this situation before updating hash table.

That would happen automatically if we return -ENOTSUPP, right? Because the 
check in ftrace_hash_move() would cause freeing of the new_hash and the 
error value would get propagated out to ftrace_hash_move() callers.

-- 
Jiri Kosina
SUSE Labs
