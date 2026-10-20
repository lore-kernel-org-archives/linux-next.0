Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792508866;
	b=e4vzcv+gOFQx8+Xds4taqlU8bnlY1iaUE3jpaMazLxPmnAvJlINDHR7lBZGtfETjTkR/
	 jSDbvzu/nurISbmJpJScp0V11ZvS9qR42r/PZgu8x1OM1CTYbx77jjTJOp49HSK/9jGJn
	 6Z7cYCNEMLK3LDWv5Y5JFVHh+JZDK8n5XIZRmS2C8x2iGHfwk94vEtOBkWizrj9x1mYoV
	 hXiJMTDdZsJBY3895kGqJoxLVepmh7iizPCf/ompdy+TofbxtHjpRvHFI6fxe/pU1IEXb
	 paxcwHzNdjZY6CNWxAUTrs/C0/qN8NIwntEg7laREwNtjDBftOPDHgCSECWPRd6PU/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
	b=2tOt2ECWMzdPb4umZvYbBjyJDUAjIc10F3fFSzbMPG5gUlCEIILQJ9VBeMVS0DCeTqGl
	 n41HG2s+N5KivmlqmOxFrQHtfm8SYAZuTnDde8gEVPK+PTHgDSFHasEYNFW/kF9dQWnP9
	 +oHwGI6snzT9cllJ8wV55KjUAdpUU0jbhCD5IReCBdjE01jnbSvO35SAN/ZXXEKTuLZqB
	 pfSVh3TH6LxIIZ8JqxeczxLQugYnUeEBmvPfr/lSsR0cnSL6voB2mZg6uqL6xYcRVHkkn
	 SQzwAKaEFgQaWqb7QvAMM3kHdH0HuZ85oEoxpLKJP08G1oG2yKdrIZBZS1oCsFgc5DA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=QMCd6zX+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76F606A333
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 15:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C76F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=QMCd6zX+
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so3994849eec.0
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 08:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792508864; cv=none;
        d=google.com; s=arc-20260327;
        b=DORPYlAuQ73lfR9qeVoOzO7PLDsnpw1zpKl++DgR3859wR2CuQkiwD402v2acSzceH
         gO35L69sdsyRjrMbHIGLhF7zFVd3hTJCcOk+JgaM3OFiqx8Kt44dcjHssf8IulJPxkti
         tSofoTH40AJdIf2OUm9jXq8/hbfJcdcsIrV/v1fN05R8I9Ie5zMP53yds89V/l+aNoR9
         1E7h6oXg72enEnT9TGIr71UmLGJgFUHt/LPMgrP/IYNkY2n5yba3Ngwh8C5DY8+6GI2O
         JbEKZQ3TJm+b4i8ThykVgbIsT+0k4Lj3/Z0QXp7Q9cRqFgorUpx99PvsRsYeDDkXOsV+
         oVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
        fh=FRQwcwmZaEs4W4k4TdhpyCsdYtYTuC0a78iTP5y667o=;
        b=iWpVgd02c4Eq9mg7N6MIRP0Zhgw2jJh4Iq0yVnSaTPmf46P8i6MzzcbN92Qin5jMHx
         bsjk1TRbxbteDkshO95/eNR4yjo5OR/wuBqQBv5h1nFzLIu4qkxMCGu0u2MrjpyxzrbI
         09U/3xwITVRo8QMHqBcjpKznJcHiHtoJgvcr0SH7PM+1GRSTyYUOkz9nf6xUwUwX+14u
         ef2osMoPw3WtDUUgUxXABPjh+AtWFlGjaQkd6erzq0RroWhcteo7wQj4nsjmTUAeppPh
         wCC672p/pjFRXmM0pNsymp7oIUNwpS8ZL6FIbQwqnyoMdgekWb13i3Xglp/vBF1WtW3r
         v2wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792508864; x=1793113664; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
        b=QMCd6zX+rxmZMkYXPSupJ+X7sgMAgrEbALc/M7fVNnob0g4l6rDArk29CwPOZW75rK
         2Rfd9r6BNPcZoEchiU2ls3EsVQmwQAcavDdM1WqgS2I+33Zt3jJLiklKexv8glILmrCM
         QQCNY7geCZsAH14op3RMab9OYk+5DbO2GX1yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508864; x=1793113664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
        b=PXYY4xDho0ko8JAQ1DhKeXj4KoacPFepgHypWqfpoBBeBlEdfwPlJIp/iw2b7WOCur
         KAyrMsjhk3L9nE8O4w4ndCzswotw6MVCDddb7TmRxBg7K/ZakZqES/IBI0K5/EZlcTU4
         /EsrntXOkP2UKckfINgc8W7OnsFHhbGWHduW32nYibc0TmaKtPMv4jRyJ6ZfgG/FSS2o
         OSp2Ar4TaDDhRfmPnIK/W5gETY/dYRvSJZYf2zfD3xpxpGTlsP0r7g4uYXrz16jeanAE
         5q0QAZfkJRtW8KmSYT+XqRl+A/+FxjEvu094aFEqXE3gsxSjcBCyVgAAz4wBFAtS/P3O
         eiSA==
X-Forwarded-Encrypted: i=1; AKwUvBy8HqaGT56mLXVV+M3LwdAHAF3d1NX9vVewN5xL0Mwsh1mbJFPyeN+J1gRPSkufsKkoKOFGnDLBLE7V@vger.kernel.org
X-Gm-Message-State: AFq9FYK4CiEuRt6+qfn4cqbG1kVT3tysJjmRZXDOhgkQeS9QAPX8/ekO
	Yi6V3kF9Dadd83eAHSrYCq9NBeAw9zms8QI0DDTmrVELQchyP5PGka3E2/ivDtkxEZAxd9d6NNo
	GRCymyAtF9/4PY6NtP+l5ZT4Fr555rdOO18t41waOVQ==
X-Gm-Gg: AYBFou1aTXsX8feEVMPrMflw8aZ+Ya4mhYLI2H0nA45LV3UhqPAwM6HbfS1u/E2QvZc
	A8HdihqxhMYpWZB94c/AIlxijMolfk1lSR5U5BxrJ9KZV6eKusmU0WUB8EAZPlPeDwti4z5vk6J
	bDoSU6bWBHn7g7QnJLb1CRn5WyS4XDRIXAs3ar0Q1kG2m3es4WktNolGBYbygxRgTAQY5TRGS5C
	zpsC8hKhD34lBPeuj8vHHp0RGGzgiuMD5NRnlqICd4WPmlwfRJxyP7j+OtHsSAnkhNvaNzdhbc4
	DxWXNuyrlmkaHq39ypnRbn4Utr3OcAhFpXoUGIkMAsiQ0CVnmoy6PQa5COfr2Hn7S3q0ZIv8d5a
	2Eo+vgDbxfqYQ
X-Received: by 2002:a05:7300:80c6:b0:328:7033:9b8c with SMTP id
 5a478bee46e88-361a12718d4mr21242527eec.6.1792508864209; Tue, 20 Oct 2026
 08:07:44 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atYKkjN0WgEhpACL@sirena.co.uk> <atZq0WW6UqnzbVx2@sirena.co.uk>
In-Reply-To: <atZq0WW6UqnzbVx2@sirena.co.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 20 Oct 2026 17:07:19 +0200
X-Gm-Features: AclHuK9-35ga97_nmD-ywPr1hnQmMO5FBjMOCS93Gv0o2oR3ZoUlqwq2_3NPfD4
Message-ID: <CAJfpegvnAXoEotjBFn_KXRLmW6eukPo78HpbN7fL+2uG_iB06w@mail.gmail.com>
Subject: Re: Missing signoff in the fuse tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 21:09, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Oct 19, 2026 at 01:18:26PM +0100, Mark Brown wrote:
> > Commit
> >
> >   5fda61d42e762 ("dax: add fsdev_dax_from_file()")
> >
> > is missing a Signed-off-by from its author
>
> This is still present today.

Fixed now.  Thanks.

Miklos
