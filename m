Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F4133D6D5
	for <linux-next@vger.kernel.org>; Tue,  2 Jun 2026 20:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780431214; cv=pass; b=XH/G2elNeHW3EDlah/bi+eNu99qOVb+8O6nm4jK5SnY8Bdf4FA77lLy6OFfAzrfqrCDhJABcHzlfA9+Hiv8X0sOAWF7Er1oUlrjk62vuiLi/xisEtuj6QGj/Hg2kykNjTrlg95j2YwkpKya0LHRDTDHkc/B0TM/I2o7JdwE+CnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780431214; c=relaxed/simple;
	bh=pseZnC1BAHbaZcHMzdNx6tAqrCQgXMmpIht/MOPt0gA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOxXYqhH5ReF6daFZbbNSmCz/LiWBOMN7MiQ4P/qRiUyefd32MG0NS53F4/CXL8FgOMXvF8MIycXRa5Xg69wzkNBXYSthuSNvlct9ToRj6zB5Wn+Nct2c8vVSBaG4GsFOsIgrDKbW9ns9sLPkW8N7kLclsScz3wZw+RxGKM04B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fl3ZVujb; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fl3ZVujb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf30d530bdso44642775ad.3
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 13:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780431212; cv=none;
        d=google.com; s=arc-20240605;
        b=lBRxPBuTYyhdHy7Pxa5NG79ULsWp03WLM6qeAxE265PKhk+thecBaJfG+CQQj6QOql
         2iweZv3X2YBsMy0hGC1UqW7ogHoN25fYWc6EPp7OIt7XHgCR8EfV1xRJIyMeFD+nZgjG
         YKz0gGj9lueLaoo1/qoMm8yYKob/+ShnFnUr9JNJF4sXdQggdLFpa2250WnnznKw780w
         Xv/KeDHCURMxPxRvalpxG2Oa1R7sqgC8sVfxSSJH+ugXcQjjgahzilu9U5D/7Wwp0tNk
         d2yzLFb3Q1CsYUWczBAO621GeDemidn0az7HTDQ4c0CCviiVEtsiIQqgE9jOIYsMd/55
         AMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pseZnC1BAHbaZcHMzdNx6tAqrCQgXMmpIht/MOPt0gA=;
        fh=pItr+XvQLUHhLGSEqC+VQ6j4rYnQGckc8U+WYFfwP+Y=;
        b=U9HEvF+ADvYATX/wxAEk0nqlDsVIZv6O8BD8fpFug35KrCLFsG3aMdOAzsNqWTDwnA
         rQeJE4iLyaiCZ2sr+cuS3GkZithXYP1bYi7txWY8+w/5zifkoYTp/Kwgwq5LnSb8IXxZ
         LPDxSnT5DlBDg8FrVjpi5GZ/Bpd1aAhjPTiZ4gTKQePBMSlTtB1AvTwG7bn/aCN2I20U
         WgCXoKFSLJFTpnkVLvyjqCMN5qyB1FHGYaWuWGVGmUf5fHnP7XpCJxiNWA0jWRRxIDAV
         Y6X6+v7vfaL+Z20UoePHQeZQu/UyE7HXi1QRg3i56bSxZY1ia8zqAx+0oGRndHBVzS54
         xa4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780431212; x=1781036012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pseZnC1BAHbaZcHMzdNx6tAqrCQgXMmpIht/MOPt0gA=;
        b=fl3ZVujb9HyNyZlscbOzAqgPIDbe03L42xZxJRK4g828hjkxr6tG40favXwn3F95yH
         NroOjT4q8bioNJtcxiOP4kBFdwhRy87YJmLQVpRCdGVpgd7LTOnXhkmhSBg4u823+ybQ
         erw/ABULTQ5kHSyjlCk+sT0GZw7iz67BFYr7h8N2/+NZiTa0k5yossWAMdPwLnl42HA2
         dj2SK9IxQRsOmjadDicnPx7uGyqz/F3i91dLmvguWULWXxkatm8B7kxrmL2C3DbLPG8Z
         7j0HY56CFEfD3Wq+ITZvnWFrmzQOtUo9PSHbiboAcM89pdcG6XSOLbYSZzm05/DW07VY
         BNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780431212; x=1781036012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pseZnC1BAHbaZcHMzdNx6tAqrCQgXMmpIht/MOPt0gA=;
        b=iy9y9PjFXNeKS2UCp4e04hsbyX5Amse7s9ADzT3VEBv6zIWj39tcD86PBy+n3DT75Z
         60qHbc2tSyWAB/v4KDZdpKB0N7Bi///hrZyZlowLl/yOA//GZWiehll4XV2c8VI6Ny3a
         F3Hs2UERlC4iEg6bwwxqvIDPul7tKEO2BwTKbrt7x+Yy53xA4tYnJsI7QdLCFxEWh17T
         8f+294j9+n7g5oqGaRvi9shXH20yeuO6TwVo/9w+zIiMRQDjXixlARzlt3C5UkUkJnN7
         YrSm9HPCCz14xtH7ECrIcRmZINfz5cIz+GRllyJzlRIoEIwVa8wfbbf7GqTXbCcIwyvE
         LrLg==
X-Forwarded-Encrypted: i=1; AFNElJ8etekv4eVDImwUzxTbONcEsdcjR8HV3CCtxl+y1kfB59dKCJSzOxthNMUsJfnHKueQdnB4akKjehk0@vger.kernel.org
X-Gm-Message-State: AOJu0YzzL7xL+zPulvwsrMIeRJqZaKYjv7jy8Jn8PTRT9II2/U/Tj4cO
	+KHab9+K9C6x/l0QbIMZOvp/CaHihb0gUAYH7/Y6A1kjDliDNnYKj/KyQelHpSAhZEugu7rerWH
	x3zD1y+7hIbt5ONpWlzSKwayNIic9Cb1rTYZKu9hh
X-Gm-Gg: Acq92OGyueqbRff76v3sPBppZLnWe8aj1TSDQjce4gTLwlz7uamhQDqrSAvpUUOPWaG
	gUjWg5D3PIDLzLJt3U5rUdgP9i4OkLpSCBxRDZZk1W7YGMNhjRmebG5PozcRNBleqmCXbl8znIK
	u2jOfPkgHNtF+KpmAjIu95H8HQ50kvVbc2tcH+b6/gxtnQ7KXuJfOlHe/ILi4GqtGnnUR7loO5w
	M4g7sU/7UgBSFeqBEkjfJqlu9anRvbIOVeeNdC8Uhm92S9fZbxwPVTySepfNc3YthXhpMtWfBaT
	4ef4CBFHD60EZquzXQ==
X-Received: by 2002:a17:902:f60b:b0:2bf:160f:7043 with SMTP id
 d9443c01a7336-2c1644b2994mr2445575ad.34.1780431212343; Tue, 02 Jun 2026
 13:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah8BzqSmZO40xYhS@sirena.org.uk> <CAHC9VhRR4mmkOdWwUCLswmA+_KEjB8RCBBTJ2W4JGiLUWKzxyQ@mail.gmail.com>
 <CAHC9VhRPbkVYAMec0KG55er6GOPdKqMXKdpC8rrHgiAodSv-sw@mail.gmail.com> <9d34218f-abbf-4a23-8b35-b305873ffae3@sirena.org.uk>
In-Reply-To: <9d34218f-abbf-4a23-8b35-b305873ffae3@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Jun 2026 16:13:16 -0400
X-Gm-Features: AVHnY4KpKpO9DYaOTu4rfr4g8D4KZLclWt7FiawOozC45PMKWNUodtnlnRl25IU
Message-ID: <CAHC9VhRxeTVxCW+=1DR5qzopGyHBMOJuWmtBqT_T4r1LC1jfBA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Mark Brown <broonie@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 3:16=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> On Tue, Jun 02, 2026 at 02:40:12PM -0400, Paul Moore wrote:
> > On Tue, Jun 2, 2026 at 12:31=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
>
> > > Thanks Mark, we're taking a look at it now and should have a
> > > fix/answer later today.
>
> > Proposed update to Hornet, assuming this looks okay to Blaise I'll
> > merge it into the LSM tree (and either pull in Daniel's patch or base
> > off bpf-next so everything builds correctly).
>
> > https://lore.kernel.org/linux-security-module/20260602183658.161744-2-p=
aul@paul-moore.com/
>
> Can you ping me when that goes in (or things are otherwise resolved)
> please so I know to drop the revert from -next?

Of course, no problem.

--=20
paul-moore.com
