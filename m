Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC201443C17
	for <linux-next@vger.kernel.org>; Thu, 24 Sep 2026 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289687; cv=none; b=eZnz90Ow63oxevvLX24WRx98OdtiyUAMj81yc93EZ4TCO8EZZ5bI1nXBeiQyhKwWRYijV+dZi5heY1zv+/xmGXLrPEfflVBJ0Naoeq71h6+OWrx/dud2eIMRwugjvzjvk10g6ZZfDz3uSwiije8+7eOEvSMr/coWg6NEN9wVayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289687; c=relaxed/simple;
	bh=TUXt6ktVt4Gz6z6+4bfN0D+POleMHD4yZINwWeHeufQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XZjZrc0tNE4N59XhtdtOV6NvqcjPk4jacdRDLKQ6lKUkCF8jLBmOykzK//KGnYKk8ZGf4Z7kJfWbLhaBsdvM6VGz2SXAgpdTrMMDfCik4mtIdzTINixXcgh0lSTnDBq38RXVz4ksM//KTse0yR9Gb519UoTlJq2oHWi5PXePptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJOYKVGz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJOYKVGz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso144166f8f.0
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2026 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790289684; x=1790894484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pbq8cg5hzV5CsgrEJBLzOPDrWzTdUyY1xmmm7QhjguM=;
        b=IJOYKVGzTk4I+9HZPZvJ33aLiJ2TzL7RRTWomONTWpRusH9cr/jwI5wj89t7hUIaMc
         dBVbcLoWIKGmSJikOlcSvmZTqXc8xv2NO4jVa7/4tc9oRoSTJvZxMUZM88MpVaorFRfs
         14mtiaOqPTG/Idmiqmt2DeOl/yMtuvCcaMjARlu043LCJnRMnYFCYjG6OiDZAZuSA/tP
         rPeeI+t/QQ3+S8kYRq8gN05Be+UG/A1eVKQJvHC1V/cdjEXLp0QJFbfn+de8oXg/3Eib
         A3bqV+SIdHbcvbnLWKcipuHyHIAYUpofyrTaayNiEfYrKkn7UDgA6UklLXbHkEo8vSwb
         UqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289684; x=1790894484;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbq8cg5hzV5CsgrEJBLzOPDrWzTdUyY1xmmm7QhjguM=;
        b=zQ5Ll4JjUZ9G7NXkWFQj2j8rFDZjduFVW/cQwsQl4pY5uLlFFlst31/AuxJ+VpDQju
         GtpZPDtDpGak74Hd+NqXWtO1sbuTji5pZAT6AiXTiVrnshjWhfUhY8loZ2dXuDSVR6zi
         S27B0DTQ7/NpgvGpUToaScrCD2Akbdath0wTZ21YcCOTrVqHj668K10tLa90bxHmeaa3
         xV6i8ea8k5zroIXq+9zRjSWWids1c9qntTJ6KIkzsR2yAejmJvaiXHeGeQZ4ItxDu9i2
         IqBFSRz+myz1BmARHpY5aICOPT4hFShv0D7AP3R3HLuqMcQ9tzPOgzrCeBw3nZ3IOPAM
         fOqA==
X-Forwarded-Encrypted: i=1; AKwUvBy7rqmZvPRp/2i57A/Ov6gE4PZ7t3jaRaLQtQ2GIjz2TkhU42fNL/OGCxZinFcwZNpmBYq8/35tjybm@vger.kernel.org
X-Gm-Message-State: AFuF++mXTWSLEXXj29kUEz5x0wh6Xa7+Qo6My5lG0hv7//BLDgPvSNfM
	T67LtkCWHF+BV/rB2b7q2E+vb2IZQy1PHlKudByPTTIFawDLKXOlP99k
X-Gm-Gg: AYBFou0Lr4T3+8XjyqYK/APQlelfid2F/RuEG2xXm7ZmqdGlnwElwl5xonPqRxb8e7R
	3Kc/lR/1ZvjsuomLZkBkIRyyynphK5Mnrh6vFf40vYK9rt52JIXh0GJdouLtz+efJCiR6UTXnfv
	HuMy6xxZbIqEcekojD7PLECIH+/bEkGp9+YeCTRTTf4O3oXgCQqOsbUiNAOViz9NyXnesC1MQX8
	BWJiHAEgto9Hcp0eNwOBaFqHk910SB8jwxKmw2JQK5Eagw0cx17ggD1L801dVcbEt0BYkQNb/G7
	Z6oGnVhYMD3SOhVPnWYskPRx4npCRVFXYGJLVAewDZShucYa0qoLBtiXG2tqnQUfO6l+9sVC4Xa
	ed+4gJ5sTw0Uu+P+cguxV95MZ+yBduXTnxU62A056p63K2f3siDdZQYay21kpfi9IkJlxAJQwLc
	EokRFDVb5nlpq3GVRy4M5GyECMLg+PisaK3ByLNh4s5vVsssRnlYKDcVoMmuhrL7WJsPKN0QHVd
	B3GSeUwLv/a9ABjM/Jj46+3
X-Received: by 2002:a05:6000:25e7:b0:487:35d:cb0f with SMTP id ffacd0b85a97d-4887da06e28mr508409f8f.14.1790289683867;
        Thu, 24 Sep 2026 15:41:23 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a01:e0a:880:2dc0:3e8d:e7d3:a406:828c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm2382883f8f.4.2026.09.24.15.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 15:41:23 -0700 (PDT)
Date: Fri, 25 Sep 2026 00:41:21 +0200
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Mark Brown <broonie@kernel.org>, Namhyung Kim <namhyung@kernel.org>
CC: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
User-Agent: Thunderbird for Android
In-Reply-To: <arWl_CVE0g8dSTSU@sirena.org.uk>
References: <arWl_CVE0g8dSTSU@sirena.org.uk>
Message-ID: <9D941A1A-2AAD-4542-BE8D-22B727A1A20B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 25, 2026 12:36:44 AM GMT+02:00, Mark Brown <broonie@kernel=2E=
org> wrote:
>Commit
>
>  4c09f6c47b769 ("perf annotate: Fix NULL pointer dereference in loongarc=
h_call__parse")
>
>is missing a Signed-off-by from its author

I'll fix and force push=2E

- Arnaldo 
