Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1369B3D4121
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309461; cv=pass; b=Z2Yq4iavjVKsteuJL/OPWiEBQq+5PZxD+bMymCG0Ju1a5t6w4r78utLCPsI+D5/qUlrwoMqdL1g5PW5dDwW4ctz/j7T1ORWoLYA6R5Zcxno95PVte3sXLMPVTYKEMDYrRpqVXAAlwIHqeotqq7PLCC/m5VI9UqS2CfkESpj0Nhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309461; c=relaxed/simple;
	bh=qarkPqRXB+dfShUJEBC/CSbD8pBSMW10X1A/1Rz1mLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZtr8WbKjSmEsfwo/eM9rFj7y6vkgMimjvd9V1z6adHtCLWZ0cceLxEyjvLoFyDOCkge4LOZ8DIdbVNBcNkYYWoiTmuMwKAmBvKLmbPBN1CHxNvlFQqBpFUavDBmiC9ju72POSOsU2vNi5dcLgSWUMr2swBUYxNjaIcNqxe5N40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA+ORUPs; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA+ORUPs"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf49dc28ccso671615ad.0
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 00:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785309456; cv=none;
        d=google.com; s=arc-20260327;
        b=EYbD4dVstGc0K/E45Tx3U2wfP8A5iQLvc+GML3TlSDiScnyJnTqSYY/va15nk6Z+w3
         I4dx4LUWtm+ddOPOh1uEAzFYP49qpuMiCVf0rlaJ7UpomoVrXnJcWKMnuvucYWqohEp2
         DfM1lTsXyYd/D0Kbd8bDqorVFtUzmoWflihMUJb0hcjS+DlWVkovRk9lb4sjRZ486+fZ
         hAeQ+IuqcyTpygcYE4RhxV1IZc5BZXLiE1ROD86LLPlqelKW7ovaO+hquYXUDW6guqi5
         v8F7Qv6sVeh+ip2xOMEGv4/RGuHJtBvrIZOn5ZKj7LumFS3Tps8yCne0QCtEXtOK2I+G
         CX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WS+W9kQeqokaKHWO2/0xDWSgYoDI1woHTUSpxVy3z60=;
        fh=JvfF2i42iFDq7yB46W7q6rGC0Scaoir6zIui0w/WxRc=;
        b=AhZ9WXc6l7rAt2iMN0pz74hD9SFW+dXtLvqPthH3H4EXV49T1Q/Cwy2oQXNbqnbvxp
         pquNGlpRiUCWPY1XOkbIfR4hKz3vzt0ocWeh5EqPl9Yu7mbjwaruNcvggv2nMzUfCDjS
         FGmihNSutIMLCHtFkF0GNGMl8QM36l+00MPZ7cjTEOr+TX8fzZFtcIgEOmZXgNUno/rF
         Dm6EpPCPbt/0cp3CIglFnluhyrdv05mDzRyi2Y4EHOCrZDve2sVieqbSm5UtDNWT0gxR
         1Cs3MWwaK7bHQXAQdRr34vx7PFeZuksv6mOHop/WMHvKO8p7EX5FQHhlHgHzDk5WUP/y
         Zp/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785309456; x=1785914256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WS+W9kQeqokaKHWO2/0xDWSgYoDI1woHTUSpxVy3z60=;
        b=CA+ORUPsl5MF+kBe1C8mc7rO7LWPN9PDOMAk3YpfZBR8De72gu/CNF67aOcsov47VD
         JXdM2EwhiftQe5NPXe5hdEla316n4oGEbtEAqrJzMU2Sih1TC3h6gX4tukui7GzKgDnr
         APQc3AYovz5Ab3kdYxyz/B7Q6bPydrErrfZn87Qxnp3yrsmo5qmvQZZkvi36zHYcp0XP
         yqtq+YDVfrIFUuOsn77OuqFp5tdTs8oq5xx1b7SJL7BJr961gKg38Fo4u1QLiLQNR6tq
         sx88bFfKpXVEXiGIen5wGrYApMbmR7Uc02PxG46DK0BJIQFsnG/9ZmRunU/v4Mxw+ZYK
         w8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309456; x=1785914256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WS+W9kQeqokaKHWO2/0xDWSgYoDI1woHTUSpxVy3z60=;
        b=XQjZKgsQzZyIpVlqICk3G+dgNT1NOv2eIyX06BWwmbDmwEdzI7OBNc5x62EasSPrHH
         Hrivu+f3WlitbLtGLNsFafpsVh/dBVzZjQASzN2LpUo0OOqFjhlBELETJbVZZb7BOt3g
         rhLw2iw7T650ADiN9jldOmMiAtXi5TIVlWqkgw25m6EtU5NzeL5zD5OGhwkXaBAeVmfE
         vSzz9GwoTaPhm/q/+CLHLu+b/g3hX7Oq89h/UomrAl+Llqq5TDjcTr8glp4D8GNdkQrT
         gNIHt/HfOGqkussS7RQypnrNpWGCH4HFRwlj/YS/fK+FATI4eAtjjbZBdZnNZ3pmySc6
         7t8Q==
X-Forwarded-Encrypted: i=1; AHgh+Roy4VpXMfvqRdsFhTGEylTLEWCuXO2nYQlY/tOmtkCwxljdIWD/qFzNj/cDd+F0NJJjUlGF/QKQ1Emp@vger.kernel.org
X-Gm-Message-State: AOJu0YxSXuKWChqCAv88QhylZUUXlinMsTBmR8zVDBmS5mY0EkOPrr7B
	DzV4QK7ZO5tZsi2bfzCeDwTgJbGSYkBqu6bua1/2nZMZxWIRQW/7fQ0mPKHW2TT7rot9wKjVXbB
	Xj3JYoRZ3K1dRAS9JXFDO6nLtTrd3cbk=
X-Gm-Gg: AR+sD10XHdkvbfx11JDasNjvP8SfdtLsac1y3RXxpP7D3BFUFY9Nsev8339V+40VQE6
	v6zksSFPAjq8aT3DI6Q4oyYtke0JDkMDwqk2+DVxarvpb3lZ7KsClx6ZbY0OAimBwdQcKYVscGA
	Q9b7OsjCSu7DiogkzZzU+AaRhsYyMIQRisThKuQZqdcrreFl54Frz3MAcAtsK2U2OpcVmOQwTDL
	RwLfcvUakFDxhehjGV8J93NWJw6htjlln7aM2uI7zdF2z4tpMELZhahTD1chMzdiTkH3t/tb2Bd
	TwUeBOqi1AFq/nJRSFt/tFAtpZD68OOX50PrQh+2guMFlUPC16FisHoQXA+frOINuKVGlGr7SIo
	e9MUdvZRKmsNOBFTTYWa88E/yxwT4gHMO8G1g7+dHX9ckl37uj3VcXSbeB8s/W6WBB7+nK10=
X-Received: by 2002:a17:902:e88c:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d0157877cfmr53038385ad.0.1785309456207; Wed, 29 Jul 2026
 00:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amNsDFyTbsyAASjt@mit.edu> <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk> <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk> <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
 <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
 <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp> <amlXC0hahHo4Cdsx@mit.edu>
In-Reply-To: <amlXC0hahHo4Cdsx@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Jul 2026 09:17:21 +0200
X-Gm-Features: AUfX_mwapLyftcvVL2tkMWTBa2eO4ka_DoCxf_zCaKaAMhknVZ8nzNdRhzs-S74
Message-ID: <CANiq72kdz4B8yd=rPAVTQE3=O-Proz2U5=95agVtGK9fvUGowA@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Theodore Tso <tytso@mit.edu>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Mark Brown <broonie@kernel.org>, 
	Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Daniel Stone <daniels@collabora.com>, 
	Alexander Potapenko <glider@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, 
	will@kernel.org, longman@redhat.com, mingo@kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:47=E2=80=AFAM Theodore Tso <tytso@mit.edu> wrote:
>
> It could, but it would involve making a change in syzbot.
> Specifically, syzbot would have to be changed to boot the kernel being
> tested without the kernel.panic_on_warn=3D1 boot command line function,
> and then in the syzbot reproducer, to add the moral equivalent of
>
>    echo 1 > /proc/sys/kernel/panic_on_warn

Thanks Ted! Yeah, that's about what I was expecting.

Cheers,
Miguel
