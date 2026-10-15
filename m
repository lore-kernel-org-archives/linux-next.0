Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35105581FE
	for <linux-next@vger.kernel.org>; Thu, 15 Oct 2026 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085079; cv=pass; b=VYhYRZI1pGz6AoxZdDDkI6un0sAz9xGsS9T3mPG6frTpeLfeydLlASd7qYMDAZD5VbRBS5QUU13hC1UDPK66uoNp4qHNQdWGJXGfEBd1WPjgwhuFHONsrpW+U6ojVgRRsPsJf/OVd4pmSclk0KIqTuwmUw3vB0zMox5cVEAfko4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085079; c=relaxed/simple;
	bh=J4fwNwwk2Wo4wS0yMEdtE2pEvdPmB5DNJ5kAr2QyFH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pj7ZfLHwx+lNnYN4QokwpOQPkjdw/P6Kglok/22I7iR6jQgMmNwG0a3jJzD4S4fgfVbPsmGjurDueg8Az/fAxTbRydIPHl1rzxY6j62ctZpLzsQxUauO++FblAQ8qTlxyIQO2fTlvFr/9/O89w6I1AJvuI5lpUE/eavL/DNjeiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5AdAOgt; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5AdAOgt"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-45e59205b91so156989fac.2
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2026 10:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085069; cv=none;
        d=google.com; s=arc-20260327;
        b=inuAn2zcV4tjjoFJgHiDX31Y5KdSmyjIzJ0+vadDnZZQrjtHSKwvDnGTo0F5jSRRPI
         y7+jACYHwGX2YCISd7282BpomBIZZNArvpwF1OkD82rH6tgbUm5k9PY3YARX0Bb61D36
         Zi6v8pp/pKYUM3RwQ6zKJg9i9vpspDxJ3gyVWMRrtjpkpqTw58vBnpUJcqY/tclD2x62
         C1gq5z2cdj1S+1BcXsyEb+Aqa8I5BA74fKsZOh8LUVNJXpkm4xStCEiKNOu8Zc1lErUB
         imza3fQ3Yf9G583dCGyq2JHTqoP9l34zmVpS2mi+O0oawt7qNY4LJMjBwleiqmWdeEYj
         IpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1mu4SGh6E5z5qH2iwI9S7XC1+VTXuGAxqDRPc273fU=;
        fh=7qSFEkmLezVZl2Rd6auLbM2YeiDLaVPqf4Au/ZhbeFw=;
        b=pUpbwlZCCttaJ9VUNzS+5nWd8jzo0Q088XBM+AiSv+0SOg61uNA+febjgnqUtKu09j
         927gwGs5cJbcT3/szwcpJcq5DK9CT3C5p9NlIGq6oMRkyUSdePz0tpN4GK2N36TOkQaC
         1db0HjKWTFnlPsIrT63/Qj7ra9Go0McBP0DF/qofY6POoVt+r3YU2aU5R2mNqV9B5poM
         RvOTE4tcD2Ki8Iu0Gc4n/Qxs7CLj29+rmXw7wiCQ1pTTjhOeJGXZfLIH3NtdK1JD3kwf
         hjyGPgrEyhjkcJk8HCIh0yztetl6fYKLDEFxnf/y06zW7D57EGPERSjHYPCeMZFYVgqv
         nPCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085069; x=1792689869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1mu4SGh6E5z5qH2iwI9S7XC1+VTXuGAxqDRPc273fU=;
        b=b5AdAOgtRBfM7/x5i8Ex8ADfURDmnZW4AqO3Osc7DjSdONosMZulpGc1Gkjf8cyYNs
         zGQhr6qXEN0/GbjovPiEYry4k60XqAvKkLaH0mGq4+kV7voLsRWlyBJGyx36NxX8JgVH
         jKa6ydYft0Xmz9HcoG5FcE2eZ0pUzqtjMzuY+kHf4iYAHYcbtfCLxVpkxJv+YM4JlRcm
         kNcXsvn965VsZiG6z+NRk6/TkOytRpGgWrZqBh95N4x4WCq34wLESoJk0C0ENfkVQrPh
         jcWo+ExrZVBFvMzVbbX6Zwjnm6c5vCOk6K1ng6kqLxStN2lJaGMEKIJ/rZ7Ka/HfSKTT
         NswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085069; x=1792689869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1mu4SGh6E5z5qH2iwI9S7XC1+VTXuGAxqDRPc273fU=;
        b=X2Fs3QnXWBXXdl0Z17DbR5z3WqadLq6SctTmz1//ON2yifd2uXmCVmOriehau79+eG
         uYRl7RIvBpNg81187x2psGS4HRgklo6clQ2jQU06yWSTXEzSQAuZAKNwRKy/5XCGHSKN
         tGO2SZIHmT/GHgKQ9ufa5+6GHlTxJ8jECMXSBefGvFUcM+AVX88wdyNFKKgBFR8EQ78f
         /3RlUzx/HOlnolFe87AVsiCpJ2wxRyKy2VsZF6RuJ9yuNHYC3zJD2sSqMfwTvopnrGXp
         BDbO+ZMBMDss1VsxVwnlF7sWy+UFWydH3SQFs95mtQKPMC2wLdQhMMia7Red65UtD/Tf
         hojw==
X-Forwarded-Encrypted: i=1; AKwUvBzOMzSVWrcbzIIic4xaE/idxxqLkFlNNQxPOC2MviEX9tGrvb/OjRzxDMOtmPeYOc1xGPwHP9nHKkd2@vger.kernel.org
X-Gm-Message-State: AFq9FYICc3icGAxyK+xLlQL0l0fO3uVGu1T9Oki9iDXOhEsTwOm+XyCp
	rK1D4EE5VQ3ml52RhoYroK/7Kje3ogrj5mEYPfcinCRuc5XkcEgpAD0+cTna4hFfG7A4bLXGYrP
	TBeXf+kdPLtQqoakAYqPfXZW65+4MokSOk5NB
X-Gm-Gg: AYBFou3I+lKAKJIYqWncMXQWFuWZsE31vyzyLcTy2kJuo4pAw9FJf6QfqER1NtuoBUk
	lEdIDjEprlDTiTQEp3TLTcNPVJwFXcDpLZUONnjQeX7dqytZ+6MQDnY7qWfaeMmk1MBEvXkSLc2
	39CV02P3FM4aWXjLTF+O0S+5xLFlaNbD81IkcGLFbnhBOoBQMx9y1AW3hmZ5jNxDbvTmqSBfADL
	WT1juCUYEf/R4asrS/ZOj2U3oyRpL1H1sULS/946IOjENATpHkHM9ZwrIS9VE/dEvalMRwfAQzV
	5ZVWAK1BMt7PEEIPPCnvMJ9HuL4cwU4Wcrufsq0d+CGCNddoJ3yON240mHvjWsj6P79c5YVcZVS
	w+FR425Y+hIctLtOjpQ9dRwutc2r/l9v+O2UxoQUG8yc0GizcMztJlC0gXPgYusLUZSSyl59WKA
	JY4a62yyBbj3J6qU5LLMGzTKJckrckx5VRPNn3jxtkY/scSiLOJVI=
X-Received: by 2002:a05:6808:6c82:b0:4f5:c569:b9dc with SMTP id
 5614622812f47-50c322d0685mr28531634b6e.0.1792085069043; Thu, 15 Oct 2026
 10:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <atDkPrlfMSiLi5XW@sirena.org.uk>
In-Reply-To: <atDkPrlfMSiLi5XW@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 19:24:15 +0200
X-Gm-Features: AclHuK9yTozceFfwI9aW5oCtwI9a085rmXQ-p7Wc724AAxuqKioAl_EVMlXu5UE
Message-ID: <CANiq72m8pHqc7ssFX1FyQkSgm+rpdgzn7mw8D8WRpHCbXAa4uA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:33=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>
>   rust/kernel/miscdevice.rs
>
> between commit:
>
>   a4082121eeb5c ("rust: miscdevice: use `#[optional]` attribute of `#[vta=
ble]` macro")
>
> from the rust tree and commit:
>
>   ba9d2c7ea7f8f ("rust: miscdevice: add registration data to MiscDevice")
>
> from the char-misc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks Mark.

Cheers,
Miguel
