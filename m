Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15993EDE40
	for <linux-next@vger.kernel.org>; Tue, 30 Jun 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815006; cv=none; b=AMQE7KnBvLHbEnAs/Ax1vLEkBYWkvTmyvDJNUVZgGT6GEn+TZqzAwV43hrEw7HUZCZkpV1dng0Hld4H7W9nA55iG2iX1V2VZCvhBdgqreNoBnbtbrRki1DnrrUu+R629SG1EB0NWPgeIPHocS1mUNVbhNOtigMRFN+e3wKe/kN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815006; c=relaxed/simple;
	bh=ookSO9NLyxStg2XjpiwLYO2/4VPcyJ2pz5cz790SDPE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lQkiJkaxXuCbPGKtL2i/mt49UPiH/TqOZ2TErfM2Og+whYGqaSzdRLSgCNHHjv/xd1NaBN4F6camISNrtziGCkJYuV2irs2XwYeA2uvq7wTIbtghoNQqjgm/kGa0cx4Iak0gMHn6b69fYDnDpSw7aLjXCZ3xaBVzz3NOwFZkanc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JchU8k/5; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JchU8k/5"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13b2b92b0bfso1168627c88.1
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2026 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782815005; x=1783419805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=64br/RkmOmhx13/ESRZScVcvPiQV91aMcBObjJGHD+E=;
        b=JchU8k/5+0huPNv+m2QJmsuCQFHUesT3JTAcV8C6JKZ3lK8o6vqNVLuwqX2aK5Qhxo
         EaA9CuLPKr4V2p22CFJ64UzhFOyZLC1D6UPFJCtnCkWQytnYFTYmjwNTToOxC3drckru
         eMbJNmcR4a8xiey/nXrW3qpTW0l3JVdfR4rByOOc9eXeYrwJiK3ZhxzMbMKCEGuWmCTc
         cxEBLM00Ip2tph2qfWC3n9/DYqScTAuk94bT1lhX8Hk5sOT/O6ZTx1d+ygYWXplWAhRD
         uSDMjwtNM8Fq9UbBAMRX9IdbHc/pG/6JU9wfM0OBKhBLhCk+eQ6oMskNlI7gLxcKWXXw
         C3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815005; x=1783419805;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64br/RkmOmhx13/ESRZScVcvPiQV91aMcBObjJGHD+E=;
        b=jZavsE+8LO/FK+iU3JHXo6L9WvALTAPJwI6uP3VLZbIkIz2t/DfQnyY7DzGYFcW7Wk
         PGTIoerA7V3pLImffZE/p0dnCnkBGM+/hZh77q1RBeo/WK7Esg52TXDK5tAZ+8RzbWic
         S6N4f2Cs5q+OQsmt6At/deFO16tPI6RCi0Esu4qSHl+w55TbKEp4YSNZcE+XRQHP0b6L
         QdkfYNmTcG0LbRq8tJuWv90Qwli+4sI75fe6xrsO6Wr2+gQQf1337xcYodvVaMVzTFfw
         Xg4yFPXr4o9zy7WCrRqNIao/qnhK692fZtXT+gjDaWd8VSiaJuw90oX9bgyFkcezx3Qf
         EJmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5ImCmwtqd9cTBOQq+zy8+hGAy61CCvvw28pQiuDLRdHys+PDL+km+pyUKumrOTlaHWN4dxbXFAQyD@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBGP8LIAylZMhk5XHtlvbjj5GnIt0HPNnkT2dGUdt6ZizRCZZ
	g8/4yUW9iHskg0EeipH9rdgG7NlYe1XBfz5arNAcYEpHoZM8XHX61ivp
X-Gm-Gg: AfdE7ck9yq78QSVvwpflUmn1abTfvkBV+QveCPS8Wbo6MI3lwEQWqGxS+o/KmiAEw6i
	w2yPzPVz9Ok3FfCrQcfpuJSlNPNDhKed8VA0Y+TpEUBlCu2SKJW+jOzntpzrUTZEmyKLZ8oYFyC
	uHExqHsXnj3DIee4ombEXIOzQk2PPKN0rJPWHzPYDCNlSO4F+H0W9DS0skxhPYXBgmiEZnzCquF
	umagJnc6VW+hjuvh9R/WuXSlce/BQfyFTpU7a8sR1fRta/JD1tQ9gRnBvYwDSKzYKwPmSvmdgG7
	Bqz4hHHG+ZhcNTynSqnDuJleEjsjB+WBrqi4uzXBiFjQyHyEqM2kL1RXLP6IoV+5GH/+bumclFU
	uXhoG1VVp1T4bf/j7V+BqPPd9Tbe4BxjgibHUJDxHNPGiiNa3MP5kUfi4JpJirobH5poEOEuKHs
	s3MaWNOxiSlHyXylNtLGhSiucErdWDGw==
X-Received: by 2002:a05:7300:fd14:b0:30b:f888:7821 with SMTP id 5a478bee46e88-30ee144e2e6mr2130764eec.28.1782815004526;
        Tue, 30 Jun 2026 03:23:24 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:bbd8:81fa:3317:1f51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fbe011sm6728875eec.9.2026.06.30.03.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:23:23 -0700 (PDT)
Date: Tue, 30 Jun 2026 07:23:20 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Mark Brown <broonie@kernel.org>, Namhyung Kim <namhyung@kernel.org>
CC: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
User-Agent: Thunderbird for Android
In-Reply-To: <akOX2cfUOK1rRbu0@sirena.org.uk>
References: <akOX2cfUOK1rRbu0@sirena.org.uk>
Message-ID: <A5DDF2CD-1DF0-43BE-8FA2-E2FABE176B27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 30, 2026 7:18:01 AM GMT-03:00, Mark Brown <broonie@kernel=2Eorg> w=
rote:
>Commits
>
>  535c327f22a28 ("perf python: Add LiveSession helper")
>  4f093d248b148 ("perf python: Add perf=2Epyi stubs file")
>  145f6bea48134 ("perf python: Add type checking for parse_events/parse_m=
etrics")
>  1bb0a1721f3f1 ("perf python: Handle Py_None for thread and cpu maps")
>  226e60c35ac93 ("perf python: Add config file access")
>  2b8aad745c248 ("perf python: Add syscall name/id to convert syscall num=
ber and name")
>  6efb7ef71b226 ("perf python: Expose brstack in sample event")
>  1b3460930fcda ("perf python: Extend API for stat events in python=2Ec")
>  4d97f00572c6f ("perf python: Add callchain support")
>  0dd3f949cfb58 ("perf python: Add mmap2 event")
>  b81c05a559ee7 ("perf python: Refactor and add accessors to sample event=
")
>  beed2f88c2d7b ("perf python: Add python session abstraction wrapping pe=
rf's session")
>  f46938e02fa6c ("perf python: Add wrapper for perf_data file abstraction=
")
>  d8da1ea834a88 ("perf python: Use evsel in sample in pyrf_event")
>  3e153b92b6e88 ("perf evlist: Add reference count checking")
>  4d7018b55734f ("perf evsel: Add reference count")
>  7e7110bdf0e37 ("perf evlist: Add reference count")
>  ca42447bde058 ("perf data: Add open flag")
>  3d295e4e6974a ("perf evsel/evlist: Avoid unnecessary #includes")
>  6a7ac633a3e8c ("perf python: Add missed explicit dependencies")
>  bdd53407c817d ("perf util: Sort includes and add missed explicit depend=
encies")
>
>are missing a Signed-off-by from their committers=2E

Thanks for reporting, I'll fix and force push,

- Arnaldo 
