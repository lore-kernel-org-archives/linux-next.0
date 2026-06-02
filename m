Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F272395AED
	for <linux-next@vger.kernel.org>; Tue,  2 Jun 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425625; cv=pass; b=B4F4u+l5gk2ehudVThfsIYv64wDOq7wHTzk6XNd4tRDUmM0pdfwREW/UKEMZ/TESfFrF+Y2/CaXagBHrUhNXK270C/KYspvO2lpJJip+C5U/MKvG1UB4pXmvMVF6sfJ+FAkjbqqbCAJoYZ8po78axtsGOmNE0RlzbQFZlwsBa7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425625; c=relaxed/simple;
	bh=WA7l95NuW7yFcNCRtIvefhqHj1bJWeBjBhmpwS0AQds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWC/HKfTRHdIT1Jytb0Q9+e+2gu7FCfzrRjXciddj/LZEg8NQGU69F6p/vkB9raRh/RDlIIU4Kb6lwXniODUeADdX913cIAfkL5LSOXqpcAy8gyTRCqKxPQqELnVJY3Dsv4mrstcZQBPl2GeSv7XQTLlyF/XP5aFAycgAjMbRuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EI35RztN; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EI35RztN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so2558391a12.1
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 11:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780425624; cv=none;
        d=google.com; s=arc-20240605;
        b=NYOMIMs/RYEr7gCBjsDuEOeglnQtiLH+WQHS3mX15Gxg8h4RQ4nkMHERt3nipxY1HR
         Rxq9XR8UJ+MbLqis8eYTKPE9i/k5t+y7Q/pzcglyfdqxsGHaCD+qPs+0karJZAjRN95j
         vVsquzIUL3WgpgaVYJ9CRk1wI/IXjXMrhm5RGQvW8dHQWwJxVRDUbGfSa0Qw9I9GGb77
         CKZKd/NizZSpB5qq/4rYQ1UarAU7Qtvi62eMc6jCw9VmY38Fqk1VTYlbJPDyZrvNYAIJ
         MdRcGeLmwZiboPFVvlffiADEsqVxABCuW3/W/+SuPxUWwBORqIfWRDPMK+y6WvqxjeFU
         dC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rfh9WdBs5XOXY44y294ac6EXxBbUnL31MDufdlNqOTg=;
        fh=VedYzgchAf6Bw7Zzpp7hbcPK5hjqdGj1Rs9T6+MMRYs=;
        b=Pbd8jQV+q47Ev3MkdmEVgTFvWn7XlNlMnv+mNXb/tC5a4qNyxDDhg4JSdyMcBfvwJY
         mr1WKEPQNPQMemQsXIHbhb9einCXm1t4Le6/A8yExU0u7PTdgIaL7DeCryJHTGyupAnT
         53sFQy8ynEg0Cf8/d3SdBLRb3W1NpHo9+0pIeIGfjmHLnD9PPPeAK7pBwBc77NTBta0u
         61I93o335ZxFNCxmwQN0CMfD9DzyudpdRr4ePlxWRedi8DmcsM8lTj0OgxXdoZmcjbHr
         chFsTVTkYShAARtjFsQz5J+h4ZVrt6smfKgzrGqef4i3QZwvnKsss9p5TpTWk/x2tLVU
         +2dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780425624; x=1781030424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfh9WdBs5XOXY44y294ac6EXxBbUnL31MDufdlNqOTg=;
        b=EI35RztN4TEm5SbgtgQnyT6eGUU5sgcuBmOFp5ybOirSL/arndAPH43Xm/sc/fu1iv
         G3n1o3yDLVVc8pKP5F5fslIroK0BRZ81N85Dp1X04B7EGWD3JmBzYtDkJiuXSGS9zIUm
         cY6DJEulR61ALbbn38Gcla+FKtRASkDV5UWFwYwOTlgzQgcFMMG+6ud+VkU/ZdwMg1+9
         U47H1LMyHS9dh/326FbIGxwEwbCGRU2XJ1SRvwssIkenqXLMUNJ2qBinitWw1j27L/Kx
         kuaRYp3WmFNptm3BeDwNh/+ylNh6tBM5hsg8glFQdfXe/VmuYa3XIG0pfzAROUCNslHh
         CQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780425624; x=1781030424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rfh9WdBs5XOXY44y294ac6EXxBbUnL31MDufdlNqOTg=;
        b=LZFGE/KGwb7KlFKHN7DvEnJf6vLPSj0uiDswRCdrXbGr5E0TUCigOSlw/S1Js313zg
         RUo6kL5Y51Em5XgTvtpblnUs5lSAdCOgjn78jD4S005yDk2fyoV9boXHtl7q77/Xx1D8
         jZ8veMeLjHwqGTEm/xzTuSmSSswvsSRi7Cy2Squ/ZawbTUKpZX1XCQz6SmOAuZ/gOnJ/
         2tcLpfk28v/dIRSChuk6xyNDYQEhuEqq7VRR/Xgq/wSmWK/MsJSTcf1f6Ik6tqPrk9lH
         1Mokj5YRji9OGCjb2PkRkLvera5xzTjNu2JVqhL6pQMeGS6nhh+UxsFLkxX3ZN6lP+oG
         M1Wg==
X-Forwarded-Encrypted: i=1; AFNElJ8a98J660/ksp65QXfsYXctAHaSOnY5jWCHF3e8Artz/jCE9H4+mPgZ5CwU65F2tBKHq4O38pYgNmK9@vger.kernel.org
X-Gm-Message-State: AOJu0YwrjzGEuh2No76Tz1OkmzNMTbz4haTzHhiwgLAuXzsdKDhGFwaN
	imeF3MtXMJq7TO0rvRikLNPw/1FEWfCLavEpFm0x0FVM+o/OFCL4WBQYixLec4UB0j6wh76gfU6
	C4lZvNRO1IbdWDaAHNDAHB6aDE/pnpYUkDBZYnuy+
X-Gm-Gg: Acq92OG+XXCjUK+Voo6HjO4Mtst7CTubmXoj7jNCAhtsF4Ytv2n14k2OeTJ52EdnSjv
	hU3tloONoRvDQBRwNJvCktbpYc8n86UXoOoc5+UH/BvTDdV5tv9j6hPk1uvMpF6cR9vy1wCehAB
	VqRSbiKJ0ZIuqGcTv5N7iBwFIb8KLqLmYiuCpaYcB9CDXi6ttt3pvPML9a48HClaSeW0ALt8eoI
	dp4xjCPJji55DTvycaaQGh5oMsILfXbQqMSPboQKA+SnBX1EP6OhFxmkGFJl9LKqk2tB7jB39nA
	KHREKsHK39k92t/uMw==
X-Received: by 2002:a05:6300:228c:b0:3b4:6a23:6ba with SMTP id
 adf61e73a8af0-3b4978a0a35mr69451637.26.1780425623852; Tue, 02 Jun 2026
 11:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah8BzqSmZO40xYhS@sirena.org.uk> <CAHC9VhRR4mmkOdWwUCLswmA+_KEjB8RCBBTJ2W4JGiLUWKzxyQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRR4mmkOdWwUCLswmA+_KEjB8RCBBTJ2W4JGiLUWKzxyQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Jun 2026 14:40:12 -0400
X-Gm-Features: AVHnY4LseEdZ3PSnzNXG3ZVT30xvrKptf0DJmetNk04_9qty-3SQmPQjrXm0JY4
Message-ID: <CAHC9VhRPbkVYAMec0KG55er6GOPdKqMXKdpC8rrHgiAodSv-sw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Mark Brown <broonie@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 12:31=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Tue, Jun 2, 2026 at 12:16=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> >
> > Hi all,
> >
> > After merging the security tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > /tmp/next/build/security/hornet/hornet_lsm.c:212:36: error: too many ar=
guments to function call, expected 1, have 3
> >   212 |                         if (map->ops->map_get_hash(map, SHA256_=
DIGEST_SIZE, hash))
> >       |                             ~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~=
~~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/crypto/sha2.h:14:33: note: expanded from macro =
'SHA256_DIGEST_SIZE'
> >    14 | #define SHA256_DIGEST_SIZE      32
> >       |                                 ^
> >
> >
> > Caused by commit
> >
> >   c62310df81899 (lsm: introduce the Hornet LSM)
> >
> > interacting with
> >
> >   c48c3a7e7d5be (bpf: Drop redundant hash_buf from map_get_hash operati=
on)
> >
> > from the bpf-next tree.  I have reverted the latter commit, the new LSM
> > means that the assumption in the changelog that there is only one calle=
r
> > isn't true and it seems like the most straightforward approach.
>
> Thanks Mark, we're taking a look at it now and should have a
> fix/answer later today.

Proposed update to Hornet, assuming this looks okay to Blaise I'll
merge it into the LSM tree (and either pull in Daniel's patch or base
off bpf-next so everything builds correctly).

https://lore.kernel.org/linux-security-module/20260602183658.161744-2-paul@=
paul-moore.com/

--=20
paul-moore.com
