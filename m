Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36049250C
	for <linux-next@vger.kernel.org>; Mon, 28 Sep 2026 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588062; cv=none; b=FSGk4PTSqFT5Jbe0hhzl46DjIFYxGIw2kXRQpFxm7JqcdyEa6UMFVzAjoAInOeAuuThYhnLd/8OxL4QlIpqpyZNd4ZFHbc/PFbZ0tgX4vpoHj7SOPXN74nYegFJA6HtSRR1hVwNp7wzIs3uHve4uMH9EQdNRqRKPTbGXV0t3Edw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588062; c=relaxed/simple;
	bh=9T5hU/KFPVLeW/TJVhn56mLfVyw2B7l5cGczvvVbcGg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XL8cWXLLuRUS0oGp4DxlBCt7nHeGX/gdEmOPLmKM3W7TTgtBd86YWOMbPt1Ol2mcIpP8fr7KxoNb5ODL7rdxh+wwcbauPPvGMBoxSRhuM9uLjDCW6OzArkoQPlF2Ru9MJIOmABQ7rd/1zEsZR5MEJiARQO9l01vasiMFggm0W6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/YiWwaV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/YiWwaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86381F00893;
	Mon, 28 Sep 2026 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588061;
	bh=1S3eqdrJC+KcIBCE/x46QnBf4dXxjey+ddh/bKc9jLk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=n/YiWwaVMWI9Ea1BJo6TCBqquZQA1JeE4NwuD2t48pgHWEFc90ifJAyPf360vG8xU
	 8vPjw+VimZZreDs6PapkRNu2KAi152tlFXLlQ9NGMdUMGLTWb2VzMNsBRbRSAz5n+M
	 Isq1dH5p0N9JYQbeQRtafxiYhQmJOfgniDcuS3fnXpUifSlfrWchtczZgUZ0YQLl6j
	 ow4MFkWBCZhfhCqALeCt1uquyRw4Qjrg2FygQVHhSXdTC6uhL0rl0541NKNH0ZlQmK
	 SeIB/ZfZpqO7eUZlyCwVMcmQLUZU2Z9p0wcnr7SBKO9Q5g4lbm/k3WXuL8Wfh2ZMAi
	 IQSH0SL1JQbkg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mark Brown <broonie@debian.org>, Breno Leitao <leitao@debian.org>
Cc: linux-next@vger.kernel.org, thierry.reding@kernel.org
Subject: Re: linux-next: add configfs-next tree in the merge
In-Reply-To: <5efe46d4-2e30-494d-abce-b58708d7c6dd@sirena.org.uk>
References: <apFFi-I3gJWvxeHk@gmail.com>
 <RG7jQ5JyvM4e5Xcaq6gH5fYtgwBJXjZBH3zOR4L9ct0B_2DKAVvUNLsKf-QBrgFByrKg76S9Cx8lUMwtTzrKsw==@protonmail.internalid>
 <5efe46d4-2e30-494d-abce-b58708d7c6dd@sirena.org.uk>
Date: Mon, 28 Sep 2026 11:34:13 +0200
Message-ID: <87tsn9u3ca.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mark,

"Mark Brown" <broonie@debian.org> writes:

> On Fri, Aug 28, 2026 at 01:27:41AM -0700, Breno Leitao wrote:
>
>> I've recently become the maintainer for configfs, and now have my own
>> tree, which I would like to see included in linux-next.
>
>> The MAINTAINERS file already has it:
>
>> 	T:      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git configfs-next
>
>> Is this enough, or do I need to take any additional steps to get this
>> tree merged into linux-next?
>
> Other than telling me (which you just did!) that's everything, I didn't
> see this mail until the merge was in progress today so today's -next
> still has Andreas' tree in it.  I've now updated the configuration so
> your tree will be there from Monday.
>
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
>
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and
>      * destined for the current or next Linux merge window.
>
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

I will PR rust related configfs changes Breno and he will send them with
the rest of the C configfs changes to Linus.

Can you include my tree for the rust changes in linux-next?

CONFIGFS [RUST]
M:	Andreas Hindborg <a.hindborg@kernel.org>
S:	Supported
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git configfs-next
F:	rust/kernel/configfs.rs
F:	samples/rust/rust_configfs.rs

Best regards,
Andreas Hindborg

