Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52C93D3304
	for <linux-next@vger.kernel.org>; Tue,  7 Apr 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581147; cv=none; b=BSFaeMrG9+PlBcKH8Van2BGFaHetfpERGovkMjbzE8Z9ZpU4Hu4QyYWIvXw7x7F/CVg+VPJpQyszB+2xUQwKBeHBUzbGT2f7dzhPzx+JqLaaOLp7D2ShfNTiKR3fmLY+0FnbrdVZox0cRzzsl0SYTdkhFK1a1QLQ56v7c3mKYS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581147; c=relaxed/simple;
	bh=bxYEIMMTVo3a3xUHdj2264nnwkZcK4ge/xjM7PO6BWk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tfnafN9OELd9PSagRuyRoevCCvdYowxO14zgZzOsRZaBelcDje3aQtisQypiMyiCQXytttFZt97fX60fSex9x+87g/Cm5dvO/sk+qstw9gVCrKqJyAd4wsUM4GG7juIKX3X5V+eqxZayq7qao7p71owgUKVWcAPM4nch8mnA5QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=vBraFCXi; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="vBraFCXi"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c080efc1eso82163c88.0
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2026 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775581145; x=1776185945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MfhcsKLB68VuGfp7KQRym1YthVXBJvE5Ws4oGUqa1s=;
        b=vBraFCXixNDdCnjfIfOVkgA0sP0eKtP9Iev6lzYHO1VH/mipjZc/IGRu2eUDiLOwHs
         9nN3az21qySpkbfQxPi0dlffqRzLTlmZBSZaACH+VHtrNcJ2q5bgQUmRycUpOfrEfX8+
         Qj+xxLn9V4JbsfSkh7pFvaoms+BjUH1MctiE/AuWevAIq2lZMvpqVcaZQkeoSuJ+bi/R
         tCkvo002L8zo28Tl/DkDvp0oDrl14a/Jw7ah9mMsL3+m+bvgyHHLkObSZgt71fTPKK9B
         rYiDPZbLp6WZcGx9uX2s/I9508oK994fnvGFTaOl+CnoOWcgHs/0OKWAMgB7CtFun3XT
         FjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775581145; x=1776185945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MfhcsKLB68VuGfp7KQRym1YthVXBJvE5Ws4oGUqa1s=;
        b=fKPtHA2bBxO6UFe+VOddVctmN3igs02vKOVDb0gqqCvbWoISA46sBxJy7ph1hqaSNb
         66XBv5B9BzR/AeKhtYlB5mAJVluHU6kRRCr8KCjtf4QxrjT7E7VGqnq0oNo7Ln3e9bnC
         EubVBh7GOaLFs7CVDWK6eQUkxBAZkOslTCjAsZ3f6wVKyBbNX58QsQLD3YjO+Jx28Pcc
         8HkcEpom+zgq5lc1X6RhJGd2pKWC1O6JJPOQSWwxYqV6LgNqmovrYOfEJ45dVDZufy0B
         aWCpmLFnInWugsej7u9z0oQ9een07qzqdU1otuQ19NN+uftW9ABpNij6+OM4e0mRmWhh
         st3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4TFCyKF6NXnruf3aiHc7TFs35q56qtdVHMkRfjFheDhiMO/S2sGqdz/nfRGGOnwAHRPPLRXUYIUGv@vger.kernel.org
X-Gm-Message-State: AOJu0YzOoRiuiwEZp2rknf3n6aitAMpV0rQGAF5ia27wEn+j2pGjIWHG
	lppk4MnIj720SnauYOniZ0hic8p5rU4/nxK9F/qHuqQ0ceauE7uFNbRbKuXceQbh2Ac=
X-Gm-Gg: AeBDieshxfQ6Vf7Ep1eCaXE9kFeGdaGBDy0QZ8SnglPYlD2V6BOMaPImyPnk1JO68Wk
	kMIVrwkitz3qgNttPwi2JUep4YX2wyvDuWUY1k/Mr+nh1YZvH7EGB3+N3vkB2qELBYutv5Ay19R
	VuizuEhYpokNxd3iJ5sCPVOO+9aSFfzc9Mg6gWZe4160l3St5ozrZjK7CrEn3rZbhrXIHXIJAcI
	vYhrc0bb/h2u4NrC4sgPRWLpWF74o94Hhu+CLRHIZEfBMoBZNBdWx6a8OyD/QM0Pemf1lFcDDUS
	g5WqGyM2AauU1LUqaUb8D8EDMda9npLoNuBWxVyS7Fuevu9JE4yKPwDwknQLL702tebbTyQJ4uD
	fz3z0AFbwC63bYTKY1q0AiFe4oChD/Lia7uaWGNTL3vEI3dNGADb4OcDlmG7hRwlYmmbSEaqUQF
	q4KV49M+S3wGZbHbu48iYETl4JDlI=
X-Received: by 2002:a05:7022:f91:b0:12c:43:3ffc with SMTP id a92af1059eb24-12c00434d39mr6192958c88.0.1775581144909;
        Tue, 07 Apr 2026 09:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd4e4e3sm14570001c88.1.2026.04.07.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_missing_fpsimd
 (Makefile:31) [logspec:...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 16:59:04 -0000
Message-ID: <177558114382.2455.7736704922788141563@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_missing_fpsimd (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:8c6389d41c0076496aa18ee93b07c00f7335bcff
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51d69dcae953c056f9648


#kernelci issue maestro:8c6389d41c0076496aa18ee93b07c00f7335bcff

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
