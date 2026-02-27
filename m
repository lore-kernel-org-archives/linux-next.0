Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC12C36D507
	for <linux-next@vger.kernel.org>; Fri, 27 Feb 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772234454; cv=pass; b=DDcGcLQINcKrtf+1/mR5hNbUNMv9N5Ut8wBhHmpnKhJo0teQZKGkNDCOy+iYetuII9ILQyhTa7qRU2axOjVFAHju4fHFefk5UDnHswJyJRKa9VP5ug/9s3f3IVXJsO6Nai9qgeju+DTBxQ/WbNgH4IhIQFDYgxA18GN8uvyYDW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772234454; c=relaxed/simple;
	bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ6NoVySqu+zWNSpAAyBlCgKMXCJhk1jmpP+4oPyULGFSZSn05ycg27OCiDav3r1czMTTCaizz44iTHScxvmXwJHmkaFcVucvamyvyCcr+a9NUuxeYDHbvoAdI0/8HpQ+ghx6/O85nrAFdJvNhvnNWJsdMEkjumTmjjuB2oA1Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1aXeKYj; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1aXeKYj"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1273882d901so147429c88.1
        for <linux-next@vger.kernel.org>; Fri, 27 Feb 2026 15:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772234453; cv=none;
        d=google.com; s=arc-20240605;
        b=NAIyAIS5Ohc2YCaJh3XV4FkyL9JtaZYO8FiJhRWZB5OfJixsmV8QAh1tfpfFNSXqCT
         i1rxLMEVtA/IEghAHNEJAbb4d19b7J/4lvI3RullANGrJDWRZlHBZH9yudJQI/eC6rYh
         FVWg1svtBjaKhvUOyzd74YOwhakzZPbc/TJZhmkw4rP4KlTnXc10fY7lzmgrOYJWvqM1
         y6R49LcURj/Idum/S0cj8TfVdoJZhRgjJu9Vwo3ANeK+hRTjaocyo4HV3YSZD6NYU2fa
         yfAdpAJ64ZVz9EX9n7/px27WfKT0Uuwdy3zpJpEfwqh15vN0VoLqmxesEKsWtFyLXMXP
         cWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
        fh=mRF6Oqxkv+a7iGwjxLm5vTkW9UtMGq5AFtUtIL2fYZs=;
        b=hF2EE+oV3NtsszTw1fL4EpZCS3EGnCBtkX/4udvFwAjzor3K/uESbkoaRWf2VdftaF
         F8tA5NPJxngzuBP6s9i3HjWNFvZ4CCcuidFKm/U/GBoKQa1Y4GKGwtRVAy6bWCOoFYE9
         9ixeOHNz+ADGiS5uzt/k/BALCOQMCq+ByLp3TI51jDjQ5vxiw8L2IvSTN4UmVLUE9xRm
         4gt8pxAaHG8wSCAAnQSuKSX8BmxLB0yMlryuRh9T5l4ubkkgekIDYQC6SMPinDN+Q83H
         suT3nTEVUElWKUKKiAo4wXPrpPtX2xeeLC9GdHbbgzX82Tk2+YnGAfofcnzryVvNX3in
         t/dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772234453; x=1772839253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
        b=U1aXeKYjy/6c+PMIfF0QL7fQrKxnm8XtO8Ekmi4PyGNRMpg4TA4Tz1lwWool3OCui2
         oyn0FyK4ozF5eyQy9PhLSk6Qu2V5TqxuzrHoPI2nuJIyPVhg17BOA993zejk5h61g8ff
         AXKRE2V2qtHeJ8wKAqb1CDmC3YWNVRCek7ZjYG1phbEK2rxEimAjRPGQhLWSkMMaNZCw
         /qltML+WhJ+uNrlCHNgIBPOkmta0bsOQ/8RlWJcSP9T/CC0sqyk1rXGUFrBCHC/rD1K6
         +xL/XPDS32R3lj1CPqWWNvX4KA3PRiWx95auIceO5YKPI99fE0R4EzdFfV3b4Fkb0c1c
         uYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234453; x=1772839253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
        b=LO/+IezxWn9r6OOgHfxZHyEK59x03OwI3ptK8o7jfXzd7AeyB9iMT2PG4nZZ/mKy3M
         oqFHm77sXNePDl4zULo2GgRUW6cNkYbAVlMknEs/xr0SFki7zlsOSS5VtmAEkyPbwUmH
         21/Md+udPCgybqgfQzgiwilf68+7Grgcg4lPae+AfOVapy3cTc90SoWY/5oCiyLC0xjb
         DvbpD38nt4MfdYLBiNTRUtdr6nw0HZ6tsEelynucCyeYNrxcn+ES/vNmiZaK+U+fGxxb
         2PfZseRKV2zoD3WDhJPOVJUNPBVjFzVGFbC4ohm5Bh2b8WwGm4iT9oZNRCbG5nOHwxle
         5G0w==
X-Gm-Message-State: AOJu0Yx7msOt20bkJpBGyzvgSK+MXy5oi/2Qcew9W9cg0WfL9HZb2rXb
	QpN8P9XHr8B52EL38rnnzb39RW1BniiJcXWhKJdCPW3/9uyfvo4iqb4EctiKxInP9oPaItpq6OL
	aVAGiQsZ2vOihw0yMxx6SogoR4Xnz5UE=
X-Gm-Gg: ATEYQzzJ2lCfiye2LUHxqHy9FvkDTk6mNrsZ4XyhkG+NlzIWprOVBk9gJushdoxHXlo
	ccFAfL8AVqqWlfDH9MuFkUrpbzjXqHM/MkxNU/j2u40YKohYRaSI2EWx/njLC8dmptyw/TsGxg1
	d2vOS7nLxlN9Va/Rf4aOn+JVT8YCG3O3qXwOlFkRbSaNAcjHxV0hfqkYucwvOvVurJAzAMv8vtE
	ArdVFkvA0ZVbcx/mRNk6yn6bIbeDYK+Aas66weK9ZfEFuwcQurzh3WUWEo1B6iqKEdt9uXe0tP6
	dORAFcGPcO/NMHiUqPKMH8Hj6waAegmugXYykcMxH1jLx9IEwaBUW1Wy9x2QG97mbcT9PgzlrAx
	eXj8yIy+N4JPQNQmOcYwGBYXDdgFF
X-Received: by 2002:a05:7301:5781:b0:2b9:1375:b551 with SMTP id
 5a478bee46e88-2bde16b7286mr839706eec.0.1772234452768; Fri, 27 Feb 2026
 15:20:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aaBWxNYF4g5jRzzg@sirena.org.uk> <759447c5-a2bd-445f-a245-8772f9ea1316@sirena.org.uk>
In-Reply-To: <759447c5-a2bd-445f-a245-8772f9ea1316@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 00:20:40 +0100
X-Gm-Features: AaiRm53TVPi4EVXDe6K3cBUaQBzbK14mP_f3T4ajURZcsJVD8i0unSqMmEzCd7s
Message-ID: <CANiq72mjO1-WkEDaYUbrBuNnykeM3XCAx9t_-zaZXS4vSYnVwQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Feb 26
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 4:03=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I meant to CC you yesterday to let you know about the additional rust
> checks - I'll add other checks one at a time.

Thanks a lot for adding the checks and for the Cc, Mark! :)

Even just `rustfmtcheck` already helps a lot, and more checks are very welc=
ome.

Cheers,
Miguel
