Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C098E3803D6;
	Mon,  9 Feb 2026 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657317; cv=none; b=eDJnqn4dQIMW3W3OS7Nq/1uZGg1p+iCz7JxtPKJTaitqRrsiVzIyNRtjSMmbmBscAp1Jo1LDH/QZTIz71MeT6RjLiFKEnJJb4QF9YyFWDt6TT3i1ncIGkPQV29k7ZTxgJtM5FMpnx+8OHVHGmKxn4FCSmva3FI53G4heay0tlsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657317; c=relaxed/simple;
	bh=TshQmKxF/32DjLPh2D5RzS8HWKz9XEH5M8vrq8v5R4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ok53l4p1xxijkcIidzKxq9AeVyeaheRfR7QvJ51YBMaxceI7/iiap+YmA/OECKcu4smNOpkCH79pQTGnoyA+SX9CdGiBrMLHzwVS3A/i3lrpc0XMH2wKKhBdWNZDubqcsmqQIBML+Lu+Vr/X6MRo8nMfD2n4WPjXLE9hv8GYfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 70C0B1601D4;
	Mon,  9 Feb 2026 17:15:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 7EF1933;
	Mon,  9 Feb 2026 17:15:14 +0000 (UTC)
Date: Mon, 9 Feb 2026 12:15:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yury Norov <ynorov@nvidia.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 mm-nonmm-stable tree
Message-ID: <20260209121513.38f12ea6@gandalf.local.home>
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
X-Stat-Signature: k1q9wq1jg1caby9qntx1is5yxjtem845
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 7EF1933
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+7nOkRfSs5+CZq1/EwGgCXT7Z8UNE9ZNQ=
X-HE-Tag: 1770657314-515089
X-HE-Meta: U2FsdGVkX1/c4TH+5o3cu4PJGpyXVxdC9/6oWr6rhGSlROIHLOXQzGX88eUfC90GyAw8jIlsKGGgLx5eBwYPp/5w07fdI4dWXHc9SZvpx4WNFaGXIm1FWqZRYc1Fzlb/0SyECiMnTx0N8u2KtPZ0UIjWu/nIPxPlaPQza+whhrJOFtcHaO89VJc3WvXjsV9rOsxjJPJGJgm6xAd0Wc4OD+FEyPokKnshh3UfWT0ZMPZRE2fkpHekP1Hs9c/O7ZBT0KzhSpqoSN2SMofCowY69zMzt13zfOSI1Z9Tkx0ymUO6lxM+r354YI2TcwejMsLPpvSeXlouyabCf6OQKw0cu5418RrkiELiNHU1RVfeYidCL25M6KA1yg8pK8EwVWjT

On Mon, 9 Feb 2026 08:58:10 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> How about I drop "tracing: remove size parameter in __trace_puts()" and
> "tracing: move tracing declarations from kernel.h to a dedicated
> header"?

Andrew,

Don't worry about it. When I submit my pull request I'll mention this
conflict and how to solve it.

-- Steve
