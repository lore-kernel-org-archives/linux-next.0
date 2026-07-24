Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5496433E61
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901114; cv=none; b=EWqvxBi/7ZkvacNyAb35Y7gw9dbEXMAVyCdsMoFcBNhw/7X9IAgcSlU2A+1qqeKRJUA4WxQgBkPfctR1LHjgFUqk8uGAiNs0tuD1wiGiei3wWwYadDEmaCZxdLHZcdr7h4yoDfI6x8+8fl35FLKQ1f9vjCJFOFzmlw4o7kZBCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901114; c=relaxed/simple;
	bh=JmHb9oZYao7Yc5niZHc9V54/PpLCBKu57iqtsPvR7IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGJR8tFZ3pxIL1cqFy6f25AzPl3mMbpHC7n734zqXsoNrGeuiw/2x4CNgT4sVQN54LBn5t8sQLzQuk2JespHj2fFAq4xLTBiHhQCxoqgHNqjZMrB31W/QtGNxme/LSkLVmbhNYBJWFmxc35E2SYedE72322RmkMVLCrpd2mMi0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=fail smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=BIBKW6xH; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="BIBKW6xH"
Received: from macsyma.thunk.org (pool-108-49-209-71.bstnma.fios.verizon.net [108.49.209.71])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66ODpAIb005143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 09:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784901076; bh=TgUdH/ng+MV5RB9DjuusSmVUHKEP9FsusF84biSM+Ac=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=BIBKW6xHUP2hrm2RbX5uBpnvLMzAyMo7vVe/RwOqQvFBahDRBiHQmmox1IHOuogO6
	 s6LpTWiUb0wATLVyi8Szsx2B0KTgdvyuzdn7Mtjq8ano8YibRmKXKGU+UQBsDkoBb+
	 0Dtv8WgBK5joPNUAK7/Spd0ikcW9qnAU19WkCsEjG+c6QmlozjxOfXFN8qGzEBOpfK
	 TvleRMEvHjenR+JSpOxKx68aoEpTJJ1aHE1lZBZOQQrEiamddn52CX1FOooQKUPqyW
	 r+Bx7o0HlP53KY3D/MeMRL90I0TVeTG/9IGm8EFEDl1La5WR9Z1lx4XacqVRoshG+1
	 G/mGGqGCDrlaQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id E9017BE892F; Fri, 24 Jul 2026 09:50:09 -0400 (EDT)
Date: Fri, 24 Jul 2026 09:50:09 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Alexander Potapenko <glider@google.com>, Mark Brown <broonie@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: Policy regarding linux-next only changes
Message-ID: <amNsDFyTbsyAASjt@mit.edu>
References: <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>

On Fri, Jul 24, 2026 at 09:11:27PM -0500, Tetsuo Handa wrote:
> 
> What is happening is that I am using tomoyo git tree as a hook for
> executing debug printk() (using linux-next git tree) in order to debug
> problems which syzbot has found but nobody can afford looking into.
> 
> Individual git tree is not served as a hook for applying debug patches
> like "quilt push"; one of reasons is that "git" (compared to "quilt") is
> not intended for removing a patch when that patch became no longer
> necessary (due to problem being fixed).

Ah.  In that case, what if you simply have a separate tree which just
has these debugging patches, and then either Mark Brown or the Syzbot
team could create a new git tree / branch which takes linux-next and
then merges this debug tree on top of the latest linux-net?

The advantages of this is that the patches never hit linux-next, but
this new tree, call it linux-next-syz-debug.  And since it is a new
tree, you wouldn't need a new magic KConfig CONFIG #ifdef, so no code
changes would be needed in syzbot.

The only question then is how much does the Syzbot team is willing pay
to help provide the resources you need to resolve those syzbot issues.
I will say that *my* particular management chain at $WORK has
authorized ignoring a whole class of syzbot bugs because they are
utterly irrelevant for our production environment, and so it's not so
much a "can't afford", but "has insufficient business value relative
to our budget / head count authorization".  (And personally, I refuse
to work on those bugs after midnight or on weekends; I have higher
priority personal priorities.)  But perhaps the Syzbot team has a
different set of priorities....

					- Ted
