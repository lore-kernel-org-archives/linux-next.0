Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA936A009
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772060370; cv=none; b=OZFIbau3mAChyQmt8fDU/gwQDtUuBCJGBkUyKoK0TA+R8zr4jf5u0DaLpdpkOltuHPBZtc1RpoIK6OS11IGKeYyuuTmOo1yKN7gkFMsgvyBK/m725skzkp1npTvVNdsFZX0uMAnL7C2s7IuNBFGPjnVN9FPttHnpjoQYAO6f0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772060370; c=relaxed/simple;
	bh=LqLSncIngiS4ht5cDmLUZSZ9T8LTdfEfVyx0SS2kbZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/gpMLAp9oaAz2+CjiWgyQ2baOtVGMSd/HTruXnpLyxtccWLQ+ZonjA7+rGUkt1d0Ftk4FN+vXkq2xvkpojICKQHzbKL+VgK9XJPO7SSsLjMEWsbT14N9/ye8dwRrOCcbXMpdBwivnXRspuXX9b0mQhtn5FGQ+pkBF8v20/rXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azAdxEHQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azAdxEHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980DEC2BC86
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772060369;
	bh=LqLSncIngiS4ht5cDmLUZSZ9T8LTdfEfVyx0SS2kbZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=azAdxEHQeZnLJxTpCRV5PN4uIkGbhEJxwe6ZzrH7B3VwLmkS5WuA6eOM8wow0K5SD
	 fyHWRTjZirRCHIwd7r08jfGg9OyCjyl6ONdPnoZV6IflMHmjGPo61dSd6kZPFBmNOS
	 OQLk9iwZshu3FWRQSNic2nEVJtu7AsxsgK9hwUdXUuNX4Hg4QReVbNljkqneXDUKEE
	 j84Q7TbxsIW6qoxPw2n/gOUBs0/69EpLKRtllplCIGnIul+jL1t4+kUgnk/E4h5W9s
	 4nYAiXzlAIROoHi6JpJPOfWtdbdoGnTykj7+whKKWhycK/fZibdJBQJOB+v6ZwGiZT
	 0gvo/GcDGzlMQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65be78011c8so387878a12.3
        for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 14:59:29 -0800 (PST)
X-Gm-Message-State: AOJu0YwRc/8KyMfFvQIMAZ+Qpz2Gf9ulfEJxAnva3ychoMIQ/2tRekSV
	g6tFH+Bwakf1lPi5IC8bofdfbTATyti55SFNhZQkqS+ruU7lKCg+UxohWVmOwQr9r9uyaPdKbtt
	A6HIZo58JoQYxJHq2dzpVlpGm5ZMTRWE=
X-Received: by 2002:a17:907:3d4b:b0:b8f:a449:e362 with SMTP id
 a640c23a62f3a-b9081a277d4mr1100241066b.25.1772060368114; Wed, 25 Feb 2026
 14:59:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
 <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk> <d4e59537-f51e-4860-bc66-8fe5f9f3e66f@sirena.org.uk>
 <CAKYAXd-M+apvWoQUD=ucj0zhz3bN=Efi0GV8h+LtEhQZC4PU1Q@mail.gmail.com>
 <ecada199-b746-426d-9207-c2d6da2c2034@sirena.org.uk> <CAKYAXd-HvwQXeLSL3bE4ie9Ce+WwGnFW0FPwSmM3v+d3Xv6tKw@mail.gmail.com>
 <762c325b-f43f-4e44-80d2-c52ebc9a00b5@sirena.org.uk>
In-Reply-To: <762c325b-f43f-4e44-80d2-c52ebc9a00b5@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Feb 2026 07:59:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-EmzmO-xvLPeHedRkbPg_5CegMz0tVjd-9XDUDwoSj2A@mail.gmail.com>
X-Gm-Features: AaiRm50k2dA3IE1oy8ZTsWLo_REqV4cK27NoKA4CvR6I-Jkxj6jCZfqt_afB9PY
Message-ID: <CAKYAXd-EmzmO-xvLPeHedRkbPg_5CegMz0tVjd-9XDUDwoSj2A@mail.gmail.com>
Subject: Re: linux-next inclusion request : ntfs filesystem
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 1:31=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Feb 25, 2026 at 10:22:34PM +0900, Namjae Jeon wrote:
> > On Wed, Feb 25, 2026 at 9:41=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > I checked again today and it looks like the tree wasn't updated - if =
you
> > > could let me know when it is that'd be great.
>
> > I updated the tree and re-applied the patch last week. I just tested
> > it again against the latest linux-next, and there are no build errors.
>
> Ah, so it was - I've added it to -next today, but not fs-current since
> I'd already done the merge.  It'll be in there fully tomorrow.
Thank you very much for adding it today!
