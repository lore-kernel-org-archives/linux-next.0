Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402B128371;
	Sat, 28 Mar 2026 02:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774664305; cv=none; b=VZ6yJ5VvpFPed8BJstM92sPPYBX6dGeTFRNDDb152wwTKFqOErRRfrXQSla0HG/nDMEhKq7BuRYt34PL41UG5ZkUN+XojMIXBXu9T1JnKXZFC1AWkABXfo2FpdK/KijgBVgt7fQW9BShFt5LwES8iDcgjHqIG/aVR6Fm5DQ5Xwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774664305; c=relaxed/simple;
	bh=BBJuagGGnQLIX9SgsIJGOqaq3hGkkdTko6lQX5383As=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bc1qIuci7hX3xIBzit5f17Ja9UP2ZrXn1cuuD9G+BT0Nz9UXR37uv5MUL87doVBT+xDN1sHUIne8bGReSfy1XsniP1SYrjOdz8hQNf51K3bNF2+ndPZQnmVxNmOYV5+mckFMbPHYqrVZetrKO8xbI6bgAqSyp2nuBmGnq5cZJCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 2375F5F7BB;
	Sat, 28 Mar 2026 02:18:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 8961531;
	Sat, 28 Mar 2026 02:18:21 +0000 (UTC)
Date: Fri, 27 Mar 2026 22:18:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final build
Message-ID: <20260327221820.380c19bd@robin>
In-Reply-To: <acb-IuZ4vDkwwQLW@sirena.co.uk>
References: <acb-IuZ4vDkwwQLW@sirena.co.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8961531
X-Stat-Signature: s6x7378j7m4iff7m53q89mqa8mmh4rxw
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19bKDHq1fBGopyd/KN9nQ71Br6AcnXN4Aw=
X-HE-Tag: 1774664301-955140
X-HE-Meta: U2FsdGVkX1++RJ6Oz6oI6yiTbCSsuCg69aUC5K0tsIiiyl4aN29LnjusBiNYk3RlJkKeC59/TbCWX6v6qDMt3h83Zy+DhLeygbTuV5aaOK2m+QxO/UKbfWVMMqL1B8siR2xqTukShdWFD152zK+RTh/eJTdjB/i4ojxF9I+qMNZm+zgsvO2NA+zr/0R/X0+6/NjB08p7M6SwsvU05wJiFmZPGZh/Wyr0xhS72xLrq0Mgz6n8JrQAP98+OusbPd+stDatDfYKRMUZxoA+9AgjAG9jkfmuY6ceMJ2jgs9EN7x1IG6unWauPHY8VPS4HyS+OgWggMzxeTSCFns0L8wKisdURh26anXD

On Fri, 27 Mar 2026 22:03:39 +0000
Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> In the final build, today's linux-next build (i386 defconfig) failed
> like this:
> 
> /tmp/next/build/kernel/trace/trace.c:820:5: error: no previous prototype for 'tracing_alloc_snapshot' [-Werror=missing-prototypes]
>   820 | int tracing_alloc_snapshot(void)
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   bade44fe546212 (tracing: Move snapshot code out of trace.c and into trace_snapshot.c)
>    
> I've left this for today.

Thanks, I'll take a look.

-- Steve
