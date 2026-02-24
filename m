Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA1F1F30A9;
	Tue, 24 Feb 2026 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922542; cv=none; b=eTdwcyRVW+nrJGrEAu8QvNk961jsFzlBFU5GSW8kvGD1xVrJXJm7pZZuV6PJIl/Gse6tZwa4S7RpQMYeD32RjxoCehJ+Njnv7BF6guq8w3TgepFoCnRoBw2s6ntD7vzUjkpKB/HhhOPAms+HkpUExFwDye05nMtRILZW/xvkmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922542; c=relaxed/simple;
	bh=p3EXrFuQ20OlJGZ/EG1q8fE3o2MGb1vlBAdFUDppgnU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mUyyWBsP33Xlzhn/Ii1h1MWv71OS96p+mjhzoZL7CRHZ6CNwRvnWca+a5B0gBMcB7MR6IAJsmhrm0gSsfWKZbIdHwakw8zmWTIeSjbyglQxrHww6dAMzmvhtRnZqfq0jJrX5mB7a5d0Lij16q6huuGfUSSFVRR9uyJ7+nWurJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suLPkeXS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suLPkeXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF2FC19423;
	Tue, 24 Feb 2026 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771922541;
	bh=p3EXrFuQ20OlJGZ/EG1q8fE3o2MGb1vlBAdFUDppgnU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=suLPkeXSKRkB9fzKETir4iW/aKENgoBt56Enl7MfOr1UX7FqoQzOk2H4lowamhMx0
	 HDBZTeqrSX1puzcJGetuIkZO88MGRpShcIu1eWlaLP491FDw3BwR5+yBU2G9scWW3V
	 MWyvZQ7ArdHNuUSiAsA1LtBOBkFP6VA9mFDXyPYK0V9X3TkvT1+Rtn6ekkesH5USLm
	 6A3CMsiHIY1JcIkDLRkHuolkwG69SJnupZhaGfxg1i4DJV6dFvSA4YjSPygy3+NkEN
	 iFcsCJHJzDgmnOGyBm9IqaJ9o+PPPM400g81YU/e/1hrF4YjQerLfaQGZmfDd+HmP3
	 AVErjMdP7lVcQ==
Date: Tue, 24 Feb 2026 09:42:18 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Julius Lehmann <lehmanju@devpi.de>
cc: Mark Brown <broonie@kernel.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the hid tree
In-Reply-To: <5386c18c-9326-4df5-99d9-30727b0c48b1@devpi.de>
Message-ID: <op47q6p8-so36-84so-49op-2687s05n2774@xreary.bet>
References: <aZxFiDybKKxezaYc@sirena.org.uk> <70o4n987-9s87-rrr1-qrrr-r351qs44957p@xreary.bet> <5386c18c-9326-4df5-99d9-30727b0c48b1@devpi.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Feb 2026, Julius Lehmann wrote:

> >> Commit
> >>
> >>    6b409da663270 ("HID: magicmouse: fix battery reporting for Apple Magic
> >>    Trackpad 2")
> >>
> >> is missing a Signed-off-by from its author
> > D'oh, thanks for spotting this.
> >
> > CCing Julius -- could you please provide your Signed-off-by: line? I'll
> > take this as a sufficient reason to rebase the branch.
> 
> sorry for messing up my commit, has been some time since my last mail patch.
> 
> Signed-off-by: Julius Lehmann<lehmanju@devpi.de>

Thanks, I've now rebased for-7.0/upstream-fixes and for-next.

-- 
Jiri Kosina
SUSE Labs

