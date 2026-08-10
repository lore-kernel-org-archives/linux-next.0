Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB831443313
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397121; cv=pass; b=e9omSUPwqkMHe5GiepPER6yfjV9lvMmyKrTO3M07rjdvf7gnSJBIjmsYuBgOLEqpWW9cHGYTl52Vjih+pO0iyQzAVOWbhHUq24SWjoCIo2xH7YlyNb8f4HroUXRTrkLtKRql3rDrS1TUevGaX9++WdaOhSOUoNTa7ciEOiemJuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397121; c=relaxed/simple;
	bh=xzG8TQCQ0GfMHqNyrSxXf0awA/lqMkjTFbO93w8sRBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhglIh6Km+WbyiQBkbZ5inN9bdhtsajmpjmIjhtwznmbEHMaImlMly1wt9qviaDBAwYy9jveOaLmHuM/vPGTDtEc/QjV/+d/YDh3vsqDgrL6tO1wvSFIuIkn/YrPdw5OR27wcQe1uQjEaP+92GZHDRpXK65oPqsitaognHfRrRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THx7JLi+; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THx7JLi+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d01548ac96so3403525ad.3
        for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 14:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786397117; cv=none;
        d=google.com; s=arc-20260327;
        b=lKmkL1FWWzNOpqGl6vMkDt/ktYoCW2I8tKDKmbodC9bEdkUWu8B1PcjYuASWv4kmR0
         hurofLzMm/kaPxAIpH4nFkh8EuStRXX4gdp74FavSykIixWpDjeHKrGcHZt3ifVmFXTV
         zOomdAajLgTAyHJxU7O/zS9c8qz6qSYLKOQEhfobd1jZiUGt0n+qKWqF5DJbXps3ulGn
         Ov0bfbCESDW8ITDSXADimwOjLEsI2hEo8GEH4a0eSfGvY8ra2P5QDYCro/L2uv4o4J2u
         6h3pGQIqd0Q99RcxOQlOm3YlvC28ji2EwFIlEySHAJ9ktRuP7/vhCLkVNGWQXgMzs/zv
         WVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WyoU5JSLOo8Y4Tc4+91IS8nPF+gerv3dC51jLs9ET9o=;
        fh=zqhgpcALYemqFjQfa1zIZinITr/a32YA7YOC691pEAI=;
        b=nUc7i7B9tqWH3ZROqheMrFKP+P9AwyajMagG6v967i4LCsAHIqipXZSkrpJ6aiVLj4
         6pRP1luPz0sRYue9A81nn7t9X4Mvs1W89aJypjHDHX8gVottJ71DJTevh5IEaVToB0VH
         vUb7cmm46zGg4B7AMf+y5Cc0WpsQgXiFrEUzPRXmLeZVHyPS0UoDB/nlEWs3la/RMqd0
         SdaZ10k9Pqvm4FU/RQE3OnWt7LOakoLO4yweZVENqgDqnQFdXT3/CJkIzpGMLo5K7l7I
         zM6fh7EXgS9Xtbbn1MWMQQHllV+cpvTqcE3sYlZ3X8gL8tL7GNI4CwKhuJCqgXgc9dkk
         Fmmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786397117; x=1787001917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyoU5JSLOo8Y4Tc4+91IS8nPF+gerv3dC51jLs9ET9o=;
        b=THx7JLi+pn/AsivxkJRvxt1m3CDQodsyRfhBGHTm9A7zq4mMfBbJJALH5qlFO4z4ru
         SKRPr0Nkz6WpsQsvfP6mTWtm5YHmZtVwMyqH4bIo8fbNUeJVjP8pEUm5DDPlXxg4x1N2
         esQ+gaYcxz4hnQ8eVXqj8431Nrq7Z93ObPtT1gqVchS3Vl3GrrchZDiVr9+kqRO/6bfd
         Ipoe/bkXrrtH/A2DLOPPUWB1Ksn4PYKo6Q8z5XLQBePElOrM+UjBJEUT6AXS0hvUpXoL
         l2B8k+oIPlLvx30m7Wlhr28Nqu5zq6TT4Exf4LXpD/0diqN+hbV7xUd8Wj9+Zs1dl/yi
         verw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397117; x=1787001917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyoU5JSLOo8Y4Tc4+91IS8nPF+gerv3dC51jLs9ET9o=;
        b=jBV+eD2/+xUBpNHJVCW33q7Vg8Fg6PjmQrhPAJaOaOADbZ6BXvKuobgT0tiDqWBWd+
         Hj2SoJCXKc5Hh314dDO/0ByAUuOIm0EK89D9OiHnBECLnlEN9kot74Lhv0DEx/1HIwUm
         agYJg/v8/1HTMzMw4z202V3jT7jPfIAqtCoCSMoWcnf/q1AwHaNXC5vMrhRvCXlYJ+aF
         MOWXTeuU6h7tCiZ+GmtrtLodtJDb/H/KFNJ5NA3RdB9jcSngoELNcPlUpF8yG6oEXfHn
         aNGgH3jo1drd+1o/rEZoktc005Xy5Jsr67efjMqiohpcw6SrwR9ag1U9wPwVrYiTasvc
         GLWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVQeG3mfXB23lxZePFhmcF4af6WbPruCKIJaWgpQ8CD3CsinW755xOYmKIFuyhgvLsuP1AsmVsVHcg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/AsN+Tw9GjIWEVYjvn1WJixyc3lAUNsakPhhZ2KoPxA5yMg17
	e80RRfTKPqjBARz1ILyi/414Lgmp3xcWLw4NMEOrSo1NholgBjxCPt+yNDsWd/fUUD6cCkupSW0
	V4xm3/GAXKZ6RFzmg1g8+O9mdmi+oVes=
X-Gm-Gg: AR+sD10UQsjtzcRK4jHeZIA6sDj9c4Zi8aqjFSmuhKaV1V7jsBzK4eWXm7lIO4uX3lF
	6k/UBhXO2SIMSPSYIwpVIRtutjyMulctiM26qkQ/eIdgMN7Wyu8+urJXoz3uHQD9SKobr5EoOFw
	Omx5OKFJloaD6Xc4CdADimzWkgHBpy3kFx56wd9KnvvU2XiGO4ZKQkLsqouDlUTKUUrzHHZuMrx
	P++d7Bo1prw5xL6Njs44we7bthmQnTxx+b2uk7wSfYQTpNE1UxObL56nC4y31tMdPGHCeLqFLp6
	fM0q/PxrBR7HrJJ6QjvBDLTNWCSjG/vaLZMUi0FxFx8TOwUzSy1SZrNrub07up5I1lEyAqoDZ7g
	3+Xl15LHzKezRn5yCZ1vcW3vf7tJOcEREWwUWVeqn1B2nnUIeL7ZcPQfYCMuXTid/tevpF+Q=
X-Received: by 2002:a17:903:17cd:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d0ca7b0285mr357288375ad.1.1786397117199; Mon, 10 Aug 2026
 14:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anoDGk0XqfBjHfUn@sirena.org.uk>
In-Reply-To: <anoDGk0XqfBjHfUn@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 23:25:04 +0200
X-Gm-Features: AUfX_mzkhOFr7kvtn6vgiKcHWbZsTyN-n5uQ-f4JcBHohWyEFHK7xtRIrpCJlVo
Message-ID: <CANiq72m+J4DA54p9=REf+ZJwRLbPe9eHonXx766HBQ7S=9aB-g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 6:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   rust/kernel/sync/rcu.rs
>
> between commit:
>
>   d8973c4754437 ("rust: sync: Add abstraction for rcu_barrier()")
>
> from the rust tree and commit:
>
>   1fb92e0625596 ("rust: sync: Add abstraction for synchronize_rcu()")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, of course, thanks Mark!

Cheers,
Miguel
