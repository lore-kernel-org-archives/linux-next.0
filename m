Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C241EDA32
	for <linux-next@vger.kernel.org>; Mon,  3 Aug 2026 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785744450; cv=pass; b=uQghYQR2WhEd/FEkMNfehXZoE/uHyl0Zj+c2XNttuvyNwZT0S2qohbNfNPa0uM0Dt83lEaTq0u8NBl1a28IqGwyKEHi/hrer3EY11FEtHY3y8KZgnGJfJrWDy7X6eWLb9ncwpwtcqDTozEOWYZHFnThPTJfB2g2RcbKB2JkF7+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785744450; c=relaxed/simple;
	bh=X5lb9wQ5IPsxjk1ZmEsbc4rMTk9llNeuOa/27MrvRFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYMtABltJ3b/g+cCtZrXf4aRYL730vSmDxgJkRWg8PydoGZ9RdQsBMvxTW1xsYY1ISxnu6w9NN/z9VQ3x9Sjxq/7KCUm1R3GNX3oItpe9EK/dKrb+PdoYVB512nBB4iTHhZALQ+7rv8BTaTLkNuHOEZBVcMm38mQXgbqgQK9RNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0lhLZT2; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0lhLZT2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cffd93cdedso4210355ad.3
        for <linux-next@vger.kernel.org>; Mon, 03 Aug 2026 01:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785744449; cv=none;
        d=google.com; s=arc-20260327;
        b=fDp4khVs+YzKtsJQK4F1v4sZErbhawCoy7zrS1WOAwjvHf1lYEBTz2kMSTOFWrFMxV
         fYvfi/XDSfGSwt8VdMl0k7vstwcL9e39rx69U1oO1NComMJj14/H0mxnKnfvc+Qnsjp3
         MGt+9gcfU4va6YGor6C41KY+Q8HpSmbHL88E2CSMQ+6DY3qTS9aIBR3ckVR4gReXWBYr
         mo49bT3QTReIvtBSdRzxiq7vb4T3Dawj8vo8zKft3OAAiLKJ2fEOz5yJ9iQgBTGddTER
         GpO33Ci2DE374qVXmFyiAvBhPJupHW/76l1eBSe+Wmfit5lqCQ0q0uEEZizzon06olw0
         aAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X5lb9wQ5IPsxjk1ZmEsbc4rMTk9llNeuOa/27MrvRFk=;
        fh=DMoA3hVNvrvCRUTGm37aXxpxenymXfwnmj3bbAiPN3w=;
        b=XcCAlHiLemvF64VQ9rF5rzPN9UJlQVawgEtlKAVKIvi75jwQv5a3E9VqpxAP4bi+Y8
         AeQ7Kf1XeK61f+3jLLI3Y5qH9z/PNFlqkuzc34J5YCVD1U6Rw5/k/7Q2vsymsE37FrSq
         zcjZ6ca2GcLR8yyBXOpB8fHfMZadngQRi5giDgguKTag5EJ7A4SDf7/MxJSUoRSbbMXf
         ujy77REuH/clk6bKXYiRs8AFjo+HrSBpWHO7HPCKD9UH6s6x4df59WqBHu7PI97c5TRF
         3FtmRUkarT4DXs6RflYGoTKEb+gXT/E7P3Ss0NRzeWrHxZXyJttHri/Xtx44Ii1oEUyQ
         dtjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785744449; x=1786349249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5lb9wQ5IPsxjk1ZmEsbc4rMTk9llNeuOa/27MrvRFk=;
        b=K0lhLZT22DaYBxh2/Co7nV5JVINWmmPdATWRwHAMRIXLiBW0A86yrD2ClmXb2jVyI+
         paPmADPMy/FdwtVqSKS+nD2TxyxDIZ6KJFYUWHf8IsRxWj7ERHi3TAoRwfiohvi9C+CE
         7YpaQ9FPggBM+z7+Jb0JdWLhVgJlegsjkAFVby5NKcGKTKOmJ9Eg8XUdvqru/p85+F4E
         oXyCCVmmUbQ+6hOAl3DEOlFNzy5xXeWa+CtmWohFy4WpkLKLfa5T0nJE1NnrsMySFG+s
         PO+B98zizQdwc2DJU11+F15J0bhDIVgXppnsbZqL00OiD6pEN8gsNBVtcUvsMBTX0E4V
         Rv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785744449; x=1786349249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5lb9wQ5IPsxjk1ZmEsbc4rMTk9llNeuOa/27MrvRFk=;
        b=gOsGXAZeNYoKXVEf+h4WsMPMti8cGyWfF/CuGn5Ca5axjOFx3MesqzidCsvMbbmfrj
         AUEYwFQnrpK/z0bTPwEWm0QppWRSRr6Zjv9a1sLLL3fecYmUu9Vi1kgEevxrhdpia7ge
         B2ePhRySeBV+8rpvX2pYMjPyPSrtZrEEMDOPpGPzmttbTM+cbyddKB+EwomvXMOAlH81
         S+hZz7lq/7/qxXuDees4/OXBJtd8C4bTjQSBiCtYtHQEQ/kCMTibRSQFSmVWVwvEZMXf
         ppLFni6NDIKrBZ8MnPVOM2JS3ceRi9lIcIH5qppU4ON7we1nKDDLisWOBBqboyhT9apc
         SroA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/JsJTtPW+PfNTYp7nZsmbryea8Kg/qIOU6PyHNAsO1/Mjwo9j03tW7EEqEf1bdLVmoWXBd08CJBwy@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEBx/RJU3TqzsIelLeXn0itAUmTjbbQuzZoGEhc2J9EDEHeG9
	4ljwpJaMlLgmnoYLSkmVToLbOvM3c5ZOfkJPo09X7ZbH6uX9aTFOGft79zlKRTLQOx3Iiq0YOIy
	20TTNQcD5KvsJfbkCrPizMyYbr/Kxt8A=
X-Gm-Gg: AR+sD120CeMUQj6HzK5l+MgFUKN3fUl3/47FGfrHXr42S+ZGRYYL3dlcYRbXiJiV7UJ
	BwbhwR9OrhPrMujZXolhR0P/uy+4LmDOWBLIKs1zrL7yrdYBUIfHJmGUOhn8IWyrgEGwUH2hOji
	pN3yd4ln0SowZk7Us3M/fMVsS8cT8w44Re1BOYAfy27H7c/Vp737mZqod0G6xLA0ElDa+/U3TvI
	sgKfGC6+9F0CM65muz2TbM9hRmqsJNxQlhR1CnyhCOFo8nywAj4lkTqXhKkeIjrONcgkQBuW6vS
	XrGZYMiMmAHQjWC25WDWYFIxc8phzXllYSzWTd7j8ObfEvm1hw8UdomOC0PTapgFdad9tFCxkxP
	ARPN/Ovc0k31vtGt8Ih88dphaalVaUKZfuosrenKrSDOt7t5BmI4dPmJfh3lB
X-Received: by 2002:a17:903:46cf:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d0523bcf3amr132427385ad.2.1785744448943; Mon, 03 Aug 2026
 01:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amth-CMf3Xz5hR32@sirena.org.uk> <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local> <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162> <anBBhmBSwLgcLjht@dev>
In-Reply-To: <anBBhmBSwLgcLjht@dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 10:07:16 +0200
X-Gm-Features: AUfX_mxEl8_laupMpbzesSOebH20A-Ut4obiZMlcxAzC4YJCDRHbqC3vpEUNurw
Message-ID: <CANiq72=-yqp1JDHn-ucDpWcx=wJ7Z60K6am6X84OTqNiR6yytA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
To: Harry Yoo <harry@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulmck@kernel.org, 
	puranjay@kernel.org, vbabka@kernel.org, vbabka@suse.cz, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:23=E2=80=AFAM Harry Yoo <harry@kernel.org> wrote:
>
> What do we do when it needs to be fixed in the merge commit,
> mention this in the pull request email?

Yeah, it is also good to make sure the resolutions in linux-next are
good, so that they serve as a point of reference and so that
linux-next is testable etc.

Cheers,
Miguel
