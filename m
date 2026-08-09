Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C22FF66A
	for <linux-next@vger.kernel.org>; Sun,  9 Aug 2026 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786293340; cv=pass; b=E1YX/5an9NJvTNmsKjv8xsLMlnzbQtIOwBnhL21raLI7iKA+oDUtv1woy1K8jkwolx/EWpiOQTH7AHZAEBW1k0VmaGjoF+KvVopJvHLCrH3wzxH3Kr0iv+d89h/BGVN8FGWgbkHLMK27x9bEEoKXQr/69xkob9+dwZA08ov5/gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786293340; c=relaxed/simple;
	bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6uG9jeXPRAE7pCxA5Dk7uYNcFeyGwwsNhpQFnmQMgshIsABi9vfp3oakwO1UkWZPtBw3FtRTcn1VuYi8j4KRtidwOlzonPrv/pJWOIVpUY+Z1s5rjnhyYyMyMfPykkeVyo0VrDI/QApwSM1pAxDVvdofXs4hcxLXr2OJLfWOK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJQFgRrv; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJQFgRrv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf110997efso2923745ad.2
        for <linux-next@vger.kernel.org>; Sun, 09 Aug 2026 09:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786293338; cv=none;
        d=google.com; s=arc-20260327;
        b=re4xf+Rcn4239A8Sqr+9r5G3+TtmGm0bY8McfI9p0eenRkq++h8JmpXZWnUkviuCdN
         iqltg1THZNkrqN3sZB55eIFsTHH1pC1MjOuvW7+cIgD8EjdEeOufVLHCWBFEQ2Iyp1sO
         kIoWtyCVUF/IIFhb8KBzQ8hCkVfZ9OErj84pv6w7VwMV+ZVs/j2w39NREFltSCBuZEo3
         TxwS2/WDtZO6mDTt2G1M/l0+Oy2YTY/Lz1U4Lsu2+T8b5j9hWCs7omxTDoLCr/AA3fyS
         LIOpVvOJqI1zQLT8nx6BnL9xfRx6CwiNITtdpGExujfTGSWlLyueaBp9lZoR5DY3bWN4
         w+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
        fh=Ab+iqFeTB2KtDZhM3IlS3hYTM5279yhjtzja/pZQUS4=;
        b=VPZTnJ4dqaWJTfgKIcFHvEtaXHBCIjXWV3Ft2JwPaWMSj4+QOaZBrtv/pswlFVNv45
         0LnAkOmW54UyRc08qH3bosRn4w5kP48r+S2f252+wYPx/CqZmm1sMHF71Lp68EppVk9c
         Cs+Z1zw3seR2lgrZwKkJ03j15OZHJ+eXRlsaoHal1Pabs4kaxI1UkgAyUKhvZtFQMhE3
         Y2/Jc0TseNj2EIrz2kasaZpEIL/9h6kiX4badYvYRMxBFOHJ5nwjd1tpOuMe5mGUL4RG
         WPSJJo940I6slPSeMpXUh4cQZVD+BUaXbT+oKxEG0R4NiVsLaoqqNnq4JjNbi0tX6nuY
         2Yyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786293338; x=1786898138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
        b=AJQFgRrvreFPRA7mRU3jdZAdra0kbXgfSAJVB0IqTgb7fuKjTb+5HZzY6+Ct/wTY1J
         /filY/SjqnFY9cJ6Mh8yr3v/Eq4j5l5vpsE3CHPnLj5F8Q3gKIrFuopX4dHI3UJ77spY
         bsqW2tcB5ci1402GUHz2riCsxV7VyyPObX+9VHTohfdxwhDwIC/L2BWMYxdbQ+3Qvylg
         TBXMLa3Xc2LkW+DwuKwi0zS88uopJ42DHp727yn/3Xs/PG6Es98Xri53dntnv628kmkF
         oU5TlMAwKzUGmDwOCZ7JyXkx4XcGI4k4g5aORH8m5tsi0z9Uqmv3RACdb8IgFjjrT2j2
         mEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786293338; x=1786898138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
        b=fbv9d48DbpXtszeOYUAvZ+fxzoEqbfIXl7S90LmDQa76jUaYOh0Lgm5zW7iKu4x0sc
         f6ZSJqVc+7gNC5zTe5oYi95UvcgS6o8Vbj+1LWpIjQY1o6Qo2D4d7ULmz5uXtyA7cIki
         IC4uDJUe4ojQXMYjXdtVF0m2IqWuhpWuWbXfzlsKyQHRDkslS1ucpWzrd9Q1VrBKorVY
         kF3Zzq6eH3qzBlDnMFo7jBVIbbnLOS/cnRFLO9LO7ETy2kT7QUrqf3o9i7Gh2cZ6FmpO
         87zW4iSPx4K0GnBIEYmU+pHxlQETfTiLGhZfy5smF64Bu9TvFbXA5TsTY1vis/7OvioG
         d6qg==
X-Forwarded-Encrypted: i=1; AHgh+RrNIULFITYs8PufVdYXt+8ns5n41Yrvb361q9ZavonmxBidXds7gI505nfOw/0I430gGEBWGN33fzPy@vger.kernel.org
X-Gm-Message-State: AOJu0YyhVBAPqTwhqiaDp9osWZsTsXKxZhcRrXmDQWHhrqbBS/83FVqs
	5rYH+Q8MwiUtt7ezvNUYddUb/YzmwZYGCU+dKTr9BL8UKraxpkBZaDYgxSQW+a3VvhoTTCMIboA
	qKpvb0fBkbOKHMn7o88vZd87C2ssXpZ4=
X-Gm-Gg: AR+sD13r0SLK34f79PzaRcfkE9bgW1bZK31Qc0nJO+Cto4KoGQaZICGCNy/5sTmPDVY
	l94Jx0mYe1fZdliPrWD2bq/SxiuCiMvtR7YKjdMWeiRRun+3HbIqxvC8tYHjDUFiVJSoZHIm9Ho
	DZhovHrmONpI25qFFI6K8EkC6GPPnLtkPmD/vodAghRSiOe72O0tBOi48xC6jE7I0l7Bj0zbDf7
	hA8MnCw5GJyY03gz1MdCF0guuRi0WyMwVajqRcSFcN7bJelJlNXzN1I6a3poQZPuvlqVbhPIAsE
	upbCczRzRfgHnBqNqSBQracgZ9kUqBFOB8HZmb+nQIBJkvrv9+1ktxutMPnvOQ4vayeViEvtf7M
	1oXGXEAyVCwRyDXhZgNZyfhirWZn/FHZX/wDfZgYWdIcEaklCtzQkEKbofXp1
X-Received: by 2002:a17:90b:c02:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-390af7cff8dmr11149536a91.2.1786293338167; Sun, 09 Aug 2026
 09:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net> <CANiq72k=xyeftXo7VLvxPQkaOQdXZP69rK4_GhcEc6khuaJqHQ@mail.gmail.com>
 <DKKEMEKDOIM7.1B1R7QP42HR9J@garyguo.net>
In-Reply-To: <DKKEMEKDOIM7.1B1R7QP42HR9J@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 18:35:25 +0200
X-Gm-Features: AUfX_mzEHpXkygepSJZzkIzdzVebv8fn05BPCami4_KZsd0_nSv1UWi87XPI_mE
Message-ID: <CANiq72nMMRG_mduKbfyEJ1a94R601KHHBog4LQPnpWx4NXkw4w@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 2:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Oops, indeed! That's embarrassing. I've pushed it now (it was the same co=
mmit as
> the current tip of pin-init-next, 1e26aea0355ad2afa1ccbc62885c01f5bcfc58c=
a).

No need to apologize! I think it happens on most merge windows :)

Cheers,
Miguel
