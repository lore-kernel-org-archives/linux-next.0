Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8244E646;
	Tue,  4 Aug 2026 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849783; cv=none; b=PsI4qjv59gWl61Dz3B5kULJcS+jEDvftmAAl49jbWtOAmWT317gyC/EdosazXUxYchN38axVQ5h8jd9lmHQLJCHw8dLEkKzn3wBJvrdiDxf/O80dQhSx6ymfmEb8gOpz2p8POY+QQRJKj85+Vkqb2BB6yukceFMHH7w69eam1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849783; c=relaxed/simple;
	bh=GXTvepMgcDAaRuDoOoiMXW++keJ0aXZmRI22qtwJRVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AfZ8zAhLp7YbCS+cDTXuxlg3VCTps/cynC2syw3mNGCL1eEFN94l2EPGtxJdVqr91kOZcp9wHYKQm3/GlK0y4XEiADa4HTvfpIjZ4DxwMQYrYUrgx2lT4XCkzW9dmqDqUD4QO2jso52MPoNq0jOFkXOhwk2Cep8SPRuNwKgAOQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hvZECEXW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hvZECEXW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7883A408BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785849780; bh=EsbRNgza5Qvw2kkJTbs7F3wUNwugXDXiTBaTsrhXJfg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hvZECEXWi6A7jO1W5KLwti6f2ZUy16HOOlW7GQwHpucO7Y7xDL6bvu7AM52O+fE6Q
	 vz/2zMLya8/05uDYRCo+iW9WBYtL28Rgogyv7jiYFj1uZGYkkF6x7x5VMoENm5odEJ
	 gTajnpgyvvgwCWVbNiWn4rW3mk2E93qYmIaOLbAKOWREOE3M4oBFJ12zdUXjKfKSVv
	 9LO33Y563Lb2P9DlOrv6Jusga7dZxirFwE3yaJSJfg/bgkNaA3C9szDqkBP7xxx00q
	 2j4ruodQQb+6frW3y9tsBrQT7otTit252t8URy0V/GaRlI+Z9zEddZBQP8ExFpYrpH
	 wX7d0INr0KIzQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7883A408BB;
	Tue,  4 Aug 2026 13:23:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the jc_docs tree
In-Reply-To: <anHgUVqezTD8Usph@sirena.org.uk>
References: <anHgUVqezTD8Usph@sirena.org.uk>
Date: Tue, 04 Aug 2026 07:22:59 -0600
Message-ID: <87v79quij0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> Commit
>
>   7144308f14eae ("docs: pt_BR: process: Translate CVE documentation")
>
> is missing a Signed-off-by from its author

Sigh...that was my mistake, losing the signoff after thrashing the
changelog.  I'll put it back, thanks.

jon
