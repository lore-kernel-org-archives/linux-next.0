Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC2646D54F
	for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742521; cv=none; b=dQz6wl637Lo9Clv3pGHjMi0Op3NriozN3y2zBwbCGMfvvAapBtSEJE6n8kXBjkSupQ62EVSljxUmJYHvTjDty3vq/UbWEowfSj4i631Qc/8rq58tnySKGPri5pemMfOw3CtZYY4OpF+Te1Vuk5nsdyKBhNIwbo+ZbTPTLYLam0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742521; c=relaxed/simple;
	bh=ciwGsdeayt6jxkWDPqow7kQIW8lQ9+KlMKpY9B1aPGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iS3WYtEXV0QXALDL5ZY4mx4viEZexdlzXtNeG8M1CrbtkeYnetnONfRYSXqyH7PdSlvU5Z5VafrAD1yj3mimZn5guEZvDnYqIV3Jl1KAJcokqFrQwog/g9d3lzpbVY230sVKttRrOJL776ZJXSSbPNhbiIDFYcYofG5fOuBhFGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=pq8uTuRV; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="pq8uTuRV"
Received: from macsyma.thunk.org ([104.135.218.222])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66MHlxMC001455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 13:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784742484; bh=uR1QxlQQWpgkXX27I6IFEtMOWx0Wyp0gBXAoYJzJobg=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=pq8uTuRVSbz6PtSDclu35S35ATD4kYfqe3S4xVFB5PFUEkUpisK7IMjKlFABxZqaZ
	 Pru6IVn4b2klSwueAf3w1R4ELNpBXHNgFAkm9u5qvS27UH2P88tm0NfSKhH/qLdXK1
	 0m+868hw2t7DXF1sAFVSdt+xjb4eYXE6PdQ5avLDBdCVW0R9cbOwkPGE6OpnuljXbU
	 TWExN08doeS4ecXW4dJ3AqFSj8xfJ/5RnLln770XnL7NXolepXPnLuPrLanP5SURwN
	 hZOw6ZtitQYk7cBO94ehY/eBzWMWk7czi7Uwwk4amsYTMdORUexOG8/rMLCdEKhzfF
	 a2QNRTgnrEZFg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id B7DBABAB7AA; Wed, 22 Jul 2026 13:47:58 -0400 (EDT)
Date: Wed, 22 Jul 2026 13:47:58 -0400
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
Message-ID: <amEAzMTbA9R9HgN7@mit.edu>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>

On Thu, Jul 23, 2026 at 12:07:44AM -0500, Tetsuo Handa wrote:
> The procedural problem is that developers / maintainers are too busy
> to respond to my debug patches. Since I am debugging difficult bugs
> where nobody else are willing to spend resources, this is an
> expected result. I am OK to post my debug patches to ML. But without
> responses / interests from developers / maintainers, this problem
> won't be able to make progress.
> 
> Just saying "Not my business." is not helpful.

Is what is happening that when your security LSM (Tomoyo) is enabled,
this causes lockdep or warnings or other issues in other subsystems?

If so the question is how much are other developers and maintainers
obliged to help you.  The historical answer has been that we help each
other out as a matter of professional courtesy, and if someone has
helped me out a lot, I will tend to return the favor when they ask me
for my help.  I've even used that as an argument for why a company
should dedicate some amount of their developer's time helping out
upstream code even if it's not directly related to their company's
direct interest, since that contribution builds up karma that may
cause the upstream maintainers to help debug a bug, or upstream some
feature, that the company *really* cares about.

But there is nothing which obliges other developers / maintainers to
help you out, other than their being nice.  This is another way of
saying that "free software" is free as in freedom, and not free as in
"free beer".  Responding to your debug patches is in effect demanding
free support.  If you can convince them that it is in their interest,
or their company's interest to help you debug your issue, then that's
fine.  But maybe there's a good *reason* why no one is willing to
spend resources debugging a particular issue --- namely, that it
doesn't help them or their company?

Regards,

						- Ted
