Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CF1424641;
	Mon, 17 Aug 2026 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786977350; cv=none; b=IESPztz17F0pHJrDxK5Ztg2RLpEcM63j/ffecKk4FGXacd+bPFUHiKUY0qva7mTjkzf3z9Cn47pXyL82aCWlNkzPYMTDXtCcOnnosGdrf9U+8QrrnfHz/NqhtcP8rQzn+9WrqTpzfs1sV7veFe5tyzui0qa6UoNMLwh6QHrEQtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786977350; c=relaxed/simple;
	bh=6oIfhrtrrvF3x+ZndYgf6RNDRoVyMrH/XyN39XOhGWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0T2hfCQf71ee2guiBFiMP3wyr/yijnca9CiDtSLSxdzhEa5JKWbydrImb3wEVj0k6G+gRoc6UB7L3/c566o8vE9hi05GXmLOpjr1RBbb8ujEg2IluXSyNIOjfepmXyGfAXqfndMJPMY8P0+Jfvho18yYMbaMILfTbcvAebcLrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyerP5D+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyerP5D+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E271F00A3A;
	Mon, 17 Aug 2026 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786977345;
	bh=2CQb+0FITn22la/FRhLA8FDdjbGbBZRRoBZA4VJfZT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fyerP5D+8RUMDlSExbku3yJ+dTTY1ac8FV56gG2ydPs38InRQ51dobYWKTMvFmRbx
	 XCrvCylGSH4rBsqusBJLYqzkR1lVh08qDP5JkgIBKym56WLtVkknoMR1cfRVEWRvbX
	 Jav917sn0UzlN5T0XZ5xXgh/eDttVQdAjr3BedvIIHJQMNYE/dTJ0alMpTN0AJ1FET
	 LlN1F1rjwROxfIE+95EvoCN5bcLXhrxse2D9j7tWFXBRt4JRLjONqEl39uf+vHtC4j
	 Q4DIrH8WaDqbqvLoJfjcWXrahl3Z60GL6TD5XTIKph/f6zcj1EwJpr10PeG9ijalLV
	 EMqnt/jLg74Jw==
Date: Mon, 17 Aug 2026 08:35:43 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the block tree
Message-ID: <aoMcP8rLXzLug1j8@kbusch-mbp>
References: <aoMBWuoLh1bAEUYU@sirena.org.uk>
 <93c7c45a-09c7-413d-b83b-beab1d3a3a38@kernel.dk>
 <70dfdef3-7d3a-4c46-8027-35baa5310625@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70dfdef3-7d3a-4c46-8027-35baa5310625@sirena.org.uk>

On Mon, Aug 17, 2026 at 03:07:26PM +0100, Mark Brown wrote:
> On Mon, Aug 17, 2026 at 08:03:34AM -0600, Jens Axboe wrote:
> > On 8/17/26 6:40 AM, Mark Brown wrote:
> 
> > > are missing a Signed-off-by from their committers
> 
> > Keith, fix your scripts...
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc-tools.git/
> 
> might be useful.

Thanks, and sorry. I was experimenting with agents and didn't double
check the resulting commit message. It worked correctly for patches not
in the Apple patchset for some reason, but clearly needs more oversight.
