Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB4053B329
	for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171152; cv=pass; b=uoRsMPS8azrXG+GAKTbRIogzNXtXzsv9XYvheMB+vYX9OGaeCyWh8DtTVGLpW1AL7DfikkhtbUDLC0CwoKnc0dpFsdfwLHaHhZ1smncWiH1fylyJmq7aFurRl7pRkKLTx6PqvZt9RUFEFg6ZyUh2j4CCPK3LRRy8aP61neUrDDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171152; c=relaxed/simple;
	bh=b0QXcZNpXsUThpCOmQL00R26guN06kE90slVJR6kThE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5fzRog6C4SuqdQPuYZ5L11agoiU/kPHoAt3oqEZKc+EUYee+PpwYJiWynnT1kjlu7RjQRY1BJNpF7QVtWuYTI6AEkiWGRbmN4EBtrBdSsFsYuU6bxsAn1FqVcZa3bfJ9cAlXTNMz90Zco0IchN8x1MpJUirmwD/V6KJcA0nxK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3YULxwj; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3YULxwj"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-334f6631916so154952eec.1
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 06:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790171150; cv=none;
        d=google.com; s=arc-20260327;
        b=sdyOtXi1nufekNNplmFH2n4FjMY1opJtQJ7rjZaV3sZjo++gT7FAt2PDtlFsZ4sq2z
         UREEq2NzktCeJSxpdSz/Zz8ya52kFcVfz2aEdJk96OqVfOQMg6vTEqxzyTiu6FItDaYx
         5yZXI3Wf3F6fem3qnwQgASI9jA7j9zTgI/40oKtxGZK4OM0/TTHc7yTW7zWIaKR6lVZK
         SsphRWfoduV2dI2CfvcOSQ7D3sYIpdpncb+Jks7GvH1NqkDRNq8bvRgt1A2VcWLnKtZb
         IcbkvM8qN+z7+jFCupg0W6wWZZoL0Tx0imUorwaqd02OQNJAzexn1yTiNLgsD6yzTLBY
         6+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
        fh=Aegysbu7gI1feyfMyAa/hNo4vvVl/DeTw3DDNcsZsSs=;
        b=k8y7rffzdwxpw3XYJdkv+dQBiiWkb/LUn2TQTjXDqfptjsubFIiJBU71jtEYDtLhNW
         mrWd8N9WWqkQTW/0Eewhz3ZoN7EQ2qfnOqqxWuNy/+cisL3TrC+1UaALQNoQ0sUG/K9z
         1v8lxHzZTzDnL+mCbts4afarxa5qMONOvynUEkI3EkGcYHmfyagkpt0b+6LYY0ir/bZH
         nwyJFedYh0/Z2KiIBr2I/zLOaupG9TkCjAOT2Ceo583bB1psORIviK6mhwiuKiWn1tuA
         uu+20rnydzhP3t18BkZV3wRmByP+AoSdCINYiFNGRoLKwy0fP/qOQpdkPFCiIGvN9X0Y
         T9sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790171150; x=1790775950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
        b=i3YULxwjStmMODCY1z4ScFyNm0LPrJe9jTOGluAnPm2QjAMcsxkWtLADgT93sy1iBU
         lif8crvMyKNZD2Cn4IDM9lH/2QFAPwLmUaFHrpMdENrqzS0tRInsCgnnFIw1znzilNpp
         puOptjSYdxOo5k7A4krEXi9m7YTXBcyGl9uPvjoN9g7xbvCz20D1TqDDb1ogoca8Jom/
         1PuLsDP75qoi+KbcSNFszlQgVIzRD/RjnP+Oad0v63+hJMLgyRxHMNQiPs416u2oPuo0
         sCzrQQz+5UybINuzMQ76LY5j1OcsJ83EpGP2PzDVsMaown44qRX6X1n3iq3Ls7ojln+p
         67RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171150; x=1790775950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
        b=xI1XB9+CQBZSw6hHzDLMTZDVZHIzkIiuiHoz7cm4PCjoQ6oR9RJ0QCGJcvFd4v59sV
         7r73NnKe776Y+4ckMkUVqaG7eywaO/G75EXtoo271kLZ8YvQop9bFnTDRXySNYjrXUgE
         hf9PTs9amFxvQ1Duy0J1N78Cne3uFr89UC8Vq+8LIFS/mlzBN0LddZP9JHhTlajjSGPN
         J+x5Sr0mhIaPCMBLu3zrbz9Rc+qTaLUa3ljGlBZehmcVNZi4Pbfrq8+d+838gMRETkJh
         Z6wawh5Mi6wlGl6kBj6J947zHALDvVXXg4PPkujyCQ5mCrMfAPb12oDoOOjDEHYHc34i
         6yEg==
X-Forwarded-Encrypted: i=1; AKwUvByUTl8VP3zZtq/G0Gy9VzBcVkESaveLO3IPxU6V4I8ACj9raKS6lX0fLVq5cl0pGpLKZsD7QDAMLdQ8@vger.kernel.org
X-Gm-Message-State: AFuF++lnYfqzTJ5yYqAFWyKMC3H38BLCjnfCRiF1KN2q8Xpzsx+whes8
	/bDT6vY6gGArRraaP1+aPtv0cecdrY3Q85f6UJIVjLc+J1+Vs47e8H3eZIevs8lTVaxEmIIXxhq
	GRp+rbiv794GbpbduTsKgev5ZN03BnJlMEA==
X-Gm-Gg: AYBFou2FZHRjZ6Ujg/DlcDJlMzVkPazDxUz6crjE5cLA2fs/Ws4YbfS6ezSwTz8iGE5
	8tYruOhGQbcUGyYieI9mSHpF3nYz68kmJu5fmkD3wgewehWj4kHu+DKEjZrCwo3DZ7vYLt2BXW6
	iGLCb4eKNFMxHqeKYLZOd/0SgCxLoMeobs9LgNmYniwsb6Tn7FIbAyhhY4ekUDYIIxNnMzfBgmC
	zR6ACWIqdZlgsQTKvCV56js2K2lqv+cHpCc3rI/o7NSabXUTG5ghh9gbU7bCS76GszuaZr1z19s
	tK50oLQxgG7VYg4FdOhtf06GooXru+S/cZrUpeS/Kc9Efyda8RqkIYIGWbTUcM+hCq+BOXKRGq/
	znEwe4ehWmLQ/EBoqlv52Zeb3aQiCXieSQ2aAqmwzqA==
X-Received: by 2002:a05:701b:4517:10b0:143:5c2a:e45f with SMTP id
 a92af1059eb24-144f8fcc55emr4442748c88.0.1790171150250; Wed, 23 Sep 2026
 06:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
In-Reply-To: <arPTRF4qS6o1Q3vD@sirena.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Sep 2026 09:45:38 -0400
X-Gm-Features: AcwNN1VvuVKZ728jo-o9478RCdxxAm4oEfsFVGIbnAnLjFz4EvjQl-J3APv6aG0
Message-ID: <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c=
:87:37: error: stack frame size (8264) exceeds limit (2048) in 'dc_memory_p=
ool_create' [-Werror,-Wframe-larger-than]
>    87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t =
size,
>       |
>
> which I am exceptionally frustrated to see was caused by commit
>
>   bc3f07516a992 (Merge drm/drm-next into drm-misc-next)
>
> which merged the bug I originally reported in the amdgpu tree:
>
>   https://lore.kernel.org/r/aq0vYhZXtMqA41wZ@sirena.org.uk
>
> and then in the drm tree when that was sent upstream without the report
> having been addressed in any way:
>
>   https://lore.kernel.org/r/arJoCiRM1hRbgRb5@sirena.co.uk
>
> neither of which have had any response at all.  It really seems like
> there is some room for improvement in your processes here, currently
> that's three drm trees all held out of -next with the same fairly simple
> build issue.  Can I suggest at least check to see if the code you are
> trying to merge is in -next, the drm merge was done after amdgpu had
> been held out of -next for several days.

I sent the PR out on Thursday and you reported the issue on Friday,
then the weekend happened.  It was investigated and fixed, however
Dave reported a different stack frame warning yesterday so we are
trying to make sure that is resolved as well.  In addition we've been
trying to figure out why our clang builds did not catch it in the
first place.  All the patches should be available momentarily.

Alex
