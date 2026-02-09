Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348925D216;
	Mon,  9 Feb 2026 17:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656825; cv=none; b=sg/xxkqJ3ZPQFzx4pX5lI6Bn/s/tNg1ehsbOb4bpu2bXGQ+IGjSigyqUUrBxVLHyZ/SMJSLk7n9S4LvFwtSvXwR1Xc5760sIZCtKdN0Ob6R52WCsJ/B4auVYMZ4qp6eNJvS72N3ZTyozB1rqkBEiyeJbg8Go1RfVhvR38VRPHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656825; c=relaxed/simple;
	bh=JLtFwpKRFMxdfaAx5SJL2IwOxACnryblaZrL38vxDB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=usPFir1UkiQUZF0uYhWe2PcUzz3Z7jX5v/cRvMfDN1WxsvMZwZIALA3Gui8XoImRGaqJCgatzgiJoIgmO5fEGgKxTojLKMO0qY50qp7rMu1UL2eNj9yyRSChmGX6bRnN/A85x7UN2jQ7JHcdx044MnkDW5PnA0bfQBsDieAVtac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 2534B1B2A80;
	Mon,  9 Feb 2026 17:06:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 39A4542;
	Mon,  9 Feb 2026 17:06:56 +0000 (UTC)
Date: Mon, 9 Feb 2026 12:06:55 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yury Norov <ynorov@nvidia.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 mm-nonmm-stable tree
Message-ID: <20260209120655.2045ea9f@gandalf.local.home>
In-Reply-To: <20260209085810.9aa1e0c9e8cac00ba9585171@linux-foundation.org>
References: <aYoAtbc4L0N-g6C-@sirena.co.uk>
	<20260209085810.9aa1e0c9e8cac00ba9585171@linux-foundation.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 6iczbi14bspoocjxj8jq6kpkqtnfgcp8
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 39A4542
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/KLqIEsrl/NQZ82/xJsj7aTsbjd9WNANw=
X-HE-Tag: 1770656816-437331
X-HE-Meta: U2FsdGVkX1+HqOJlD5kr72/LCJsLjztPrjMcMCXsJWqmeqJdwTFSCoiKNJDyTq7vC4YewobOmq4XtXxC1jIUESoE0GCInUAh4Vm3wxbKfK47AOEyf3/FvH7pspxHFU3yW7jTYDmovr5gZx93VdSRQ5JM7/cEv+HToYEmkozwK7HiPXxXAlHmSLSqm25iDyg9HdBxtwf7xALdkB8Z5/eH5/tWZ6JGrBImvHG4BE3YrHhzmSNf5rztOxSTUStN8up7M+JnJcoUqvXJiTqp3vkpTJNuCinCHp57ipsSSB6lqwdgSfKoL3EdcXpyQwquN3VQEyHwb2m9SvXMe7gs6/sruyd4GuKGUOOb1FhReNYIxwouPKl6RUb8ZVmeI2i8eDnN

On Mon, 9 Feb 2026 08:58:10 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.  
> 
> Yikes.
> 
> How about I drop "tracing: remove size parameter in __trace_puts()" and
> "tracing: move tracing declarations from kernel.h to a dedicated
> header"?

It should be a trivial merge conflict. I only moved the code from trace.c
into trace_printk.c. I made no other changes to it.

Basically, the commit in your tree would be the same, it would just be
applied to kernel/trace/trace_printk.c instead of kernel/trace/trace.c.

Both changes are similar in the fact they are cleanups in where code lives.

Or would you prefer if I take that change and rebase it on top of my tree?

-- Steve
