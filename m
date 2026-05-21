Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598CC364049
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364881; cv=pass; b=bBlHtOEQdkC/qUmhjMJIieCPsmtH2Okij/992z8yys8hYLJI6PNGLtt8yuLrSZ4HW2omuDTbGR8tQrtNjVG6Alt0nyunWbTGpIxbP+Ebzj4DfW3agI2NLrYfqbAn8tLwPfaywRsbIRwUtiZz4I+9kuly9JSeO/X8VlGNmxYeYFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364881; c=relaxed/simple;
	bh=N0WRCQ+KH01CpayEYyy7mrrqhMaV2Yzdg1bxdqWZuZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M503cVtXybUhe4z0wo0SnmN8ilpDrz0Q1jjKkzohT6jegSLGLIeIG02bb2hoT830+6ZyvKy9U4FPIMnxjT7EEQuvQe9P0BF/QHIMor2p1rzbcHdCl/Ob8kRER/9o24rpdTMSXnGDeGFscKlgL6jrK4sAukBRlX3uqOkWOIyNlMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEfftwHJ; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEfftwHJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd8faef2e18so580937266b.3
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 05:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779364879; cv=none;
        d=google.com; s=arc-20240605;
        b=B09k1Hc0HH7sE0R6oRMMLp8EJrHf3RA5Y6Y/10OpYVkMQUYhlET4tCotXbO7ykSSwZ
         AgS66GSnmZ1UCqgkraHp9xyB9AOFBvRozPuYLVxeSKO27NHyRwEwsHgW9wL3z4d1czqv
         i9WqFM+ZGWC+uP4GysqysG3uFnSzJAeeaAA2iNSfs+T9LdtdDt25jUek8PSgeZaecOgS
         hcfl5gMYtXFveGVBQY1jyzCB4d0GNuzDtx1jldCDiuuc4kc6xiQ50fQuXCTgnL03Euxy
         XXbMTNTxQnzFbDpZVwKe5NmXQR2pdMUhNyyd17/bT9k5bPxjjOPp7kW1UOGZ0RKLik0i
         opZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0WRCQ+KH01CpayEYyy7mrrqhMaV2Yzdg1bxdqWZuZw=;
        fh=nBiXR+G3xcIOWGfCdNd+zPprSlI2g/1UK3t9uWrLtNQ=;
        b=KdMj1fyiJWBM3tmJc43Y3zc8EDuIpoem99W0+/d6wqcBdyqss46Upf7qZnU3CsjG4E
         h3rXc/tyb1RefAoCX5BV73RM/4CzC1U2OqC9MGrrNKFOGpq9xabUrbsQ8CEEY8V+dJmB
         vb/Ev+m9rA4CBD9kKNxGaezjdkaZrfga4z+4PcvOqnibG+3R2z8M0CVCQWZqdJ8AxPTS
         9Lw1q2npmv3JwuVRc6YkXmo4D6CHwdhBka2RVkZWNbAeiq4tIOaE3CndrnhXqUEtOPGf
         tzWfvGIhByS25ZC5jbWy1mCeloCcG6DULckVQTbvaS9iUSViXltBrLKq99qJ4sw3glA2
         VrdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779364879; x=1779969679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0WRCQ+KH01CpayEYyy7mrrqhMaV2Yzdg1bxdqWZuZw=;
        b=EEfftwHJbcxNYZ8176Z7aAfSijLuDtPDRKLdydRy1+2YDmjEkZJiTmHnvAnxrU0dw2
         RLsT+YuiyzBuoWBA2Hk9KBRGwIuf8GvTW65VFpcf+XcPIDS0EOaJyuhNYdgk6nkmMJfg
         nBsCrmdCkRQge2x+dNcbUyHB6Fwxh7l4FiiqCLFq7ip4Qnqm9p8U20O33hneoL1Xdb6f
         JWloFenWsX8hx698dkDFwFi1r+rXKW1sfoc721aa0mawAE2a/fHZ2uxvAbBjm2SNcnSn
         cmn6Z8XCjEvTXR9qWBCusRm9jieBmSIlXMK6i0k3A4yduErcwaD9TFFDKgwDDnP1efUz
         L0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364879; x=1779969679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N0WRCQ+KH01CpayEYyy7mrrqhMaV2Yzdg1bxdqWZuZw=;
        b=BLtOQhXQP0DhlHoutL+KAfqWIM0tJXuRmaLO9SEyCrQ+TXXN+zXSxbCkvO77QPHXe+
         m8wqo0fy+H82Uoigq0GDEHqZ5SsM3Kf6PIhY2y+ZzhY3CdH/iYdQw218fl1vT5bybM3m
         vKBb7GZSK3Ulhc8x43sWG8aT6qmFywCTqdtNZuwVcXA42ZpRRIafY6sHwqzy5XkbNjBo
         lH26M6o3bPEE/zMiFuR5WcVjhXyhXNN4x/yzQAR6P0wCQDced1BcDs/63k4Q7SSpHnZe
         nvP5g0MIT7spu38PZXdgc+Cpt/2BmVf/94XUKxTa/k9OTSHkj1oP8qf65jwwfYaysHg6
         wtlg==
X-Forwarded-Encrypted: i=1; AFNElJ9NDkoZZvElHSOdPElptfMNAHQhHgu7sBXrk7fRSSdSRIQeyb4i3n5ZMd6gBc4f3+8mSCgbVnXXVDek@vger.kernel.org
X-Gm-Message-State: AOJu0YyVW7npJXQ0GI0HZRGrbjTACZe3olzIZIcfWexY1qS0ZGVBMKVc
	2r30JNMMHyzMhFtanCx5+PfWWQ4tTG+1MCDUSVWUcq+ihix8nUI8+BEjvhjiF5MJt36wOZV62K1
	dBl2he3ER8HaYh9BszT3s+nhzhuqYFk4=
X-Gm-Gg: Acq92OFed3jCx1GdtCfHT8KnnR8QAQ94Ddy80tJLf+9bjNRjE6xY8VGxyT8u/iKBNpN
	Q1q9RwK+tMqBlfbAFxQW8xSFVL4VmPtiLN/h6takf7ovvfLfDBCLwltjAhLz1544pt09PM4MgfB
	XAeX9ODkTehUDvhYfPQdEUVeVh1g1q6n40AsaJdDALnfDqL2hoOaP2AJGCo+hBQ8k4vzzLVaVqj
	fB24IphK3xX0vM37K7fpw7jpGu+0dvTCmMIX4g04bigYVNG8JAXMsz5lc1QOmkf6MPSVSNTTHyE
	HKIsDvUAPNh/wmnElcNx0arUylVZgYroDEOBuX0=
X-Received: by 2002:a17:907:2845:b0:bdb:e19d:5257 with SMTP id
 a640c23a62f3a-bdc152607demr109803166b.29.1779364876921; Thu, 21 May 2026
 05:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520225245.2962-1-spasswolf@web.de> <fnrz73n5jojl2wlbgrsjdtu5zuwykwbcjzznaijbquuovpoand@i6ihdqn7a6zv>
 <s7cu3dpioidx6mepmai6eyj2pxjs4skbw7v534zbzs6g2fwcis@cvokidcxy3xa>
 <4f548d61b2dd12e01f401ce4b8c865f238f7b23c.camel@web.de> <878q9dvzh0.ffs@tglx>
 <50e5e76bc13256e3f5b3301e92f159957c3d6762.camel@web.de> <CAGudoHGk1CP3gRQLCV85AFHKx6vBEyKySOn4J+AZVAP2FkrN3g@mail.gmail.com>
 <70676dae700e6a40989315bf31ea269a509ddc0f.camel@web.de>
In-Reply-To: <70676dae700e6a40989315bf31ea269a509ddc0f.camel@web.de>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 21 May 2026 14:01:04 +0200
X-Gm-Features: AVHnY4Jlf-yrDim2uzOH0TXtokw0U7b4OPXVrImpSSlCPvkxIq7CNbdejhw5Too
Message-ID: <CAGudoHEX=Su_ehV8nNP_6Onfh=hB6uiyTTCojR7nSOkEj6zh4Q@mail.gmail.com>
Subject: Re: context switch within RCU read-side critical section in
 next-20260518+ with PREEMPT_RT
To: Bert Karwatzki <spasswolf@web.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, adobriyan@gmail.com, jack@suse.cz, 
	viro@zeniv.linux.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 1:51=E2=80=AFPM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
>
> >
> > Can you please do the following:
> > 1. go back to the known crashing-tag, add my fix, verify you still get
> > the amd splat and then try out the fix provided by Thomas
> > 2. regardless if the above helps, can you boot a kernel built with
> > CONFIG_KASAN=3Dy
> >
> > fwiw I verified my patch works fine with KASAN, including by
> > intentionally miscalculating the size of the target buffer and seeing
> > a nice splat from it so I'm confident I'm not corrupting anything.
> > However, as there are new mallocs + free flying around at early boot,
> > it is *plausible* amd was getting zeroed memory without asking for it
> > and it worked by accident.
>
> I think the warnning from amdgpu is only displayed with CONFIG_LOCKDEP=3D=
y, so
> your "improved fix" does not silence the warning from amdgpu.
>
> The additional fix from Thomas fixes the amdgpu warning.
>

I just wanted to confirm my patch does not *cause* issues, at worst
uncovers them.

> I also built the kernel with CONFIG_KASAN and get no error messages.
>

nice

I presume Thomas will handle getting the amdgpu patch to the right
people, I think it will be fine to drop all the mailing lists and the
cc's. :-)

So overall I think we are done here.

Thank you for testing and sorry for the breakage.
