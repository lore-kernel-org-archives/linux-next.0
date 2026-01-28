Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E1253F07;
	Wed, 28 Jan 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620829; cv=none; b=jZZtpCwnVoYvVNigKxFLfTBsHanE9BTwYoD+kBMVi0QS8W8Yx/KDWws0+OtJvnFcCd5TueT9xrFVVwkC2lOZ26jdQZRWLqI3/M2/JBkYeBmnxumAa6A85woBNU9SBhSEYWYG1TDfJ2318rYzeGwcZQtOgE1+C6ZR19ESc9qdH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620829; c=relaxed/simple;
	bh=nN1/LQFxOOXVnpy8O/J7EGqjZPkSaVGqaL01AAhD2RM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Mo/t8/lbeOos+Yq52wgvXX4VzaGOP9HSuDNaKEyRUlXmR6AJBk21NO71t3ApV7qV5LZ9S8IKX67XeghPLVU2ugTU6ARyLzoYt7iC9UO95haJMCitDs7oXmqg911arrpeo8qm155xIvpWDG55IKzDA5tDoPJG1WLaVSl3drly2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXoBqrO8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXoBqrO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D5DC4CEF1;
	Wed, 28 Jan 2026 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769620829;
	bh=nN1/LQFxOOXVnpy8O/J7EGqjZPkSaVGqaL01AAhD2RM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HXoBqrO80Gi2cSQWaKTh6VPXze/eIxvW6BaD/HFcqBuMaJau/MPI8HfIsVfZ60Id/
	 vsTI08SBVWnTQlWV9NALU4P7cfQwxVVJPlgGOXOVgujgSGBZ95gXfA0+ddwD0uvFiZ
	 qObSg/aqN9BF8BXrCCpdOVBYRShZnSrREBIxNHBE/m7oWu5/5pSuTcddr7fjctzLde
	 t1WS9UJnc1hnUROQwI5MR6jKOgO3JwJLJNEVwdIjD1lnZAudCPcwzylJqG+58wm4IV
	 AUiyiw+DE6Qb+hxcKVBOYxopQhL7kUWXItdpyEgMfufR7bp25ZojmKU3LjO/kq7NZC
	 S3G9XJ8ciN5tQ==
Date: Wed, 28 Jan 2026 18:20:26 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
cc: Mark Brown <broonie@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
    Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    Antheas Kapenekakis <lkml@antheas.dev>, 
    Connor Belli <connorbelli2003@gmail.com>, 
    Ionut Nechita <ionut_n2001@yahoo.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the hid
 tree
In-Reply-To: <8f5f8746-e248-08b4-50da-11a2b58e1d12@linux.intel.com>
Message-ID: <5q8qo934-17p0-7q87-37n4-691rr34q7n5p@xreary.bet>
References: <aXjiJsJamyzEU8Xi@sirena.org.uk> <8f5f8746-e248-08b4-50da-11a2b58e1d12@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 28 Jan 2026, Ilpo J=E4rvinen wrote:

> I moved this asus kbd series into a separate branch and merged that into=
=20
> my for-next branch. I could create an IB PR for that branch if HID=20
> maintainers so prefer, though admittedly the conflict doesn't look=20
> particularly complex.

Yeah, the conflict is trivial, and Linus likes to see conflicts between=20
trees himself.

The one of us who sends pull request to Linus should just point it out in=
=20
pull request.

Thanks,

--=20
Jiri Kosina
SUSE Labs

