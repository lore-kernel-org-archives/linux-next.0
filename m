Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482C44E055;
	Mon, 29 Jun 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751836; cv=none; b=KuFkXpKMPBnU7phV8baL7gVRl+rk7DV7y27Gf9E4IIDi4xM37JIR7J0Mdq1HV03rextGNDcBMduJaHUxfw9tJvBmuJpIRnuLS3ggC0DwpLCJyMo59AZgWaiXhNOSxdlV+7Me8lptzJXhI1RBBidrmeuHLe1zprmHnOaUSS7uqUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751836; c=relaxed/simple;
	bh=np6c6JIGFXI/fRrQ+WdGLMypciNSDuPYbXBzBQK87X0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=n2es84tvnVJiozs00AWQuE01ec4lPAzLlm+e7J//0wjcOuKaZFQiFle2eRYoxgLtMjKPkIgVgnU/86YOV8BKL4bbvMI4jSvRWSJ0BildzbWjBTjg5ExZjOwhJyucaewlGM+Ast8TsoWtGRPUOrc15RjFANfiEODl13DWiDT3i7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Laj0y+Wr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Laj0y+Wr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0990C1F00A3A;
	Mon, 29 Jun 2026 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782751835;
	bh=OhG6gD83z3XsnqGnYta2pnEwhViC3H2yA5kG9U1h390=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Laj0y+WrQ3b9botbsicE3elKDAq5GrfC9EsV+BE3Q54SmR0L/sRhGHgjKrBaYu3TS
	 Qn9WUGHfU/gO13plT9Y66ld1T3qWk3SOLrf031lcvkKYw5LkbT5k2jO9AV0GAE9Fi3
	 7D/P6a2QYeza/fP2qVqILnYVAu4GGOuUV79nGMNQ=
Date: Mon, 29 Jun 2026 09:50:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Ketan
 <ketan.kishore@oss.qualcomm.com>
Subject: Re: Fixes tags need work in the mm-nonmm-unstable tree
Message-Id: <20260629095034.e12eab20d0765bac87a463b2@linux-foundation.org>
In-Reply-To: <akJVQVgBXfl4INGo@sirena.org.uk>
References: <akJVQVgBXfl4INGo@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 12:21:37 +0100 Mark Brown <broonie@kernel.org> wrote:

> In commit
> 
>   2f0a90124d661 ("mm: page_ext: add count limit to page_ext_iter_next to prevent invalid PFN access")
> 
> Fixes tag
> 
>   Fixes: 9039b9096ea2 ("mm: page_owner: use new iteration API")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thanks, I altered this to

Fixes: 9039b9096ea2 ("mm: page_ext: add an iteration API for page extensions")

