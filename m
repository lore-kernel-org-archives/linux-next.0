Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E387D200C2
	for <linux-next@vger.kernel.org>; Wed, 20 May 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281948; cv=none; b=H5KCWyb3FfwGhx1tZmzYV3g/R7ev6qDKP7fNXciTAis/YDDx+CWqztkuNFeVIFOdePPHVo/xF1+OlHos2f5ENiwxbHaBDUYdThgrH+dWPRvZmJDrWB66Sv9x5skZtX6IHYsPbCGZcUo6IIYpbWvTTvkzgIiWmZMawP7MuSRCOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281948; c=relaxed/simple;
	bh=65RCTQjSqiH9OvgLpUr6Nvm6TMbutL/FAxsgSqjiKxE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MFwVdfL3u8Q4PcI5XuQU4YHxzy3GeP6/MM11e7zQd1qNlFYUXUI7p8wxpRVz9+QOntvupm/e3PVB5AzBfcTcJADU411IxmZK85jnAb2HJ9FDGiKqq0sTZj3n8NL4dLW4HwdMjRwX2rQdHpc/kE2NOkkwfxSC+Brj3wnq3vS3D7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Vz63bGcC; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Vz63bGcC"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13621cca8f5so187242c88.0
        for <linux-next@vger.kernel.org>; Wed, 20 May 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779281946; x=1779886746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgr1ZYz07Uly84CvVDogKTgiacxKhqua82HkZPCO/LI=;
        b=Vz63bGcCLNgdHIWtDJE3w2HROO7cDTjfsUCjHqLQT/82Janx0oT96ngejgKhR33hpj
         /a0UDXfKZIhnBpfhHzsU78pK376vnCAA4tknPlCGcnG/C3DKtEtu1GZf7odxkIPBK7o9
         Vs1TCLftsqJItqMHGKtAFddSWoqQMYHPAUUw7us/G3rBRMXarzz3iVw39XvliMA2hif2
         AmF/YeKvn73EsHx0TxlUq0f+gqSY3h1st8eawlbbW7ipoKUcncff33xoGbzgHV/bPGdf
         1TC+j0oEIL+S+fEAYa2DF0Wf9QOPZV4cUiI+8So3VntzNXqo+2yml7EgMgXSrIKa3eTY
         DvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281946; x=1779886746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgr1ZYz07Uly84CvVDogKTgiacxKhqua82HkZPCO/LI=;
        b=QGmz3lL2XWP425bdgIeM2t7aqNpTvLOtgc7aalgz7EljAHH0A8p1v6ku9mwOB3anWb
         dmQ+zW6dEtx47lQXZZcGqFf6641FMVMNiKAOW/7fBKyQdl4h0yRoDYgcsva1TXmySPKV
         PO0na8aiwpYyANV63n0f9MVFAsQrxNwVI00zDade1eJGymdEnps0/5V499mclr4w3bl3
         QpItDXAwKFP/r8Pv+bx8gQcHkGdf2uzU0S6kWdrabxp2I11fCiZ+eCV7Ccp7kczRz5bt
         XCPJAGpHz60z+Gvvw3lpmnNVMRAehWHGR8NDwcCNpK8jm52K2zIajrK5y/QEs8ZjTCT5
         hvLA==
X-Forwarded-Encrypted: i=1; AFNElJ+v0NSgNVwXJJHI+P+hdGOjZc4hhxXflNNbR2FtKNupZMCkKYrhCVqc2nGYAy7ksGmcNwKzxQknh5pZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UUBOv7kX1CivtO5PiE5wYlg03hDXD9QyppbBX6fOebvToYu3
	u0B5ubYI5BVTIaNGLrgUmKO8I/krmy/uA7rSEL5Dyf2/SwVG25i1qvTeEz5LOcby/ta2Su+GuBr
	ICWfc
X-Gm-Gg: Acq92OH2u2YSH2R9PPH16hPKoSCFvoiay2WsfEeMIrJjQ7TnTFM7nglXdWk/JyEqixu
	Zwek1QjTcmiihIVMBgpYc+OWkWAeqKHrPZ+SR8wiz6cduV3f7wF8SLy5XpDSXSNIlm98ehmAG0K
	rBj0QN/gFxmoAkAszjlfua60bkO/Ytjq8PJl7XXpDLyseahI7IMJEc82llcvEMi8G7+3Jp7ObiB
	TVtbl4etzo6tWGFe8sIxhgpGkutC1XgOJOQrcrIna9WnKLvpbFoGrH8pkz95GryKVLX6MJpfWf5
	7tEcmHiOXAsDUp2vOcnJfxaF72qCofQynDfBHlv6y4Qnv1/tvSmY8Vv2ZAPpC/RRFvSf6buH96y
	PMZZoklQaSuAGMxYBDtsYaMLOSTWFv+7ViUFmMSZzWg3it744Exbd7CW1EjJRzosUEiQqxqW8Yx
	nvIGfIU4KqwnS4FCRv/G3G3A/sIsw=
X-Received: by 2002:a05:7022:6993:b0:134:df7f:910d with SMTP id a92af1059eb24-1350451e077mr9875479c88.7.1779281945853;
        Wed, 20 May 2026 05:59:05 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdce9fasm21886223c88.4.2026.05.20.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) stack frame size (2104) exceeds
 limit (2048)
 in 'dml31_ModeSupport...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 May 2026 12:59:04 -0000
Message-ID: <177928194404.3268.18401290607331979680@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 stack frame size (2104) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:504ac30a3bdad797a2185cd52e1b61acb0439072
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  687da68900cd1a46549f7d9430c7d40346cb86a0
- tags: next-20260520

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3800:6: error: stack frame size (2104) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
 3800 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      |      ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a0daa38744d1c1da0287568


#kernelci issue maestro:504ac30a3bdad797a2185cd52e1b61acb0439072

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
