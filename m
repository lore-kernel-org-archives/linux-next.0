Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA131A682A;
	Thu,  2 Jul 2026 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013332; cv=none; b=toqkDHrIrfYI9NCBkRfHQgmvIn8p8RGTxR3odQCOX/YQcUxigpYZSBP4p0D5/laC8f7wzUGRDsDpVRlxefjTZ28kvRYKArBIuifZAmMLyGrOc2ENqSu6PfrVOMi+gG0RcVUgjgjU9kGKFgZohaDasEETA/Bk9h2LJDTYhgISA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013332; c=relaxed/simple;
	bh=3Uhok7jMuo+qnx/vDTOZQALXyLhjgK7cM1aS4G3CGxo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=detGGKoQESzxobxkxS1o75kxznQBL5utZPSuJjitZ6ZRlVLZk0znKl2wW+FRUuHwcJyziVlHJfhIQemEIZo8K7jtEc04YiyCBJfqRdVOayXqcEZ0QTITNYMvXyFcZW0nbfU7M89MomZ9KAdNXymDQMALdCSrZeP2tbWjBBVmlYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BJqVHRTS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BJqVHRTS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2311F000E9;
	Thu,  2 Jul 2026 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783013331;
	bh=92VL4MNT2Jl8ZLr7zqnWjETD1huyYIoq09ZhXAQf3YE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BJqVHRTSzEWYDlGuTZV1UjaRW1cGGoVUHggbe7xYoYgi7JyJns5MRMalwDI6SmqqB
	 CYAa8MJNwWrDqf3DYT0w9+lC7sLUTc6Pb3FUUiJyFNqtAFFy75uufhGxEHEk6tSyod
	 n0hXRLLUcx9ouFsFacIB7dYqrV/DMQMHBnSqYJ0s=
Date: Thu, 2 Jul 2026 10:28:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>, Breno Leitao <leitao@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 tip-fixes tree
Message-Id: <20260702102850.12ce82e1e2e95766d52e0093@linux-foundation.org>
In-Reply-To: <akZv7XdTZlkCUQ1L@sirena.org.uk>
References: <akZv7XdTZlkCUQ1L@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2026 15:04:29 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
> 
>   lib/bootconfig.c
> 
> between commit:
> 
>   dec4d8118c179 ("bootconfig: fix NULL-pointer arithmetic in xbc_snprint_cmdline()")
> 
> from the tip-fixes tree and commit:
> 
>   9f2274451ae6b ("lib/bootconfig: fix undefined behavior involving NULL pointer arithmetic")
> 
> from the mm-nonmm-unstable tree which look like two fixes for the same
> issue.

hm, OK, thanks.  I don't know which is preferable, really.  I'll drop
the mm.git patch because the tip-fixes patch has a nice comment ;)

