Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D534A33F2
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999465; cv=pass; b=qqhVDxQpCO8cAkKdm7uHExN7BG1TbdXLEwRyB195FO2Uul9wJtDkFvUnNcKc4oSgTqdJZMpIwFiAbho8dTzCn2N5hwJbg6H1u7K+/CEVUKpQ1uoUk5CH30w462A50DzDIJ3rYUIKsfc/B+HeJi2minZxd3cc6Ti1nk4hU/QqMLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999465; c=relaxed/simple;
	bh=wOfhBQDuvwWg/16+hRen4ZG9tZCpBNphlp5CiJH7cnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lP1u6vaQY0aluonBES1/g+YftTB/zJUEWty8A1WeMxYuGiGUf3ghRQ9+owWN1MJ0uqMWNzrMW6V0pzJxwg36Fa5GdVhQGCS6Gcl3/A33Tm+pfl67EIVnj07MKNlM9cJbFNL9PciSUIXHNhq+osPovfwnsNhSdbfyRXqsPLfCBVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rindslEX; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rindslEX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-380adec3d39so229562a91.1
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2026 06:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782999463; cv=none;
        d=google.com; s=arc-20260327;
        b=JB7AlVZedUHCC1aEkZHn+y8bF4IfovdajrCz1VNQH29UodLbzNC8gT14Xdl/nImvlT
         vb6tSclQrKOoomBK2gGJnkBaudvUJgZWTQFU+NcvssyEHvmu/RUgKPYsHK7hFUl2cMSV
         AnbhskOMHLQnF1uxKvkAPHBScHJt5wXqYHIbr5loEi1UFxzvK1oaDYTPdK2xgf8DTUbZ
         XL5Us460TBrvMo7V+pgiV820o+N7ww9TE/o7/wphJXClQw33QWo1F+YfknWGE/oLTx8O
         +npqnwQAt7zFCpwILO5VqEj0DbDXZHlt6m32M9n2LnKlqQIzLiP+D8fxmFRULsBn+YFV
         ex0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wOfhBQDuvwWg/16+hRen4ZG9tZCpBNphlp5CiJH7cnw=;
        fh=+H2yYUYQXyskSOxHnFMCFxRoqdfj4qwaBwO15QknxXI=;
        b=O3DWM4FjuMuX3nKJwUGNBcBu4CSo40+nZkWCw9g6JkVmYs4nakmvp6Y58BX9jwM9Yl
         sfjCCeOGYCtnRetoPQk2M6brsBJUl7zmFSrHpYkJVoj+kYe02N+VnIHhBITxFlFiv6jd
         Orev7FFxIYMWrO+lV36uyxPhc0y9KWdHrgddwKx6eB45zcFlZNs1gwWhNUzoVcYy7ROA
         D1dlRmpgTlUswQZWwkBg7t122THrEA8ir4icE3plpyGnepFieU2UwOzf5blQ1to28VBg
         V6VuCnN/+KkNkdHvmiRmVcJlD8MDobJ0ey0MqrDWoPg5o8IrTpXhUqFjXgkunmyoHAKS
         yttQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782999463; x=1783604263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wOfhBQDuvwWg/16+hRen4ZG9tZCpBNphlp5CiJH7cnw=;
        b=rindslEXNa1gJDfMTskAnmN+767KkitIyuga0X/GrzTug1n4qrEkx0/JZex9dRkBnZ
         9MVj6QJ1MrXtcWFFZ2Ojk/vRJt/xq83WY7usbwT3sS/iqvG1yssPOkTeWBaz3/yl6YS7
         ZZLxtMDihJDYNkwU5ADb4687aRsegWAqYI7SOvRgirmZoEN78uwqPBR4Gh6hg9k1ZccF
         r9vKucGvognRfr2iMpMrg9zJtLDJWYYNT1C4n99KuLtUbmbQXygxF75aLU2XBjvDCseo
         nNCIzqNZJgEpHimuomSAO2GYmloRjyj86IIGfQKUy7Crr1rre/x7m3N4hqLEQXRMDKmh
         j7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999463; x=1783604263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOfhBQDuvwWg/16+hRen4ZG9tZCpBNphlp5CiJH7cnw=;
        b=mHQzz0Ldw0wX5tNX4VAcn6SYAydEFSff+X061ZjtpiIDvSS8uaYiHEdtVScgpOOAoe
         MwvkeIu51WRiF4C5nC8JgXuLqkwnhrASO6/BdQ+Avirz5KIVezfDcqiYkw9BaB4YL4c2
         9PpWSmlYCW9wDAnHLymfX02hSVLg9gn0mvrdEpLBBFBA8ocPXRRlHasAaEObRm0rZuPq
         Zy/neBYGyqwcTrQF6WdlY6nzR9O/ze43hO9+vcJggsG/5DEv+/BE5LnVBJNc0+NGkwBL
         ygOE5BJH8l8A+uLXp9m4V8rdJGJniBMs6/8VokEv9SKewAaMSd1m2daijce1rpIaVrtf
         7mdg==
X-Forwarded-Encrypted: i=1; AHgh+RoEZUQq+COOsDWML1WECf34SdyAPSq4luiZwq3akw9xUqjY8oJbxYS0ZF/5ce+8un+O6XOF+Np/3Yx7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdx++bCOByNany0jgASLjVd/+dvPs/9rYL6RScOsYXgqQv1dd4
	kFBmoEfkq309WGO3N82Fm78MxlrAYR45JAmo+gOJuCsAAgWZIQc+6OyeWlqaMCoh9I4DPZ7z79u
	ibvAXcnrSauD0LlK+/OeB1otXevsJYZU=
X-Gm-Gg: AfdE7cmX+Wkx0vIUwuozOO6k6SYJp0Fv+aCZSbp8aPr5FMw0qBuj6KRNHZWJ7IPI9uC
	ZPmeFAOorb3ZwyfX6L3k2zmH6aMlfXHay0TEgOJEKrkVrMzoRNYk8E1yGlbdeYDhbIa+n46E3FP
	wQtFjBCo8rvoeaud2mynjWEHqYJK4kziinzahcwmjBAmGXB0PaEVkt2L7EY14NMYgKzgp9qntXV
	PaCfUOuHU3NsStshKLQKX/m8SJ2TTzvqzW9jKFO19/nZ4JikH7dcX8ZMyg20ollOi1Y9qnF62fr
	ZuGtTh3RJ8g1LOd/lunFv7NfOe/K03K2fzwxLmeXgYdvR4aLXDAdhuw2G/ItKo+2IHBNZ0z8DHp
	qxQ3NqZLGgcDC
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id
 98e67ed59e1d1-380aa23f18emr4542715a91.6.1782999463155; Thu, 02 Jul 2026
 06:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net> <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
In-Reply-To: <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Jul 2026 15:37:29 +0200
X-Gm-Features: AVVi8CepHp6KVWfnK5Z2UcQUsFcaR9zF1Xq3d_U-qAmCT-f-UWxkS3MSNEnr-aA
Message-ID: <CANiq72kubjSuyD8q2R1fBPnYp2NU7bvWZAZdWd4B3x82rNp=_Q@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 2:49=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> If maintainers were more responding to patches that help debugging diffic=
ult problems /
> avoiding stupid behaviors, many of these patches would not have been stay=
ing as
> "linux-next only" patches.

Did you get an agreement from others (e.g. from Mark himself or those
maintainers), or not?

As I mentioned to you last time in the thread that Gary linked, the
standard linux-next rules do not allow for this. Of course, rules can
bent (or changed) when there is a need, but it sounds to me like you
are surprising others, even maintainers of related code, by
unilaterally adding whatever patches you deem important, without prior
agreement.

If you think something is really important, and there was disagreement
(I don't know the context), then you should try to work with others to
make them see why it is important, e.g. bring it to the Ksummit list,
to LPC, escalate it, etc. But doing things unilaterally breaks the
trust, especially when it is not the first time.

And why do you say fuzzers cannot test whatever tree you need? Can you
please elaborate what the actual problem is? Maybe it can be solved in
another way?

(Cc'ing Greg here too since I see from your threads that you discussed
with him patches for fuzzing in the past several times.)

Cheers,
Miguel
