Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com [209.85.208.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696E5581FD
	for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926957; cv=none; b=Zt/b1FCYeLT4lflZsS6uZJmFQoI6kUYI8u4GeLWb+GgOplh2MT+VkhDZgPB3Kz0WhYQB24gvoyd69XeofBrL6BMXBmi0shNDfoQn7N1tQY80o9FxDjXoBHAaX52uevBeyhbOJQQniqCrOVdXGkoIVJZmeNXlLQmDJjOGyD+WV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926957; c=relaxed/simple;
	bh=Ohf+Jpl/D7AXu0XpfGAbb99OwlB2fyEd5gSUwMdqWEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zj6kToNDnigROuR1W5zXdr+vN3DlRMjLQ/BvicaGHmSaRSUPBcs8qwh6xmgt4dqsoC2QtnLys65vUdFSIG6dCAltbicFLSLt2npwzspa0p1s5I8qi6cyosFyZVaz3CZjHyiEDsjm+4piBehQcyv/pPyzXiXrE4HkQMsLIV11Sug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=I+GOs7IZ; arc=none smtp.client-ip=209.85.208.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="I+GOs7IZ"
Received: by mail-ed1-f100.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso3669773a12.0
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 14:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1791926953; x=1792531753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ohf+Jpl/D7AXu0XpfGAbb99OwlB2fyEd5gSUwMdqWEo=;
        b=I+GOs7IZ+Ob+n5R8RNTLBF9Bco001h25+huRSPjtcbnOZzyE7cm6UjfdWe3rfGlOdG
         ghlkGkqhQdOHyrTgtMfHkkRdkxo/v3rheKyc8QozBZ0Lb0Jznyo6ZXN3uPXnUM0+qC/X
         fMHjbllCSAaCnAj7NKMTClkfVGC82iSz0LNwFOXPArPXWcYvwRM0jmNXJPTmfGagp9tn
         PoNCBfEQ5SQkXeB0qv6z7y9aqhr+tnzBvebwLbhQ411xiCOgj1x9j9QCU4MhtAXFIAW5
         n5Y7wwKyf87P+EFPeJI5djtU5Mc6SMhCXRTCjFhabkTfqJFKvVQYZdanpWT5OPO00Vl8
         aQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926953; x=1792531753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ohf+Jpl/D7AXu0XpfGAbb99OwlB2fyEd5gSUwMdqWEo=;
        b=kWKu8VCgSSRPB8ZoUrROHN+ctvY/TxhLdZ/4rsiK8qYa0iiYzZbuNtSIgqgO1EPybI
         sLPRHPS8jepP6dhZkaG3LZtBZnkvNZVM+ENmp3Q/0HnK6ABhrscmjoujbEdh/Vkp5VD9
         ALWBQfv887uRCbfPPDiRBTam+TiZ8E+KjEpypMtN7kcuY2ngfG2AWKCmJAAzpNQ7op9n
         dDxp+RLpbs0rYcDfEtRpNlA1lz7CMDF1lRs46fkdMz+DFTeeMx0Fhi/S2RFLoHAaW+lH
         S6sC1UiqZ9qu2u/ux3qOq+/ljIGnDLH3ssookR8sthZqqzpis7aCzh6fDOtS3eryoLNs
         BNdA==
X-Forwarded-Encrypted: i=1; AKwUvByRTU+lvYKb/WN7M+vLkOXyE08V4IgX9rXxnVTclhusWEx+fqMlknZcP8zqWy1PnNzzXR08JKzTJfot@vger.kernel.org
X-Gm-Message-State: AFq9FYIxBl9U/Ds2jUFo4uid6qi97x6b7rUimdpeEUr1NEDOXbzoIQwB
	RpQQjpfTzffwiC/gA/PmEWCer2Oh27ybdKeNG7NJPYNgH8AWkfZsJjoL0ip6D8nEC4dPRD7kdfF
	LyROVypYSadXl3hqhfLtMqNUI2tgY/VpQUL/L
X-Gm-Gg: AYBFou0cLjDgPJLzpYyj/MZcunBzAd/dXhTiR3WEGhNsBpw3D/y/KDFyGS/nB5TnKSX
	e1BdJdHX1BKp4rgCCmfG476AUSM1D/RA+bj8cKyVmFycWg5EcCrGzkHLhayVqIDTL+E/ke2Tifn
	KLsWqmBQR0RbnJ1EntukfRLfeSWo0fS3yNBybo5dCmXQvQ/t5x8F8y8Ojd771yv4ju7l9kyNx/L
	+FcxVZ+Nuz/levCo7LrRCdAOPVxCCzrKcGf75qmDLSY/2hxK5bWmqi/PUHsILXzbl1W5L0ahKkH
	e3l3i+ewRDedEiH1Yv9aQq+TwHbj0s6uASqYUXXs+X9EwWUTRNVwVEmFqud+S6uJak04P2gJmqs
	CFZ4NMhEPbth3BxgNOi4MClNA1vlHSkrfhPiPCIo=
X-Received: by 2002:a05:6402:44d1:b0:6b1:c6fa:c461 with SMTP id 4fb4d7f45d1cf-6b1c6fac66fmr4159999a12.9.1791926953336;
        Tue, 13 Oct 2026 14:29:13 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b203832dfbsm329944a12.6.2026.10.13.14.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:29:13 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id B9F90341570;
	Tue, 13 Oct 2026 14:29:11 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: broonie@kernel.org
Cc: anna@kernel.org,
	trondmy@gmail.com,
	linux-nfs@vger.kernel.org,
	anna.schumaker@hammerspace.com,
	cel@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	trond.myklebust@hammerspace.com,
	ymu@everpuredata.com
Subject: Re: linux-next: manual merge of the nfs-anna tree with the nfs tree
Date: Tue, 13 Oct 2026 21:29:11 +0000
Message-Id: <20261013212911.2212308-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <as4aacUf2Q78FMvY@sirena.org.uk>
References: <as4aacUf2Q78FMvY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I tested the original reproducer on v7.3-rc4 and confirmed the issue was
present. I then applied the combined patch from Mark's merge resolution,
and the reproducer passed.

So at least for the issue I originally reported, the merge resolution
appears correct.

Thanks, Tim
