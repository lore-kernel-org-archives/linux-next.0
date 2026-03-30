Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361BE279DCA
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877563; cv=pass; b=asr7ieebpv7NOH1qlB5uY7i1zGMRO96ZV6TqpbAZTSd3iJ6J6PxpPoTwA43EoaiisRTSlwzsAcRko5qV2EnojBEB1kNVRNWznp19KtAw9ri83TBy1wPRpdVIl76BvWLfhDVZStSII5tbBjPo6pauae3As1CxaXwEKJh9siCRvvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877563; c=relaxed/simple;
	bh=fZSoa9dQJtH/fkKYF5cBHjUH+7Ej76kpMuBLR8vUqvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJB/+XTF7ldK5gTfp5ALOdWNVEMrR71szDdoe7MVCe7ZTrZPOwB+KLAms+eEQ60WJGvsL3tMmumi5GZ5ZM/t/2RfpMSUyXTinTwLXfukTDWs6qGPJbVIXwde6bslDSurIuAMIzGK5/RsdFJnhZ1SUrLTrCYBczfIB98+oh0e9jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3FElTQ7; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3FElTQ7"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1277863a912so520080c88.0
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 06:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774877561; cv=none;
        d=google.com; s=arc-20240605;
        b=CScnT3Qyno0DN/BRmOmXkzdaUWCH9IwT7AS//qrhIniezJGR1pSZBdb40r6u3bYB0a
         w9zR15XZupMADTdVIUOWTBeeNxBGmdPnT56heFfiJBSHkjPIrONpqne6PS9MtrtIaMz8
         23gisHv0wTE30PitzT3RspPAv26EGlZTB8wcZ55xCY+vhd41aYufM+w4vF9xJIj+zK1a
         E925oT6Ajar6nQE0w8YSniloYnr8gphRCv6iWnLst1YkAr/Nfkusd3qhmeAjujAEJLdo
         po5mqkKUtl2TEtWtk6COEt4EBKKwwBzInOdUsPSGslINL0C++ga2F7OrLa+b7jRFuN4z
         DswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZSoa9dQJtH/fkKYF5cBHjUH+7Ej76kpMuBLR8vUqvY=;
        fh=4xYptN7EfpA4SCA01RNolqTd00hQtCF+TVFIz0Y92Lw=;
        b=YGBn1pRJrwnsuHV7fEfpGLRKuC6gjiDDmP8DstFIy/aaebhR5Gb2RSbLP6wDmLSsgJ
         4Yp6IEc78bjJ20X4qiWDW44z6x3SYKAynJQSn/vKRwfmSX7QZtjiNcsllc6ZvtDKPj5z
         ITszGHyHgjz8aaTYpRvR/10Tcj8irU3Zf/B2DDTJz6luZPzgzCvkvEXiHiTxVECwxcik
         pnK9RGtETBfQmXzSHns9Umb6wrxeHRQ4lkdqth6J8efE+JZ4kfd+Skc55giZKv4usGtf
         AhMdWlv7fjPs14PwQoyFudCNyzwjngBhRcIQvtC5WF/No8lWbGgp+yxHIIDdjq80d303
         ySrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877561; x=1775482361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZSoa9dQJtH/fkKYF5cBHjUH+7Ej76kpMuBLR8vUqvY=;
        b=R3FElTQ7VEb5EZDFv58vm+oOHDUN8C1CYVICS1gi9sqQspdLC/oy2me5+ouy0YoWqW
         wKqm3Cbcfz40P7aPDp9z2UKMPb/onoLQrdION8mP846XKIe0iNoDKeFbfMSr1sE+Ql8R
         bv9p9Z9/29/HyQ0fpWmARcZLbL2IYvrooInb0VdmBNPR4aQkE/Oq1b4n60scwG60OCjj
         iZt3ubAtcQmWBi4DIGAyIfujdh09rGL2N6mHHBg2/g4SWVokjB59S0VCM+IX61wdzzx+
         SSYHtI3K8nMa218NiZ0YcSnaAGpDnv738JDSeX9VY1UZBm/CnkWlGALjDdcwHRbdowTt
         /Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877561; x=1775482361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fZSoa9dQJtH/fkKYF5cBHjUH+7Ej76kpMuBLR8vUqvY=;
        b=s/sEGWTP9l6e4eiMY9JCeyOp2VniJr/tHjQ8GO0H/cmd9CNWbIy2CS/wSOJXsvFgji
         RFUZbHhu0gOIEFjCJmgx919kjMJQw03HLyY3Bmi/rQV28gZDikWh+tIVtxZgT4rgZK54
         NXjuOHJLspyF32GAxnbh8XuRzgD2GVtKWOt4fg6GdLJ3TiJDpEPPXBbytiRI2sjc6G7c
         f5xHi+hsKTF1l0YsES2VIH2xKWYuJBLX3IFRlRoE7qGkxOF9+uItFjzUuql6HQE2oWdF
         3BREQxj2KrKCFXe+IAKSuKMR/AI/++JZI1DDfKLb/vZG7U2fz2+tmj4V5zSdRUs+qFg2
         VOEw==
X-Forwarded-Encrypted: i=1; AJvYcCWxHYXtZV2CsJVE6Wto9tDULt9f+gsGJYISGxv/1knloeIXhgUtbMpLOKNFGCgWOVSEA0P/MyQe9BK4@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQM1aVR712d6No5gnaCzbKKRCSngTPhtlB0hm6e2evMtcywJW
	3MRecbGvts83tMtiJogI2CgDP4bjVc8fBHocDSlyOlPx0E7lKsYh4Dii0nOfg3EXVmyvi3+opLz
	uC46mS0EGWwO6yyUjY29zg6Sf1SoCOCo=
X-Gm-Gg: ATEYQzwDLoOcJQ2vXqoL50vQKbUp/7HqI9gFeKWCkvxTBUIzcwU0ixUKAGpV4CMPg4Z
	gNhoW+zBbQAhoyLTL/4LXdLDLQQSQVIfdtGn/eGfpV2Mop41moWYLV/2VnZ51g4n54ukr0nXvuG
	4HsmsIygmwED0qXFh2dnoqS4GVl2VEF5MYZOK22wmnWVDV4TYbO+9IMcGvoVxZLED2Kj2KV/W4R
	/wixux5qfCtYJfUA8Zx9OfmQiGjBBdnOmoDUQdwLNBI9yDfMb30sE++cPuNAPGcNDp2K4166IzE
	oLYfheHeiPsbo7319iMWUEJGJLeun8EOXW6v5UtGIDC2oQm+edT/FQ/3E2vWxW+H13ioy7zlmgt
	JU/dCg4KODYYdN3DZjLaDgzdoYtefATEHxg==
X-Received: by 2002:a05:7301:fa13:b0:2c7:2cac:814c with SMTP id
 5a478bee46e88-2c72cac8bbfmr343759eec.3.1774877561366; Mon, 30 Mar 2026
 06:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acp4AY8W5_jOo56Z@sirena.org.uk> <DHG5G61H8WGB.1UL0YPOVFUWFO@garyguo.net>
 <CANiq72=MZekuSDBDrWGPrJS-mcFm2V_WabdrsNn8bzOQFUDQyw@mail.gmail.com>
In-Reply-To: <CANiq72=MZekuSDBDrWGPrJS-mcFm2V_WabdrsNn8bzOQFUDQyw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Mar 2026 15:32:28 +0200
X-Gm-Features: AQROBzCNke6w48insD02DFG3O9FKL_gLDPXbm7FqriFRymVs87vV23DCXHtpdBU
Message-ID: <CANiq72ndg8Pk8ywK4GsOxXcb=OivvyTUeemaaiQY9TkePrQL-Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
To: Gary Guo <gary@garyguo.net>
Cc: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 3:30=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> should use a period instead of a comma at the end.

Please disregard that bit -- somehow I saw a comma (perhaps recalling
the fix I did in `rust-next` for that commit).

Cheers,
Miguel
