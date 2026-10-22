Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677548;
	b=pVwMagXmvNRrXsMIH2I+VYJNTloN1/F6AaHKPFoBKvyeXpeuuUhRwQQo5ty0uSP1OwTB
	 cRXXli9MOoiLkizmS3a/ommtYqR+lm2RFm/iTfm7etGmp1JKcnbAC4LYmOfK7+y6djrDP
	 SZJapSfW0vLCcadHNk6c5pQ3dNPlVvfGseIVd4MCgoqT/KM32wTVLQ8OpdG+qOr49g1cw
	 47bHCP66St7tx8xOz5VSi3sTz3Tpxo9e4Y+g1sF6OAJ8kxncfcTWLcXj8QlfOjAkq+vxx
	 2T7o1HAzvsvKzX+9qakc9D7/lSaxTXR4Aex2AICcSN5ma+3bXRjlw9bMENhWUok5Ygw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To:
	 Cc:Reply-To:Date:Message-ID;
	bh=yapslLW8DJgafvTO1QZsoaeneeL8j2kAUWpgSuLBw/0=;
	b=sAzL05dMJ8EBrb/yZAH4UYKVCynrXCrM65XHerO3o1Yf5SbsU0I0Yvbd/P4pSOWnLPzT
	 0gZiRAUXOcnNzrZHXsl2KcF3Xg83sM849cJ/e1vmCAJ66MdUOj8SENEXJK+OuG6bSWaNR
	 eCm7WY17HCiAxVUyZyEC8jx/Ci0qbyDxeZx7t4QyxXVy5ZZXTffYpVsAFtRByNrCmtV+j
	 0KcrLmmZ6dg1Ti/BRZCJecTy8sRYBmY82wa0UnZMrwkxmTbiFBshs1rlyviVsaP7JlhVM
	 x6eFNNDqclGeemcoexAs/2OW5tz13eUc7rQu9FfzeX2hkjnegXe1e5rVxSTAWGoSVxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b="Le/cKqPi";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8458E606A31A
	for <linux-next@vger.kernel.org>; Thu, 22 Oct 2026 13:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8458E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Le/cKqPi
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35d0be18c71so1032110eec.1
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2026 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792677546; x=1793282346; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yapslLW8DJgafvTO1QZsoaeneeL8j2kAUWpgSuLBw/0=;
        b=Le/cKqPinGKdgsjy4iOLTyE+J2TbYRfhoW655YJbVqNcQRfBZTd2TH0doV1BhADHy9
         QZoNZDB7YqsFj3c0Qm0/8EVPQliuZ4B7Fd9yBtr3jP62xTBjRi1GbbukG4ayr7DTntkt
         wuyvwAqQbBTaVT946XuD7uiiANLNnMRiV+WLvYyIT+YMn2KCnRJnrSV6v+nQCMHCcQqM
         4bJ2gXqBa6Wx58/lNuS6p17JhDfZ3YtFNlpGA1lMwbT9oqyvNNw/tthdcoKonxJU+KW8
         /pjyChG1luGqofNXuKHBm6xS4nsw4Zi5wKl6K6JYgFm1lnQm/MM++buXt4mkgjJXiAna
         Krcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677546; x=1793282346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yapslLW8DJgafvTO1QZsoaeneeL8j2kAUWpgSuLBw/0=;
        b=GcSbedCz8tkqQZh0bGyPnaZ8KdFZQDvKz1eErgiosnz0gw/RMuuq+9lKr2ZRTbFpxW
         jyBRrHBpXo7l+lv2ZaWCdwrGnRHlK8XUSFg5rGwLRFrT2iKokavogNzrP3PS0uQFVk8g
         8uNSSMPkvEfCnFCqOJbPgRDwhoc1S3IsV9kz1LVvPCGDqElNR+DRUsok2NjfXNFUyqhl
         7hQw6f6uL4+DHVNnQ1iL0u4PkjMmk56avUE/CeQW2XOu5q0VfZKq+LLnvUPeS7jOwjvS
         jOvlU1ZxPnriMLM1f/+MjCATmo8H8OdLOLUkA7G7EoOQOPf2x3tlU7Vqd/Rfui+o4h9G
         uXfA==
X-Forwarded-Encrypted: i=1; AKwUvBw4gEP6ZGeVK+O3k27sip2ZzVXeisT69aS2not+JiptKCG1iRBXOJtktTSX+GJJ7p5zaPBPRvmLlyY2@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Du/HwivxiweK7SPFbNu8WJRvnyCPUQYdTYWqXJ3Gm5z+tZU3
	CXwTv1iGkvFP8Af2TqZ0Sj5gbvAeqGQtcaTaP9OrS2rjnbn8dXD394uNX0zRnLIGfwM=
X-Gm-Gg: AYBFou1ltmj7u8PjbheXzBmnr2VrHHGYlnkKhnlnbKRfTG1i6qyckVU0PdohIzV85VI
	XrNsQ/GARIMeJZ35LdIcF9ZW5Gn1YCjGQfKK4NxbARQM7JDRT0fbOcq/PKVZpRaET3ttpdtLEGg
	PHuOnidG055hlWSulvHAreXqfklAfucu6i5+6uxV38mpm+4+iO2wKrO81hinXIyU4H2bPogFdAz
	X/eg/07x6526yQybA3X3cxknv8oDksirAVVCjUT2HzHRKL5e6i8jad08Z4YX3uCu0BiU+7PMu6n
	Fn1+pGU3pvGkkCF1bAbIEmzBEdZ9eil73tkSyr2iadhVEOqAnMFy1VPt0cHTj0fOUueVXd/q1ep
	0J/U5Oz7xnXxCujBcoGR/yt65NZIRKD/gcV9sOPr9HZ226mLvXhWGOmej9/D5QHPLLfSbu6EzDC
	BXBsfkKDw3ndA8MGD8tdIU3mEUpaPp3z6UOUOQ0Lag9uYCMA/GNma0Bo4u8lrQRJSNU3ySzvuyP
	myt6vOqm3vAN/wAgbsf8nRMtMpT4uupsHQaL/QBFkfwnneRAw==
X-Received: by 2002:a05:701b:2086:20b0:155:734:9cc9 with SMTP id a92af1059eb24-192f442b6d4mr3254838c88.16.1792677546254;
        Thu, 22 Oct 2026 06:59:06 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm23639534c88.12.2026.10.22.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)arch/riscv/kvm/kvm.ko: symbol
 'kvm_arch_pre_fault_allowed' undefine...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Oct 2026 13:59:05 -0000
Message-ID: <179267754360.302120.2153520610797426540@kernelci.org>

New build issue found on next/master:

---
arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
---

Log excerpt:
=====================================================
ERROR: modpost: arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined!

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179267754360.302120.2153520610797426540@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:9c12526508454935ec55c5be5b9699f5296ee63b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
- tags: next-20261022

# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ada0faa55fda507606868e9

#regzbot introduced: 9a482184d910775cf648863148944945b74e2815..bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
#regzbot link: https://d.kernelci.org/i/maestro:9c12526508454935ec55c5be5b9699f5296ee63b

#kernelci issue maestro:9c12526508454935ec55c5be5b9699f5296ee63b

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
