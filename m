Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F5B277037
	for <linux-next@vger.kernel.org>; Mon,  2 Feb 2026 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050590; cv=pass; b=sUzmNoma5V+Vd3RQMu6E1C0s6YgBHdmJJgaAysqfMVJgq8drjE5iPdrY2vrtu+tHgdsylYPVX2CxWnkbYyDHnJlsv58opphruCUVKaEDqRo06a2ld8FJmJ/Rv6btXD8Z+dcs5/X48PM01P4n2rmOdSDeP3fwsoZwzKlVLUVPhi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050590; c=relaxed/simple;
	bh=gz3yuC7l35zroo0EInRyeQcnYyGkSrI/GFIPfdx5eN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rP/KPw0MdOIW+kRLsaYBJlb/I85FDIUmPxGKAl9zy/hcoOzLZVbvMQjcH7Yd+/qAAAMMk42sAXV2xTSulqzTdR++B85rRP5pKC1Yt9QtLWjOcqv7WAwucSECWbxFbR7EW9daLirFewsVJEelIS4xY5XgLe4JKtHOrFGD605uxqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7TQ9XnP; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7TQ9XnP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4940210f8f.2
        for <linux-next@vger.kernel.org>; Mon, 02 Feb 2026 08:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770050587; cv=none;
        d=google.com; s=arc-20240605;
        b=jktbeXangywS9qPX/fbteAgM92PLocbhD/JubiD5udyxxTzZN3O/HBV1g0TGMKX5Ho
         c9Z61IlOu6YDCInWjThi7becYpmMdftRaeDTUvc0c/z4n8pzZw5wKOxItzGayX5iv668
         P3QQukXRKo7DmE8GB/52uInaNU1tlaI1nQrtCQsH56Bf+kmY2EFo4NKIho4RDLShkXM8
         42d6UnaH6LTMfjIrJAH+WlgICJ8e3aPtwjfaqWBGJ482lluOYe2FyvAMfv25pa2o6aIT
         wF4paqwzBiogEJTkqUyAn0DLiK/i+IJSx5SnRTmGjN/rDsXEV5Mm65N3JMtZ6ilqNMci
         kIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z582UOlUNYe5JMRaep81RTVUHc3+fGxXZPvJPubU7sI=;
        fh=Uuz9x/xpKBckg7GJMtDLIpg2Bk5+9bt/zc8OogcG8ro=;
        b=k5D0Q7lwTeqYvFnGB7z3ROijeMR3HXPb+QSiTX2KzrC4LPrkCZySj26GCPO11Kp5Yr
         W+kXl1OtMIzpISdtJN+EvFTqxokhj1D0NuLKDacD6fPaL8PPWnXLGRNU2j4lF9ko8m32
         EV2nMFrR6Uuys+P/dajJi0HDm4Urk93s7lu+9KH6l1SX396OJvvCaFHDJYPKbH8wudKD
         KnFpZxaEd58t9UZULrCleZMOJwEIIk3u8RvLqWzRATD6RueviQStIqDvNgrEyAcKJGI0
         cbSPrhlMUCq0cs4qNVQTWOpUT7FiKdebj6ydoFxyfUUdwGSLvGiDthePZlWoBMvghIfb
         i6pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050587; x=1770655387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z582UOlUNYe5JMRaep81RTVUHc3+fGxXZPvJPubU7sI=;
        b=f7TQ9XnPSc7DQ1W6jys3ehhbCMb74xYcL4dJFwBSIB3/5vpjZdfAhomAHuTHAc/kBR
         KMXA99GrAeqKwfBCdRLbBF8hYhtLKnHW+V/UPzCr2BP0KVat0R9+QpLOtTq9/okR6UPS
         lw4Sxi0EpXg6Bw/spV+nEqxF5zH1iHABHXT4qeztMW8CXrpXzb2CKlNd4PhpimAuofE4
         prN9/4hPcMretkFZIf4z2Ky5vriZDfgS5FmNBzix6Ry+JZqpujTEYOiSeOTPMrk2Xggj
         Hi9gTsH70lg0h0hCvLPP/J6LMjCA/NQphBzwq22chxpBSzPgeOid+9a1UwAj7IKrPoSW
         z1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050587; x=1770655387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z582UOlUNYe5JMRaep81RTVUHc3+fGxXZPvJPubU7sI=;
        b=vGwBj/Vd38flgTSJePKYXhLkU9Djt7OuFIr9hyl8kFuaQLWz1xCc/yD7n43GLb6u4F
         KLjG/ghxHJyGM1fRavLx/RColXoAUbo7gUMQ2IGYLAN17aRqiJ/3nYeE+JMGYJhYVsne
         +fQFWpJrz3SrzeWyDZiMTPuEnY9/9i1HRvgbZ5nk6BWoBWMT/1OntogrMybifPgcXEkN
         coPtRZ98FTj5/qHBvfCE2y9UnQx0kZLW4EEIbUHb+EUEzF9GniPz9sjDO1aA9oxGyT/T
         VXkW2vcmEmx9W5pmqggmnGTOMs6TbEolZhkrDpJYU6Cy+y/QJOJpGQNel3pwoqnFpFji
         H3OA==
X-Forwarded-Encrypted: i=1; AJvYcCVNw/r4SRzE1ZSYs1O1MfgiXs1IfQCOc4HmkChyhhfpWqck+xmWXY99pO+Wzc0ynkVMBhFFRrkka+iW@vger.kernel.org
X-Gm-Message-State: AOJu0YzakHVmCCayWv2Q3yyOkV3R3oLOWUwhrMcvkbWRumtK2pFyZHrV
	tEX2AhWQZ+DhQWcVLCue4A0IPSB7RE4gFj6gWZZlqqzmlipo/haG2BVQFr1Rdvv5IHTS0YuXgQT
	yl2jpYGy0pMDPVxPMKBqnNaoQTWv4sgU=
X-Gm-Gg: AZuq6aIvqR8j8ymz/2qU4QhLsBg7YhuOlT+l52/DXt05jHOuQ/WZL/iZHSvGLB7NxrR
	1aMhwLxeBYJwwoD4Gw2O7/S0dx1EP1cZeu/GNeNG/eK1HtiyaFRn7KkFGkpB1D2AWHt3wHl1Ddg
	7EQFmG5fDycHExdbrNqAE9ZSVDqba2ryQdRkqvwnKm73wiqI2jJQzWG0xByd/jr9/d+Jal6Xuse
	vY8tQMkWsvREIR4wIeC2mIewBrWwJz2aqdPETeIbQel0caA/qUrxgHUpnq39ItiycRKmE+WFKIp
	tUwy6nDqQL490GGE6sa1Q4SbNMyQ418N9wdvMZ/xYbSnKyybWHl05qzTNSicw3+WbjJ4oQQ0
X-Received: by 2002:a5d:584d:0:b0:435:a2f8:1533 with SMTP id
 ffacd0b85a97d-435f3abc7ccmr18865667f8f.52.1770050587301; Mon, 02 Feb 2026
 08:43:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aYC09rYDOvkNNOaA@sirena.org.uk> <20260202112010.0e46018a@gandalf.local.home>
In-Reply-To: <20260202112010.0e46018a@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 2 Feb 2026 08:42:55 -0800
X-Gm-Features: AZwV_QiNa_BMzphl8GY0f6UFV6RAp95m6_hf-XIg1aIi0Jjfq-JwzOZ00Js_F5E
Message-ID: <CAADnVQLa2z9mr856XStTFvfZxi8or1f9j8Gfu1h6m_A5ZN5eSw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the bpf-next tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Puranjay Mohan <puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 8:19=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Mon, 2 Feb 2026 14:30:14 +0000
> Mark Brown <broonie@kernel.org> wrote:
>
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
>
> Thanks Mark, the fix looks good to me. The conflict was caused by ftrace
> doing a small change that was recommended by Alexei so I hope this isn't =
a
> complex conflict ;-)

yep.
Conflict resolution is correct.

I wonder whether we should take the whole srcu_fast in tracepoints
patch set into bpf-next to avoid this conflict ?
Probably not worth it in the last week before the merge window.
Just a thought.
