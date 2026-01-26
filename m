Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB571EB5CE
	for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438559; cv=pass; b=iel4KXdbn5c7scAbI61fshLDt6XzUzkO+cs2gAyNe6bJiqXhcoqFy6e0tTDpPGE0xcrFvf+u4AUpIoptCGk3eTIULOVKN6EXmcm/LiT3ks7TPzGHocqyhdT67JiK9jVtD3/syUaM/T8aNDcT0KJZ1rHKoDh3kOSDnvnqguCfp2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438559; c=relaxed/simple;
	bh=ic6xgOXHwcgP5YxtzZmaJC+J29ldNfKYx8Ee0BY9QaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi4luMuXJ3HzwiymCOeRqhbmHCgYl6cFHWRgO/9LZ39HQxIT7YXcXV/7ROSyh4UsUXBcHMzLuSicjR81nSzel0RrGQOlCYht591XsIk1NF/N8vt+HbYH0WwdY/fX+hh0h8YlRuGdIvMjQd/MNoBcHRzgPUoa9stbHs0rcARRWDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUGzEv1H; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUGzEv1H"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6aa67a792so248332eec.3
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 06:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769438555; cv=none;
        d=google.com; s=arc-20240605;
        b=eVeQ9ItVkjw9AdcYi8KREdJX6jqRiszdxAZfdLVmzr634ApFoRqXVM4hE+cyFanEI3
         //5xdW1cZHa4Fp0Il7hWSOwaItPwDrVBxLPjRI0MNaohtvpXAq6v1Xpv7toebjiE8/Ie
         w7h5yu4vSbALaWUVQTTySkf/g/2UFgJMenYPL6EZdlDLaZQiynK36a3U0S1E+AXDYeKG
         6MMrYPOHIKutcDpM2jDi9ll0IChwhkf/7VN29zMxyLJKt6w+ChoyOTwsQstRnMHb3eyJ
         TwQMSiIt2jssPtySKonjtjSGzNcgnsNjFhQV8pP4cztPBmhaFNihkumLKuNs9gbIB0gK
         jH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ic6xgOXHwcgP5YxtzZmaJC+J29ldNfKYx8Ee0BY9QaY=;
        fh=/LbJw9LPYCcUnMnG0Q4Y3Uq4FGtZNgYZ1R6Vtmp6YCo=;
        b=HnmgOmJRBrVsTiJvcr8alq+M+AUG1KrnASdMbePfnRBq42tOiOZO5IAosx4Vk9UNk4
         uARmOPTKI/EKFeV40N2pGSFRSMPERjI77K92PtnumecXJjTNSIJJkMziaIANeEMq30lj
         wNHtsysURO+m7pCWtMASdIysJzguNLUc8H3D7jq0i53E4FcYOhyMpBOMVGoMAFKcWtf7
         ewl/ch2AvyGMIKHxaVjlSithGE6ddcMvKzloion0iKy7Nvbl6xyrF79y06ItRzmpawFX
         K/WlSN4T7MtNmG/wXvrJ89dJ0UU0JOLSlgf5xSPzPv9XobUdEUjpNE+1LQN9uxYQgV8w
         L/6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769438555; x=1770043355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ic6xgOXHwcgP5YxtzZmaJC+J29ldNfKYx8Ee0BY9QaY=;
        b=dUGzEv1HUQyi8IZ2pXDh1xgx3xwuJF8LnrUvH+GGMzt5wqlmPWZIy8K1/HDTNckGKA
         bwN0NOutklRebKsa4rWw7TMGNPwa5Kn7tZCndqJnQhikW7CKJFlOy/NmqRNVbC//qxN0
         FIaarRImCJTi1Yd1wI94m0UUhu92y4FumGxiUKVJsHOn2UzCjpt/gAPyXMu4OcAL9lFu
         EroTurA73fV+qDGo7ukChLPvyeOawzzN9x7MLKhZdy+1Q63q5xb5HwI2ijJcboXMxJEv
         07Fuvtv67H9fN5zoYRmaT6XOXUvN7RANOw3Vx3X0fltdL1/lg3VrIsWpOw1Uvk/POUYO
         4Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769438555; x=1770043355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ic6xgOXHwcgP5YxtzZmaJC+J29ldNfKYx8Ee0BY9QaY=;
        b=dgnqTYE4KQBqWXPs4dhjNoxIs/0rsfh+sr59NnxIdq9awxKPtRzlpksgM2fBUS7MqQ
         gWoUPPu3yTq0dQDI5dgGwhtixngSqoq5KXM9L6Bmy2ev6ejrOVdWQRnoMAcs7smJAq/9
         /W+OBvSzYSeSJkbkDt23a91KcHUTTPYYx11I1yZkrFwuaGUdxbLZdhvFkzQvthEYP4ck
         awpHPejH77sg0+nTc2tgQQpv9SLIz1UN3rpQK/lTxu8NZEdIyl5cEl2uD8qywZYumM8J
         qRAfF/gyaXt+bcsVx1huJ2sxtJRKv7k3/R/S2S6Gp/JvY+wRqUdlnfd+MZKt3zSmA9YP
         Bn0w==
X-Forwarded-Encrypted: i=1; AJvYcCXvCKMDNeOYgkhPHyoFa0tqhw4rTD9dBN3EMdOE/lBhsW4bGqPcRha3k1NSqYmkbcGG7jlpHG1BHDnE@vger.kernel.org
X-Gm-Message-State: AOJu0YwYO2D3cXGgLijXx8tbw0AzAeYVuGA3IaiIWesyedb+Vky4T6ci
	PBUCasdJGPS81YI3Id8VMD5Q1fVZv4u+Fd+HXIB79r36dxM8z8JhmZkRSdMRBgqz1eCFdoC9uXc
	Faym3g41qQ1pA+d7J1aaJiG4Dfr40uD8=
X-Gm-Gg: AZuq6aLM08OJaQy1h2qs5xHLQaDHuTFYrA7hGMgHUFIxoK/IPFEh4xX4rZp0xfvew89
	y3xT3b0AIdxFXTI9chXxgZK+lk9m62xv3qdEX7BzA5wdix2tIDFIeokCWi2cE0PlCOm+dx3eKde
	tvizvHEYqi8628vZpDL1csCxFxQqh1OT51E0dBTcL5ErusLIrUaveblzxAknZan9Uw6DS8/tDYZ
	Wya4JijK37G9Nc9HvCO64dc/5tg9agu23r0DMPtbC+p7lyK10jpU3pMUZQXnrT37XHslQXaW0Ov
	2fabvLQBdolW6g+WDDeM3dRawMMJUS3/AD0zmdevvCFJCtRgKyq4oldG3sEqOptmjLuzfUtEsV+
	2GQ45HbBwdHfi
X-Received: by 2002:a05:7301:4090:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b7648b942dmr1130225eec.8.1769438554939; Mon, 26 Jan 2026
 06:42:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5xqLq7gatOy1DV@sirena.org.uk> <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk> <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk> <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
 <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk> <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
 <vTqxQtPb82EIUJtln5_7rGW5a8ot7hGZeTwDlTSiQPJwSr8IZ5COad9CBcZY9jg8YssEH6NyvESidrBA1sx4JA==@protonmail.internalid>
 <8cc01720-427d-4cec-b4d0-721b22c47552@sirena.org.uk> <874iodtshv.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <874iodtshv.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 15:42:22 +0100
X-Gm-Features: AZwV_QjKPlKEO5pENzOQcmRwF6qJf_ONCrDq6jkrVHKEPLGTmI7QYLpuPHyjJ8M
Message-ID: <CANiq72kyjMLcs-JW4EQy+ewwxAbSdbbstBs5fB=2kG_9iRYNZQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, David Gow <davidgow@google.com>, 
	Tamir Duberstein <tamird@gmail.com>, Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 7:25=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> The `rustfmt` target will change the source directory even when building
> with `O=3D...`, if it decides formatting changes are required.

Yeah, if that is not desired, please use `rustfmtcheck` instead (i.e.
it will work in a read-only srctree).

Cheers,
Miguel
