Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315331327F
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289698; cv=none; b=l54DCMTkYOFnkBvVMF4YlT5Imxw3ZpLggDNfi9eyQud3IIR5SgK797bncnqPRx4q3hVoKYoS/moCCfQzqVVS0GfS6+eXEQe2Gfwi8gn+nUFtulko14ud6wXNyZEdXzWh46j24xjjleQu8cd1U4nRouAz3yPI4oquujcNsi4waMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289698; c=relaxed/simple;
	bh=DthdaERehxh3WXNrOkKW7MLfY0yAWBW74mLiNGc5Vhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apszrhDhSPsBVUysRtJl3z7Gg2K+o64tL1/WQ4o+MhvYyrATeRRpJ+jYbM9sL/KokxV9bngbq470wwsIjJm+W1+SGFbnZH53jEBrQB1EbZj6aEXDCh+zgJHfH4SQhhKJ1FjTii2b6VpwVWTEzPnXsIIOaMNXxPrHeGVE8RebrFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=i+MM2m+d; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="i+MM2m+d"
Received: from macsyma.thunk.org (pool-108-20-43-42.bstnma.fios.verizon.net [108.20.43.42])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66T1lMkt005228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 21:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1785289647; bh=KKcpd8Sx9/fo+hMQmbS2cZhz53qjoNUP+WAWbdsX+yQ=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=i+MM2m+dRFzAXVSiOb3i7mItfGc7NIVo0R0EEKiFjGl3XOtW+k1NwPXSZ2NWbChCu
	 1Hb57XJSTBRzsomqld0pR0YWsnNRJBYPpSgZQLWLXgOgsUa3105btsxlq54zMrzGpW
	 vqs3FPnWsNZNd1Zf40dU/ejVyTcMxrixzswHOkgskKSxiHHGahVKUflaqYM0X13G9h
	 E+FKSG8qwpatIAljSj8bKsglCjIvo4PIBCnxpQYIqrA0fa6IYNXZAT0Zl/cz8zkMgJ
	 sWA8wSEQfa6BqpWboZCjATu+5WeKGnAY04j7pdVq9TqofgKkTtkwx4+rb+HeZTOaeJ
	 oM8JOfGuanOEg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id EA4CAC8010D; Tue, 28 Jul 2026 21:46:21 -0400 (EDT)
Date: Tue, 28 Jul 2026 21:46:21 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Leandro Ribeiro <leandro.ribeiro@collabora.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Daniel Stone <daniels@collabora.com>,
        Alexander Potapenko <glider@google.com>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <amlXC0hahHo4Cdsx@mit.edu>
References: <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
 <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk>
 <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
 <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
 <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>

On Wed, Jul 29, 2026 at 08:46:16AM -0500, Tetsuo Handa wrote:
> > 
> > i.e. I was wondering whether the system could ignore the "WARNING:"s
> > (and avoid the kernel panicking on them etc.) until after boot, i.e.
> > when the fuzzing starts.

It could, but it would involve making a change in syzbot.
Specifically, syzbot would have to be changed to boot the kernel being
tested without the kernel.panic_on_warn=1 boot command line function,
and then in the syzbot reproducer, to add the moral equivalent of

   echo 1 > /proc/sys/kernel/panic_on_warn

> Commit 860e748bddcc ("drm: ensure blend mode supported if pixel format
> with alpha exposed") must be reverted or updated not to emit "WARNING:" string.
> Until authors of that commit respond, that commit had better be excluded from
> the linux-next tree.

There appears to be a fix which has been reviewed; I found it by
searching lore.kernel.org for the string "drm: ensure blend mode":

https://lore.kernel.org/all/CAPM=9txcOcnnxznq41z8+FA_V2BCqmRKFZBOt0oEhcHbBs8Fsg@mail.gmail.com/

       		       	       	       - Ted
