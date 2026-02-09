Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B883815D0;
	Mon,  9 Feb 2026 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656291; cv=none; b=oItgtKiThUqStg7fcwQGdWNx0lcWOqmgTRDMPtsITMVIZ6g5/yg71bpdy+lWkEXcHTVM3oMfxupZPU95TdL0NF7NbFemm0ju+/yFN/itoDiWrChPIFtWxA+TwfEYsmNv79McdYgkgVI/pRQZ8izpLsEJ/z0lTReeXUKZKp0FElA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656291; c=relaxed/simple;
	bh=h32mq7vh6uiki+RD8P3XcMxIXHYNE1xMDIfwFh+CdOI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AtZlmU6q3SmviVMeauq2MYxoIjlA6tbChXtDWecCfRsS4KfYr3lc7mCwFMwwmbGwFsBgKDokxoCt1RzR0/Cyf0tlHFQOQ4sWOclSsC/r6qROHAMWucMnyC1mdEtshHy2To5l/1pUD6WdXY+pI77azvcllfA4keL7WQTaHkCkcUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TBDTUWKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TBDTUWKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CADC19423;
	Mon,  9 Feb 2026 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1770656291;
	bh=h32mq7vh6uiki+RD8P3XcMxIXHYNE1xMDIfwFh+CdOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TBDTUWKb0jp7MYE2hbxkzrnWJdbIHXCFReopekZhwPAiFl7r1QVOIJdBxGOWb7IX9
	 mGKFagzVDkuyOXu6O1iIw2Q2J/aLN7+eAaL8V2LHKIssnktk1vNd5OJxFSm0ulOmG8
	 T5IZ2ylw+J70UeX42NGWYDMeyS06LtHtBTHxlmWM=
Date: Mon, 9 Feb 2026 08:58:10 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yury Norov <ynorov@nvidia.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 mm-nonmm-stable tree
Message-Id: <20260209085810.9aa1e0c9e8cac00ba9585171@linux-foundation.org>
In-Reply-To: <aYoAtbc4L0N-g6C-@sirena.co.uk>
References: <aYoAtbc4L0N-g6C-@sirena.co.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Feb 2026 15:43:49 +0000 Mark Brown <broonie@kernel.org> wrote:

> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   kernel/trace/trace.c
> 
> between commit:
> 
>   86e685ff364394 ("tracing: remove size parameter in __trace_puts()")
> 
> from the mm-nonmm-stable tree and commits:
> 
>   27931ee8f45415 ("tracing: Move trace_printk functions out of trace.c and into trace_printk.c")
>   0e730bc067e7a7 ("tracing: Move __trace_buffer_{un}lock_*() functions to trace.h")
> 
> from the ftrace tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Yikes.

How about I drop "tracing: remove size parameter in __trace_puts()" and
"tracing: move tracing declarations from kernel.h to a dedicated
header"?
