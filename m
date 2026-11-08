Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148076;
	b=1KVTe9oMn6tqbaxqm+W3YMM7mM1onkKZ/i732j7Y/mdI23ulMTbGJlCMhsWARw6ANNn4
	 ePB4KcLRg+rPRi5j66QfxiC5+p3OloxH20RArh+3tlei2UWbwfYPLvBfTrtmYeAStA+GH
	 giuDa8RP0TSOD21BpuTSA2rzzSWaUoKc3YeOCr9yD9e/N0Mf1XIOqhneQdoeN/Ja5ok5+
	 T1AjilhJRvlFxLFjcX7VmEibUmEqKf/qsYXo18311OygQbtKXp6TM5nli5rjSOfYQTjO+
	 08IpTNyg0aRcSDhcSmB3H4JfemssbmOVvVrvAZDIkcQQnOf0Cef6BK0bvWIXo7kt3mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148076;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j47MBzCwdzR8lT+wF5UiNgyrg2D3sXQhhloVtgFBaC4=;
	b=VuUkp3q6Mp/Tp3HIq+Ba1gNu7eJRyRyUgU7by7w96IiuYmQehHDD7hBuZDP/+OfHg20l
	 iNx2JEUMDIwcawCsD7D6Eiz5jVHLuVDwjir4dPkrskwowTP0H6EMBjtvYNS64+rYA4XKV
	 eWQhWVT03+f2/Vlkbhq8urL5GMlCGhoY3U9YqLCos7+Dz+xZRjm5Yeg35UmzMERGy8OD0
	 IHpuq6uHufg5yx2KcPnOXBuJvGEFCuZDQk9aKoq/hxUoj95Px13TTFVrVrbxcLeUz0Quy
	 lYUgRbw9l5n3OY/YO7BJ3AHEq3LvspzVBQPW1U4VrMxlGqlr566FO3PMx81GqpQEsSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igssIa8L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4275E606EE91
	for <linux-next@vger.kernel.org>; Sun,  8 Nov 2026 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igssIa8L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30A41F008A2
	for <linux-next@vger.kernel.org>; Sun,  8 Nov 2026 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148075;
	bh=j47MBzCwdzR8lT+wF5UiNgyrg2D3sXQhhloVtgFBaC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=igssIa8LsGeEDyxBfxCPVb79hvgYJwY+qnaq3KYFRkXTFtgelG5hDeFnXVP3cHBnN
	 7nfoQlJMbR/i2822+d/G5MfeezvvEy2SXhsNYqLom5POQKdHNRWB/W2/x1CZ5ArIxF
	 H41kgHsxhNfSk8uge6jYHrG55cM2fCjraz223Yqt/CdM9G0Z58OmTy+Nx424dm6TAW
	 o3QFMWpV4vE/TJOBNiiiTG0jmgyIH6TwvvIL0w8PIDIYSUg5aod2GzskRj6ltEkTlB
	 dIT6FGYTrGmMXR5dodULUal3GwdxXFtvFvqauKARkz0eE3dSAO7rBt2+chZzfMbQ1y
	 rNVpDZO3kxedw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so1078631fa.2
        for <linux-next@vger.kernel.org>; Sun, 08 Nov 2026 06:27:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFVz70pm2Q5tTf5WNTvovpKBZ66ybr5LrWpChs/psxwFCXOqdNxLh8/yByUqR7p1GhJMMt06/jvUyvX@vger.kernel.org
X-Gm-Message-State: APuU4Z8hm8Le2/Lt0DX76m4BmYbNhZHOEi57Q1aYit0mdohVjy6sma0t
	PKrvowPQgwvSnPebJLQYJqbgxK7n0RO2cY88/vh6NH5T0bS0YjooziztsM8GmMUfRgwhSapqgMT
	UzML+qM7h1rRUOWjbucnxfNPfJUFvX+Y=
X-Received: by 2002:a05:651c:150d:b0:3ac:dc69:e62a with SMTP id
 38308e7fff4ca-3adfa32c6c6mr4253071fa.2.1794148074722; Sun, 08 Nov 2026
 06:27:54 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <au4SLJH2hZZpVhGa@sirena.co.uk>
In-Reply-To: <au4SLJH2hZZpVhGa@sirena.co.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 15:27:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkkDRtfOK_Pu2S6fuMfCDWgOZEkbyL2pi=QekMyJieY3w@mail.gmail.com>
X-Gm-Features: AclHuK9BzKTpmPooj-LkIYVmeFpVSV0LfIiAxz2g8JPtLHrKizF7qPLtFUvsMJc
Message-ID: <CAD++jLkkDRtfOK_Pu2S6fuMfCDWgOZEkbyL2pi=QekMyJieY3w@mail.gmail.com>
Subject: Re: Fixes tags need work in the pinctrl tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:45=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:

> In commit
>
>   0e62a6aadef5b ("pinctrl: realtek: Initialise omitted offset fields to N=
A in config macros")
>
> Fixes tag
>
>   Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for R=
ealtek  DHC RTD SoCs")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'

Fixed it, I think.

Actually it was a copy from terminal to editor bug, stray ^M inserted.

Yours,
Linus Walleij
