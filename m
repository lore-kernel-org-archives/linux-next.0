Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734373;
	b=PqCXoS7fAlpCIwtD9miX1ietz3Bb6dgqFzAaE5iGxs5v0lxueeCf8PpPLr6X1iSFn4lW
	 EoxCSYiq3qqE5Z3m7TlRMrPHolN6oYIut6vtEuvVo2l0vcPqIfbr1GTxMqGWV4WhoA1Ve
	 eHaBEDRd/lo6cdPzn25tYWW7lsA+Fwtzxb8ZerR4wHtGt//OMGIsWcUgM6TJ16Fs3Cb3r
	 s2iIfvUNlm7vbumxL9STECzvst51xsx0qujFbn9fCkC7BUa6URh/kyCN0wwUWeKZDL8sC
	 g50h2ZqKUMuag/H1wkMya0lIKwkedf8ShcC79sxM0EtzhZx5aK75HU0QTUarVIUjkWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734373;
	h=Received:DKIM-Signature:Content-Type:Date:Message-Id:From:Subject:Cc:
	 To:Mime-Version:Content-Transfer-Encoding:References:In-Reply-To;
	bh=mxr5cRlVOVG88TMoFMPx9vx/LyLkzTQJUEcWvdoSHPA=;
	b=MY23WWIuLstzhXYbAnnt/0rTjhtWA2uRMrOAULTHmUN3djBrE0hlE+lcMnNomuy9gyTe
	 k9eKrkP7wPu5YtD7+iX2QWAbXRPItwOxYWcWbauxKH/gkGqcalvGJVgqoacv/qrew9Dfp
	 fFUL2jmzdfhry1aR8XW1jHOxZBv8F3y4qIVu3MZwXevH45GTBuTiRyNOeGQptkMqnwz+T
	 0OTmGbkqYGkCY52oNjDF1FroPZNKafgE/O27qPOevhV1vbQnEXvOJAxZeEBJLFpD9CfaE
	 4HPuBY2xQurd6whExMe5pus8GT8JZtgH/Suz/1rDuihF3oTOEq+ZIyIkd8o2LquWpOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqWHPIAV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2D606A31B
	for <linux-next@vger.kernel.org>; Tue,  3 Nov 2026 19:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqWHPIAV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024751F00919;
	Tue,  3 Nov 2026 19:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734373;
	bh=mxr5cRlVOVG88TMoFMPx9vx/LyLkzTQJUEcWvdoSHPA=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=oqWHPIAVXApBlYlYrQkTS+6lQGvh6NYK+Cv/uctWTllf1caUDBNDdQuh2llf5GuSf
	 6BimkvX6jLdX8bdmK6m+0vjSWT3rwDBB1EWWdGL+QZPZc4LXAk1U6J/iJSnle00b78
	 0TjhuC5L+9jWYv7FKIOER0ACu2n5wkcs2V6WBuHwXxr3Mdf4q9OhXlFWoTvneJ+LXs
	 zuP3An8xXC3/KT6h3CJj4CGSNMVPYzJnU2yNtdFLMJ4bpeUMeBAW/dVslaSfUP68vf
	 sVpCE4lF+M3MhiLMHkNvPzR5QI9RHqPE9rw6vIUvic27iejI3z8a8s1swlvf0K6vR1
	 mddFiqdJmPSmw==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 20:32:48 +0100
Message-Id: <DMLTRKUXTL3P.11VRVU1A8ERMG@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
Cc: "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Jani Nikula" <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Tvrtko Ursulin"
 <tursulin@ursulin.net>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Alex Deucher"
 <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-next@vger.kernel.org>
To: "Dave Airlie" <airlied@gmail.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <aujZcJBUyQ7iX_PM@intel.com>
 <DMKY979I29AF.BS1DF5YAZMOY@kernel.org> <aujikV14tF6K1Xqw@intel.com>
 <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
 <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>
In-Reply-To: <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>

On Tue Nov 3, 2026 at 3:05 AM CET, Dave Airlie wrote:
> It might be time to pull back to -rc6 though, we could just keep the
> rust tree in -next separate,

Agreed, I think that makes sense (I am thinking more about occasional cases
where we may need a few days more due to cross-tree dependencies). Otherwis=
e,
that's an option too, but I'd like to avoid a special case; if we take the
proposed approach, I'd rather try and see how it goes.

> It shouldn't cause any extra conflicts, but I'd rather not keep all
> the -next trees in -next once
> we merge this, otherwise we may end up with trees getting ahead of the
> next cycle again.

I'm not entirely sure what you mean by "keep all the -next trees in -next",=
 but
just to clarify:

I'm proposing that linux-next only merge the unified tip/for-linux-next bra=
nch.
The per-tree for-linux-next branches would remain as inputs to that branch,
preserving their existing selection logic.

IOW, linux-next merges tip/for-linux-next, and tip/for-linux-next merges
$tree/for-linux-next, rather than $tree/$tree-next.

I.e. the ultimate source of what is linux-next material remains to be $tree=
.

In general, I think that this is more accurate and probably less error pron=
e
(unless all trees really commit to tagging and sending their final -next PR=
 at
the global cutoff).

For instance, let's say a tree closes (i.e. tags the last -next tag of the
cycle) a few days before -rc6, it could happen that subsequent commits to
$tree-next still appear in linux-next because tip still picks them up until
after -rc6. So, after -rc6 those commits (that were in linux-next for a few
days) would disappear from linux-next again.

Not that big of a deal, but technically they didn't even belong in linux-ne=
xt
for only a few days.

If we kept $tree/for-linux-next, tip would never pick those commits up, bec=
ause
a tree that closed a few days before -rc6 would already have switched
$tree/for-linux-next to $tree/$tree-next-fixes.

So, in the end, it comes down to whether each tree's closure controls what
enters linux-next, or whether maintainers need to coordinate their branch
updates around a single cutoff defined by tip. While the latter sounds like=
 the
ideal case, I'm not entirely sure if it isn't too strict in practice. I'm
thinking more generally here, from a practical or organisational point of v=
iew.

(For instance, in practice Intel has sometimes sent its final -next PR a co=
uple
of days before -rc6 and continued applying changes afterwards; I think thei=
r
cutoff is generally around -rc5/-rc6.)

> I'm not sure need to have that complexity for everyone, but if we need
> to keep the rust tree as an extra then I'm fine with that for now,
> until it stabilises.

Appreciate it, but I'd prefer not to special case it; I can see how my drm-=
rust
example focused the discussion on that case, whereas my concern is more gen=
eral.
