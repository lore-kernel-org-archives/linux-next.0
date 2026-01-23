Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4348342C80;
	Fri, 23 Jan 2026 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167750; cv=none; b=VAryrxQFHprtH5U2oKr5pAmxQIUi685p5sRo5STZaXgoMLIpA55+l8U0bjjKk/iRfnXUpQ+2U9NU5CFqQFtCekzeGwFvcIBASi0Zir/KltiKz7aW5WHJebc13BhRXbGrq/IeEzZrbTFYr1+Mh+YBWpoz3hK0WUyscF8LTCHnyUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167750; c=relaxed/simple;
	bh=o//Yy/h1wLD7d4NpbTv1GBy8VAJdNSFupU+MpU9R9WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQi2/dPdPL1kR2cg040rTtcqEjmuMCk5Q2ISlCmf7X+F/cbIWN7/IVApPUB2AeJ4sLej0R63hJ4RoHdt6gPq8e+g3cP7RY7TODLxtItKcw/iv6NyczLrZfPpHJbkKRRktHSuTYORKqveljlY0rtgWNJePR1Fa4Hnqk2npU3e3wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KtmFhkBk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KtmFhkBk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T6zr5jmxbD64PQutuhCPjXlkQksgf806zBwZpt7CAZw=; b=KtmFhkBkJQH6IFeT83rpw1ewa1
	uvdHaLXJLWqfX3vvQjqeMT8EjzNXrG28bjBXQ/TPL0bn3tg7zieNQJPqZZFZDhEkEPBuBPiCdcytC
	4/GFjyorm0kcjBxLwgR4pFv/g8EGA40vsMfKLMt5+6PnARzyaLILbTyzNi/FgwJLHqbl75q8MIJ9o
	U2hQWCADPumNsi4gTznfA12UausEto/8ZCZ8eM6zPelW1cdqF2JjKRzri263VA7nDkmwLHTW+7hEO
	JgtELxeKBjt0ZzSecrq8E5BTfCP+3h3QwdaEvW1/pWT5T+7hg+ZZ2elmuhwa5MyEAy/6USmmvRPbs
	iDAMEyvA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFLV-00000001gzA-3lmJ;
	Fri, 23 Jan 2026 11:28:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D3A943007E1; Fri, 23 Jan 2026 12:28:56 +0100 (CET)
Date: Fri, 23 Jan 2026 12:28:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Marco Elver <elver@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: [DOCS] build warning after merge of the tip tree
Message-ID: <20260123112856.GS166857@noisy.programming.kicks-ass.net>
References: <20260107161548.45530e1c@canb.auug.org.au>
 <20260107215409.GB694817@noisy.programming.kicks-ass.net>
 <803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
 <91c5386a-2c1b-476a-b189-86d80c0d9e96@infradead.org>
 <20260123081126.3f0f152c@foz.lan>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123081126.3f0f152c@foz.lan>

On Fri, Jan 23, 2026 at 08:11:26AM +0100, Mauro Carvalho Chehab wrote:

> >  tools/lib/python/kdoc/kdoc_parser.py |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > --- a/tools/lib/python/kdoc/kdoc_parser.py
> > +++ b/tools/lib/python/kdoc/kdoc_parser.py
> > @@ -186,6 +186,7 @@ function_xforms  = [
> >      (KernRe(r"__sched +"), ""),
> >      (KernRe(r"_noprof"), ""),
> >      (KernRe(r"__always_unused *"), ""),
> > +    (KernRe(r"__cond_acquires\s*\(.*\)"), ""),
> 
> Regex here is too broad, as it is greedy: it may drop more
> than expected. Perhaps:
> 
>     (KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),

I have of course no idea what so ever how any of this works, but it
occurs to me that __acquires() and __releases() are not in that same
list, what happens to them?

Also, there will 'soon' be an equivalent: __cond_releases():

  https://lkml.kernel.org/r/20260121111213.634625032@infradead.org
