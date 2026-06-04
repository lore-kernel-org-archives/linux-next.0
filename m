Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC2F4502F
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595947; cv=none; b=POnBQADAoskZUF99noAln/OhfsYp9JC2v6cDO7YApz/R9WGUJqunE4oc04JjQsLIUVBOfec2839RRE52HdpvKxyPnMSQQjcXNGbxMI7lhCbERmpyuWN/vgqsd9gjpxG3ehGe9nhyqtk+8s9Eo06HazdtGOgQ2b65pf6MnHvD7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595947; c=relaxed/simple;
	bh=nfK8RylvLKuEzFpYXFoSYWUzV/VO6lZO9BXznBVS5HE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WkXihYb36aYhGue4CiEj3jIF0w7vSlDHvcnlyna+j6k6UMk8abMLxGbVKrpg6hrE4K4wT7+R5oDPwmbVzpT79mZ3AxlosU/IfWAt7VjelMiBrUZ7eWfdlSJUtvop9NO+2Z/4SJCsZqCjdqLeCp0LSkWsvh1IonVlgZa9l1gZebA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Q1yKZMW6; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Q1yKZMW6"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137bd9ed2b1so2320302c88.1
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780595945; x=1781200745; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyEsaSsaYhlOCnUozjrxNOzw6jzmnNaVQY0+GszbH9k=;
        b=Q1yKZMW60x/9dWy4C7Tch5KuMuDloEp0OqQzKl5x6qsv+KRVuUp/HlYyXXmveLINmO
         3hPSvgeJGjxkA/c2+TUi4xAgcdSKBZnZsRn/Tor5IcbujLs+VSDDgGH4lYd++Vc/920U
         en7eiFVA5ro+cp9k+NqG53UdBOx5UhwtDVWh2lmMoGJ6oYcuUPwgo0B3VPkPTQlu4X0C
         Rhs+4gPr3pgmsVn1jpOQMZ+ByJJLlEaPH5z+Bul1gEuonNJkrqpTlP5DKxBQ5pXNwcER
         WQq+C6Cd5nLEARkebZfVaqAU+AeBG7dsV5z6sf3RXyUhw1UhY/rKfNpnvkh6gRpy4MSO
         pFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780595945; x=1781200745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyEsaSsaYhlOCnUozjrxNOzw6jzmnNaVQY0+GszbH9k=;
        b=GAk/itTawzXeHyuxPja9AOMPlACHf1BPzlmYyCYmpFwN8GIqEe8gWfbEO4gggdswAq
         lAxAgLGWtxDkkN97Nch8qcAMz3+ZOxPAqY24kVsMG5YFxs4k1fsep8MxM1YJVbgrDish
         IX4tl9cLX97vblbIPKyL078gQ/D44W+NP5WpYb+xhxpL01SN2XJvAfbtJDRjnbPIy8BR
         Cy5OsR7LKZnYvaZtrWruYk96hRy+LZGSxPgkWgOs7L70pKhsuij+RfOsrLYtZlBdEDwb
         XBDekTv8Iq3tzaNxpoO/cjFlE1bnTFmPVVfJCSzTgl+7guK0bAQW6xi8NxFomGHio0DW
         3Tcg==
X-Forwarded-Encrypted: i=1; AFNElJ+14KaTXjwwia1pd+W3qAx1WnObU+1sYUIz90AWvILqhwOVSsJa8UUujtERiIlP7JHAOwdIm9NO8ofo@vger.kernel.org
X-Gm-Message-State: AOJu0YzE6hOiSA79scluf0vz+AVtxOxyh0zwZUI1GIpOVzIFJVqXUCJx
	RZlX260H9R0h0Hozy4WAtWGRsvlIYF9SaADTPxTCyYz43RUmCZLCMf9Qdbx8GiSsFPU=
X-Gm-Gg: Acq92OGmSc+quWMIYD9Mf6rAoYAphVFLQlhorpEoF43tXWPp3LppoO2jtpmeUtqFG0h
	1rPtwytCUajscujeyHLPOZeISsq5Y2lvTA4mJuxCk73iMHTPld562BmvVXUE7CO1Dt/2r6OfaIy
	P0Z6HVFO3Lplu27b431hD0pRZCPOFNu+YC2h0Nn14nvVKPwyVaMLV6/+bJhoTVeSHHEVq/lOSjF
	kQKJhc2tvF0xtAolVDjBUyF6JtM0UY3sd9UILOOrUfk7K9jajv5HOcKrWuTxcl0+O0ohgaHhktX
	kRh8f1QnB665VQmYa+6xfAcXW4BziBiAsvEqdzO40GDLtn43JFdv5CWLpC7FYVq0dGr9+EgIe/g
	r+ize47fKuUyoVs+lLKDEk4anz/MK5zmsyoQwe8vlCMBs2mCPN3tf/5bRwwwvu6X2g2tkAqAt8m
	X0SGui9Ya/sV64tyE+kjh/qtoAQ7w=
X-Received: by 2002:a05:7022:62a3:b0:138:36f:4288 with SMTP id a92af1059eb24-138066d54e0mr72818c88.15.1780595944696;
        Thu, 04 Jun 2026 10:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm4387471c88.11.2026.06.04.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 10:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) stack frame size (2088) exceeds
 limit (2048)
 in 'dml31_ModeSupport...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 04 Jun 2026 17:59:04 -0000
Message-ID: <178059594388.10259.8984887956034576074@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:96417cd30041ab8f3153128d0120c6cd70782d99
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  b99ae45861eccff1e1d8c7b05a13650be805d437
- tags: next-20260604

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3872:6: error: stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
 3872 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      |      ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a21abf22cc72b6e94bf3c60


#kernelci issue maestro:96417cd30041ab8f3153128d0120c6cd70782d99

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
