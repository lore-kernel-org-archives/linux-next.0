Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08F305662
	for <linux-next@vger.kernel.org>; Fri,  5 Jun 2026 02:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628042; cv=pass; b=ZhecoepqHHBYs1hsHXziFyZ+s70ZauNj2Usql72K/PaA2eEAcbsmzd2XcZtgo/c8CZDozeGvpY33J3lyB1SouEpLzL0RcxuMCc9jevkq0RpbgLwyQZeeyFsT+K2I6wADHffcPMJbY8R9BmTTXoUZf72+Lfsu/h4zcjIWnLLLmks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628042; c=relaxed/simple;
	bh=ME43NpyRYHdtufwk/rMYavSDkIRCYV716D75fzY8bgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwDwo9pJFDbq09Yz7efCv2UeX0cXl3456ov0vZEKMKlIOivtqoyO04ZG1lno+l7m4EJ/X2LowfDVuRrV/ZSSkzR7bSc7xfK9kjn9bp+n+WE9cW5x5AsQ3iYhRA3fRU1+WuMY/y+KiiaAw8hrc5sGRGAKzkdj3033yab9ouTy2EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AbbeEFJU; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AbbeEFJU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so10573065ad.0
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2026 19:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780628037; cv=none;
        d=google.com; s=arc-20240605;
        b=ICIyibC5EKFGDEdrGjaOCDxRHF0mhmLe2Pf+X+FIIUC7IX6OwsJRLCH0xwYoLwQSBJ
         UA/SGZ3UtW1w2rgad/BbpkWdjbPwb31Uzbk4hvWyiamncPF9nVL0CZ5R5NVHVD8bVFQ0
         1h5CLgXBDEJMyd+99RJR7b5GuAbfuZk8nEOwtqeHybFXWxJ/bxDStCm/sRcauG6rupsI
         0hJh0zzXZYMYXmAmyWTRaI6dXjtsK8PJGk2Hh7pXpsoguO1urUlP9DqKypfmn6Y5aNrs
         9/49vlpZ0fTQsFVhbbByR/L8TSVtv44ep8Vp/qCQQ+5UrTJlDKPWGdDT4xxH09nTcenr
         I0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zVKdyiFZUuhwgR/wN5SQI+AZRhERkIUiyYokvuYk4uo=;
        fh=KXAYuN5s77PKOKXD1ElcMTFOlCG/Cq3L3Osw/QvgpJ8=;
        b=ifCg71lCN5ltIgXzNv40lHT5WSjPc1ZMgtrKjnPavQdE5rpeVi9PIydZ08P2tvHhow
         Gyxw88AOUVnd9ArdfAjyZIIDTQt9Bduq02O5Wy9ILmsBETovZSTQyacZHbNaVd1HZvdQ
         pbBYwurjRt2u2HvnWaVdiN4zN+CLtnHowWdY7x1SXFCZC4krjypvv70sQXCVyd1WO4YK
         L1UK63QcBfitKO9D1q1e8RVG/voE//+JyAzuxkdIqa/YRJnWm56tidl0nvFo7HEzlmPm
         kMRQzhEBKcwyjkwToHl/9KLwc1Ck77iswJ6JpoTC6Mzc1QXFPEHQKvDLtAqyU0xLqWhj
         7VDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780628037; x=1781232837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVKdyiFZUuhwgR/wN5SQI+AZRhERkIUiyYokvuYk4uo=;
        b=AbbeEFJUJqAtMTEVvCxsy+DkX8j3uXUg+GDc3FCMPBgL/3MjTyjXQA/46H3WZoukwf
         Pk3LBJMjgby5iJLdzR97iq90rUBGv1pUhUVU/WpDFR/KB0rAhhoClMhTIzRAqkQi2gIg
         L/ujM2v6mPLc+mZd+P/gzlLGXvP7hIAgUKaFLKNbcrRmZttZWamNCn8Fa9jGvs1tNwTx
         AyRfCHYWpTvmKq0Ffq01XSiipgCw3OldNFGKKULzpQn3XiRndOAkrz2Ckgcblk5st0Dm
         hK/wqwr06MVs3rV3eA35rTGR/fWsFK+Od8Os5VK9NOEdOm7/7hE/NPiJA/GFub5LPr5A
         yQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780628037; x=1781232837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zVKdyiFZUuhwgR/wN5SQI+AZRhERkIUiyYokvuYk4uo=;
        b=jCFDR7h0Gy3Es3VipS9WXZ2N/NZWMEIqBUZFYMTPM+7w2s4HB3cZbXAHzJdnTR9t1o
         uqkc7l1QM+az2ir47vX21tRh4weGWehCmeSFhNPTuwJ8080FZdiLsySWKfovY95z2d98
         Diqu3mje6p06JNXvnRRuAsuQKud94Jw9+un7toP6zRV/A+BrZx0+/CwWHmw/EDx87vI4
         XsGe2XrreJaK3CfvrjusqrTxnYzj/iRFszZXAE+rqGy6gLzGESJxFmC5QV6zAOFADvYb
         kqvbYKdhd4u5WaeK+1u0yzriFk/d2R4miGft3mRHoyz3wGZ4Vrf1cRkRxqkAa114pDs3
         Jk8g==
X-Forwarded-Encrypted: i=1; AFNElJ+j0ao/6n0DGbpKM25jBvRbqcburGcgPYQyYCb0nCporEyQO2q6w3MgN5RzM4GzrZxnmZEl5cn/cijL@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/b79NhhOAEJuT++Ru26pVgUfMMQmK6Fj2YJhhplJl1mLGD09
	cTsipsAtdonuPbLv9+et5fegO7mLTw116eEx4vpV/Cb1XrpYJ7gsIRZs6osZCv1WKbfmJ8+SN8s
	XcB6x9/vOvq6VZgoKxMZ0AZKjaxX2l0gvwdizfzhE
X-Gm-Gg: Acq92OFevJSWqUChbGwPn2vHjbGlRuovPzr0UWt4tV9f2ozU9YGn4MIXUcq3i8t+7LR
	/oDi1x+9ocW1lXKxeDp4FxS45nMl+3Eozmj+eHH9dsyFS3d2IiEE7elTv4A1xHHSOR7RZuzrGNw
	/y5/8L1wYcAdUW/Fopz6GJD9CW1ePApifhmEcM6/AYqq46D1s1c4XeECNe3SPsTLXjnhOV3co7z
	w5uEAcNOaYB5dC8mP+ZqVOxdiJzjojDlKXJI+wkoI3GvTcDUJ6LmvIN0E0cUK28xnG9vIlNkNM1
	RPPV7MAzqydapqvodg==
X-Received: by 2002:a17:903:3807:b0:2bf:281c:d2d3 with SMTP id
 d9443c01a7336-2c1e7b073eemr13561925ad.9.1780628037130; Thu, 04 Jun 2026
 19:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83f77b2b-8c00-424d-b6f9-b044e7ea1ee7@sirena.org.uk>
 <CAHk-=wj6CtZS9hbwFjQcoNkPwQLoyKmk8czaBF6=bBOCYuXEUQ@mail.gmail.com>
 <CAHC9VhRX1=tx4+arzuH76kirYFFJozexa5L=41Bb2QbgWZXOkQ@mail.gmail.com>
 <CAHk-=wj_rtiufEEVudMCSbh86HYrnmEa9NhYfKeWHs1SOzJVnA@mail.gmail.com>
 <CAHC9VhRXW_kyWXgYBqW3K-jSr5yN9wp1EPos1c=BFmiebxLiUQ@mail.gmail.com> <CAHk-=wij4nkMRcshzEGsxvjwP2RBQyaiQ4-vQrYTOqvQusxu9g@mail.gmail.com>
In-Reply-To: <CAHk-=wij4nkMRcshzEGsxvjwP2RBQyaiQ4-vQrYTOqvQusxu9g@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 4 Jun 2026 22:53:44 -0400
X-Gm-Features: AVHnY4INK8NtMj-R7SeMSEzhh7NqBFWKeHLFLV-z5CLbKKoFGl6DKtLxUhuZ0k0
Message-ID: <CAHC9VhTsqVSxog5xZm994kUDa2-LgAQu7uaLyrQU2F11J7ZuNA@mail.gmail.com>
Subject: Re: -next status as at v7.1-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-security-module@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 7:19=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, 4 Jun 2026 at 15:23, Paul Moore <paul@paul-moore.com> wrote:
> >
> > While you didn't reply to any of my comments explaining how Hornet
> > works, specifically how it ties into the kernel, I'm assuming you've
> > read the overview.  Can you help those of us in the LSM space
> > understand why a BPF dev's NACK on code that lives strictly under
> > security/ is sufficient grounds to reject an LSM patch?
>
> Honestly, I'm not competent to make a judgment call between two
> different models for hash chain verification, so I basically *have* to
> go by maintainer opinions.

I appreciate the explanation, thank you.

I'll admit it's not particularly satisfying, as it doesn't appear to
identify any specific failing other than two groups having differing
opinions.

> So that's basically where I stand - I've seen disagreement, and I've
> seen what looks to me like reasonable push-back, and I've not really
> seen the LSM response as taking it into account.

I would point out the several different attempts Blaise made to work
and compromise with the BPF devs before Hornet was even an idea.
Hornet came into existence only because the BPF devs refused to accept
any use cases other than their own.

Regardless, I think that's about it on this topic.  Thanks for the discussi=
on.

... and of course the invitation to the security summit in Prague (or
any future instance for that matter) still stands.

--=20
paul-moore.com
