Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA73E314A
	for <linux-next@vger.kernel.org>; Mon, 27 Jul 2026 03:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785124709; cv=none; b=HDL4I0KYm03zAuqX5DQDN/hbjOVUp/roE6man1NJcscZCMpgNYPTV+c4FR9WSi2vEwQbzVyBRTfQchxD4I5WDrGHgmTCJw0Lpo4DsjGAY56zpj9xWAnwQc739YfjotgZDlvcBphgQSPuUCgHJywJAo8v/kjSuKNY8BQB/C2SvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785124709; c=relaxed/simple;
	bh=LiuX1Dq1gmcfl2Zu2NUOfS34txZxB3lXhumGD5CDYhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5xLXX7XXuXsYMQQ7omBwEoB8mGS2RF2sH0D/G/U3bI0VvaTiByDXz1kbwN/0pu0GfXC4UHXvzhGJBqq33PX7hsFrScrDpAhzj2z+ZQ2J1oIVaPSBcKuPAefzmsVBTjl9pxJ1ndOGLM+496LkBHzexFNEKrM7arVCTWIJqfZPaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=fail smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=Zh+3hBg/; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="Zh+3hBg/"
Received: from macsyma.thunk.org (pool-173-48-129-101.bstnma.fios.verizon.net [173.48.129.101])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66R3vS9n006831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Jul 2026 23:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1785124653; bh=ItgPvuvyqAAGBJx+2HAp9XvX82ec8ui7c3ZW93EpwMk=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Zh+3hBg/fnZZ1R7UCfO+Af9Vx7+QMrN+gAfRBo30zc0rQbSiG/VoVGS/eVxagpm5C
	 ZB72rYqg2g7WRNqH/dHGumlPSUXQZzJE/Ws32zCs7CgScMjNGQ+pugy4sLLverRYtV
	 WaMyWwgQFPHaiUYm/R/qoUqN2ntZ8yeXc3PFeEFivjgVZLp4uMq1oITbp+ndna6Zpo
	 2LC3aFRGXLDk3UmJNPjBuS4xiYfXgltroyPynZyMmCVh10ToOoWq76r9LQQ+somZzW
	 OkGvaJjMZb7PMrNAt0wjHjp+7K+RKYyjeyU8NC0sC9Wiz7Tiujeq+MMlEDPmhEIowv
	 0EbruKzkPfgHg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 5C1C3C25AE3; Sun, 26 Jul 2026 23:56:28 -0400 (EDT)
Date: Sun, 26 Jul 2026 23:56:28 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <ambVmT31R5e8c5g4@mit.edu>
References: <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>

On Sun, Jul 26, 2026 at 06:49:44PM -0500, Mark Brown wrote:
> The other side of this is that the reason people are noticing that you
> have added these patches is that you are causing breakage and disruption
> for them that catches them by surprise, a lot of what's coming through
> here is that you need to work actively with other people.

I will note that the last person who attempted to push changes to
other subsystems via their own tree was Kent Overstreet.  That was
considered **extremely** anti-social, and after people complained
Linus agreed to reject any pull request that had changes outside of
bcachefs.

This is slightly different, in that it is pushing broken patches into
linux-next, instead of Linus's tree, but I think there is a similar
precedent.  If someone is doing something abusive, it doesn't matter
whether it's because they think they are doing something where the
means justify the ends (whether it's "I fix syzbot bugs" or "I make a
file system which doesn't eat your data").  If you do things in an
antisocial way, Maintainers are *not* obligated to work with you, and
while you can appeal to Linus, you might not like the resolution....

      	      	     	       	   	 - Ted

