Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D1347C5
	for <linux-next@vger.kernel.org>; Sun,  5 Jul 2026 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253190; cv=pass; b=qpE453+QIAWldhIC278UCsHCFX/QYF0Om3Euu73R7lmm9Whp+92W8zQC8YiCHnNx5NCkPBCDegNftmY73YwKp874buxeWy50nztVNKr7rDDXdddFKqlakgm2GtpKYfHNQRTGH8yupke+7BstJPIktqj86aCsZozfv2IP1uZPvl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253190; c=relaxed/simple;
	bh=cDktNqZ7Y8L2DLcqn3jCHWr50MUHEnzrNHkSF/XhY5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNTwsDt5nHpgtbIp5/siCk1m0+lcgNpJ4CuhZ6lAQzDJuGl/cg8Qc8TXqrerON2r5br2dlYwAhQs95ur60z0ZfJt27m909Ssl/NsMqXBL2gcDCqzuGLImXn0rqtOae104GHapfOcepFyUke3S7jYfGtRKU39yNdIEdPmYSfKvXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxtZn8kN; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxtZn8kN"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84787ee07f2so748759b3a.3
        for <linux-next@vger.kernel.org>; Sun, 05 Jul 2026 05:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783253188; cv=none;
        d=google.com; s=arc-20260327;
        b=GN4WaZlRd16Fs1zBwb/zwGheNdwhToutU5gGYiRxaOkKNHCm2At4mH9oefGFhMKIUy
         /9+PdnrM70x/XiOcF95NOAiJmAtnljfdUlEBGzr+NlGhoRU5D8ILixPLCnX9earmNOBG
         VZaNGhRWhBQ4V06GTA4wbKsoXippbMSwVYxEUo6R/UryjnXDB0RbICmnOn+aj9GfaMgV
         aHWT8LbHg6DqgOahxTAEOWk4i9bYIOZjeCcxjpqL4ieChhNNSkVGBqzBO9oy4qzAPuNb
         ds/mvcd+IK6S6PzfdkjJdXnpUtRS5DpHQDemWOghHBTDrkBo/xBaxNusQFrDom5jM0wm
         Xk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDktNqZ7Y8L2DLcqn3jCHWr50MUHEnzrNHkSF/XhY5s=;
        fh=/Sb25Uy2sr6OLE7EZc+F8x0Ic2UHfopODXFqZsZisrY=;
        b=cYjdSu7OvZt5no3U9lHCcLWL+nF/RIV4HdV5S/Kx0TbtHyEWZ+3jzYPsNINjkyjDQA
         I7ntOQtDuRXFghYOt/ZyerEvoo9/cw89a4leUa1GrBx8ffDmLYtTbaRegyJSioMPBLsK
         +vRfTi+PAsFRDUZ/zbVCpXDxjS+9rejMOC/GwAyOAdb6V/Bv+2qi3Vwx/wQ4Qk2Yw4LE
         GN5oQ9A04AIN1NjVuqm5PJPalv+LrDmbZ+mPWgKK8s9K6XRl0key937XRmWi0SgZ2Hes
         GTdIsTqFY9PIfKnQhgINypd5CKP3+A3kN5jOQB7GiZUsGpfyipjIS+cs0jr7+JzLKJw8
         PBjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783253188; x=1783857988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDktNqZ7Y8L2DLcqn3jCHWr50MUHEnzrNHkSF/XhY5s=;
        b=HxtZn8kNenVeGKkzkpGUGLnbUfsEjNmmnb+95256MiOXmFJINChzwZrE8yc8cAqn1A
         oqUFkn5CsQvDSxkxqTS+H8zJocbNKZ1G03qnOjRC4FW27MzCe3FVFwCnD5Y/nnQlIyXK
         SmywcjAE7ZImygUnGXHkU45mVxlwdhHOaFLTk983RZ3TrIewWQFzkhfcK6qEE1zhvGuH
         SIFEMQqqw7NFM0sk8w1PMTwVsMzT4cFDdOGLBigWNVVTM7z7XhLexql/7pzaZKuT6Uhl
         qNMA3D6dkyUgO4LrqJaOUJwISMgI3vn30EmiwldQDn1PlOsMQnKUqvAp0jxfYJCZXXWJ
         8LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253188; x=1783857988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDktNqZ7Y8L2DLcqn3jCHWr50MUHEnzrNHkSF/XhY5s=;
        b=tCI8wmk7ETJ8uH0WKsnfmiELGEis64cqxEbvBvVb+ovgsx7BTKLjHEIXFX79TOX8cL
         mmrmfLFBhakwDdrtB4pg6HyUgs/Ralbh1gvTjhiuPNcP0O2yWwsVFFUaZXPQrfAoFN3p
         v4xytmlEFwSf70EO4EoxaSpAMjGV6VxcvxJVQBepZIhmU9UMlKfmPgff5ohvzbeSIX6t
         NgbWnsfSI4I/HVC3ML0M7+GWVR3LSnY2YmCMhkd983i5fto4LYbAOmwt5ONAfrg04wDv
         Rp0WCJ+f5W4/wLhw0iDLo7CtzyTRX5TWXYH78ASbjVv7XkNkMOy7eB2XKp/YUwH3LMPm
         7bHA==
X-Forwarded-Encrypted: i=1; AHgh+RqobQnXsdwQLKnfaZ7N2xjzXUkmBBwiORZt4BhCkk2xPSaDJsRiQc4tnYC/w+oJNJaGV14XYuqNABEy@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLdl8uNUYzfCFZBJ5glHa7TzxoiBJfVfD9+JAlNWW7hFz2QNU
	6J1UXBHNKMkw8huNTcsra/qoNtDheBuCkHCvl62sRZhvBvXAUY0phqh5/yF3VpLTjmrBa1piIgU
	okeKLe5SrTjcj1qNQggon/l5/GzQ2YD8=
X-Gm-Gg: AfdE7cmlWK/rAHk0DH4I40dNzdnI3wfQFNS9kPH7F8OHDYS3iHO/yYBnIhpjLXeHl1C
	6/uqCpaTi9HSVm4Xks/emE0eDFKmfvsS5c2A1ZeGH0m+LzoIr9jVPqnnb2qrRBF5aDuF+Zms56s
	sa00JtoDw6b1VUQ9DVNEfNydue+Tikt+yqkblplGsfgEy8xlp4Ob4h3tMXIGStCnnXPfkNnmxKi
	zbtOAP4VExtcUIF1F4uMNwacsa6AUNvT/6RXpxdJa04QQ6AcEkZbqIjWFPnHEgX7gw0zAneaQTv
	bRgTu6xtMqVB5D6AlzBdT+YkQzaTe7BTrwbqr1U6N29Rjg6FXbSZqzffyBHP/7nEPHxO0SHx7s+
	FwkvHwNuQwKcp
X-Received: by 2002:a17:90b:4cc2:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-3829eefea08mr3983489a91.4.1783253188056; Sun, 05 Jul 2026
 05:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net> <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5> <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <akkGwsQg1k5ZfGwa@mit.edu> <dc3c0e2a-a3fb-496a-ac82-fff849b8ba78@I-love.SAKURA.ne.jp>
 <CANiq72nNz6Xo8yu0nyC3OLAJiAA9A86a7Ku59YX0GD-cVwJnGA@mail.gmail.com>
In-Reply-To: <CANiq72nNz6Xo8yu0nyC3OLAJiAA9A86a7Ku59YX0GD-cVwJnGA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:06:14 +0200
X-Gm-Features: AVVi8CeFASiYom3OLJnmAXQqP_soqXX7jAViDXi37UrXwfPqnHfS9UCST0g3HNU
Message-ID: <CANiq72=igqmSzOBQYO4RqeF6yFD0B0V39Y8S4reJBFyYbrJw6A@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, will@kernel.org, 
	longman@redhat.com, mingo@kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 2:02=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> is about the worst time to do so, and which did break rust-next).

s/rust-next/the `rustdoc` and Clippy clean builds in linux-next/

Cheers,
Miguel
