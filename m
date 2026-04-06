Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7DE39DBC0
	for <linux-next@vger.kernel.org>; Mon,  6 Apr 2026 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775519948; cv=none; b=KejX0AK+YFBPpO+2wf4mWbUJZ7bdA24rIfhi+NLZkftQazR5RP/kTcUVkGvH1+5dKZsAZWVJ2A3uHVBbrEWPKrTyCogve+umuVkl4TIlKCbaH0jVeNftPvLaHBctR1/lvClaODvrzEbHCJlKRiV/psQDVr4PAcrwzAKUPrJdHKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775519948; c=relaxed/simple;
	bh=4cAKL4ayXGlMuDTMMR+t5eNAFiUJUG3n3nhkKbL/PNw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Zt8+TDNtPQCu7U96LAyyrhOQDVyqdoxRhGDRmQmXB6Z5nSpbZo+W9+s/SFqYfh8S71OQcIUqxO32wFKCobMMcF6LoGG7yYwiUTG5XGnLniE4nFEraU4RBeMOUbVnoLmMjduGq2kvtG7uvjELJaXvlsv6pIvCXcxKu7PeGc5VjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=pWWMy7Cd; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="pWWMy7Cd"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d18dfa2713so150987eec.0
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2026 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775519946; x=1776124746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie57W13hOvM5MZvwRrxU/IpWDzgPMoxoDUwbFa0hWQ4=;
        b=pWWMy7CdNAOQPTz+itNr4KlFYhZWRXdd3NmvAT3DOvineOSzrQk8VSEova+qgiNspm
         URpBadHxDzGl1uWxjZ9U7ABL+NUyXWuJK966SOhI08QwEnzm53OgK6cs+zFNHGN9lyKw
         Bq542Tt2mwGR1xlbfwKsyxpLsEaji6syCwogQ/rItEMrmjZu5i5EwFYHtisKzFFI0lgu
         j/z+UsDhIthIUnH+3j2tC3+K5WW4IxD7OkIWFFhOCAyqFyaJH2iBAt+/yxWoFymege0b
         fXGaMSFWG7kHYgXl9K5w0g8qBpKn99phGO2QKwNbcyQDDd6HwvFs+OyYAfQxoHVBJzKI
         du+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775519946; x=1776124746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ie57W13hOvM5MZvwRrxU/IpWDzgPMoxoDUwbFa0hWQ4=;
        b=Xj82a4RlPthFzMAV7QJZ/iNIewlRnweniXh7keZkyRD+/MjmoT0kEhE0a9+yQUORQX
         mJz6MXa9FSHSZ15Bj0sJQdGbscKBw8mPP9RpgFfdtj1KlU5cx0Mt+xXL33Wtc6iHtP61
         cJF9Xepxq/gSg2wxqWkqFdwxTa/TnSVXoNyCT8gojJxG32v/f/hwF39zgWrFUYI/nJz6
         dYMfVjjUA8f5LL3tOmdFgzzoUMQiuCAclfMvNQcQZ9f3I+8j069zsvmfkiJgO9Y+ArL4
         8sOAe/p98N4YsmtTsVK1eeSREsWMUEIgAHPEUCTyKyWcBvfkZG7k/MFNqYbRX1mJhCBW
         Vhzw==
X-Forwarded-Encrypted: i=1; AJvYcCXWelngjfrMGLrwBX9ltYJJF0c+S2PKjcmX913fs6auz0wfsBdKBicp8OqYUHoHU+1w3rhkGhofmAlB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yVIJeEAFEJGnP4iNvRCk3ZYkL47nu7gAfcZ9gvewO+JOnW13
	rRN0148iazmvJpXMaeXtiKTw9X/WjMOdHh2Vs6Bqv4t3/ngFUSrN6RrHhCMzzw0OVyw=
X-Gm-Gg: AeBDieuSdfxFmgrYQ4UIS2tvghuPQ+2ApLlUtQWDy4MwBMO2AnA+4IybsI/u3lTvq3P
	NWf79nC/Uk9CmiDWFuNHjXbuwH8ZXuhCnjiMWKaaEpzVsHFMB8+O3ZVrpyjnHcw8zg1TtGFXJJu
	zc35Vop2N3SdvYnhd7FVnmDMIXHVW+nLNt/As2MxidGzyR1BQJ3sd8JidCnJS2XMJtkXjMjkher
	IXC3MyQJKh6J24OxqVE7CW5X0cl4JQ9Cl0YOKYGuuMomTqJu3o8N0nDMIdpLdfEM2N4f5/jivWw
	l8GYMoEf3iMsVyT+nCGpm+PbAmnuAev3CQXLttLOIQp5FL56GiD9sF8v2V+/4pS0vR9FWqoJsZf
	H1QLNKY9IweHbQTt3dLByytlAkV18yvrJyar4PrZou03sPHajuMAfVqNq5Xqy5fZbegPkNxNuh8
	rQN4uz56CmRKJWDPFZ
X-Received: by 2002:a05:7301:1f04:b0:2c5:b23e:48a2 with SMTP id 5a478bee46e88-2cbfa4c48f0mr7608021eec.8.1775519946417;
        Mon, 06 Apr 2026 16:59:06 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7d00f5easm13482499eec.29.2026.04.06.16.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/fpmr_siginfo
 (Makefile:31)
 [logspec:kbuild,kbuild.other]
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 06 Apr 2026 23:59:05 -0000
Message-ID: <177551994531.2129.13510513122159641255@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/fpmr_siginfo (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:c905629d4de8f0d67e3bbceb3629696219daacc5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  816f193dd0d95246f208590924dd962b192def78
- tags: next-20260406

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d3d7cedcae953c056c1b52


#kernelci issue maestro:c905629d4de8f0d67e3bbceb3629696219daacc5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
