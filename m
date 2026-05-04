Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE43FB7EB
	for <linux-next@vger.kernel.org>; Mon,  4 May 2026 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777939149; cv=none; b=Phb4FPWQxNVM645RcSQfttI11cCgCJ0565oEib5k9aZQJKOAFLHe/QWYjKL3SryXCQw/beYKS1QKoWM5cH0B0LwX5VdNYzHi5xeNc6vshivkFgFAdAoxLZWeou5wK9pDBRXEf1j4ju2Z2L1e78aTTXdNy71Iiq88bak7CzQGMP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777939149; c=relaxed/simple;
	bh=DbvdLckbFzcsiT1D2JTJ2ybEF2rDyQCoOBQFHWIKGCE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=OqlFArrmjHXuJIYfrEvXcEygXAy2LH21odj5gd7gLL+6zVNNoged+/AEG7cyVDvScowXv7TSvCE5eIRlZHXtf4HjPXahOE2sx6mtgxuXOBq28s9vxkptSjJGMGYEO968stQzvY0UG6BwBnxg+tFkwfc3SE3iZug0XciNxUXLWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Z+xIN7Wz; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Z+xIN7Wz"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c8ccc7755so6662858c88.0
        for <linux-next@vger.kernel.org>; Mon, 04 May 2026 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777939146; x=1778543946; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmAPxWSHCPF3ZnyTDeZaZ3lyy+dDfvSwYuSiCdmys+Q=;
        b=Z+xIN7Wz3sE+VyK4nMb8BwnhVr4urPWTwBOqJ2NG3g6H3T1kP2fxU2y4RUbyoNbq+h
         8WGBpLvY5MvieTrWOe0GsdhRBAsQr7D2z0/bCRuQMNhir1gaRrDSJBTLcmGpB0Tw+yKr
         xIEtG4ff/gp2y7erEXYrSv6+ZvT2/W3/lVLkAvn/bUMOjLjlfRd0sW7nmckqxwhZtHpL
         5eieI0vPg8JwShGo8uIe+JdWJAIFfnVPun0+CVfdP/+wLa0au3RDnAcJWctjpbdGJCb3
         9SmsIJRSkTtpZ6+zh5+bL1L8XJlvTTboTgRZElWjEdqjWGZPJgdn/uUcrB/+OlKArgR8
         uKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777939146; x=1778543946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmAPxWSHCPF3ZnyTDeZaZ3lyy+dDfvSwYuSiCdmys+Q=;
        b=kno33D+aXlADomLNEXdDdJ6xkkySJvp77s+czcvPJejAYQqiDW3WbVj2wyuSmcZYCm
         VRYY+JMmJnqHTD2vMGnkvk6lMJH2XWknM6KxSi1wdfaO00Tj8IKo3vJ7O/w5eNdY4elv
         Pb5up6PzW9MUiqPESp4ZlO7YVGw/KCcDxtZmMap+YADkz9693ZhFtbbyUuXpBQ4BiqZQ
         pBFGX0gkInJDdb3Ket8ECAfPUM2SoYRcVnPqdmZ++mQLRyGeQWhkFVyY63tznByl0WSE
         L4It32QdZvqFQKvnuLAEaGVJGqiVcMcKkBIOkeDFgIi+/yvBu1PkHIlOo3K1IPb9J+bF
         xf4g==
X-Forwarded-Encrypted: i=1; AFNElJ8B7L5z76rUregUD7hDFcKJFMWw7MEjRmcPvCyew4kIOBuwhsmdVyFzm51pQXTd3c6nunXCxeENTOgC@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbNW+wT7v5SpRt45a+TwkpPlqtM5TeOOSfanFJdJv2tET8M7F
	+tyTD/qXfGEIdpr8pZPWSwfldv2W2uc0D8wqo+OhI2RJBPmT+1pLAVHOJG8MOWA7IZ8lndDyymv
	5cQp8
X-Gm-Gg: AeBDieuK+gago3jGyy5EyjqK8OX6ndPd6Pjw94SoGXXJEpwbvRNN2aHEYdp6Ky//bv1
	sYp5f0KaY5iB5j+pskUETQuGB7akXqzIT6DycZZsXeKsFQ8Zj+XPNkoYn49lZbI7Qcqhgzlah8H
	60ukv8WdTaOt0Xvc2KaROpKVjb+X8DLJFBlj52ePLIA1Qem+LoiWSV4HkZScb5BWp+ap7fVpqeu
	A9aUKFp/0fT9EQskNhR9DszOnJUXl02SU7hz0JtUsNSMWlWInjkUXceg8rLLhmX20z6DU5V74By
	+OMvKe9YM8CmF6bRxQWCdjdW5EOYGTPsx2bQENozUed6kUMS4n/y6zrZlZA7BBeJrPvaA/CmYAz
	2y2Oz5OACIqHB+VSAWppG3pHWJKgAxJhFT5Jq6MaTZPFRklPIkGOEFoDgLcKUjqEhMbJCtt1rE8
	U2Z96SGjJ6r16aspAdI6vwMRGlHk4=
X-Received: by 2002:a05:701b:2412:b0:12f:1f67:e744 with SMTP id a92af1059eb24-12f1f67e7f4mr1967760c88.44.1777939145815;
        Mon, 04 May 2026 16:59:05 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8431037sm18354239c88.12.2026.05.04.16.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'num_ports' is
 uninitialized when
 used here [-Werror,-Wun...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 04 May 2026 23:59:04 -0000
Message-ID: <177793914437.2560.9287713196857718000@997d03828cfd>





Hello,

New build issue found on next/master:

---
 variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/usb/typec/mux/intel_pmc_mux.o (drivers/usb/typec/mux/intel_pmc_mux.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:4c562376c15477320ad9a138b83a5256431b57cb
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
- tags: next-20260504

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
  740 |                 num_ports++;
      |                 ^~~~~~~~~
/tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: initialize the variable 'num_ports' to silence this warning
  735 |         u8 num_ports;
      |                     ^
      |                      = '\0'
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69f922810e4ee292cbd1a001


#kernelci issue maestro:4c562376c15477320ad9a138b83a5256431b57cb

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
