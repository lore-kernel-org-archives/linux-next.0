Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF32BE621
	for <linux-next@vger.kernel.org>; Tue,  3 Feb 2026 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770146852; cv=pass; b=aTIAxe3pdqFoX4B7lo3TKyL+4ydJyDVbohHHS7UmoQHT+SodAp2seR5I7xKTonIbnupXU21Li0a42k5bDtZXhVLlN1s+vsoE/3TXSigX2pLN1xqrZvyDG0Trg4vlAPmlZ/AFc5g8ZzgMxT2jV7N2HrB4wCd0u9g9nPOHcF7BIS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770146852; c=relaxed/simple;
	bh=BJCdKJ8VhEzkkCBNCmt7tVaUC9+uRxmlwMDyQ2+kcGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmkKn25sybfL1Dov9lEAt1xUQdpDnSOHCc0tYMIOKv3BGARwCV3hklWfk63oPNJ16jdp3Z5W0oeBFXsXNcapiTeN90HtdLq9tBXLqDSk1H1qTTcJxEzAF9lgmVZB+ru14wykkRda2LVFJb0YVmpQXUgJCjRBhc30zvQTS6SS5ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vgoP0uo5; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vgoP0uo5"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so1413a12.0
        for <linux-next@vger.kernel.org>; Tue, 03 Feb 2026 11:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770146849; cv=none;
        d=google.com; s=arc-20240605;
        b=TKEFYy3eWnrsaVgMlSHrghcmBKB8kxNwh97/2K8b2ukPauqKqygoLjWEc06zQjDcJs
         ZowFl3eX+jyiUcl9MDzgvqpTZqZ0lz0k/jX1bDU6G/gfUdL40P3ny02Gi1N1hsmEuZjs
         cV4RegUd+dF41i+HJ1FG8qEGXZzMgnOrfx1wguuhGkRyM1V2lgl3JTMIPukebAsg7eZl
         Ndnz4XOidgS2+TEydeEpuj1CRMHQ1hEiPlMqPDlV7tZAmtZ18rGRA8t+86WPl4fK3KQy
         ZXeRy89qF4yqDXPMYrK8TPi5eepre10mn3YESJWOFcRFk0p81eZnWXWtW88waawCIRaK
         FBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iOFz5LEyrr+LCfEyF0lGY08d/y/Bq7GXShswCjE6dxU=;
        fh=VGMScYMQ7+zyvqmShgACxeufs7uD/h7glzPzrklwCL0=;
        b=iS8zrHYNjRivKamjglyPbeGVTnHD9rf1Vlz7fP2kK3n5AwO/zL9mLW2KL24N3RVjyv
         /jTUIcKQbGjlyom60Rsw0u+Z8TJa27uSkOdbxPevAWXSAXyvm+bIUcZEYlSFaWT7lw4w
         KoH4kJsmfPKki5ZVIXgFPL56APy4hKkpCJb/OO+2QE8XseOj6YAKCY0Ohq3lvw0mJdqW
         n8qn8NIcf2mG3p5FwWriNLpSVJuNK0uHnXA92ZCAjQpztlZccaFpgUXuvD0DIgE4VOe1
         icD10ExNvUWcDrLwLdtvbK6326uISJvtTeQ6U3H7UlJS9ZBpzmeW+ESyT1T5ygnUwGoM
         /NkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770146849; x=1770751649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOFz5LEyrr+LCfEyF0lGY08d/y/Bq7GXShswCjE6dxU=;
        b=vgoP0uo57/edGrm3aqkslPpG1OzJpuRpetoee0ouf3XUaLnt5TGg520WfHd9OUddF+
         vYmesXCqGz29aAj4MkqdGc/AddR8WbArdLaU0dEnvkZIDTIgiDMwjEhFkH1mu4IIhE08
         4aesBonEW6tmkmkdvvdNF17/cnP+NzgbkR30BGqK6pFTzkL/0f++DhnvKL8OFQQ8Z05F
         Ng9kISa/0et4P7mmrtEfXROiioGdUw0h6ADK2F7TKRWcnv+C1jsRl5Dnz4pjcSOnznTH
         GBvH+vnU7V65UbK+pV/WLd3vVyOkcqiTQqY3rnykwfd3zXbsrDV8gHIUXIxPHdynSBCF
         cmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146849; x=1770751649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iOFz5LEyrr+LCfEyF0lGY08d/y/Bq7GXShswCjE6dxU=;
        b=SALakJbxKa40LJlOzb4ZUpbvuvKHBTGu9sKpq/aX2eutaH4i+yKYC2Mmfv2jYFJZ6D
         Y6RkOf5nUk2fb4sulZ6BJNzc2xuguRmIsv25C9KuhbMlPe6FJFE4DGCSbEZFG+DA95wF
         6ixVfXRgwMJcuhV51clwjaxFxDGka12wlAa72LX5ux71b9tHn2pAiOo7Yh2/XAWfycSM
         1nmVRYhZ6FTpdcZN0NUi+CJ0e5IWH6YF6ReAxGBc1kfhaX+qRkRw9mZmKKgq/z1j4H9F
         UVtdIMkCRjr2PgHP6/ILdZgKSRrqBmjJ934WLn5Tq0sBwGumQs+ZVGXiUOIFbZ7Zn5at
         ngzA==
X-Forwarded-Encrypted: i=1; AJvYcCVsRz3wfqqSJXfsCCQbxOG+gEbSM+Rm43VgTrrWLjqclzEdI26CdBVRLIcU56ktGOWh/0lguxQeZR+0@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6+hKkHCWpJRGXBwpAqJvGNKcRngc9rSFm+TSBtMIwCTWOcBl
	rzC+aej6EHAExNhInsSaFOzLExIqIjpNI1JtUhyAGWtobIOdIPym27ji1EdlfrpG4WXOM+WTjM8
	gfRwu0plGBDNez12/iU86VQo6CqNbHaVo/so0xszQ
X-Gm-Gg: AZuq6aLjYgotFNO4QjzqXdzSe7cwuppzvNe+VZYBKwh+fGmnYQDQ3loLtszanfZz9fy
	bHrEFGSq0+vSfvFVIr4NgJsuuKzuxCHN0kBGLYJXI+kri8LuQDbPRDc/J49kK5E1ty/iuB3kiA1
	Qv3sE5Twb+uQ3E2yGUODFftrpdGgpyE+CMgKA2DKvhGjSTKK1J5cSbNoR4qUwLKBpZKi3WLQ9eA
	xIXtUzKUJCngEzzUz/EDZtse/Gjdu8k2u0R9QmsDwTNNdx7EthGxNSTuCizrMVrKkfDA1JOSGz+
	0i8zG+OhO0fLUfZNOErjKjNRfA==
X-Received: by 2002:a05:6402:17c9:b0:64b:5799:4f76 with SMTP id
 4fb4d7f45d1cf-6594b8ccd3dmr1333a12.9.1770146849189; Tue, 03 Feb 2026 11:27:29
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aYJJ_w0_9DjvXYai@sirena.org.uk>
In-Reply-To: <aYJJ_w0_9DjvXYai@sirena.org.uk>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 3 Feb 2026 11:26:53 -0800
X-Gm-Features: AZwV_QhghBASwX0Srxa8OLs8XT1jdE0E-gaglj40sNzBRQtAtVZ9VO4hspXOMWc
Message-ID: <CABCJKucymgLdrp38MOo-Op3_BgZ50QcdROUPNaJDWYA6eE-u3w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules tree
To: Mark Brown <broonie@kernel.org>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Feb 3, 2026 at 11:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the keys-next tree got a conflict in:
>
>   scripts/sign-file.c
>
> between commit:
>
>   d7afd65b4acc7 ("sign-file: Use only the OpenSSL CMS API for signing")
>
> from the modules tree and commit:
>
>   0ad9a71933e73 ("modsign: Enable ML-DSA module signing")
>
> from the keys-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I believe this still needs the previous fix-up:

https://lore.kernel.org/lkml/CABCJKuckAwav8bg20mz+SwgGb=3D=3DpX09G1dhGV_3_U=
RyMCGGTQw@mail.gmail.com/

Sami
