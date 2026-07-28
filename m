Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7598439347;
	Tue, 28 Jul 2026 13:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243981; cv=none; b=k88EG5M9A/15pzL2m1JsKWkLBv/RzW8iBg0BgFCsSkunOXx2730wcGbLn3d0TDE2jkAUK3sFJ4Owaay/TsLR5UvXcHL+GNN2RAwpdknPbFuVRp6S8l32/t0/IrxNWyVB59RJ+D494d+57cUN5A5s1+UjJf0xxjaRZ0pM69WxUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243981; c=relaxed/simple;
	bh=awZJ3hel0aKmBudgbQyU5ewEO9OSJUKG4j5gBtWpDRg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=KIrMJGowKzH8xv0cH/Rp2Pd2xeCPTbWaUTWczOB8dnw9Ny/CJ39gZ8CZyz3AlrOrGlq+z7sP3EOvDW8dMMeHuqbUtIk3KKuPcgViMgvRwQx8stj7kscGFp60Hvf4ChCcwsFOcxwFRVXbLCqJO4N5jCBv8u1+0ECMwq1eaZHIdRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtfxFyeI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtfxFyeI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9532E1F00A3A;
	Tue, 28 Jul 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243980;
	bh=Bw2EuqhcOg6eBiJtTxSCgWRP8z0iMAX870v7d4oP8kI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=DtfxFyeIlbxCkoyM1RXBaqrUjfcz/YXaDUKreOuu+YqmCfFfAozkRF7VUDeT7juwG
	 RrvXZI1tQnl8HL7c3tBBgybMaxWhYowzfJnSfV5JlXIeYVKbYREYaQD720A81D6Uti
	 PRJwBJ3d0qJkcebEmDomRKQjtWmJdJ7ftuTMEcIoKeevHjJqAfrdr2gz0lu/pupVlr
	 zPAuLz7n1BnMBZfdh+TtVrOATOjc2E+pYEOFVfQggwbJP5Ekp176knamardgF2B1ZU
	 +Uiiw4E/1ZOXIGZT4Im8qW+gZPg8AEVGxPU4VrkhxjYgfzglvRd9M8xcabKCGWaE1e
	 SyAXIyFjqkSxg==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 15:06:18 +0200
Message-Id: <DKA869IVHFTK.FZZ8URDMCQU6@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: Unexpected files in the drm-rust tree
Cc: "Alice Ryhl" <aliceryhl@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
To: "Mark Brown" <broonie@kernel.org>
References: <amiode9ojm4agngI@sirena.org.uk>
In-Reply-To: <amiode9ojm4agngI@sirena.org.uk>

Hi Mark,

On Tue Jul 28, 2026 at 3:02 PM CEST, Mark Brown wrote:
> Commit
>
>   ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted refe=
rence")
>
> added this unexpected file:
>
>  drivers/gpu/drm/drm_panel.c.orig

this (and the other reported issues) originate from a backmerge of the DRM =
tree
into the DRM Rust tree. I've seen this issue has already been reported for =
the
trees it originates from and is being addressed there.

Thanks,
Danilo
