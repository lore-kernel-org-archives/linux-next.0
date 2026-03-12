Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB043750C6;
	Thu, 12 Mar 2026 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330923; cv=none; b=GAp2Tacx1yDAeRaouHILmmgGywHvLmIw6sAi3SjYm/r/79hXVQWT0wgiFuSLUnJpnDfHuZe5RVC0LGvAnYrUeefJipK5RVSFgPvdXKtnM+2dKeFpgtU5HAqdIBB85xd+GnGhI80upqVQYARREATjRqYUsiff4mRi45bQDYqAkkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330923; c=relaxed/simple;
	bh=n6GXNEBVeQR/v9tTlJf0SHo8j54knFDB/A62Yxf1Q4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkRc/MT8Urzr3Cb+N4PVCVw9wssN99D/zU17GInpz9Tuon67rLHflO8/2V/IF0TcXtkwHQ2HvfLjgR9tTSGU8JwTNi+DR5dR/FsvOwO57TC5OAgEtTJ7eh2pAbZ5gpzfR0aNWv8Rw0FNuU9pYcK5rQDg0Gy2jjkEvdis5CZVfuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExlS7FLE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExlS7FLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E12C4CEF7;
	Thu, 12 Mar 2026 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773330923;
	bh=n6GXNEBVeQR/v9tTlJf0SHo8j54knFDB/A62Yxf1Q4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExlS7FLEKgW4LOPZ87dlRM1K/6ToVu6+CWw6+3L76/ZHRx+zmUMRgMnQeyJIBsfz8
	 mpITPgVTXvWYp3zkdwnrtv7FqJWwKetHwocqzDBHTdXLepUiMoxhC5WZOLM5Yadf2t
	 WerEN+8HboXma7E8OpruKvz9Su78IgwO57dqMJJCc7fMgA/Dn4wsFDTl5W7MVTEANE
	 ++69qU+m0PSbKSu06kV+IQOkJ3lknTWIKMJ8KCwvwku/FWJphru/SnSbCtCQcxOd3g
	 NJJiTHuOOiK1mxqyYaFaXZWkHS+OcALQScC515PJKRpQxWLfeILdD/EaCLAOCE0KH9
	 y6MeCKDgg3s0w==
Date: Thu, 12 Mar 2026 15:55:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <1f304ceb-06f3-4158-99af-c5e6321e177f@sirena.org.uk>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <abGBhmJ7827npf4D@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
 <feb7b428-eab3-4cec-a004-6067e621398f@sirena.org.uk>
 <abGYiyHJHWOgH65W@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
 <abJe1PAf4JbwGGRI@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jcvzAXPN4bX6hXmy"
Content-Disposition: inline
In-Reply-To: <abJe1PAf4JbwGGRI@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
X-Cookie: I feel better about world problems now!


--jcvzAXPN4bX6hXmy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 12:06:04PM +0530, Ojaswin Mujoo wrote:

> Hi Mark,

> Im able to replicate and confirm the following patch fixes it:

>   https://lore.kernel.org/linux-ext4/5bb9041471dab8ce870c191c19cbe4df57473be8.1772381213.git.ritesh.list@gmail.com/

> I believe the previous test's cleanup is not going through properly
> causing the mballoc test to fault.

What's the plan on getting this merged, this is fairly disruptive in
-next?

--jcvzAXPN4bX6hXmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmy4eUACgkQJNaLcl1U
h9AoWggAgc8Onhv7++Qc67QGg/kcoK8JeT5QNk8KKrTNRr4zDSZzGVfwGsUFtm+m
1v8gutKeKNgOlbvOShH28VUGrQjXkgtQP1OoHOphyJO5xkHAUZjd1MVAgobUHhpr
plIKPdYrhavYby9WoH2fEng4yuAYz2GjJFtjegFTs99ArB1dItBXf0hNVfzXVCTz
/Pe3NlHtzF+KOMA3I3icyQqvHMSWlmIFBoLLsJd2pTBI1W+0Zt4tADsvDHlRpM9x
92XkaTbqQWdtCJh4PBPHAu8ameGDleTtXvxmZ1Asxtl3m0a3Lp2p663uGiAkKjYq
yM6OaY9FPQYiiYRU4QV0skSLvkwmSQ==
=/M+v
-----END PGP SIGNATURE-----

--jcvzAXPN4bX6hXmy--
