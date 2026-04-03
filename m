Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0D38D684
	for <linux-next@vger.kernel.org>; Fri,  3 Apr 2026 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230917; cv=none; b=frAi2Eu2IWWRFdcQvzwl5Zxh/kPyoe+5WOUFd9pOIwLb2O8LEYt4Jsc0cCq6KRWj/3OuZHJK6KzjcfkyS/jLQxkF0Ic1h3ma8KKqKQanV7/5mBcXMIeG5wrmtMPyPk/+RGFyecpIHQncBnHwZ2Oa13Xm0D0oGFlAtmwtFjWGuPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230917; c=relaxed/simple;
	bh=DSHQUxyQrtuka6e7TbT/do91thLyrf2wAYzU+AqlmvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHDrjINQUr3c3D6enT5A0WoAg0QV8e03yqk0GJhyGqXgziUSewEbRjqXtbwC5mmkCeHjxTZMYlItwQ6oTxxlvlgoZdba7HqsAaPQh3vqf2zs3VaCtF2bAvjHgutqYqCPaZ3nis/f+PQQpLmiDFA3qCm2tLRc0gdbwfEdDFUcEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=oMKyuK6l; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="oMKyuK6l"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40ee9b945d5so1622617fac.0
        for <linux-next@vger.kernel.org>; Fri, 03 Apr 2026 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1775230915; x=1775835715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vxm5/2GVdEZo1ciBag50G9amtXzLYIgHb6ISfoYhwiQ=;
        b=oMKyuK6ln4HEomUD1V0cuwClKZZ6i9/yxp2HpvQaL6O/KMGFeHPBqRqZHNsVefNwYI
         MWoZEeBx5P5wecOl111Z86Jiur5hUsWm/tboMCKOJ4BtwFdVj0QtOixu0o8OSd7OET8e
         /jnCkJwqu7uiy+WbX46LI/v1Eu0EajS1G9V1BoAyTLJVjY5lIbOr0pGPXOME+gSc3pKm
         PtXI+676Up7uk7f0iPsKKzPeJwMTLuQ+WD3SmIqk1aFQg09DFNnTswqUUPnMscGMGkTL
         y7vNgozyIrYv8TMGYYB6jym+AQBFhPu+7KLtj2b+eaV657ulbnJ8zR05KJbrB1+0ZdVK
         2FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775230915; x=1775835715;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vxm5/2GVdEZo1ciBag50G9amtXzLYIgHb6ISfoYhwiQ=;
        b=URxOrGylVRUFjJlW3z6WLYXfEEdoED7++7rs87+rMqZJvBtfAIkLhArsd+WG47RHdb
         oAWymddaJmiXA6IlVol2+iXh+gC1Dsz3bfojwPf5HGuTODZtwuIMa/y3KgWbi7mMrwjY
         jOQdN8qig/1Zg5bWkPKYidKfXhwT+NuP2JZKupPCkwdur3RLmQYHYuwfbgrT2S6WSvC8
         7svVcNXQmnDsboNWexWwkQb9DWrBntAsEEdyimIvWYakKQn56LQtQXzfs0VFYdljDqfU
         EQrWQPqNMV1Pzt5cPoHL0Au9QswuMXCr+Pavykew+a5wbtIlYkh9NgYbkrEzt/IGsDZL
         9uag==
X-Forwarded-Encrypted: i=1; AJvYcCWmgEfWFnSKeGxFaVui7NLRUNm1kVgBF3NDF21giQD0CmxOiTiJpY+finYkzI1HuGh1mjOUPjxtnmL9@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyzJUSuOl3ttyMPfEieIAD6hf2PmBl23o1slA1P3XK9eBS0eY
	LI8m5h6oOdw7D2wM/O5PJK7sKYaHghXf+HoIuw8OVTFE5rged1ptg0emt476EZyVqAo=
X-Gm-Gg: AeBDiesJZ2QfDof8RGGK8ozIpnceHYnyrrUmPbTPfXoPG9WM0+Xt/hd06mEXFfL1V1S
	KHyGJx5sCAr4uQAfO4dDok2wkzRIf1p9azsqxyEvvFQh8/9//RXkRV/K9NmCHWoTJtoYbiuccu+
	RNV6CXXHTPhuq/wnlpbtedFSFpggcrTRp/XK+0h95roDpDmRib8lmCnHNlF/dKcWx0kyvBwxcDA
	9Uj6B4OCABR2Vs7cfNq4wbwkaqGJjw7TEkYA7cCWf8LRx2RuCX/P3X8soGsJaDkpI8ZI3J+4sXn
	igjfdT3sPhfrXRa+NIpLssNlF3o3oLQ+a+5evChz9RZJhOryeP6Uk3o5p/Z+v/d8LdJ7Sf1if80
	0nrZhLL8BzqyUZXCh9gbnNA9mbIfTBLx1Z0tAYF9M0RCWLptjSiWpOLb2Eqnlg+KtYMRUoby/j4
	lZSZejBHsFjxEEzf0mFGXZ9sHERR8mgs/4bfaI0Zhz6as6UtJ9+i9maEQ1PI7pRK/cwkqNc5sP9
	9gPDGRDwOgdmSg=
X-Received: by 2002:a05:6870:cc8a:b0:417:4693:ca0 with SMTP id 586e51a60fabf-4230fd536a4mr2034783fac.14.1775230915501;
        Fri, 03 Apr 2026 08:41:55 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:67f7:eb47:a398:6ff2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb25ad44sm4725907fac.12.2026.04.03.08.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:41:54 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:41:49 -0500
From: Corey Minyard <corey@minyard.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jian Zhang <zhangjian.3032@bytedance.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ipmi tree
Message-ID: <ac_fvQUf9-kAe-pI@mail.minyard.net>
Reply-To: corey@minyard.net
References: <ac_ILgraQZ1KcNDF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac_ILgraQZ1KcNDF@sirena.org.uk>

On Fri, Apr 03, 2026 at 03:01:18PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the ipmi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/char/ipmi/ssif_bmc.c: In function 'ssif_bmc_remove': 
> /tmp/next/build/drivers/char/ipmi/ssif_bmc.c:865:9: error: implicit declaration of function 'del_timer_sync' [-Wimplicit-function-declaration]
>   865 |         del_timer_sync(&ssif_bmc->response_timer);
>       |         ^~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   e1748349a14d3 (ipmi: ssif_bmc: cancel response timer on remove)
> 
> I have used the version from next-20260402 instead.

Thank you, we have fixed this.

-corey
