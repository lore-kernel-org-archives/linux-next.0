Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735B84D37D2
	for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642783; cv=none; b=PT6e75Dg47bf6nye8JDhF+MkqmHcXT1ll3lrGw2Iy21lP/4Z4/Q3WgYqWNKAH2opt60Q+okyV0TXzju3uCqrfO2KnjdOVEpXqpTWoX22CkcYHFLkpohRuYarm4JckaZHG0hLCt/72kioNkrT82MVe2wdA3Ma2YsdQgFpfC8nrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642783; c=relaxed/simple;
	bh=8e8Ah+7WlZHbhtXBLLlQRSAvSloayfN47Xg8BoeWzkI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=tjWH5aMsevNVdUWIyPIWJoHfzxghbLTk5q4eok6anrk7mV9w05By9YuAQ28s0hvEzkbTTUCrxUA9WIbeLQ+nKU9Y7UMjLrt3+lQo+Setey0/adLzCkxrA1I3TTxSOfI0RJ6Bl8Im5gFMrKH7KbRmD8iHexJSePHwXNY0nSNRKG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/6iZZCo; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/6iZZCo"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6eb11e9cso2572565e9.1
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789642772; x=1790247572; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h0M7opCWPOuxBFEuwAzPAI3fMW+G/LVbMC9tyOg7hDc=;
        b=d/6iZZCoppIIVZl9QpIgklFXZXZoKkLRQJryB2oLdVbShfOhnrYe7qEzJKAGHg9Fhs
         9HaGUP3r3/vT4HfOI0wARNf9i3EP9pCxoUekepUKAPKHN4ZUo/fDlMBbPZFk4NuMEtpZ
         jEscfmibdxyykCl82IEkOU5qwoCXV9jQaErqKObXxE6udizhFIcWIRq+bO7BgB++Pixf
         //EcCX2xtTEmJksO8NE9/8ozoG8X1ZxHLDh+UTwkgVZLA+06A1Rrmdab6x9Shl7mnLuD
         bEdRFB7oiOeClRwahH7eXIsFmpiJL+daucAfypDOcx7MdGLbpe6CdPnEBNCwYZ47Nzxk
         jqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642772; x=1790247572;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0M7opCWPOuxBFEuwAzPAI3fMW+G/LVbMC9tyOg7hDc=;
        b=LqFCWJZReeMhKmlr9F4U13ZQgCNW6lBdmNCz4SWAlexDmmbSQ34gDoU+SCaIkxJG2J
         vsSMkm0YEHhrO9ziFpXwWF2Y4FQuuZD1KMivyzgKPrguE5M9a8w9Xoco7lUGiQNoJ7l4
         8yWxajPZQJGxtFv1tYoW7ddJ0lZp3n6hPl8iczzpca/IB8tuOO1dZN8n4XtB/urOlare
         kQn1/bPAH/YLQvIDS3jq6tG031lkR6rhUoC4T2+xh/7l0uaha/WXh/K89tQrCFG6WX8/
         TtZHaDLDBVQuO+V5Dd1ItH9VPpYBCQWz5nvHmgT+Yq5DNh9Co+m2kmkOPLAppiZyaIFR
         GfPg==
X-Forwarded-Encrypted: i=1; AKwUvBwEc1P1N41vN+nHpRQkMYKg60AhOX180CYg70OKPQz9NFh7ymjkYipNC+oVB21cav55/Q/PgIF31UAi@vger.kernel.org
X-Gm-Message-State: AFuF++mDMtCyKRVEc3Gs4QPLhitvBvwSODZnPxG/Nfgpu1dtWC39FHck
	NQ7TQIqZbGfKsJO1lzMwLZZ0qz5VuIFD8Y2t60voVM90mRQWbVRKdJBw
X-Gm-Gg: AYBFou0QInPfEFHOu9MvkPtut8M1wCwfndU9NwZLOKJ0/2mb/rAYtR43gQHry/C1RrS
	Aw1gQQ0SMk9pjHsvC0OQfmDM5qTwawGEfntwfdRoTZtQJzMoL4e8gkkK5WqC9EZQMcFbpnBlKZ0
	vx9g3HZZVivYj0Pll95DK+CKXL2C22C/5posVeqBrAc3IGApbAUBXjd86ca/8gpcv5OIhw3AlIt
	XADfQfgnOhAdkd2u3f7LCCferhjvPb5b/hQXamyKwH3PkStqn6mAIHZDkRWM0+V7f1PAhganpgp
	6LOvuD/GucHB5BKUaX1bpmx+CS9RCI7qYm8D3vN6JR+6yTgerzsUoNzxlxP5sfUoXrfDEq91lbH
	nKWrzqRQ7Wv6xn02f7wYuiQFHJnTfuF2A1gAQj0Y/5/SuZQxn9N3JR3tnL0S+o0MVO+v67OjlZU
	h7ek210AJdV0zsuk/Vqvcd76xIRPgeGzetkOn/iael052Jy5Ic/bQgAXVjQt/TqNXsG8Rj0iuK9
	NAq0Xt9AGU3ciR/DDBRwRQd0zLRLK3eTZJGwcpl5Q28KxrnmpC6bcDlQIyv08j1Vo2baK/JuQvf
	vfv+cokdi4FZSV+4GLJtrgRsgV0umFxwrqROjnI=
X-Received: by 2002:a05:600c:4e0a:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49eb73088c2mr72472075e9.14.1789642771777;
        Thu, 17 Sep 2026 03:59:31 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm14454462f8f.9.2026.09.17.03.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 12:59:30 +0200
Message-Id: <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>, "Andrii
 Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>, "Networking"
 <netdev@vger.kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the bpf tree
X-Mailer: aerc 0.21.0
References: <aqvBPVcN__UX8P85@sirena.org.uk>
In-Reply-To: <aqvBPVcN__UX8P85@sirena.org.uk>

+To Eduard

On Thu Sep 17, 2026 at 12:30 PM CEST, Mark Brown wrote:
> Commits
>
>   4499609f99fd5 ("selftests/bpf: Test global subprog callback contexts")
>   3506b9a2f1085 ("bpf: Verify global subprogs in each sleepability contex=
t")
>
> are missing a Signed-off-by from their committers

