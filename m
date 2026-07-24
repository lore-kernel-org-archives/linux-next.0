Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7389521FF23
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904775; cv=none; b=dFsJZXOWK2TYchjThpWzJq1BaUQeIznaLID3Qu9sRpfuZaVXKUe19fDcG4iyq+303ZhMM2eXNXCY6KbfxlVHUn1JbCDPrE6Hgq9OUXfHtDxmIXycKFPWSS092nC+2eIxCYZwX5BJuNcqRRYEwtvMMIMvWvSNLRwvoWJ9KiInyyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904775; c=relaxed/simple;
	bh=A8ek8GKz5JiVkbEnS0bK21rHITjTJZ47RcUAfJ4mBrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7ZuhOfX2Ap1jhwxwt4R4Daa9tURm2HcLPjp9RuPnopTGEs6alAuH3QR9Ev1j0KR58mSBQDHC0NwEyKyQOTp37Qvxhh546fzKM7glyQ5c7//3tLHL5WjoSOHBPetOjl6hejNrlQqFW3X2tf10R22EZCfBZv/ve69eY90rY9h9fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=fail smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=qRxGqYSi; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="qRxGqYSi"
Received: from macsyma.thunk.org (pool-108-49-209-71.bstnma.fios.verizon.net [108.49.209.71])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66OEqGlM032366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 10:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784904740; bh=ym53p+2yu95mK9DkJGRwi4QY0kNJ6XxYvL/0oVaFWOc=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=qRxGqYSi4MGRAvEXx9ijYg/gVqaG0E6uoYYETHsMwEPHJXf1pmLOCNQf80YxZpu/M
	 qpzRCG0ojOItxoZGiA1As4oD+s1YZc1wnUx0iZ73DMb2t/y3AU1AcFUXHgw+g2ngPb
	 XZ+l9uZSDktXWxdU1vyhN1MK4OaXOhdLTkvaj9wKg60/GwdJoHRAm6OB4UpVQDmTxM
	 pPRD5HRrDfw5nQuvf6DmXIOlKnQ4wq8snXmT8VLVZOAj9Jx0I+y3kpCbro9BpAQEgS
	 Gm+FNh4f0tJR8mqr57sRPEjGwfBsr36Iesz1kL7AH5NSzZE5x0beIRQM1fvg+qTKoW
	 eGySgZQuIX2lA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 25636BE9A6A; Fri, 24 Jul 2026 10:51:16 -0400 (EDT)
Date: Fri, 24 Jul 2026 10:51:16 -0400
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
Message-ID: <amN5Gu2J5mILKs_j@mit.edu>
References: <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>

On Fri, Jul 24, 2026 at 11:35:36PM -0500, Tetsuo Handa wrote:
> I wonder whether it is appropriate to call "syzbot issues". syzbot is
> finding bugs in upstream git trees. Unless the cause of a bug is either
> syzbot is doing a stupid thing or compiler/toolchain is broken, it is
> "an upstream kernel issue".

I know that people have different experiences of Syzbot reported
issues, but the bugs I see require root privileges, modifying a file
system while it is mounted, maliciously corrupting file system images
and then mounting it without first running fsck, mucking with the loop
device (which requires root privileges) while it is in use by a file
system.

I do agree that if you mount a file system without running fsck, and
it has been maliciously corrupted, it woud be nice(tm) if it didn't
result in a crash or a WARN_ON.  If someone wants to fund the
engineering work to make this be true, so long as it doesn't
compromise long-term code maintainability or performance, patches
would be welcome.  So perhaps this is a P2 bug.  But it's not
something I'm going to consider high priority, because it's not in any
threat model that I or the people who manage the budget and head count
authorizations, care about.

Since that's the *vast* majority of the issues reported by syzbot, I
tend to use "syzbot bug" as a shorthand.

I can't speak to whether the syzbot bugs you are chasing fall into
this category or not.  But if it requires *vast* amount of VM time, it
makes me suspect that it falls into that category.

> Those who hate my attempts (i.e. sending patches to linux-next without
> being reviewed/acked by maintainers) are expecting that any patch is
> reviewed/acked by maintainers. But some maintainers are considering bugs
> reported by syzbot as "not worth looking into". Therefore, not only
> debug printk() patches (for bugs found by syzbot) but also bug fix patches
> (which syzbot has found) are getting ignored.

Yep, and I've explained above why that's the case.  I've tried to make
the case that if there was a way that we could easily separate out
those bugs which are signal from noise (at leat as defined by those
people who refuse to fund this development work), it might be good for
improving syzbot's reputation.  But I'm so busy that I don't have time
to go through all of the syzbot reported issues to see if any of them
are actually ones that should be considered high priority.

> In other words, the interest (by the upstream Linux kernel community) on
> fixing kernel bugs which syzbot found are decreasing. This is a deadlock
> situation, and just saying "Not my business." is not helpful.

Perhaps if Syzbot could be improved so we can be more selective about
which bugs are worth fixing, it might actually be better for the
kernel's quality.

But if the goal is to get ourselves to zero bugs, or zero syzbot
reported issues, that's not a goal I can get behind.  It certainly
isn't something my management chain isn't willing to support that
goal, and it's NOT going to happen out of my own personal time.

Cheers,

					- Ted
