Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510A43C06A
	for <linux-next@vger.kernel.org>; Tue,  5 May 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993148; cv=none; b=erlj2WRSe7cD8z3aYn2R6Peu13GWnhdzl+0uRy0EyLFK81w7idhY5mQKoFKuJr4MmcPiClM4uRl3LvcHSxZWdHadR70ju8ReKrlzf2ucJ2ximhDI7i6bCqwznrWTinInqzA89rgYbSxLRLjlaslw803+IhYSxs6DefM9FG1LTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993148; c=relaxed/simple;
	bh=3ko3A4kimfuWBvgGqRXOJUht8CCrfn4FYAasG+Lug2c=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=deNdteiWcOlRyI8qMhOhuRTtjpJ/+K1eVSU48+OWa86SWOuP098IW21WrYNWErXA7a3Lw/yadjVE4rcRFYVvx4YbkTyBZqp/HmtQ18GyVXzUi6w1VcES/dEPmmzrwFXelIvE7KZbb3+xbz8kR4Dc0OHGGkY6ywjuTE4KQHmd1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=PRxEUGp4; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="PRxEUGp4"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-130a4aae5ccso3771362c88.1
        for <linux-next@vger.kernel.org>; Tue, 05 May 2026 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777993146; x=1778597946; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+JNAHsC4qi6OiUkol5+kLRuL2+NBa4HUfFXhnGmjXY=;
        b=PRxEUGp4mg87VzpG1C2axyXAOQYpuJR8OMsB48tvjmYTWPcTG9A9sgeRALJqQBYF0u
         qEyRURO5ypVyy9JFQ3DIHEPjBXU6Weoe4bvEn0bZdoE1nWoQMOoFIyNqX329+M9+OfTl
         fPlpLQ5Fu4vCQpmNFH8ryUB2Qj1AlQ76oSk5+PrS0qQVdii7XUpQh6rUi7SkwOgygopq
         mTKrvvqq5H+MHLgh9DcHrVyRH+axVnCTIFJGIIagUQntRsAlpBwLQf/wmHpM7Xl4bQV5
         N6ZLgAPTKamgyCKiw+Gzg0kXDHkz4xsNjSyCqHFkahmA+wEvS0rJnLeNaRr9ElQgpJsQ
         nkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993146; x=1778597946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+JNAHsC4qi6OiUkol5+kLRuL2+NBa4HUfFXhnGmjXY=;
        b=tNedEWhaQV3D/n37prajb8NRDYWTXDBnqxVWv6gkBh2o0q5IC7suk5jn8W8C5x/tCI
         MPecUGaTm+ExJcGF2meXroFUst/+BBl/12Qt7LyhbNdZiazgiS7NIbBcdrkFKSeOuA4g
         DomaV4LM1pdXHJ7RWQvhodlyZNqRB26mmY/XoewFSCQz7M9IfDxWZWqrtNGOcWM1hcwK
         Rh32QPRNtHMynX3zsSxCOaFyS9yDxbZByCFO5eF54JoovZgmtdwpPli1gR+af1nHFl6j
         MTw3xOyHd9Wlg3BQfTxz81+XvcnvsSv6l9+Git9WTiZKKxWQuBvRVbfFiooyM11QVYP7
         Mnwg==
X-Forwarded-Encrypted: i=1; AFNElJ/RPUqK86PzlpA45uHvwfxDTwksNg0b1+dQXiS2yWSzVImaRRz2SO+9xFqUCmMKFeTHZSgtaZMy3EIp@vger.kernel.org
X-Gm-Message-State: AOJu0YwDL2ahN7SqkUVwEE/gRQFYLvH336QK75KEWxIKSjaHOU1GnRvm
	WAQqBme5GwHlBFqorc3WxQQ/UJqGQp58nTjqdSzneMyMl/60DypOoUUJmzWmARBMGZ0=
X-Gm-Gg: AeBDievSQlTXFf6zNzHasSEVhpKK8jlLCiAF4YiJG7f33WNYREbmalnJQY2BR+gaABx
	P5j2U+EGFsqVyvrHzE9Hansr8UTddWs0UIWUiKRHPfo+Oe+hslzkl8J65R8sW91/ogCNP90rDUh
	xToJzeK1SujI7ofWof7jA1vIInYJEpqXZhrWSNM10HzZ6s7pZpF3UvYH40oI+NByBh3VoKeWx5w
	RAnMfjykwk3NS1eJ3U07dezUveVABaqj6njwVepeN6yN33sxZAn+BtiWIrc9HXlE6/e8mp3Rwzt
	bKlF5J8K74gCRIXNbifQuUuQvivrGovT2QOKYj/frLcDMOGlL067zji4bBVGjtlTKimsaAA5srW
	4v4WkYtG4/MDBEgDmTCchhRQ4Y3TCaejy3CgXSYQheaAtIhw7AV6921nFfgUSYjxvy3btRFfvm4
	SEryEJvI4mg1TxTg42SKzKSa7Fpes=
X-Received: by 2002:a05:7022:523:b0:12d:ca31:f1b5 with SMTP id a92af1059eb24-12dfd81a74cmr7152860c88.26.1777993145586;
        Tue, 05 May 2026 07:59:05 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8278e7dsm19358808c88.2.2026.05.05.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'jack_state' is
 uninitialized when
 used here [-Werror,-Wu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 05 May 2026 14:59:04 -0000
Message-ID: <177799314451.2848.13872601558442495235@997d03828cfd>





Hello,

New build issue found on next/master:

---
 variable 'jack_state' is uninitialized when used here [-Werror,-Wuninitialized] in sound/soc/sdca/sdca_jack.o (sound/soc/sdca/sdca_jack.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ed6f3327055b3d832c87e92ead3d68396560c4f5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
- tags: next-20260505

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/sound/soc/sdca/sdca_jack.c:211:5: error: variable 'jack_state' is uninitialized when used here [-Werror,-Wuninitialized]
  211 |                                 jack_state->mask |= type_get_mask(type);
      |                                 ^~~~~~~~~~
/tmp/kci/linux/sound/soc/sdca/sdca_jack.c:193:32: note: initialize the variable 'jack_state' to silence this warning
  193 |                 struct jack_state *jack_state;
      |                                              ^
      |                                               = NULL
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69f9efc40e4ee292cbd73c6a


#kernelci issue maestro:ed6f3327055b3d832c87e92ead3d68396560c4f5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
