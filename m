Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5110E3C3BFA;
	Wed, 22 Apr 2026 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850449; cv=none; b=ah/2eSdoUBNEAha4A3YAijoiaKT6pOnB4NWOkksdEYBSAi1aGYeQFmcpKMY52gp/jutquxGPGmVlKFK8iSXiOGJehmCJPEXUpup2/dRdQrLP23iAnowbzj2ZM0Z/i/FO15PofzlvPqVfUNl+MX/QrCA7HC57UNi8n7plqCiGqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850449; c=relaxed/simple;
	bh=5wLwef4rIrp5lTccGn+4jmH2kPARxznL4ooD2SaIgZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4c4R8Cuv2A+fIYDXP9jj6RsSahf0zhOu5dWAGK6O0lNLJlN5Lezp0BQhy44yLkJjfI2pjO9r31pQUv1rHGe35n7cO0LQHPzoIzRLLtXe3usN33ua0DKpk9PfxWKSKyfw4JdhbJIkEoTBSZrf1/47M4VTCvLo9HUmgcKMHfgTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6mFtGEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6mFtGEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A022C2BCB3;
	Wed, 22 Apr 2026 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776850448;
	bh=5wLwef4rIrp5lTccGn+4jmH2kPARxznL4ooD2SaIgZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6mFtGEZXkptTgy39JqYDAgnZQbPOQHSqfg4u0parr/Kv2ielmOwvLHZOpxF25sHc
	 b9N5RoGOvD4Nn6HCcHJUhiAmMlo0Ft7NK746GmvVMKh0yPsRZJsSdf5Z/PAyx6T+Z6
	 Wuc0iLNsJ9ahYXQSGrORK/fPjxE12YHvmxJkqIEETUhSQ2xBh0kNvpKwOVUWFgRkHE
	 mgj+Vm+xGql1NZ5eHcswTHZAS+gWy4fEbrj/aKzHeSd7UNWPX4A2fFAFCEGSwztk4U
	 kape7vQkTVEfWixO6zTVaujM5XRVGU1Sdz1jBi/FoPFNjQKgH6NRJOD3Nu73qIGdQl
	 DrIbPyZm6BSIw==
Date: Wed, 22 Apr 2026 12:34:04 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: next sync updates
Message-ID: <aeiWDGtG1ItO-SPR@kernel.org>
References: <aee_mCW8p2J6IbIO@kernel.org>
 <20260422093528.42562dac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422093528.42562dac@canb.auug.org.au>

On Wed, Apr 22, 2026 at 09:35:28AM +1000, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> On Tue, 21 Apr 2026 21:19:14 +0300 Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > In order to address in long-term the issues reported by Linus [1], in
> > addition to improving my workflows, I've create two branches:
> > 
> > 1. https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=for-next-tpm
> > 2. https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=for-next-keys
> > 
> > These will replace the currently mirrored branch:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=next
> > 
> > So my request is to:
> > 
> > 1. Include the two new branches.
> > 2. Remove the old branch.
> > 
> > [1] https://lore.kernel.org/linux-integrity/aeVSbVIFaCDRXf7C@kernel.org/
> > 
> > BR, Jarkko
> 
> Linus-next is now being taken care of by Mark Brown (cc'd).

Thank you for forwarding this.

Mark, the goal is to address the main problem Linus was complaining
about i.e., late rewrites of Git trees (aside from late cc stable
rewrite, which could have been prevented).

for-next-tpm and for-next-keys will replace 'next', which I will
delete after the change is effective.

> -- 
> Cheers,
> Stephen Rothwell

BR, Jarkko
