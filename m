Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652D52D97BA
	for <linux-next@vger.kernel.org>; Thu,  9 Apr 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745954; cv=pass; b=M0EmDFAI4x2dDypUthsbQfXNDp5rRwwIZhfTyKn5mC3RURqtjW+Jh3+s6ndwwxj7mWHmN6i9gggtn183uo7985F5LldCVO8oD0SUQFzkUrMdL1fUXMmrHhlZDtXbd2zzHuJIsg0dvDtY53MJfU3QbqCuJNifYFjaM+TY1A24Brk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745954; c=relaxed/simple;
	bh=t7XouriFlewdWHb8XNALnZoudmvyhpFqhWQI0PO2T0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0NtG+1Q6S+HGY89nzaR8KJj3+t/eT0V+G08JtixCp4oVJipnXAxwatMoE9fJNORWc322XzcRWnVA3X162xTLQo/Zv/08YaCF2FS3neinBGlRCXcZnfvl3bjPI7i6O4jHiIa3qYxaVjPdRy5X+ZJT9E9T47pg/2o8TofSwyf1/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQv92mCP; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQv92mCP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66d24c6963bso1749335a12.1
        for <linux-next@vger.kernel.org>; Thu, 09 Apr 2026 07:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775745941; cv=none;
        d=google.com; s=arc-20240605;
        b=eMnaJQssPP1PMiqL25FcfR9+L34ZIxNfyZIYFo9aZs3KEXfXOQOCMd1hR0wYYK7NqG
         xfXnt7O1ZbbawvorrEcjKYogp+YC6hhaTRU1zuvhfcCbnm6GO3qA2C8b/aYV2F6vK1+v
         PEsThdouSDnkkJDOZIvfAI4hFxZ79F1JjB9TYiZEHE4zrlIdn2jVtUURSf8VHwyVGKzU
         leUwt2qRyN+WELgw4Zz3bml1dh9dCWVrtEkA+csl9vkFlZrcXKZyDXhLkRbHLFDHcDND
         pzpayc3sClHd6KaA7ffPXVXd9+cSiTE83+ceKYTE2bFO4zcHy/ngBlvPikpzmwkZ8IL/
         Zs7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t7XouriFlewdWHb8XNALnZoudmvyhpFqhWQI0PO2T0k=;
        fh=YNT5OhMhYlDr0LlxHgzP14z0kprF3mzTbQGXGkiDJpw=;
        b=KsBxSYFJ8Cpcnj0UHi7hNtwtEaNQ3+aqkUXHU2tu+CMyVLqSsUtN8TnMbqCDW6Vfhb
         dXUCQb0NevabFOUVjxWMsLQ9uZDDnGT7+K5VnmIiJEYLhGnhYVl9LjN9VHi8cVBzdVve
         AoJwFYIIuZKs7+hnIbHzjLfY3ALe6B9KgTrc+BGKzaMqKDfYCjmhXfKaFXJkDR7y6IG1
         rT78FrQVqO+Rj+eDeXrWVBLqOCHapsrfzko2ADmWJtFewo/OC9JKrzFDcQNAW0R4ibWa
         3rp7W4xQ6TctCzLrcXeyT99INEw/5jXfcfxd3964uhRs25y0kROl+7O3Hj+NYsqrZKtS
         EsmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775745941; x=1776350741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t7XouriFlewdWHb8XNALnZoudmvyhpFqhWQI0PO2T0k=;
        b=GQv92mCPKh5+pkKzLFu9q5L08omIgezQwvs4Oi8mozVYWeEK1tzRWsCl30C8Vp3W1Z
         zCImjbzJY/xaKj+NnJcdlDCkvaTEJshninq90QeBMeJLIPXQk7umdWLVZRSGny5vNs4I
         fDeX5fGxOyuinLMrWpn08K33SY7uiFKyYsPVmNXNvMiTCfiPvnqmfk8HuME4UagnU+Us
         NLzY177RYYXoStHso06IS5tUhrMkpS7qYbAMkxZIE4KBIPnB2GAbZufeMtUynj0fw+RB
         BjpJBxTpyAzZL6JzlVeP9TSnOHGjBeZYUaVlgqMr7BTpcDfUhpRqe0KIzrDDFvz35esy
         4/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745941; x=1776350741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7XouriFlewdWHb8XNALnZoudmvyhpFqhWQI0PO2T0k=;
        b=R6pUNu3d2ZsVZxsiBaZMq9EIJDXf6pJuUF+GWC/K0W9JCQgIeRcb2SEU413Zm226BR
         gBTOnROIJr5cMwgqKXVS60SsbC41z5ePG0Ju8UVgN6XYP/k9vhPbwjK5AvaG8BC/NW4J
         Y5m2zHikIlJAyPrpphI4UbP80fgUhsxMTAahe+ASpBQRqYX3zOlzfNtyTxOkaeK3MaNM
         yoEQRlZbrHKI7fpgXEtDNT5PEk2lNqHe3lLGk8+H6DN+Si/Ezs4hnt8KHeZkb7iphyXk
         T0fbyCJHZay4dfV9ZzE2m6/TmgyfnTinsUMCVt21UQDXwIc3+1OeJvHooG2Hwc5Q11TJ
         S37A==
X-Forwarded-Encrypted: i=1; AJvYcCULOc942celm5f0alAKQ7R8Vbg/JYZTfwlR7tS17mV0NTbtOri2meLWmPjVJVZ3Q0EZ/60F92416Lap@vger.kernel.org
X-Gm-Message-State: AOJu0YzO531Amz7/i0sNygy0+Y32Q3mXH2vkPSljycHd90CsISdKrXkd
	8+rEwBYQvUBT52Vf29VWodzhG8Y1MQEdb23CTy+j07n3vtqIIT521Ak9t/wTroVwD+9geBf4+0+
	MwxnL4cymrvBpyKJbEFaf/BLLgVVEf4WB8fyiS99Jk/TOaAyK3ib8
X-Gm-Gg: AeBDietcqajCoPgf0gsk63P3ryddBwCT5NpCfOxaU4l4CJN04WvTBcweV+1vZwMqFj6
	jwXy1SJIaWiZwFbSbEmGrfixN9XHGK1kcFS7KfjAmnh+NhRG9qYZykK8kkzC07hyjjzQKgWWzWX
	hsnqN0f8/891u5q6YpOk96Sj3ZSHGk2HsUEHIGXvXJVECZZlXrc+gRlGSSTsstDE5S0S0hy9mpR
	lrQpx2P0fVvxm0VLbLBsCMbGW9PqenQmBXsSCTxbOkJdIs7oEheTCfM/xjFS0ajr8YW/FwNkfn5
	9WCddxR/j8ZtVd8knkRTIFdnvvfUrr/2GwJOJNQ=
X-Received: by 2002:a17:907:d1c:b0:b9c:b376:8986 with SMTP id
 a640c23a62f3a-b9d4726f60dmr246040066b.12.1775745941340; Thu, 09 Apr 2026
 07:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adaNJaF58PZlvs6K@sirena.org.uk>
In-Reply-To: <adaNJaF58PZlvs6K@sirena.org.uk>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 9 Apr 2026 20:15:29 +0530
X-Gm-Features: AQROBzCIbmfedIz7RL6rl2rW-KwVKP2KCBjZ6eUenc_oBdYzkGKkd-uKZP9EveQ
Message-ID: <CAO_48GH3=g3ncBeWrcno7Z8ynYGWn1MS612djQHgfSQJ4-bkDw@mail.gmail.com>
Subject: Re: linux-next: htmldocs failure in the dma-buf tre
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Mark,

On Wed, 8 Apr 2026 at 22:45, Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> In today's linux-next I see an error building the dma-buf API
> documentation:
>
> /tmp/next/build/Documentation/driver-api/dma-buf:142: ./drivers/dma-buf/dma-buf.c:1355: ERROR: Unexpected indentation. [docutils]

Thank you for catching and reporting this. I'll work on the fix.

Best,
Sumit.
