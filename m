Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631D24248DA
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535181; cv=none; b=t8chP8ThfxWrf9KEP5zRdRTSyFRVlNpEeog40/I6KWMa09E85xOhoGNdW4j56yCe9YjSGvro5yfvF1PHcnFYnzt/1rrSmlHYjCGJg5fAVOLmQckW6RnZPkJuY3mYr2229tBZTmk7exHfxrGPTfKUaaesZc8gp/3jgSXi0BlCt5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535181; c=relaxed/simple;
	bh=rchE5u8VSUZskhzAO+miNNScJA7MqLswi5CheczdV1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKED4W0vj3E8P4oGmlAiWw4bDFATKbKl3lc/nnqFTxH43n3CnJzSZ11HTG6KCMoJSuUL7jsJCTAQiQXGu1KU4brZMHIoRYvU09yLAYiVsF7imeF8i53vsSa0vf6m0THy4fvVB4zhoHHgWTXuiK57VPgSwBOlV40NNPT1gbvF130=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YarXZQ4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YarXZQ4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153051F000E9
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786535180;
	bh=O1518Yc38lOM7aj8FrnS8cDCbr6lNwMopZIOo5jRgpo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YarXZQ4zKxXpUSeHmiJ+l/n4UXPT9PVYZN3PYNvqaKXowsv12GkxfmMmRCd0p9MC0
	 SQyKtN6lN5m+AXI3iruRd5ANWR6AjncPVajbSDs4HK3XmhgQvQd6fq/iOSpNBHHRVr
	 Kt6TCPB+fsWvkXoNGs47D/24oD84FaOAONzJxvlbjemaSFU7svm4XpI9zkBTfb18mX
	 lg2ws/yNwNZinMIGVBu5W2V3/25XDY0Gwv+bVv2ON4rqTqXs0TSoKMY8xrPyCpIJ1J
	 Mm67cMrPveUskFZO6BeELwr3lAJnDq1iVFxi9ydbc480oMQyjXSmSG5pD5TQaBs+xI
	 1E1s/AgIrQBhA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39faf9e2c62so5830111fa.3
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 04:46:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZRRz4AKWyRMN9OJOPRinYJUOVpmdJxJ+TpB4ET05H8+RcwW3JpJjPcXK6DQsbqbpNUOwgGi2TacLs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/D/f4PDp68wMIECNNhaPDR2u99NofwTLZ1o0wZ3FujIWSEyO
	FTkOdYyao0imyChc4/V6ojgxcgqRomrB6p8JYQjERFn5rI/z3KbdmtvSBbk9OPMUGm6gRMQdIaw
	52kSlF3C+ybGjUZ1BvG6ByQXafHpJ/CA=
X-Received: by 2002:a2e:bc82:0:b0:39b:d04:b778 with SMTP id
 38308e7fff4ca-3a10d4a100cmr4737681fa.5.1786535178546; Wed, 12 Aug 2026
 04:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <annVRNepH48qe6b8@sirena.org.uk>
In-Reply-To: <annVRNepH48qe6b8@sirena.org.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 12 Aug 2026 13:45:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i7pZCi80w8sOiA7F_w52-iqNoVeX_DTDTEjgAptOMobA@mail.gmail.com>
X-Gm-Features: AUfX_mycxnkWFLMjsP0pgHjrHuFkxR9wCvN4KQZv0JXDUbvaX-bl05gKbpNKZGc
Message-ID: <CAJZ5v0i7pZCi80w8sOiA7F_w52-iqNoVeX_DTDTEjgAptOMobA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pm tree
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Aug 10, 2026 at 3:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> make[6]: *** No rule to make target 'drivers/thermal/qcom/qcom-spmi-adc-t=
m5-gen3.o', needed by 'drivers/thermal/qcom/'.  Stop.
>
> Caused by commit
>
>    948ee3a74f356 (thermal/drivers/qcom: add support for PMIC5 Gen3 ADC th=
ermal monitoring)
>
> I have used the tree from next-20260807 instead.

Sorry for the delay, I was traveling.

I've just remerged my linux-next branch to avoid exposing the
problematic material, so this issue should be gone now.

Thanks!
