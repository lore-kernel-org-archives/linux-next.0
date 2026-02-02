Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897422B8A9;
	Mon,  2 Feb 2026 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051850; cv=none; b=dfgVs6oc6ubiVbkP+y9eBkBHlWiow4lnPe/ubUgUIaUc+1YxhXEixpqyqfiGaVN2ucwSpkqZPVOMX9jsFU+a5MlFKs6G/A9Swr3dTkXrTuivPXBFZEqUauhjKUvspPuMSvnuGtAH5f5Rwh0MKNxEsG/dZxCmDPdVNqZkl44Qty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051850; c=relaxed/simple;
	bh=aLxdZKAQBCkR2+mlXVcUkFM5nwoy1DDYZLDgpLdIFqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXFxQDl47Sqaigenu7PMmwkuHwIWq8E+OJSLlPjoZVj9Kbpt1sdAHvMNBJFu2lWwIU3UFGQBD4xZE2aftVSHe/VFiB4AGr/y8nS7sUypZlHYSA4p9mLBHLzeYuN1zkmwuoPhBXCExlqKAxHSwZXVXdK2hBoUYKQOn1dRNk//NHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 4A3FD160237;
	Mon,  2 Feb 2026 17:04:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 130A82000F;
	Mon,  2 Feb 2026 17:04:04 +0000 (UTC)
Date: Mon, 2 Feb 2026 12:04:30 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Puranjay Mohan <puranjay@kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the bpf-next
 tree
Message-ID: <20260202120430.760a448f@gandalf.local.home>
In-Reply-To: <CAADnVQLa2z9mr856XStTFvfZxi8or1f9j8Gfu1h6m_A5ZN5eSw@mail.gmail.com>
References: <aYC09rYDOvkNNOaA@sirena.org.uk>
	<20260202112010.0e46018a@gandalf.local.home>
	<CAADnVQLa2z9mr856XStTFvfZxi8or1f9j8Gfu1h6m_A5ZN5eSw@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: bg9m6pi3xenwbiragpd83nzrfp5ycztu
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 130A82000F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+swqWOnucZ5Ni0zlbJDhEet015DWVt4o4=
X-HE-Tag: 1770051844-740421
X-HE-Meta: U2FsdGVkX19SD80B/eV5siO4g9oAE8FUsupmAdrpEuOYl4NdRWk2DGFIATfdWDhS01xj8fxGndeiKq8IAxx3PSJHVptnqB1PkMc1ZoYfdpJzoE8Wh6kipllVeQev2u6dGOtXLW3j4ZflC9Y4QLpxC04PuWUC2fbz14EskMrTH374NsxNKWQfplH/Znn+dNXah+51iMWnIfRth3yjyeucJ1rJ0+HQt8D8dfM6+rgTw7iYuppOL3J/GhTmiEBLC2my2VjqJD9Wp9GgRoPXpMiFOjgnnmxhb4Jju5HSTFoq+OAIAhyfGVmhGzEizoqRM7HU08E6R5s+RFze2m4Cn2OuD2BTXFgWd3THW4rDs7Ga2e3FB9IFF0ekWA==

On Mon, 2 Feb 2026 08:42:55 -0800
Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:

> I wonder whether we should take the whole srcu_fast in tracepoints
> patch set into bpf-next to avoid this conflict ?
> Probably not worth it in the last week before the merge window.
> Just a thought.

It's already in next where it would require a revert to get rid of.

There's just one patch that touches the bpf code, so it still makes more
sense to keep it in the tracing tree.

-- Steve
