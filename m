Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CCF4D597B
	for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644425; cv=none; b=NpcBBVD044JNKamSnrZitsnmECR+aX3bAhIL+K5kbDY/XszLZCsaafKL0JCwpfu19nLtNTqGATN6JdUd+2qwFwvZL37bPMc0n9PJJlgMbapiV9Qtt92AjTgjR03GWsyPfbZeo/Ab+UOxqd14XdFqGYjmytKMndkuAgUNKIxgjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644425; c=relaxed/simple;
	bh=j1yYjfdvtN71lnQb1RuDzx0cffgVcRVRBV6mc2dIWJE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L+qUvGv+syDcyrFUeZIPGaEHM07mwsv6laL432DLgeNv/2utrYXGjbKouJQ/LpVRDr+cQCMfc+dymD868Z+1LoMawB+7z8ZUUr8y/fATcCmHGPSaInSPU7GAj/6d48tVnAUoZwXBtdXLpq6koRTMIt1L4Ow1OJ92VmuMetz+O5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4a1R3/a; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4a1R3/a"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48433107499so332005f8f.0
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 04:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789644422; x=1790249222; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j1yYjfdvtN71lnQb1RuDzx0cffgVcRVRBV6mc2dIWJE=;
        b=p4a1R3/a44085P/wLAXM889aehNxu6Q6YHRFlbV82l3cEMA0Rrcz1bsHcDAGQPhyxl
         ol99zdBsbGdghXYBnsjW1jQrVFhB8UX53Ai0qcfvO2iW8C4vVWE+20Fcx567hMT9DVVJ
         RfSD9oHjJvKlSznmkMKIGllovBfWEbEWQpwW7rp2NwWqpMNpCa4sv6wiaVBFi+z+9tCu
         DaJCJVWljQlAEcE1R3vzB1pLI07qD4pNtMyrC1ZYslHsRiVCuIZ9oWL8WTKsujCO1MRw
         uJcC1btV3ekp1KWbHMMNmhHrKNxIQ41PT9COLXpF1nllk/VAXbIF6qi5pZiUhf2dI9+n
         oZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644422; x=1790249222;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1yYjfdvtN71lnQb1RuDzx0cffgVcRVRBV6mc2dIWJE=;
        b=yp0PUzpNFrVuEQy/h+NGi6Zz3IT4oORE0BjYgDsdBWVFGj1fPjFt7Y9Cih1iVBdFSq
         vbzcLB2zdRY3kvw8vRrD+SLeZL693w1LRowU2obE+EEuJA6j6JgtLmysi6XlEREN0ez3
         m46OK+exItk4XGHFUxvExh5RjlETSC3ELbUEdlqO+wPo/G09+XZW1UzIJ5NPlpeF/mPA
         tumcXu9mDLaX9a3PbD2hTaKcp7k4/mYMh0y1kH0wTd3ZZpNRfPIe9I6tdYwwPCwSzRdU
         +OJNJnaqEApY+BLPhr7C/W3PY6Ivy1J+8nt3IpRUwi0CSznl1SY3FQx877fTgS95QuUt
         V7Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxpAOiqEn9vMSVyRdp2eCRDymFlelTtXPwOZuLyqxVZwNNr6nrI84TWrWvGBYXwQHUOIYsA13aJK/ui@vger.kernel.org
X-Gm-Message-State: AFuF++nVsjkTXPKadPZhJKMOrYWKIf/NgnGHhR4erYSfqnESN8eamfOh
	04YmEGM9F6Eh/VcXYpTsVjsteN+n75iw8VIWo1LrtYoZURPn+r+jw4sd
X-Gm-Gg: AYBFou1hU8iPOz1oftEggPKu9tu90C5TP3N4v//IO3QNVOGxHON3MBAG+SdOjh6FAjJ
	bdKP8zui/jJCIuUIsMZZUsuE75Eo1NRegEQ2Mt9U/m4Je0cIY5adw0fs+cOxXOGq81yd3TmeFxf
	fDp1iL8eeVKWpnWsKQ8fBNaS7Cv7azTwn/pKcF0FVzK4403lJzMHMMxmU2NiZ8GJ2YDuUAesd41
	GlU5qlllxHqHHui8cuVujGyWGk3Nx4WZBT9OhnsiPzjU1zJYSBtc62P+wAeYx4xgDKKavLdDw4T
	2Mtb5fIf3e1D73UkJ79GZoW3vmIbgriXZOklG7zsJxOtUBgUP1sOjb3xndB1WTHdPDAh+jYrZY+
	fDYspY5MkBahkhxY1kc6S0uvT5K8g9CqX39dEegrjmgwBz/UCb+rVvlwFlSXnV4OyDJCxiH+uvj
	hk5mG03yTblg20FZLcBG4qZdmn7/VuS93c/Vawg1wkFHWz7jCGyMBXdLquMVMikrCqvzqyx/rXM
	+Z+yihAn8dbFzHMSR8jmk0q2WWa4OMZhzvoiZaS8Xsku3LOZvZxzspr78/+YXLMwQX26RZ/iqnu
	9VsW3hl3GoIZyw/eE7MiJnj2ZVTA32WdEetGTw==
X-Received: by 2002:a05:6000:27cd:b0:487:d8f:27a0 with SMTP id ffacd0b85a97d-4870d8f282amr5317777f8f.32.1789644421948;
        Thu, 17 Sep 2026 04:27:01 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm15118417f8f.6.2026.09.17.04.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 13:27:01 +0200
Message-Id: <DLHK013DCY3J.19Y8X3Z0RTWCI@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the bpf tree
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.21.0
References: <aqvBPVcN__UX8P85@sirena.org.uk>
 <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>
 <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
 <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk>
In-Reply-To: <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk>

On Thu Sep 17, 2026 at 1:23 PM CEST, Mark Brown wrote:
> On Thu, Sep 17, 2026 at 01:20:11PM +0200, Kumar Kartikeya Dwivedi wrote:
>> On Thu Sep 17, 2026 at 1:09 PM CEST, Mark Brown wrote:
>
>> > Does the contacts list for the BPF trees need to be updated?
>
>> Well, he's the committer, so makes sense to put him in the recipients as=
 well :).
>> Once he gets to this he can probably force push to correct it, I guess.
>
> Do you have a full list of the current committers, I guess there's been
> more bitrot than just this?

It's me and Eduard, apart from Alexei, Daniel, and Andrii.
