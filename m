Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703650;
	b=shwOWAbvPyzUMJOPOa/Y2BHIG4EDT4elWdUq0iZD38Z1P6Lz5jFUdcAbrYKw7jBO3cdQ
	 qOTsbwqNc/eIEhhufhEk2KwKV7c17eKpsvi46z+SQ4nCeecfk/iExwjq8rykFdMSqiQni
	 k7Xrg54nJD5ZJ7Euud7F1NHZfJXxBrUIoq4pUQ/lARZMBmtPd0zbZ21lM1nYDULoE6cRx
	 o3mJq8Bkb/AY8kaEAsGhTgvOpAgfDrJjf3uptc2IXiDtOKb4SoAG1op9v4sRKk0OY6YGo
	 O56Mso5q/E5TN42zvUu0sfyZUOYwrIEiDHPe0pBIqSrWMdusY5xDUURd+YT0S/fmkag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qlQbyI+WGiNH2Z2c6wTyai/MFBNJGnmn1usDomDBBLc=;
	b=p5UbTFn0IKk37zOl5gFIR+ovKy1SvQZlpqB0nbmlnlvkeUnnzt3Dsxj2TL9k72Ybt0Uj
	 L15HTfmNzh2JUhiS7gy2QcJeDCxY1M0CbBmitDuH8jd6E659Vt52s+stdYTTa1omM7yw5
	 ApPxhCvzSlUTj+f+BRkbl1/h3InxVAvfd9JNxCJBYYCuMLDm5L21lKaWjotcTVQnV5lJq
	 SiJ7g+z7m+tOtoU8JmuPol58F2AKOEd/TYIMkrACPkX2HBTesSOoJVEC6p1Tn0bgxyXUD
	 38ywFHNgIeGUE1+wQg7a6n3kO3zXwb96xXMQ30TUFyXMnQq+TCyTTdxUzrDG7/tu3SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=T+euhReE;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ADC606A326
	for <linux-next@vger.kernel.org>; Thu, 26 Nov 2026 14:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77ADC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=T+euhReE
Received: from macsyma.thunk.org (pool-173-48-102-184.bstnma.fios.verizon.net [173.48.102.184])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AQEXcI6027280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 09:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795703620; bh=qlQbyI+WGiNH2Z2c6wTyai/MFBNJGnmn1usDomDBBLc=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=T+euhReEAAKZr/tIh8oyGoD03rt+uVVvdivyCL5j9j2t3+lLOnK7tfkZbyAUH22dq
	 RDojxpTUvyPUy8Lxg2HtuOTPOIw0s6WX0ubo+negqJ0s1f1QlrCaMRjdSn7MzEFSsN
	 abqkbWD46zCSeFX2xxy6Wx3arDy6CdX2oWjirojG8JV0vAhObTaOiRBGYzap6yYP/4
	 bxpBRUVA+G/iDXsOl+pApz5rqSFVwUJ7O4CL+8/Q7jym3eBNr8zVr8Ig1wIPU8c4JL
	 8XgppxCU3X0XJKqSzpsv8g+n6MwJ0xHpazw6qLHhDzLewdMpFvdpsxGWWm87xbkd6M
	 5aD6k9MNXtCGg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id E0ECB29A80FB; Thu, 26 Nov 2026 09:33:37 -0500 (EST)
Date: Thu, 26 Nov 2026 09:33:37 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure in the origin tree
Message-ID: <awhBpkL30ZSbDhv5@mit.edu>
References: <awbpOaMZRkKXbq1H@sirena.org.uk>
 <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
 <674edd30-0087-4341-8a13-3c306583705b@sirena.org.uk>
 <15549465-a429-4243-af9c-8a26ba497891@sirena.org.uk>
 <CAHk-=wj9sFHw4pKpMzUaNDAUdtX+xdQU=dmO+AqgSgrRMZf5PQ@mail.gmail.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj9sFHw4pKpMzUaNDAUdtX+xdQU=dmO+AqgSgrRMZf5PQ@mail.gmail.com>

On Wed, Nov 25, 2026 at 09:59:16AM -0500, Linus Torvalds wrote:
> 
> But I'll leave this for Ted, since I'm not actually *running* the
> tests, so I'll stop making fixes based on what I think the pattern
> matching should be.

Yeah, I've been running regression tests before sending you a Pull
request.  (The changes are already on the dev branch for linux-next;
the pull request is incoming.)

There was one issue which was a missing stub registration from the
merge, and there were two other issues that were unmasked by some VFS
changes.

						- Ted
