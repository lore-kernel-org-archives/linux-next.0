Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB24364EB6
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2026 15:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944630; cv=none; b=FGL2GdX3SoLggF6ravvVQNyhmqLR3pZfMds74uDnT5yM9u+LPr5UKZjStq4m9T1cV+SyD9Tlp/X14TVrGDNZcI/rWbN+9oRuan555qIAuK2bN6yK5YR0w80d+GTdWxbz1lXmJg/dnd7VRNlLElUmKMmebj/0LLziOcpn29NnEPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944630; c=relaxed/simple;
	bh=NtIKYv/gbVBTyTBDVBQKCA7WjdwwTdA+SicJPSMsEZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQ2E8NP4EfIfoj3EUsXGdq/RUHOBwYxqigcytfn+AGQbX0eUKwX1wkOWrzGpAXxgFCLXbp1Nem8CqHk2le1gCMLszvWAhmA63QIIPqTKogjpCWvdoNw/rLFXK9T9THM+KoAOFVc+Nzcv+CTmvNnJAqJ1PXlF0mt7iTHmV9AVWAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwAb+LjQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwAb+LjQ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso12729895ad.2
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2026 08:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785944628; x=1786549428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1J7SSBjgEa6FdrQUEoTL9+VAKmrJkzpYBXqLuwulzw=;
        b=jwAb+LjQpJ9jJ8E7UMhsAOdAndXzfvqTcud9OOgb4it14gj6W0e/VjQv3nZ/o+hblT
         2S4/wy9fiRqPa+hGYuEIJV+vmwACPz6kDgpXvKzN0DIEHMbnjFOongVhEnhLmVibBsqI
         oVDahp0rr4er0wlrnMnPtg11iZEGvxcK68eEl3V9bv5amPSIiR0FbbUlrsv6wuAQCv6Z
         cHyXluScXl91l3//+BkE6CktIjhEVJI6nTuy2AG2gXI7XNIb54zpe/OIQOj6RxlB6jLJ
         w7zuLUzmsNmuYxp3klWlLAe2knI92wL1Z5hWD2ReGhlqc1elqim9R2eH+wYn0hpnatD0
         Zebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944628; x=1786549428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1J7SSBjgEa6FdrQUEoTL9+VAKmrJkzpYBXqLuwulzw=;
        b=LVIxBck05NkwmknumfOFL3fQ4J9+FDkfy9QDvxRJc/x81681uNKYGvU1ZxAsveF7Dd
         KSpOmj0QkM+vWS4lrZbPR9GrctfPvpZzNqbvdV76vHwU/fnaAvULyFGpyiw+KRAVUbEh
         SLQDWfL/AADtb5pgJqwc+Y99165AZWx5rkHLnQFQcDDDaTQ55KqZ4rL2kcGYQoj/jf5G
         BhGukgpus/W0hSED4ntQ1jUdz1I3ANg+DHIMa9Ur7iq/9KiF1o/gXfeAM7pkB4s+Ayr7
         p7owUO/V8f26783Kvzl8u8JyWcX+9W4HktcCBtMFQ0/77CaXDP86r2f6Qh73nNM3lOZO
         qYEg==
X-Forwarded-Encrypted: i=1; AHgh+RoMOn/b43httlIk2tt7sou7dhZSY8sEVeYZV0HHAanoKFNcoxO3aN0OBWlkCXSYSqeNxAy30NzCsjNN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+hDjwW0HuvFrhoy4vFBqPlp2GouZJesOirnEt+9eHI2joVAi
	u+3PZEj3WUmh54Hyhwp1LzWsovzpsI1kS63YENPx5uULrGzWuBlUSNmj
X-Gm-Gg: AR+sD12+543USP8cM+t5ryS9Ukc3LvahK8WDRjrlaRB1LwpuY+x6KIux2abHvylkimA
	S+FiYvAULfnkQlwMeyEPlhOm2OhjvGvJPLehqi+NSyZmkSzkzRoWKH0YUaNXgTv2qt1wjgyjsWD
	crDw9bOb4J8Klx+0RWNxcOWGJogdMDxaJ8+CZkf59Ir1RyyU+sBNuHLph63KRJAC+wgXOtQrYgy
	dnwiP9bHNN4wptvOeYilG4nStZxuZ2/Dqz3TMaltk0h7xSuM4ZjFDfLL10ZeJpQ3kUFmlC41mKB
	gnz+zlFaK1jp/Mhj8+7fglUnNnx2mdabldhvOWTVPAvxPzJxaELkx6lVsfVFN8r7CB8DbkqoGHz
	CQNJ8yuudHWBcdLciOIyKuSJQ19YAfBF2IMXhqEQLVSmg6QrxJSyhKVzviIcX3Co1dm4kE8zLxz
	APciBciTIfW5QaMmdztkc+08G6RX7+xem7XPx2VHObPXnd+p8bOLniTTtgxOCq3YnQ3gbGPH9Ty
	7COFZL7SeJYMK1OINGvvPPP/g+9rw==
X-Received: by 2002:a17:90a:d2c8:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3903c690565mr8536520a91.21.1785944628487;
        Wed, 05 Aug 2026 08:43:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf3a:ac93:79c4:84fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315a2e6bdb1sm970893eec.18.2026.08.05.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:43:47 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:43:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the input-current tree
Message-ID: <anNZ64NWtyOmbP3c@google.com>
References: <anMXcUERgpvSGpVz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anMXcUERgpvSGpVz@sirena.org.uk>

On Wed, Aug 05, 2026 at 11:58:57AM +0100, Mark Brown wrote:
> In commit
> 
>   08dfae0f8bed3 ("Input: synaptics-rmi4 - propagate F54 worker errors to V4L2 queue")
> 
> Fixes tag
> 
>   Fixes: 3a762dbd5347 ("Input: synaptics-rmi4 - add support for F54 diagnostics")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Sorry, accidentally dropped "[media]" prefix from the commit subject,
will fix it up.

Thanks.

-- 
Dmitry
