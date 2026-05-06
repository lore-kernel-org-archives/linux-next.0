Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3617A309
	for <linux-next@vger.kernel.org>; Wed,  6 May 2026 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778109881; cv=none; b=CZpiPRODBE81GuhHW/PneyAi5mbWo6xTejYLmn9F8xKzrDQelSPzukUzGxG0q47rdKEAXrmFlSGfTzF1mvGHc7sSbxtguTgGHpZkCiJoFrD1cSuHZajleYroSDNU3EJXx+ZtyUGwNvM/gOmBClB9VXhi/f1ZdcF14H/nTv+UjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778109881; c=relaxed/simple;
	bh=/bOJM2hTRT+YMB3bwJtfk4pnDxa7eX5lb5w7sL0bvNQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Na0iwMJUTzXL+ecB8IGkaxw4narRrO85/TQfC8L972eiwc9ljaVDgjw8uWvVM+MiBD9aIdpEtLU0EgxlhfOaTybcBEbVp8/T7elFOj0qhXlhGd81YsbpQ8DPlq2yaqYhia+OGEzZYle2RwGuz9GOQ1vZHV/oT77EUclVH7Fu2xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9QPmvRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9QPmvRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA44EC2BCB0;
	Wed,  6 May 2026 23:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778109880;
	bh=/bOJM2hTRT+YMB3bwJtfk4pnDxa7eX5lb5w7sL0bvNQ=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=O9QPmvRoX0FtVwt+j+GZYS9ITyUwh86a94PZgvJzm6hlkJohWXhr2hXvfvVGktcl3
	 IZCrf6DwvvDnNvHnMeBE8dXHl364OTUPH1iXk0othqFrAN4USvtSocWkdIL4GJQbEK
	 tcg8BwSvc2a10MaYzfLjTo/fdaieadplPDv7BlqOhMB2m7ySG06nndZ0lDNLMxidsu
	 Ndhc3FatTob7+YuD1nh4mo7Q4EhcenHrKgYN5h0NRD7JUIrdvgWpb/V2ZOQ1ZNH2TF
	 1E0hnXqRTLg9ttmxfFdU3XBWZprCQ07YzBM5RCngVKo9w40+95hTvBTB7qVX6PGly/
	 A84AbERk2lv6Q==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 01:24:38 +0200
Message-Id: <DIBZCHAXRBPZ.2AM1ZBR61RA9Z@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Thierry Reding" <thierry.reding@gmail.com>, <linux-next@vger.kernel.org>
To: "Thierry Reding" <thierry.reding@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: drm-rust: change branches merged into linux-next
References: <DI3DUMHIM5CI.2FMKD5MSWVCAU@kernel.org>
 <ae6GpnWSb4Mcel_Q@sirena.co.uk> <afCi7hSqv6AeGfeo@orome>
In-Reply-To: <afCi7hSqv6AeGfeo@orome>

On Tue Apr 28, 2026 at 2:08 PM CEST, Thierry Reding wrote:
>> On Sun, Apr 26, 2026 at 10:52:36PM +0200, Danilo Krummrich wrote:
>> >=20
>> > 	drm-rust	https://gitlab.freedesktop.org/drm/rust/kernel.git#drm-rust-=
next
>> > 	drm-rust-fixes	https://gitlab.freedesktop.org/drm/rust/kernel.git#drm=
-rust-fixes
>> >=20
>> > to
>> >=20
>> > 	drm-rust	https://gitlab.freedesktop.org/drm/rust/kernel.git#for-linux=
-next
>> > 	drm-rust-fixes	https://gitlab.freedesktop.org/drm/rust/kernel.git#for=
-linux-next-fixes
>
> Sorry, I noticed this too late. I've updated these now, so they should
> be pulled for tomorrow's -next. I'm about to finish things up for today,
> so it'll have the old trees still.

Checking today's linux-next tree, it still seems to pull in the "old" branc=
hes.
This by itself is not a problem; until -rc6 they are exactly the same.

However, I noticed that it seems that linux-next stopped fetching new updat=
es
from the drm-rust remote.

The current head of drm-rust-fixes should be at
0a69ac25bd596d50823d530d0a2004336668c0df, and drm-rust-next should be at
37f748ed0c19e007e7c5677f5d605d6b93841792 (same goes for the new branches).

However, today's linux-next release still shows:

	$ cat Next/SHA1s | grep drm-rust
	drm-rust-fixes	15e8bae5d930c91b8739a87d75db0a6efca3cb32
	drm-rust	d9a6809478f9815b6455a327aa001737ac7b2c09

d9a6809478f9815b6455a327aa001737ac7b2c09 has "CommitDate: Mon Apr 27 18:43:=
05
2026"; the next commit in my history has "CommitDate: Wed Apr 29 00:57:54 2=
026
+0200".

Thanks,
Danilo
