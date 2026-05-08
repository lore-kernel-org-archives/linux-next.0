Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC73DA7D4
	for <linux-next@vger.kernel.org>; Fri,  8 May 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266374; cv=none; b=Ltpx/We+9b7cOMStD4Jvk0nyoftMxniNLV5+AWVMkXLd9vwt3XbZdCyvUp8bdn5fL/ebIrqmwsNQgbtEsdpTHemf8l+CEUwouzYllT1xPyLoDD2judXCZ8I8fEUlGS2VOZFybwEhEinQYiUWYKOXEN7BTqwVmisDmPNd+Lu0KXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266374; c=relaxed/simple;
	bh=ddpke5VbU1pET/ElrZABrD17DZi2tfqEWQn6ZyS3vN8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=juXewchWsE5yz7tx7aXLFBidwBc8VuQFEK6rugmsWasR5NEZDaAERaVsZ/CwoRdhXUjasU1Nv856eeDpBsTQjI+ZrROfRCIKOu+P5zfYOQ8AmYeg6GxLxUGRwrU7GVtjAT0MWIjPWs0YW0EtNITH36GipHbiC+NOFgtMEg4RE/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbXVawxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbXVawxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079B3C2BCB0;
	Fri,  8 May 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778266374;
	bh=ddpke5VbU1pET/ElrZABrD17DZi2tfqEWQn6ZyS3vN8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dbXVawxaY9XYuho6aCmXYKOmosNgR/kdtIX79671+VD9+nOgGdFplUUGRAchkYMcF
	 JabhF48pzOLjA5LCwP69tKyxfKf/XH0Yi4kHHHHdbBjvHR4D1OeAglxbxXRTAN1oU2
	 4P13gY94PI44jPdy4XcuzeeDzpOWcsqsLMsyexgwp3Re91wr6Nm3nsw221Ow1rQec3
	 ZXQ2tHU3mv22B43KMfx5b5Mrcw3TsbMOo4a2ueM1linI0gjEzrxwoUW49wdwB8kCym
	 QTx6/JcuBf6HnQeWD+cP4GP8k4gqyt8BMXs5GqXexE4fzzTY+1e4JbPG9UVK4ja016
	 PWpyKcSewl6fA==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 20:52:51 +0200
Message-Id: <DIDITH88BV3F.381D0BX6133J7@kernel.org>
Subject: Re: drm-rust: change branches merged into linux-next
Cc: "Thierry Reding" <thierry.reding@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 <linux-next@vger.kernel.org>
To: "Thierry Reding" <thierry.reding@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DI3DUMHIM5CI.2FMKD5MSWVCAU@kernel.org>
 <ae6GpnWSb4Mcel_Q@sirena.co.uk> <afCi7hSqv6AeGfeo@orome>
 <DIBZCHAXRBPZ.2AM1ZBR61RA9Z@kernel.org> <afxEshceOZza_ulp@orome>
In-Reply-To: <afxEshceOZza_ulp@orome>

On Thu May 7, 2026 at 9:55 AM CEST, Thierry Reding wrote:
> Should be fixed in today's -next.

Yes, looks good now, thanks!

- Danilo
