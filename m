Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0509C35F8AB;
	Fri,  3 Jul 2026 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089680; cv=none; b=H+53MxPUp63PBJmv72L++cqaX0JvR9i0FiPNcXSoZ1ZoncxWjyAf3/ojOJzo/W+chezBIZ8jJO2YSjn9AJLcOv0FF3MvAE41Moo1tVZmefqJ3vHlmf2am/mODrLdJINkkqYXoSImE2hbhgBIcqCvV2HuKoeuHBEGmy7Y5tTWjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089680; c=relaxed/simple;
	bh=vq7wpJ6MNH5K3qt43Nw7RPJYZACK9eaYGCvBNoR6xHI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VcZseio9nNF4Vw/tTY8BKbcN5XSC+hV6YyzKceNDlL4l/jYikg+6z4ZjSTcRimTWpR9VCPNQxJNS4ABhQi2/R96zBGJCrG8ySz5POgph+YAqP7ZtoAPbwCDYM3Kxy7QNkMfOt4/E5iGe2U0hctiZddEWJHYczYqDeB4kO7hoMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kngNqxPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kngNqxPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EA41F000E9;
	Fri,  3 Jul 2026 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089678;
	bh=xf/dBNBXIFknuPYF4toh7X5rtRCSG/KjSzao3sdnw88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kngNqxPnDW4iiFNYe55BEKpjwR6Wp5sEqwiZMW/MCPsfQIN1lAyMBdDz0FouNijHu
	 Km5dW8x1cWNW9lPtyM8mkR/aA1IC1gsAEtZRMtxTNWEN3W35q2hVg3LvuKvYm4yxmW
	 zway7PXRMiRq9qlD5S6wWqGODCp4XUyPQlZHEFcUEJ5U9/DGpjk5JvFpuwknFWvKs3
	 adfs8PvkZrrGsljXlcw5qAPGIjhFv6/LayY/kFoaTcncsJRSkK+uPNsQdrEvTiVWN9
	 WGQfHsnFVesa4Ru0nVvCd7oEAKYeopTm1X3r9LsVVp2LI1/TyUkGONC4gi6RrZtCBY
	 2typ6zT4PP9nQ==
Date: Fri, 3 Jul 2026 23:41:14 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Bradley Morgan <include@grrlz.net>,
 Breno Leitao <leitao@debian.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 tip-fixes tree
Message-Id: <20260703234114.3ac790ca6a173741c204d210@kernel.org>
In-Reply-To: <20260702102850.12ce82e1e2e95766d52e0093@linux-foundation.org>
References: <akZv7XdTZlkCUQ1L@sirena.org.uk>
	<20260702102850.12ce82e1e2e95766d52e0093@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2026 10:28:50 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Thu, 2 Jul 2026 15:04:29 +0100 Mark Brown <broonie@kernel.org> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
> > 
> >   lib/bootconfig.c
> > 
> > between commit:
> > 
> >   dec4d8118c179 ("bootconfig: fix NULL-pointer arithmetic in xbc_snprint_cmdline()")
> > 
> > from the tip-fixes tree and commit:
> > 
> >   9f2274451ae6b ("lib/bootconfig: fix undefined behavior involving NULL pointer arithmetic")
> > 
> > from the mm-nonmm-unstable tree which look like two fixes for the same
> > issue.
> 
> hm, OK, thanks.  I don't know which is preferable, really.  I'll drop
> the mm.git patch because the tip-fixes patch has a nice comment ;)
> 

Ah, yes. I replied to it. Thanks for dropping.

https://lore.kernel.org/all/20260701082611.6575e0f37541014f67830bdc@kernel.org/

Thank you,
-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
