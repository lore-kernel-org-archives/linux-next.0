Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974B33A9E5
	for <linux-next@vger.kernel.org>; Tue, 10 Feb 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713811; cv=pass; b=CEBwOvV31gd6Hmwru+ne6XOAs++BDgU/2ahzYTVkJ0VUgvoWYydY1Q5bGmSOR/yiin4df91aDv+GiyJq2FFdHKi19xeORvqquCMSqkkhmwM8/N4atPszoAgVqoVV7QR/0rSKK3uD2sJ1n6bQs02/X6Q1L9M4dBmAh2jh5+IMsps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713811; c=relaxed/simple;
	bh=aXBxYbeVhZxo6I3+OIVlYQrgePmLDGWZfPjy2dNKowg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CajyOXq65loKhOh+k0DLRV2HnKF3XV0t4MewAaH1H2eel+zPjgUUkPr3R0pfKAE3dl/N80xhKreuyapVGTaRNx+6AtdouJABug02Fv3Off3AxOSMqptb+bWN7YBBuxQAIsHzF7O6EMOZbMIwBKEI/EAYx0Hm2ysRWKweAETPzmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwoHZKFN; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwoHZKFN"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124b07e5fe4so377430c88.3
        for <linux-next@vger.kernel.org>; Tue, 10 Feb 2026 00:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770713808; cv=none;
        d=google.com; s=arc-20240605;
        b=jBVsQyqofnnV41F8opKLS11TTImHyyCFilrLi9ldbbofsW+Y0p1Y2OkCmp+KMg9CFA
         w8sTRvTKIt0zH3FrxjDA54qeeSDqo1pGWGaXIwT060ULnboBXiR4mMpDw+R5Y2Y1SAvA
         Rs0m/gZzHkU6wKP2wR43Z4mqCzs6y2GQ0nI5gYWZuyGPLe6wb0YwnXfXpD7We7RNETeR
         qa1v7daI+LO70hLdw3+7+0+qawlt527eR8tXgf04O4LWxPr6BCrm1frNsWLUYhI9rhHo
         tkHzJ++zBRcQuKyk2ZrvH9jvJHwxDdAwcFcRH6AqOR8cO2qimWIPBwHzjWbBjB8jr1CL
         XmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0TbjqkXCG8vCO0P97Z3XLOfGaNWuyWnyzx2yegPCmA=;
        fh=HjJ+tPyDwbf3JCSDod14VCHBlpjIpkJ3BI03+Ov3b7k=;
        b=CLRmlqTE9xkH3GuQknw1iWD2KfHIxjf9eVqXTPPLvIpV8/i2+Pyn9xUcXAgXDQ3uL8
         pkA1K9CdUq8Y+S6mvDpGIA7d/kXoF8rpr2TZG9vXFQ+UZoOsW+Q4Gk3sx3NudQ3is9mj
         iys/otmsVAc9dE5ELCXUf3D9NovTrkW8f8Fb45ZpUMTT0QhYEdcgDAUhJyiPW5c7l4Hx
         y0Ody5CFrUU35yXtXtGlOfmPRRjF57JIYViS7GB0tgIoN4YUtmNB45RzeLlWehLf3mv+
         2+avRNkZAgM2iXhFmdKJHb8raUScU+mG7LCfQempvWzkCkEm1YQ7EvyPqamDnFSt3nDr
         0B2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770713808; x=1771318608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0TbjqkXCG8vCO0P97Z3XLOfGaNWuyWnyzx2yegPCmA=;
        b=bwoHZKFN4OtaX56U5SnDa2uG5nngOkA+ncUaq9AmIusMKkTkuwv9+xnveE7z9j+pj0
         TK1GSoSWTagKv1lLorYDKdGiHffj+YrO4uqSxYla6rYohMFpaSRV6a0zKB/7Kns2efBT
         yV61bsBK/KWkgrYonb5NdZcQM6qYY1tnsTa+6aHqKPn2xB8SPMRl/Rl8SHHfoDj5+Aeo
         rDZjsojNpI0b6sDT+dJT2pJI2YH7zwKlLXYEFxnw9OqHzfw2skYerUXSZoNdYhxXdlSq
         LFJegnObhq6aIAYKQGrt3WKgCp2kxCqY8M4h+5TBWIon/RfT4JtKCmoTc0DdF+g78rg1
         CfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713808; x=1771318608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0TbjqkXCG8vCO0P97Z3XLOfGaNWuyWnyzx2yegPCmA=;
        b=YcxnbVytN9t+acCJ7vQy33A1HjpZxmVbC8gd5zdZqGtaefIAggh+bVBmesvQjXm8gi
         cENEN/76FO9d5TzXLZSBJQXN4ieJUeney1hiN2TFvW0PMTF1uF3aQB+63tPS+weItGL/
         M1nTIdqiM5aWBJ3Dlh3Gr1AE6sjmCaP/0nDn3TlgELBkSpxKGYmlyrKkHDSE5pYPv2Ag
         Aw4eiEqUR4iawDI4JwyXS/p6Aiastk47rjLULVJGc6jFapSJsWjmJrKoI17kYdWFLtHJ
         juKGtIOPS7zgE6aQBJ2axsIRZwzRkLW5w0ox8g9TWxZCtQSEKxu/sdK5D8di5KyCIHRz
         5u7A==
X-Forwarded-Encrypted: i=1; AJvYcCWVGv7sRsJA5FH5dMYb1oDiROaEUpxOBuQJbR8ktLJHBZvckFqNSyaRZUclF6+2tiJEE2vc0YuswO41@vger.kernel.org
X-Gm-Message-State: AOJu0YwBLPx/0BgKRAOP/jCQM9v019CCv479P4q6wXAJpGjVm4aZkFic
	dXeJ6suZTcp23nFKyHzlImufpIZwZyOWJUtM+4ySdbXwKtWfXK+9H9kY8HIuEDJjYQgrIXi01ZC
	R6S/fF3VOeLaapyXACX2e2Tvl6NFyHlY=
X-Gm-Gg: AZuq6aJFryE2BsS8kcfG7n6o3nlI9rLsm8cCvTgQZ+a2OFDIKFVkSDZO5ZGN5SkYqYO
	uSe9EKdhdU75sFbBppx+GWEYZAY540e3yAMs3wT7tOHDOB/EWdI4ppoUY8w7Wxl2RuYEdqw/Nzm
	SjeTT3obx6s2D0LPQfAeggfBo/2d/uLhMEGv523uCooFLh3C5ffSpGEVJInnUpkN5DSlDQUJCmF
	IH3j+dN1FZNC2HbrZUbF7j+/E5WzgSb8+G8J0sAZt9poT0ALPhWNYx1b2H68P1qionDcEn1nO6S
	IrsUAUMn1tLLmp+omyCUjMT/SLCPnTaYCJO/Y5jvt33G/q6ykJdBEog0tpYa78jfoLXnOqaAd+X
	0ZF5Poiw9q1fTqEZbDWFlNrO7
X-Received: by 2002:a05:7301:d17:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2ba8caf671fmr212585eec.0.1770713808366; Tue, 10 Feb 2026
 00:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209140533.194251-1-9erthalion6@gmail.com>
In-Reply-To: <20260209140533.194251-1-9erthalion6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 09:56:36 +0100
X-Gm-Features: AZwV_QhoQIBrlXQb9p-Te6elgDG-x3oBl25Rk3Aj45Sd7rj9jbMPlIwZYS--B8Q
Message-ID: <CANiq72mW=hcvUGt=WENRiYVeVbb2bnYzizE00Eo-MW3b_MwRrg@mail.gmail.com>
Subject: Re: [PATCH v1] perf tests workload: Formatting for code_with_type.rs
To: Dmitrii Dolgov <9erthalion6@gmail.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Mark Brown <broonie@kernel.org>
Cc: linux-perf-users@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 3:05=E2=80=AFPM Dmitrii Dolgov <9erthalion6@gmail.co=
m> wrote:
>
> One part of the rust code for code_with_type workload wasn't properly
> formatted. Pass it through rustfmt to fix that.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602091357.oyRv6hgQ-lkp@i=
ntel.com/
> Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>

Could this please be applied (or fixed in-place)?

It is now in next-20260209, and we check this in different CIs. It
also makes LKP give spurious reports, e.g.:

  https://lore.kernel.org/all/202602100751.ldfRitCJ-lkp@intel.com/

Thanks!

Fixes: 2e05bb52a12d ("perf test workload: Add code_with_type test workload"=
)

Cc'ing Mark since I think the plan is to check in linux-next.

Cheers,
Miguel
