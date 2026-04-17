Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD75371876
	for <linux-next@vger.kernel.org>; Fri, 17 Apr 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776434346; cv=none; b=DDAnVnkJCiA1GFr4Z0ospQQy7tXf36eqR7vcY9EGY29+t9k2vad4PiuUjI9nRETKLpLLe3E+DAYSMAw51BVmdBnQSMMJcGRHNrTwituML5ykYSReHB2B25kEOuqHkbbE+VqkpukGTEekIuUvWRL41gIG//LOPdOvhpYbrzTTGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776434346; c=relaxed/simple;
	bh=Ws7Xa9KEaYmSddK6P9t+airuD5pEYV4+PwU4u/5xjxg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=D9hTBRue2LzA1PZwA2ItXR/RIFDknoMb6LNLTs0XPphWqxM9OiXz8RCSaAkP0kKoDWqTJBS/O2+HKFTIeDe+gYiILoorAuTHh0+sdDdkJpXJSK1ZtPOjN9NVHEBmXekKzqBxTVhJqa+8nQ+drbH0rblZg7RxIK3jV0JF9pdxd18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=isWoOqD8; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="isWoOqD8"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2dedf5f88adso785374eec.1
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776434345; x=1777039145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LO8PgW2PfAuIwu+ycMUGMbnWKP5/gsHv03hfidGgBvk=;
        b=isWoOqD85lIEa7sq8y0m4MFh+lEEKwK+U5r5lzy5rYdDLacID8+Rd6C8dZ258BcqYH
         49FGE/z6Y+BH7+Inr3K/5FTMuQCCcVWHA3N9LCC+VlHuH8ALVfHy/QnrixB/188hkVqj
         VTU4+V+R3vYL0qaA6FFh5XbCjALg/ELrsSxDaBWFKLlqKFx1Cn6hAZYUv5V/KRtLXxsZ
         qwBwdnaPaEZ0SJBsZyEvCbjxOnPuAsz3Dt97vM84JgVwbcEoG7SMV1df/w/D42e9jOdF
         xxljbUtwGFRdpFpLAU5fdXdsEW7qr09MKFOI0FsRBYYVabIjXGBEtERHggYtWxlL1iqP
         +vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434345; x=1777039145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO8PgW2PfAuIwu+ycMUGMbnWKP5/gsHv03hfidGgBvk=;
        b=ZArv+ylh6U87g+m4zs9jtiTMx4nzxIZQyHRYsRN4l19DFomYVyW/nH7JHX0h6SLHao
         8W9qpW7Cl06FRScIMPOJgwURKC1fROVBZXi+FjTROuwt9BLCBezUA15BCIDJvEJIj000
         VAnA0kylOHbsGogUYF8+7hdJ6WRXImO2WP4FQmT9ustKV1M1H0Sqixn2E0wLpj1/m4B3
         hY1kdfGjADn78DRYHasFviBEX8mR1fs9pR8Y78j0eMmD/oWwleeV10z0WjBm7mD+NXNT
         OVa8Uzk1xSlgDeEM0E7tbZw3Az3DSOUGc1WI5XBFgn26Tq/wgHvQ/q890VQGlj807jqT
         G16w==
X-Forwarded-Encrypted: i=1; AFNElJ8CotY+chhGa4kvaaFjP5RnmORA/yy41x1Fb3OEhQ+FFc65nZji/Qmiz/Yz+UtdWBY9+Xpex1FnWrFp@vger.kernel.org
X-Gm-Message-State: AOJu0YzYp3E71oXYfDRg1rJc3DtQoQHS8PPyyyQMx+KI7MrB5gydToiF
	rK9JdPxRlcCD7MFzGnHIEjZkJbztcr26fEP30CDgyyLm1fDBhJVJmanv/yeY20N1Wwg=
X-Gm-Gg: AeBDieuOTkFH8cjkbff62ht1o1tE0FxpY7twm+Tvn6nIje0Za9XGZ25dmkIoaypa943
	EFi7Re0jl03JC6h3JCbUgje1zfbRgBVcfRMwiBb0V9tNAy9y1UljN9FNGESrQ7cHkkkNdZzwsRU
	TAQlJyJSUJ9vtUL54ocG6cJg6Psl1xpU5Zcdt5AgNlyDC3VmSWfHHweextxkXJBLA7FiQVuiN7H
	X6qRP/DTV3CBRygbRQMCj8pjhbqTp3k/LEF6CbNyVYgIJD7LNVnd3SAND0b2Y3ipRxVO+tEQsNS
	VaPgNOFuKutUzETSFMRDHwsiNLDIov8ljHn3qhQ3wT7pXm4EhhMcVCspvzTZsSWGgDoKyGJ+E4D
	0igfbELyIJzzJvIBP48Ve6r40lIq5aVt57PPDTbAQ12Kg/fij49KuXfcn2DtVudztHtGuirULQr
	uqHKYYnsAkjIDZSQeTI9VpV4sJyXo=
X-Received: by 2002:a05:7300:e12a:b0:2ca:bd22:6102 with SMTP id 5a478bee46e88-2e42e200939mr1103722eec.14.1776434344414;
        Fri, 17 Apr 2026 06:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce426sm2271911eec.16.2026.04.17.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) in
 testcases/mangle_pstate_invalid_mode_el1h (Makefile:31) [logspe...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 17 Apr 2026 13:59:03 -0000
Message-ID: <177643434320.6991.5055370416927110654@8692ffc4d55e>





Hello,

New build issue found on next/pending-fixes:

---
 in testcases/mangle_pstate_invalid_mode_el1h (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:ec180fda1c0b1d467ccb20161a74c09a0c2c25d5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  db41a388b15c9bb61a1f6535b82537ff4081ca4c


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69e21e839b5a968309e51dcd


#kernelci issue maestro:ec180fda1c0b1d467ccb20161a74c09a0c2c25d5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
