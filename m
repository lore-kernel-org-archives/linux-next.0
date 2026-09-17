Received: from mail-wm2-f4.google.com (mail-wm2-f4.google.com [74.125.225.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384E64CC26C
	for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644019; cv=none; b=F1RbexmdYT4IWbTXU1n1yNPx+VYh1NMtpSrmumfYWtovWB6x9EQaXgxDdLric3h2gq+JsVtWpTXb4oKtXyisVvkQd3ebzx2x70w3e/c3viCJ4o6c2hA2YoTRQCJczUxehnQ/Cudehefs0qvxvXjSF1FJWHuvKrGnWFtQJ0dNR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644019; c=relaxed/simple;
	bh=LlxGdMXHAdX8taCMIhqIXD7uLIJKX+ph9Ruyy3ooAaI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hyRgSycjIOMSeMjlOLuK9uUIxz6JEFLb12qk6fkw6XW1gkk9ur7IxrumlHgoLW9DRBv6lVtXVk6+BYrAG/6kqIkxOZwIj4HThzp7qi9g8E1icVjhT9e/4k2eH7hsNa8xZ0MbWye13l3DNr45ykj50gcV5i1qA21m0r1lR1QJy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ujon/4u9; arc=none smtp.client-ip=74.125.225.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ujon/4u9"
Received: by mail-wm2-f4.google.com with SMTP id 5b1f17b1804b1-49cd71f9909so927135e9.1
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789644012; x=1790248812; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+g+yvkGeEUlWNyJpsteUjFqXg2BUoy498hjd0wgzrh4=;
        b=Ujon/4u93dRla03uTYoS2izgIrqQkjHxlou7MTB/wEAzr+IzPSODRlWF2nWRYoKb+m
         fOgZbYgYv/oPcAy0mzvyti63Fm2nehNlvrXH6QT4w6d0ozwKAqto+SJQCPSHkOtWwZXP
         W6W3UMO+OxZG8MdLwNmokiL7mJZrJihJU7yL8mQT0WVc/UELvxRduWNXQQtEyG8ATpyC
         oQ/nmG3lBkjrL4RdMtvIjnM6eKvus1otUnPmJWldGLAPtDhD4/vEND4KK3Cgsx4IJcIe
         rArFOHE3zZVRZuuVtxXuW6uc5ZJinTFrMkAFa8JR4Qu55PlPVXogGWKPK75nJuITGTay
         RaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644012; x=1790248812;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+g+yvkGeEUlWNyJpsteUjFqXg2BUoy498hjd0wgzrh4=;
        b=cDN3n9IVIKxjhNEzyVyDvTXhsh16MF41urI+iWpzmONMTTYKWW+ec3T3h//yENlGjI
         hAjNIsDJHiJVW3zfZdUHztd9tldco4JGBlruO/M4ZkcBLTSBqr42uSmioDuvk9elBb/V
         +S5ffDepQeV2y1yqjkxpIGmGoSDr+8MKjKjFqcC/1XPM9fYSuyKlqrbTgREBz2jaw9cz
         Yvs/oz6d7PABHEkXUrZeXYMEFune/bij9WkdzOTHucPopnoARJxtoGBnXyAG4YlK6NNA
         GWSnH0oMVwNdcYh3mkvEEBu2sHKCNcCEbrjwakQITmtf1kd2gz2Qz676W5dCuEhgaY3U
         68ew==
X-Forwarded-Encrypted: i=1; AKwUvBx5w27Z5qBU2DXOCNDpdwUeNvNZCAcXRHUQeNotX1nexV6r1IEpc6yUkiP+mW8mquoZPxi1t6+k2Znm@vger.kernel.org
X-Gm-Message-State: AFuF++noQzvKFLfMcOvnqF4FORla1QbY/RilOXPkgBf/yuIkDIgIJm9h
	vfFXnXhq79GvcToFl/7tQnxUX7sozObGXwjn4y1RAbGo+njOzvxCzY6F
X-Gm-Gg: AYBFou1EOvyrQB9ZEAoIkNfETzgN5W7+6d+L/moKHsAShzrbquTvBPFFq55Ter7fQfp
	bJTvduYt2IIctBStdPPwugy7HTyrZNtCm58KXlNna1yHKMuzthk5wYULjCi6DNTwkL9pi/38GeN
	jbgmw0+plA6d/ElXT0whMFBRyAnG5Vk4nDvhCJygt+DkTF0Cz0f0Zij0m8L2vMZzK38992gdJCv
	NzGnDjBGvF1UDbnA+lM7jnv5Bj63xRxR3Cf8vbvyrJ0q1+X1Nt/I8kvhv1uemKtW4r7pGNYbQFr
	IGxwEY4Nf5jiQWqwHUMzK8tbKj0sTOKLt4fl74vY5+ur/GqhNmhPkdCCImCnC04rqXpaTzOMLBG
	5gcLdwpgsxDfNPLewJzdDkSOjujCztSaUwEeZ/l//+9OnemcfsvPYO2PSXaRvfSr5aH0tPkX9HC
	rtRE9kmRSYLtoLeeEV/oFZIpAyATxVDaX5RfwWptPxUL+W99fZbtoJuzPl7J1a4Avohq5tr9yHP
	OKO0I4jSGkh9SeppcBFm2qhdfh2AS6Tm3zKAIyUO52jpbTKyjZFR4e5KeupLzSzIcv5So5tVzAj
	qe/C3pgFaJ3xSOp4ujBOf0IWl4iDuCjyWA5WM5M=
X-Received: by 2002:a05:600c:620d:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49eac46430amr164310975e9.2.1789644012140;
        Thu, 17 Sep 2026 04:20:12 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm80589305e9.8.2026.09.17.04.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:20:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 13:20:11 +0200
Message-Id: <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
Subject: Re: Missing signoff in the bpf tree
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <aqvBPVcN__UX8P85@sirena.org.uk>
 <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>
In-Reply-To: <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>

On Thu Sep 17, 2026 at 1:09 PM CEST, Mark Brown wrote:
> On Thu, Sep 17, 2026 at 12:59:30PM +0200, Kumar Kartikeya Dwivedi wrote:
>> +To Eduard
>>
>> On Thu Sep 17, 2026 at 12:30 PM CEST, Mark Brown wrote:
>> > Commits
>> >
>> >   4499609f99fd5 ("selftests/bpf: Test global subprog callback contexts=
")
>> >   3506b9a2f1085 ("bpf: Verify global subprogs in each sleepability con=
text")
>> >
>> > are missing a Signed-off-by from their committers
>
> Does the contacts list for the BPF trees need to be updated?

Well, he's the committer, so makes sense to put him in the recipients as we=
ll :).
Once he gets to this he can probably force push to correct it, I guess.
