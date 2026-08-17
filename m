Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72803E5ED6
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969866; cv=none; b=PDQMXBvoP8QUzmcJ6nmCkZtR/yodITOZxE6lHOo/LMlAEElDnDOuLWKUyCm8LYb7D4HS/lwLAjoeV2TH0Q7bt1gtXsy+Cxijxq4j5/JbvOiL6Mh5a4mrFYQL3nM+1hpn8ilZhvqrOT0mcradl/oLqdfDxVw/K+RJ6kiYjDEJpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969866; c=relaxed/simple;
	bh=ZenrDbFhrcaqxx2s4INBVoRKVj+zSYeRh40AA5SqWLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KeDmmI7fGic+ZY8e1DwqhqLz0KamR9h8j3Z9apgk0iIhYLnYtE8Chlq+vkb3ZYlv5Ud+L4sOGOZwO2EQLyZ/YZ0mkd5H/QwI5H13VYNtEkWgeLYHFFjQC2bLyuGW5f+jDrG7Mnp96bhX5euWtfYC56Pzg4eeJ7f+qyZ4g6KLWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re7/c6ra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re7/c6ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B69F1F00A3D
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969865;
	bh=ZenrDbFhrcaqxx2s4INBVoRKVj+zSYeRh40AA5SqWLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Re7/c6raBuhU3aRk+KJ1zqFBPgfkYHoLP6rv4nX8OsvLYuVj7QqW6e3209JdIXOYA
	 WEE8TFLspT6PuvD2O6MyqL9/a0FWS1oAUj/fGbcTTljldCCJxPaUs1Swqfm+tGLz3c
	 CYDBE//ihoJ8dzPRW+qjhH3N5O3JucInLsnIV/ULWX9+JxA08rqh1+j8Mlnmg+7qqi
	 +qUmv9Gy8mu9jVd1CR2IVuNOfCsaYiMm/nWEDl1+hSupWLNASAcLrianOcJY2d0fQr
	 grIORkpzL8wPtkIeeKWROyZWFhpDuifRch+L55gAj6xw0A8hNjckIqHEAPDcgtEBHF
	 CQMB4a3oT+LKA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-836c4474028so31631217b3.0
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 05:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrxrW5o6AmS+6OfZsFkpopqhMopZgovjQ3CoWhzGE52AtBXw891wCYujcvAunNK8m2vlZxZQ8MxIk6R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4NHtxrqVdGT3LocEf8AmlPTqQ6rSOoURMKa6qYqVPtoeqSI5t
	hFDbPf7BBISVVR18WdoLfcPhqfDW58Wi3MLFC6Vaw2Q2BxSBqi64VbINNHR327iELRfRFKs6z1L
	A4DFD28PZKUgvOXq/tkt0+C268r+JG2I=
X-Received: by 2002:a05:690c:6993:b0:81e:6fd:93b4 with SMTP id
 00721157ae682-8371145020emr84957397b3.19.1786969864807; Mon, 17 Aug 2026
 05:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aoL81uZvygzqoSd0@sirena.org.uk>
In-Reply-To: <aoL81uZvygzqoSd0@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 17 Aug 2026 21:30:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-XTPbkLxxVhWde7qtNiubgrY5TFjxmvEX2V1rkggAw8w@mail.gmail.com>
X-Gm-Features: AcwNN1UQnOM0hNoR_tvfivZGJ1CAA9HNW9FWlyZpfzt-6M7p-ciy5CsnDjsz0GI
Message-ID: <CAKYAXd-XTPbkLxxVhWde7qtNiubgrY5TFjxmvEX2V1rkggAw8w@mail.gmail.com>
Subject: Re: Missing signoff in the ksmbd tree
To: Mark Brown <broonie@kernel.org>
Cc: Steve French <smfrench@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
Hi Mark,

Steve is no longer able to handle the ksmbd git tree due to his health
issue. Please check the request email for changing the ksmbd git tree
URL for linux-next.

Thanks!
