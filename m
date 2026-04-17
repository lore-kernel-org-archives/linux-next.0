Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475052BE7AB
	for <linux-next@vger.kernel.org>; Fri, 17 Apr 2026 20:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776458947; cv=none; b=QnqsVBj+68hi1/AmlC5kTIolae8E9aeNpvEKupoBGGc+aLWO1Z0BTy9D4t7v3w9/AYjejLEFpv0rJoLODNWb1aIznllX4d3CbGY07qqh3h+KXHiCWPzYKIhx9tKQxZPq0a7/YP+0nToTvqGEDsWkLnYNYxXPsD9VgebgGU9MafQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776458947; c=relaxed/simple;
	bh=KKtNo4tLqhqjg1MbV0VS0npGi/QkTgmpkHPTTRtePQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGIMC3gjo97AGRN+DFSeLq4L1q4FIXn6npg327IUUBS4C/+lJXJmula2OQE7dH0n4UD57CHkqpGDeArpqO20ttflJYdtU8ufnPigguUt51idQqOFRBzJMbzqeZ7HFbKjBj0K2vezv3SU5Pq7HpiOCl9gfLdFb1xNJW33/kis/fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9SSVD25; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9SSVD25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403B4C19425;
	Fri, 17 Apr 2026 20:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776458946;
	bh=KKtNo4tLqhqjg1MbV0VS0npGi/QkTgmpkHPTTRtePQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9SSVD25To6rekoQ370jaOauf75whuvt0IirMC3w3JfEfEmvDZ3rvWoh+JwWDpwMv
	 qrbpDSkPGrhFdVBVOVuNURGdySabw0NxxkMv5qkofIFhn1wX3EVaFn5cdULWnTOLSu
	 aJ1yrLXdCIcYcWUbppiekQ/bqn3zFspEhV3PQ2hWTZS/l6rl7eDw/I8i5P+6gDnQNc
	 pybiVnZhku77X33rJSI4oq2LD5H+skXqtFOFm7gJiYkbVWVsPxFi5FaDnLbroNJft5
	 1UKVdBaXR7GYdBnMrrqPETZyN33ycRChLzoSDRKH/Tc1XDg3xaavG7q3dZQdQoDbfe
	 LHbzzine9bGaw==
Date: Fri, 17 Apr 2026 13:49:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: Adding clang-fixes tree to -next
Message-ID: <20260417204903.GA720760@ax162>
References: <20260416232211.GA97229@ax162>
 <e243a21a-8507-4bb5-b236-e2dd326672b4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e243a21a-8507-4bb5-b236-e2dd326672b4@sirena.org.uk>

On Fri, Apr 17, 2026 at 12:19:51PM +0100, Mark Brown wrote:
> I've added this from today.  Given pending-fixes it might make sense to
> have two branches, one for the current merge window and one for the next
> merge window.  An additional branch costs basically nothing if it's
> empty.

Yeah, that is fair. I do not anticipate having to carry many patches in
this tree, so we will see how it evolves. If I find myself needing to
accumulate a lot of material for the next merge window as opposed to the
current one, I will introduce a new branch and let you know.

Cheers,
Nathan
