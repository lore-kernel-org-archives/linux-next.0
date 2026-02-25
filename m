Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DAD2765F8
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772053146; cv=none; b=mcoTRCCQOuJSgNq9MVY2tz1YKcr6n6ZUOTAd/s/XOe3+Uvt7YFH6BVXrFK5B7eQ8bhUJhRvLWheJoMreJknTupytO/xmsO347MIgNMiX8BneCiCo2mRa2Lo1yjLldf8XFKIBXbZP11niNxAoOH/ORnuks7RFXSJKK/b7UGoJ8p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772053146; c=relaxed/simple;
	bh=vVUewmCetlatWHv1R0K4yDCftZPESVw6eXHO6Nn7fJA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=hRVBRddmitTYH3MiEXOnL2sp0Zv2Q3XkJDekbggLnwWO6c6DPA/3AVpRiYCxGo9FW8mmOhX+yo0CIEMR08tpsRDrFhF9vn5uNnERQUz+uvgpgW9nVDquDWk0EC69lPPmO0+p3OFbuHu1qYZRkEtqHjmUKwp+cKappEXmho+GiiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=gQJWEvju; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="gQJWEvju"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12776bebe9fso236446c88.1
        for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 12:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772053144; x=1772657944; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBD+gcuj5ZDr1GM2fX0wE6cy1EESApbULJSp5txJVcs=;
        b=gQJWEvjufaPO4Y/Y2dwlAHI2s5uyQN3k5+oIxQ/2NG3Vfkf9fL2/bSeo+le5n7KC6B
         n6/fVH2XcTG07ld6PXDqVTQHZ3nC5HCQ2RDGTafAWXtpnfvFEkn3FUYR/78FvJHCaHz7
         VKRZNWqHDwhUiVFsLyZ+0p2FhwINQ3HriJeO3CLk8tcwqLui5feHEwlj62eucwG4umAN
         7Ymu29OrH4VDU9UF8CTZU3URs9j1FS39K9BbHQJHeCOsB9WPP2aBuoaxalx1YoOPN6LL
         4XKMePk/ZeL1Rat6L9GKcl1DeG/z1Q4Z/pjAdmCO6zYd0JhdoKH56GBKIvedt3DWEmDK
         YbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772053144; x=1772657944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBD+gcuj5ZDr1GM2fX0wE6cy1EESApbULJSp5txJVcs=;
        b=eE0uUy7ym5cW/J3nxs9GkqHn7boqca7/3pdv/LdNNIuHjB82oLtUh9zFO1X22xOByI
         u+QYRDj2mXlVe1DmAoh5PwtbDukCMDG/sZgkIpWM7AKkUwLfysbK4x6CIOIFuEnurVoO
         C6ukq79IbCcji1eHBVeeeQemMMhlwDKSvyALLplmiMu3pFnVRb/jtJ0TsOqJVwD3B1kT
         vJ3v8vV5LHCmkqd5t8yIC/FuOQoUCHE4wD5cwmXPtGOg9ffMM+jc3DamENp9TEjaMXxM
         IoJUDSenEl33bLdIB4+KxVPNW6hDq8/YyYpVa+YSbRURfOEV7Cv9L9VOcgCeG+cbUoV4
         fSKg==
X-Forwarded-Encrypted: i=1; AJvYcCUL4iNaD2adBv2ScnvkaOfAeRC8eZeidsH6lZPMzZAWkb1ss8Gd1whIv6l/tmhuUu7c3RH1Zs4uxWp2@vger.kernel.org
X-Gm-Message-State: AOJu0YxdG2stAAmm1egvnUKs0ErH2GAdblXvzdoJUJkYTFXS4J+azBhv
	rXyAsSOXMNWXYabvecTiCGuDXmyr2OU5d+JSX6ak33mfHBpbg+QHnwJkkSnNhk/Ja5k=
X-Gm-Gg: ATEYQzwzkv/AlmAOtVObnWR5SvmXaowSAEv2mOwpcMb0G0SIOgBrLO5mFT3nikQFrsR
	R/IrmK5e5SCjRMGI+Vggx3eBIZK+kCI/GSgMT6nzCDNsY2sE+umEb/fk8fvS2RCI5a3BDJcIvIN
	IqPpn5WnGs8atXFFBnoJEUo68Qsr1wjezt8XjJCiW2lxBRqsyEbpj+cboJ25t8PmvdtnWeHszJE
	9jvcKIH55RnFrb7+cgUVfYEFp2jtiqFmaYMqciAbEIq5QGcYxYeeRRGpcaK8CAaH2pYDTN3dQ3s
	Nd5wYfbNIaEdgBbhjodk9nbTxuTkq0sR+dqBv3GphwFsLWaFq0J9JIXQ8oOzHAykMvEXJuRj/qP
	nIqpHCwNj9Sjp3bZKqFkmhXh/dXiyl7ayHPSBxT4qn8BaZkfPY7pH9RW7KaVXKtXHfZsUwhZfeo
	drEzaxS5vDMf4NHhV2
X-Received: by 2002:a05:7022:68a4:b0:11b:9386:a3c3 with SMTP id a92af1059eb24-127869c0da7mr1006898c88.46.1772053144055;
        Wed, 25 Feb 2026 12:59:04 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899d49ccsm16161c88.3.2026.02.25.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `__udivmoddi4' in
 vmlinux.unstripped (drive...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 25 Feb 2026 20:59:03 -0000
Message-ID: <177205314269.2960.1720626770087948602@d14e337afe00>





Hello,

New build issue found on next/master:

---
 undefined reference to `__udivmoddi4' in vmlinux.unstripped (drivers/gpu/drm/amd/ras/rascore/ras_core.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  877552aa875839314afad7154b5a561889e87ea9
- tags: next-20260225

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
ras_core.c:(.text+0x273): undefined reference to `__udivmoddi4'

=====================================================


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-699f38921f24bb69463aa0f4/.config
- dashboard: https://d.kernelci.org/build/maestro:699f38921f24bb69463aa0f4


#kernelci issue maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
