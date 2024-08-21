Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D991509A2;
	Wed, 21 Aug 2024 22:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724280500; cv=none; b=Ov85gw4215Vtrssdwe7iorMIF7e81kWQwUEqSyPojyODwfGx1g7fhY76Wx2Of/698IarRBz9MOMj/7HKt1gn36kahxH4Dc2wczgZpYPKqNXAI9dRV1nRwzsqOVjOwJCnf2EpgAKYjLFcSw9U231YaEjT7l2LHHM3m2gCGv/JjnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724280500; c=relaxed/simple;
	bh=ICmh4sxHrMdjzmhj2Pr2GmQ/mqvOCutxhG/7aRnmvCk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eTOKFVA7K1pthFESxOKe1nx/0U7kPxS0l7MMtgB+RfVPdjlmiTBji+3yB26Isb7yRkZr4BpMRRj54YNls3OQ9G63UJgU0BcVGX+M0DiBaXJ5kx1wB4vJUTmfJeRZTCR5rHfPrfMXw6UsDSSakFtZ9otsuce1+GxKWbwRvRYQ4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPAstqMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPAstqMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43069C32781;
	Wed, 21 Aug 2024 22:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724280499;
	bh=ICmh4sxHrMdjzmhj2Pr2GmQ/mqvOCutxhG/7aRnmvCk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XPAstqMWot9/meBTnGuTqER4ec4Q3lisf5iH0lSTcmyGUceSJMuko/xT1Bka4iPqK
	 9vSRG/nIYIMnjY8OOeMWzMEm4v3PF+1hiGknh53cEjdFCm7quE9ErmEDvOX+XHv71W
	 yQOlCDcj6cyUnKoKkLBh+g4DKg/qPOo4TezKgjph2OcYI/Z2hQNOHnYDjaonjlg3xP
	 h6xfIveR94QcL89K6PFBPemCXTtJyG9CxSpS6Bb7D9oiiR+tFDFeHvwpWkXRGj4pHK
	 5494ZeT74588oTEjhvF3UtFbbZB4sIjQKDP55U2EJY258dGhrEDWpV+7bC3hDGBQ4s
	 wMj32saF9+vYw==
Date: Thu, 22 Aug 2024 00:48:17 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the hid tree
In-Reply-To: <20240822084119.5b2e1962@canb.auug.org.au>
Message-ID: <nycvar.YFH.7.76.2408220047260.12664@cbobk.fhfr.pm>
References: <20240822084119.5b2e1962@canb.auug.org.au>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Aug 2024, Stephen Rothwell wrote:

> Hi all,
> 
> Commit
> 
>   ec4989dea73e ("Revert "HID: hidraw: add HIDIOCREVOKE ioctl"")
> 
> is missing a Signed-off-by from its author and committer.
> 
> Reverts are commits as well ...

That's for-next-specific revert. I'll probably go ahead and rebase 
for-next branch of hid.git for the first time in history eventually, a lot 
of useless reverts and merge commits accumulated there.

-- 
Jiri Kosina
SUSE Labs

