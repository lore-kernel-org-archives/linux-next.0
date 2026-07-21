Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB2445AF1
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626725; cv=pass; b=K75kQJEz30Odt3c909p3hSVA68pQ2hWD1pmVg+QlYmUzQsG3wVRbO25o3WXXlemwMCS9rNSd+aVf0bAcn2UNHzNASRDW4FnVFkeLME4504EPvWq8HVGTSv14YT+/0zQ23P5uDK5UP4CnX+rON0j6cceQLmPpFO6fsXMpeV1bIKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626725; c=relaxed/simple;
	bh=ZU/qr/23RI+wyt2uetotEyibgR3W5VPbVRiOXqoiKWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYUAoQDHlPw45WQtV5uLNk7DCSqFh9C/q9QJwPFF5FGhtzbdPBWL/KQziqpidt/5XuDM+5sR92lxSvEuN0x997000XGDLeuq38txiA8GGSKNxdEPO7CbGDz5joOoZRIRdLqRMNVVvhG2HzKZlspJN7VzjMyPlC+SfH14/ggDkcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DOGGp1mV; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DOGGp1mV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c165a41a52bso978021966b.3
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 02:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784626722; cv=none;
        d=google.com; s=arc-20260327;
        b=TiVwIlNQ/nB9QHmBlmxEl/3KIkUFKJqLsQ2FUgoHyUpXP2HvBGrDp1cDmXyU8WtrHl
         Fp0kEAea8qXXahsoGPH3fL+BduaVLVggAzVaPRsqFo6UCYuJ9XVn5duzsVKc39GPK2Ye
         rBOWXuKU4NaC2C/HF4Qpc1FQK52aXUV9titQh0R5KkBwXDKf8Da9sURArf5gnSfiAPzh
         LYcCvs3xuQR8gP0hwK3MvRrXjjMYuu6D0a3HHsmatxnYEDQxEbicwvtdyD16zcFuGQER
         /+2W8bbjOJxmkMFtnw9bVWORZhlKgZGEGsmKGZaaPj/dbQxfX1KbQjmXUq2vpJTfgd8f
         NQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+UdcxZlnZxUUGpJZ50U5i2OIcjDFVHlA7QXe++jobA=;
        fh=eXPxxY7+rCC8RCO8k9GKI+03nLMLSx1bG0xKlL+F3QM=;
        b=qLPgTgjGOBYqQNoOLD1OeehOw2MjRd6e9sS2R4XpFaT3TJSoQFv5Rn7oSqGYcd5QxQ
         GcwtpxTN47ovCu0C1qSwUaQ+Drk8utCH3za4lCacBMxiQNM+OviAbGkLOvDHmuZT+EPF
         JHEp2imhp6VX80hEYaoKzT+mPU7sUEE6tz6F4o/Yae71FMAW52xBaRhtTqgbuwQfbw68
         YrXBi3IggqkQjyP3G+xp9niFyOg+JNVvJpxYT+P9RlX73kjx5dOSFYQ9LuMG549tjcu4
         lEgVB65gKUU4lcZqbgrPfOfoVcasC5GYxQUy3QXvFfbZvG40vhvI2FPIkX7ukCM98Kms
         OLcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784626722; x=1785231522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b+UdcxZlnZxUUGpJZ50U5i2OIcjDFVHlA7QXe++jobA=;
        b=DOGGp1mV2ohLkKtT5OEv4x1FHSX2X+95AciIB5sCoYFN3eGf5/JuH9eGC95PlF1I6q
         x6Z2YTMpxzUX1DsI0PQpazXw9dDZvS+eKoZjfzDpB9gVusEGlsEbHVwAuKBooSgXZYBL
         2u2wqigPBHEz7Hvx5Fmzv9UqzkNN3keA5NBTjnJE4U594wEoNm4xgRrHv9tii6Wm75o/
         0JyvbFTKL99nHXBPRLt6vOTnCCSDNE0Og9i83/QyHyffvVKN07x0bbXJBINbalxo4Q+h
         l2Xi8+/FAXNtBRfGYxPTrzaucPItlHDmcWhNi7ATJIx2zbqd4cmWee86FkdJ+yy5vaCJ
         PuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626722; x=1785231522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+UdcxZlnZxUUGpJZ50U5i2OIcjDFVHlA7QXe++jobA=;
        b=jfrsYliJu6p453RWSs3/ODVhjxDW3dJidrqOuyu0Da6tmZTRiTE69FBzsFYxgqXPUl
         TKGyRoJZdCnY073Pg+wBB1YKl9y57s8e37tnkC1Fe/N6HJIPqPaHgmqeK2WnJh8+9RDm
         5DPzdVbEXqlJxSV2iocEv/FCTgq+E8JICyyu36Jrs3l9lSkTh94c4+dIiEJN+Y5TvCGE
         EZxQ9uKrTfzMCw7vlTEHFQIl1ED8bCHCjyDPkReklyIGDvqWBB63VHzsUtDepZ1WWX/X
         MTo4KdXM/dCJOoWQ0v9+0laNFD6MzB6r/LfHNtkieb4JfAd08P8QnRG0oLZCaD9ju7sj
         +OHg==
X-Forwarded-Encrypted: i=1; AHgh+RocC7p54l7y9iGj8T0u+9YqWTTmbobw8Xy5hPJi8XbDnBHsSgMJ/fAY13eZMJOT4bfI9UmLklgS8Kuq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7c5e7ELg/8BEWfsLRFQhjyxeoZ535Z3hnrfIOIwIdBGPkhjSc
	Aju7AFrusdd30ObgTwnNayseU1qp887uPphAc2XfAYMcC+TViTTkPeOBmvyi6pJb4naMXyZszMy
	m/IjqFhq9twMziTX/lv2GXTQIJUzBCl067cx4CZQ9
X-Gm-Gg: AfdE7cm/76qwvBl/idhoDuUnKM9bYC2g3iTCmL+Cdvl3nLIUABwF5UORAehKiIZczxP
	MdBxW7IOyFfAp0qlffVREdRMjHkv5xqiNCNKqYW9EdBVALJGM5OZaYsUBEkVRpEDibooJVr1O/i
	yG1wozBZLHmCZ+SPkDe9FvM7LQgEWUgMMUZEB5HFu2GMVNzsXn80l5LAYEua8bD/5ni1mxIh6RP
	ilbq1VByIV463VJ4mRhzirwwkzf0lPEcsW7H2hgn3p7qr9ZJloWZJaChj1rNMGsPMhrQETfzkx8
	+bzXLXOuYgmhOvXo35PBgLQd0A==
X-Received: by 2002:a17:907:8b8b:b0:c19:6ac7:89a3 with SMTP id
 a640c23a62f3a-c196ac790fcmr343515066b.37.1784626721212; Tue, 21 Jul 2026
 02:38:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net> <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5> <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com> <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
In-Reply-To: <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 21 Jul 2026 11:38:03 +0200
X-Gm-Features: AUfX_mzFN6QxPkqPjL7E8ntfz6GPii-BdM0XHhzmXo8Niy-LTV3cgYstwnJb0Fc
Message-ID: <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Aleksandr Nogikh <nogikh@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, 
	will@kernel.org, longman@redhat.com, mingo@kernel.org, 
	gregkh@linuxfoundation.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 12:06=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2026/07/04 21:06, Miguel Ojeda wrote:
> > I understand it may be nice to use such resources, but the solution is
> > to talk to both sides, as you do in that thread. From what I see, they
> > even offered to add a mailing list for those patches:
> >
> >   "Aleksandr says we can create a special mailing list to test draft
> >   patches, so the series sent to that list is fuzzed for some time,
> >   similarly to how upstream patch testing works now.
> >   Do you think that would help you to debug these issues? "
> >
> > So what happened with that? It seems there was a way forward there,
> > no? (Cc'ing Alexander from that thread)
>
> Alexander, was there any progress?
>

Hi Tetsuo,

You can send patches to syzbot@lists.linux.dev.

E.g. I ran

$ git send-email  --suppress-cc=3Dall --to=3Dsyzbot@lists.linux.dev
patches/kcov-tetsuo-v7/0001-kcov-fix-data-corruption-and-race-conditions-on=
-PREE.patch

to test your latest kcov patch and got the results here:
https://ci.syzbot.org/series/33930a89-bb2a-4c5a-b6c5-d45829d5c94c

The fuzzing ran on 8 VMs for 3 hours, and there were no new reports.

Please let us know what you think of this workflow.
