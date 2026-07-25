Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333C3304BA3
	for <linux-next@vger.kernel.org>; Sat, 25 Jul 2026 22:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017124; cv=none; b=jWwCN9Oudkeus7VeGv0eN1Ux00rrilI9ReqNuKRboG0QFpOUOOFnWwHLWls4h6RhRSEFJhdlHTh+e8hhe59ATHJJFSlnEy5dp4uytfzSco92PJIjuGs+6yv8XFhalRVLN3FutTr1Alf5DzMuYmOnTvOXV9zQbXZLQ8ckfrIu/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017124; c=relaxed/simple;
	bh=ikW25qShF8ibt5YOknH2BSSFpSnI2EMBO1Jyuss3LdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5Iw38VS38haPWQ+hwWpLGA6FQ0OzmgWyGaYn5w+O5uNvoY8m58+r/pc7+yhR1vlN0WsGSF5bCAOkprPwyBGr/Op0BEY1WgY23F6IsFPHxthDJL1JOkvIH4qyH0Kvc9T1mpqeYdt/fcBi4GrCI9Y5XDbYO8t7kFwnmUnhufkRO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=fail smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=mbEMSiZR; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="mbEMSiZR"
Received: from macsyma.thunk.org (pool-173-76-111-61.bstnma.fios.verizon.net [173.76.111.61])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66PM1EUo019061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Jul 2026 18:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1785016879; bh=Efg22W3ikfLYE/1qx37xxUGP3PCrdl1v8ydIq3BFqjY=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=mbEMSiZRSZD1JT7fbC7l6EyO0RSp0FcQwNPMQpsgYSwa2uCex95SfR+4KBNb9p5gx
	 UoUVyBIlU5OzjBzLARIGuhJgBF8HEGWmVmNXh0nu9fn5xEdYonmf0YcQfLEYLkfGI6
	 LsZIQyCMJsGkatC8jNe48+owY4fY3C/6sGoPcXaXRx/A0pgHLaqA346/krEcZIb6RS
	 IA0nxcjId4PK8qqA1iMn1vUI3OwxfMiH5BxY0bwwxbRiMPpL9O+8VeB023v5ZB/UO9
	 iu7E6xGn8pMAKDqfjYTTLPAjRYV8mmh6IOpe+Q+tiQFbBNe9tkBzI3a6PIPvKy6VCr
	 n8CZ5XTWY85UA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id AD28CC07DF8; Sat, 25 Jul 2026 18:00:13 -0400 (EDT)
Date: Sat, 25 Jul 2026 18:00:13 -0400
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
Message-ID: <amUuEfXKXPRP0cGF@mit.edu>
References: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <amN5Gu2J5mILKs_j@mit.edu>
 <7250a5ad-ec2d-4852-af56-9c1c653d24c7@I-love.SAKURA.ne.jp>
 <amPGflb7w6RcOO1M@mit.edu>
 <c0272e64-a849-4fe0-8131-ecf6c724f558@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0272e64-a849-4fe0-8131-ecf6c724f558@I-love.SAKURA.ne.jp>

On Sat, Jul 25, 2026 at 02:20:29PM -0500, Tetsuo Handa wrote:
> Not all developers have enough money to pay to companies/organizations.
> Some developers (including me) are contributing by spending their time
> instead of paying money.
> 
> Your statements sound like "Poor men/women cannot participate into
> the Linux kernel development." Please don't assume that everything
> is controlled by "who pays the money?".

If they want to spend their own personal time, that's fine.  I just
don't want companies or hobbists spending *my* personal time.

> Please respond to syzbot-related patches.

Oh, I, or some other ext4 developer do respond --- if it's a bug fix.
I wish more of the contributors would actually pay attention to the
Sashiko reviews, and actually *test* the patches using "kvm-xfstests
smoke" which takes 20 minutes, but we'll respond, one way or another.

We might NACK the patch if it destroys performance because it adds
tests in a hot path and it's addressing a really pointless syzbot scenario
which requires root privilegs to modify the loop device while the file
system is mounted, however.

However, if it's a debugging patch to fix what we might consider a
rather pointless syzbot bug (and there are an awful lot of those, at
least for ext4) it might take a while for me to respond.  And if it's
about landing ext4 patches from a non-ext4 tree, abusing the
linux-next tree, that's a somewhat different matter....

	   	      	       			  - Ted
