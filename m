Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141C3B1EC8
	for <linux-next@vger.kernel.org>; Fri, 11 Sep 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145961; cv=none; b=U/gcDzPCYtkSQe73Csv9rlOHftWvCuIcByqDS4ftnOut3tsLOaFCt/8VVWqySaR0h+MnMZ1WjHRcQeefB/0Ye2NMKtuS9rVSWLHpC/1RXPARMqdPZ9ec4V4RAl34gMj5q3G6mkig+4AkOS7CdWiBPtLYn823YQ2TR9Y0X9U9Rw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145961; c=relaxed/simple;
	bh=2xFq+mJLGKsr1RwrzUjn2Avzut/7ZC8X+I2KGp6BxFo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rOiKTM9y0Xu2cJKEnTbADg52dZzDdagwNs6zlB/qzdNaN2wTqKyfyIhIg8xtHCRBEHsK2bQGKKj7SkjziZzkH7J+mNKkHQ9VoYW31mRGA4FdbOiIvkcGeHOEkCS2Spi2CIHM9haheGrpY2JBf1S8d+KBOmhE9OvHfnZxCyJTJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=jiMp72WC; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="jiMp72WC"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso787107a34.1
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2026 09:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789145946; x=1789750746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRtWZSQeyKNAMCOPqyycUsTBH2sja6J1xsz9HJwDp0c=;
        b=jiMp72WCexT9LaAAb1/Ar6R2Gu3+eWkXxireMehHIJ1Waup44TGdvdkNbrVmvCEelm
         VEyQuVoR2e94A4lGhhfQqkh2tvqUlxPg+NZVmaPWN1DiBjQQRRupjSzecf7LsnfK0keD
         YsK8EAesHKb1Gk9CnyNhwurBKBynNjzYQx9PPdIZXv1uGxQM4I3E69Tbs8Wgd3AeX1+o
         EPUr/WICvptNJh5KV6HRz1VE+LYPvu1Edrhv+0S3YcLtbmhU7NC+7JfK2iSbSXStSHv3
         4hO75y9dsexyRBX9XVii35puwiL3Dp41nSognkBqwU839XFYYDYbe/63SB3S0DuyVR0g
         t9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145946; x=1789750746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRtWZSQeyKNAMCOPqyycUsTBH2sja6J1xsz9HJwDp0c=;
        b=fmgU/Kq4I4U7Qe0a/7G+u5xO7MAUe7DjmYFc6NZyhdzhg0DB7Tb2Su39ATgQJx7X5x
         rOHXsNyyrGs+LOgVY2d2I4RJnmi4JAQRH6JnXEUBNhPtYW7CX/suhKxydxlg7pt+5589
         nToo4j5QkYoPqnQqJYFrFOWz3QDHg01guG0eE5TaVzpHpbIAW1pDIup6NXogIjnCoK2S
         E2cADsNhg/miO5CQ3ehoYpQSbRLAS3emhPLHktALBOxTgYA6KKBkG0gdMaF01K2yzwyV
         feYHI8dRkW2wdO8TDrDEzNwDCafV3Rify3oCsd1JpvMBCLzMWezyhbUi6cbzsiN1bkon
         0VGA==
X-Forwarded-Encrypted: i=1; AKwUvBzQb421U+AzyayTsDzm/2RHlAlrA5BCEM36gJd0j/mWMiAzQvGaxANxRmNdd/uOKSd0Zfw4ZvL/gm7B@vger.kernel.org
X-Gm-Message-State: AFuF++ka4/8PNO/YxdMbZwM5o8/y/wEcIbHgLhaaxU073lA2dw7MlfJI
	lWTP3dF+FFFp3fn9CkVMYF8ssPjWrjJFW8r4Sep39HFSDKCzqQe9gUB7dv3A/LGgob0=
X-Gm-Gg: AYBFou3JB5vlQMAeqGZKYIxryOjfa0cNRCWRgHtwUeQ6Ult9bM/JK8wunyLXCRIv4Pc
	ksrVKbIQkXOGxaHk6tNEqmo/12S3r+RrXYDvtsUHY0pNjSrlCCeztbutgxsote2o5/02QxdlSV1
	zXarNlbEG/t56LFKarN8H9dlKIHUCGrfq+mieAsDkPuQX85HcjhWD0UTNcxLl28lC7TDEy3sUfL
	IorTjNZo4MCIC6kMDVR8yuzhxiXSwVK8VrANcuiUJnqIkKhVnJNOmLwx+wIo6UNfrX/k7tSlbXc
	E+y701toSxqMt8f4LVBXavXgQEqWPrhObRH7+s0ualZEFLoCfFu/1cfSHCDYy/4G6bJhmDNi75o
	ppZyU2ZdwZdQ+DiFhcje3q1WwrIT+4jE219ixEW1XlhZcej7OSnqZLLLPyiDNgadZY7EFeKr9Dv
	TbUDn0ERcXd4x9EfZBt5y0NcmvIiO1mVZs92dUDdAD2g5fG+QlFgMkz4LPXd0Mphw6QGy11VsJl
	A==
X-Received: by 2002:a05:6830:67e7:b0:7fa:ab72:9df8 with SMTP id 46e09a7af769-803ff4481a3mr4129270a34.16.1789145945784;
        Fri, 11 Sep 2026 09:59:05 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f59ea4a6sm2818725a34.5.2026.09.11.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)unused function 'parse_edid_cea'
 [-Werror,-Wunused-function] in dri...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 11 Sep 2026 16:59:04 -0000
Message-ID: <178914594374.4423.11399857311284391817@kernelci.org>

New build issue found on next/master:

---
unused function 'parse_edid_cea' [-Werror,-Wunused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3690:23: error: unused function 'parse_edid_cea' [-Werror,-Wunused-function]
 3690 | STATIC_IFN_KUNIT bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
      |                       ^~~~~~~~~~~~~~
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178914594374.4423.11399857311284391817@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:2cd0ade6ddcd35907ea4715e9aedcfbb461a8dc5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  68142f986ff04b2b70b31db00f719bf690f64a9a
- tags: next-20260911

# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa4271720239ade90232fa2

#regzbot introduced: f2bfbc3554ca6919484030729424b9dee2942d24..68142f986ff04b2b70b31db00f719bf690f64a9a
#regzbot link: https://d.kernelci.org/i/maestro:2cd0ade6ddcd35907ea4715e9aedcfbb461a8dc5

#kernelci issue maestro:2cd0ade6ddcd35907ea4715e9aedcfbb461a8dc5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
