Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6264A6888
	for <linux-next@vger.kernel.org>; Fri, 11 Sep 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145964; cv=none; b=XBxJ59XNmW+HtQQ9G7SLGgDKyF1FCS7kKEP6IxhuO2d8TNSEfLFhn7Qe6gi9r3BNN0X2vRkY4Uhaez/3nb9R0myoKz6wB4XRfk5MYlXHPDY+pkDuh72ev+wisJKWAOvsd/cBH5WW+CQxnYL7dn9jOv78VUXnsgI3i0eXGwG3x/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145964; c=relaxed/simple;
	bh=MpSAouggJUp4vgORobePFMjjqwuonE7VilPHv1CLSaQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VYWwweYkHqcJfWbzW9VnvJItyAh5p/YfcNB+rukGUFo/U0DqZ6GLdYxujyxj1ofzL853FVFoaLnjjDYRjkWaGd+DJqvhghrVX19x9YOyXLBg8S5c5P+FdWMO5jolivx6m78d7K6rYMAZmDN8DZzDNJOJHRPg9cCRH9EH6QkA7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=W8JtWynV; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="W8JtWynV"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a451915d8aso1323948b6e.2
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2026 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789145949; x=1789750749; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnRkQZYF1qes1XmcPRPz5oF/ZwMbgnh7Exnh7T9glGw=;
        b=W8JtWynVsRucI96QNIMRGdnccBUzRsHd5BT+zyh1DmeiXRrn2X/6u2pi9FOvw+agai
         yCyRlPkPrz5ZYHMsHZNR0F/8zc1YCj2T4HVVsHFcMANBEnFUsag3kT2u6BP/D+rV2Wia
         GT23Kg4zM2ZdiTYPxYWAPU+TxDR8IKUyiZtqcp/sI/3xTxZyFksGvp8S/Fn+qW2D0LhR
         NylgY9iPOXQTGp50OQnXTNoxKoqbxsuok/wafSDjaX+JiPsMSpzthioIiG1sneT04rrL
         wJGmi9aKmcouKSjL2VpNrbH5ducKPYfhYng3AN9PQHiPxBlwKe60xdQ/bgAIlOhOOUyE
         wbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145949; x=1789750749;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnRkQZYF1qes1XmcPRPz5oF/ZwMbgnh7Exnh7T9glGw=;
        b=swLrPpNBxPcsxjbOlhsqApyuo9TmdgjDCFmzOR0Hc7GZmPZS2VF/eywDhEPFohfv66
         WUPdP/kKpVde/8LlTy/utsrc03IpB2tk+ZlLI3cAbs12vpIIWY11t6q9sVJ87pK5oqPX
         aB5wAmiN+jBcyzyCP4+egoSGQFfWQx+8FXzKyz0Mty7l0FnXCdKZF22A8oSMTpHeA/uT
         I6N4zFR9EaKsxQQBKFkdc/U5tTLgpHHP8vtrJpELNxu3U0/dG4Qv4pvZD1BRsPApnJXx
         DHLG57vtyESzsRj8K5jAEuHXBzo/t3wrxHB6UqTwm4jNUPtRD1LwPrRrUNnPEUX6Ska6
         8tzw==
X-Forwarded-Encrypted: i=1; AKwUvBxkMa9ivM44TNaqFXezOg1I8tZwlNVd4Wr7C/q9a/y5jpTCGLDox1Nx8G9gk3osstLeU+V1n8dVflGo@vger.kernel.org
X-Gm-Message-State: AFuF++kSTiIYxLVkhIRh3MdVt8kRAP1flNiiDkXwkJMmKvLgYM1mlu6c
	DNXWE+tVt75JRWe6Ti+uV1aD0Uo2be994YkE6Ta6ERWVVrmLTgj2rn129UYVX1Wztto1x9WT7yD
	hWMtp
X-Gm-Gg: AYBFou0L/bAC5oQaiMgvneSBlfRK4rY7QCzXKGQmquc+wRHzjwy1HNfVj7UByfBI3lq
	MdL9xO1lytlqJA41XteDzi7w33WvictgUid1qYa6BWs/n2uVELZNMfYUJd+VllkEjfK4b5YbLIY
	1Pow7/kZK5zpG29X3LXbu1bNFo89qUsbBUgBZwBq1MjJnRNd8NtzTKqjARhXqi6iib43ieCQDqz
	BAP68Eo2pNpic6lpgtZ6BAbbdkm9YfifzZ/9eRgc4bZQ71jA4ht8gfK6Qhp+pK1fDa3XIfeTigN
	k2m1Np07z632SNGkJdw40rmGFCxDfmUy6IB1vKYQ9GXSKtDCPjg5a35psxSrFP1g5iIO1ZDOJy9
	vxHu/K3PzdovMDnposLDy0NVJnxgpmWQfb3Tsask9xHPS9H2K3d93NR0tE7QAkSI+70IQ8/ZClK
	upq0TfUpCXgFZw/mfumdVaSzwB0BhQFN4gf33XMuWqWIk0HC95lpssHU+Joq4sF+s=
X-Received: by 2002:a05:6820:1ca7:b0:6be:19a6:fe63 with SMTP id 006d021491bc7-6c0b9d58514mr3746853eaf.25.1789145948673;
        Fri, 11 Sep 2026 09:59:08 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0996dc5a6sm3216896eaf.6.2026.09.11.09.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQp4oCYcGFyc2VfZWRpZF9j?=
 =?utf-8?b?ZWHigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0?=
 =?utf-8?b?aW9uXSBpbiAuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 11 Sep 2026 16:59:07 -0000
Message-ID: <178914594745.4423.13336797159691042320@kernelci.org>

New build issue found on next/master:

---
‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3690:23: error: ‘parse_edid_cea’ defined but not used [-Werror=unused-function]
 3690 | STATIC_IFN_KUNIT bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
      |                       ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178914594745.4423.13336797159691042320@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  68142f986ff04b2b70b31db00f719bf690f64a9a
- tags: next-20260911

# Builds where the incident occurred:

## x86_64_defconfig+kcidebug+kcidebug-x86_64+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa4280120239ade90233200

## x86_64_defconfig+lab-setup+x86-board+kselftest on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa427ec20239ade902331e9

## x86_64_defconfig+lab-setup+x86-board+kselftest on (x86_64):
- compiler: gcc-15
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa427f020239ade902331ed

#regzbot introduced: f2bfbc3554ca6919484030729424b9dee2942d24..68142f986ff04b2b70b31db00f719bf690f64a9a
#regzbot link: https://d.kernelci.org/i/maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26

#kernelci issue maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
