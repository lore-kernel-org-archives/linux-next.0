Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5583A8732
	for <linux-next@vger.kernel.org>; Sat,  4 Jul 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171387; cv=none; b=S3/6YXdDkHH4xZUVdfG1aDHy16eXP4QHhH3S+XlweKQ/PJXTvTac++HNwh66C6/jD7cN1VxY0EV/yDckAvRCUmLQbTbg2cVMfuSTlfo25ZXUjMAoEMyLmKdorrwdxgoonioQlepD2LdM0RT0Xydf4wdJAYwo597StkaPjYUE2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171387; c=relaxed/simple;
	bh=l+Mf6Es56jBvIpABwJERxVIAFd7jO+ujEUy6LgW7jkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHYjeW5o/nmyTszbRbviO9EIU8+zS8ClB63jHI1AZujOW3WAvIz+2bN30yCv55c0VigiIWvL8t1u2CSbnBKpZvgmu8E1uvc25hesdE6UULAy3C8hFt5iBFkokqAkkTh4IuByRBX7CtaZZpxPKiMTnmeon0q5I2F2W6NyJbMqpWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org (cclpop0120.carnival.com [151.124.104.120])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 664DMLHB006040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 Jul 2026 09:22:23 -0400
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id A24598BC58A; Sat,  4 Jul 2026 09:22:20 -0400 (EDT)
Date: Sat, 4 Jul 2026 09:22:20 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Alexander Potapenko <glider@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <akkGwsQg1k5ZfGwa@mit.edu>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>

On Sat, Jul 04, 2026 at 02:06:43PM -0500, Miguel Ojeda wrote:
> Now, reading the Google Groups thread you link, it seems like your
> *actual constraint* doesn't come from syzkaller, but rather that you
> want to use the compute resources Google allocates for big trees like
> linux-next.

Note that if you are trying to debug a specific syzbot bug, you don't
need to send it to linux-next.  You can just reply to reproducer with

#syz test: git://repo/address.git branch-or-commit-hash

So I think we need to distinguish between two cases.  One is where you
are trying to address specific syzkaller reproducer.  The other is
where you want to do a full set of fuzzing on a draft series.  I'd
argue that though, that this is something you want to do when the
patch is almost ready to land upstream --- and at that point, putting
in linux-next makes perfect sense.

I'm not really see the case where it's not quite ready to land
upstream (and so you want the full set of testing, not just with
syzbot, with other people testing linux-next), but you still want to
get the full set syzkaller testing.

Do people think this is really such a common scenario?

						- Ted
