Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715947;
	b=xmVVCSsumap+G8DlM9avx76Yl4YNr8BFWjwTCDbImCFquxqsVlGKbdpgKknyMvXJwtcq
	 XPDxlPuNrpvPupepg0onm8NE2Z2efyEH5G6rOcckaqa5JOsR4SA352BAlFCcRNT37ogSg
	 f9khWDh+/dIcT/n5Mp6rzF6zbN94JgkHmGZhZQoLFJt4fEfjz+joYzJX5GSB6zxOKdE6X
	 cCBW+6/wmhh0WcX/fuOo0irWqB3IMkDuw0cS4xR8KpHMFR/SX7co+vrzJ+B+1UCmkqFkQ
	 PZZXrNZYolqwiUUtg5wqCsuFO89qn4atEpoNHA3pv8XlnGQcNN9gw92C+JB88dDHjaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To:
	 Cc:Reply-To:Date:Message-ID;
	bh=4erU2ocnLd41FFsf4SfKrSJe0tbRlNaGbiANYLjYItA=;
	b=Vel7zP7BV1qi9LrRz3+cuDpszHpwVODrTGQWsuOLB+IGuHD4kPOlFHidV6yFMf3MZEdG
	 JQKjLsI9OiVIBT7rXe0dyX6GBiHnOG8pqiaJH9XN461pQENOn5XFdIwUDtd/DMG01n/gA
	 5FqtgYnhb8HdwFuHQ0L1FD+PJmdkoVjd+Y+ONC1h74RC676E7WRV/EHFY0xWbJ9L/nYFm
	 qGmkDCPeo8sDgibXK6kgCJedGmc78ig0MhuAwv32D6tDOPJq0Vke8GNUU50DtpSs5CEvJ
	 hozOPyvfhCwOeFknqFuC61UKoTrVnLEPJ7tLPIkSkiAMATpCeKOZltscJP12rBYv6mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Qc8LUI6S;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69B3606A321
	for <linux-next@vger.kernel.org>; Thu, 26 Nov 2026 17:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Qc8LUI6S
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15392252eec.0
        for <linux-next@vger.kernel.org>; Thu, 26 Nov 2026 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795715946; x=1796320746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4erU2ocnLd41FFsf4SfKrSJe0tbRlNaGbiANYLjYItA=;
        b=Qc8LUI6STEoMqbVH8VlBKKsfuTHJ3vKCNTiNzmUtA3hHqQS133XVIaY/vK0cdx8WJf
         KxbH1orlGK3tU/+Wp5s1OAXj2zihkDaYsmBtEz5E6h56LoJG8bO6ZoH1jKWVmdfp4HeI
         xGQgXvej/MxJBgKoq70ZvbBr/AIbKmiKYCrTV/lu9UB+H1/b/NnoqMo96GiVWyLcNGe9
         rFIvOvwPjr3Cn7yea87rnTkHlrnd15s+kO1IFH8rsrCX3nSDspWrotDZxY6fN0cZvhhk
         9wT6PuEgaQ3xFvfNRi4Kyo3OnKj1iwd2GxGYouDKGrUyGjc6Z7pfbjIT8O8cvbD7acbJ
         VCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715946; x=1796320746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4erU2ocnLd41FFsf4SfKrSJe0tbRlNaGbiANYLjYItA=;
        b=upEzVwFHr0Ck+95Mon4kR2hYBxJ5KefIyW7M0hdgaJIRZaM9CHfcpHdS5Rm3CJQ7LH
         3eYXjPIqfu92pPYI+kzat1dEMjM5/VqmRVkenjlkmWbw7r0aWRGU2ex1ed43SULtSFZg
         7aOUNJX61ez/5ucN6mFzg7AF74AGF7NCQ93RZ6LDIvNtkurqbBHiCBn3Dn3/FcSOv4wv
         8ZRzA8/kJZz6ixNgOEGVwSTMXKEsH48P8nium2LFSnSjLuPUAR9MBqYusAuMPL8OzDV5
         +EgKCa6lNsqC5jPLdBZieFlrdwbEGyN/Ukgu+gpRSCHbdZaGsI8YY8+xQmFdz8xFzaJu
         1ygg==
X-Forwarded-Encrypted: i=1; AL+hErFSOxZdRia8Dupc/m6XRUen16arhUXptuUGP+qntGiqBBIpZkij6qLXxmVaGlEsrsswWGwuVi7XJbyj@vger.kernel.org
X-Gm-Message-State: APuU4Z/iQH5WTnugmb+YTwl0BIbcEXy2HWP916hG/9p31yxh1qiDa5O5
	NKa6DE1jaybMMiNNBs0OMRQJ91FLNnQLkK3mCWErjWpKuxDwBnIH80JI6Vh+ATnlV97J9EMJAjl
	O56Me
X-Gm-Gg: AZFdTZfC1k/sNiZdeyJ4yLQrcHs6w0V5lMo+giMWdE/5lbBsy7/LvyZnkwCXSt/CWfN
	0nvw7m98sXFf6d1JyVP0LbTH8Yy4xeN7WLFMO77WbQKqrTaL1rKJgDgkWwmspvCr4QB1hbD/3hZ
	+ShNFVh9MGlUVh4/3pQ2AsArsEyf7h9Hf5QXnakc/MPLDxWdfrBfMF+8PDNq6pSITjFdnVQy28d
	fsioX4/RlL58USZFqIx8BGPVWgfbhRf+1jmSAIggCoCDR57SKn7Phf/flYz21AzMed9s6voVTZ5
	nfDne7cA0GrL1Lo+GwmF0ZF6pmx2+lfra6uWFolX2fjAP660jIoeO62nGPm8ZRVitt92Xh3znh9
	guljEmce/YON6iKQ0t7GKU7OUOYJdMSnp4tSkA4uz+c6FgMPSzcp9lGGO7hXeaL5MQuw6MIxaz6
	qLjyWMj3pKnlWxB2t4y55ZSMcF6T43qu0U5Ojwzr+RLMfxdJ17YpuNh11kAsFBVLyOb1pDEQgHs
	GT4kyFdUx/s4Ps5a07T0b8S/JMMHiSQVjW5T4V6IbfYoiBqKxIiW9dc2uTeGnuL636lOM6pGUuX
	akWSG3DYuvwMZjQZSK85YClkJE0Np93uRWp82CgRCwM=
X-Received: by 2002:a05:7300:f0c1:b0:386:9b72:274 with SMTP id 5a478bee46e88-3869b7211e9mr18809885eec.39.1795715945716;
        Thu, 26 Nov 2026 09:59:05 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm67751165eec.12.2026.11.26.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:59:05 -0800 (PST)
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
Subject: [REGRESSION] next/master: (build)variable 'data' is uninitialized
 when used
 here [-Werror,-Wuninitia...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 26 Nov 2026 17:59:04 -0000
Message-ID: <179571594356.162775.14762570358001870919@kernelci.org>

Cc from: regression/next.yaml

New build issue found on next/master:

---
variable 'data' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/gpu/drm/amd/amdgpu/imu_v13_0.o (drivers/gpu/drm/amd/amdgpu/imu_v13_0.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:264:30: error: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized]
  264 |                         program_imu_rlc_ram(adev, data, (const u32)size);
      |                                                   ^~~~
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:256:17: note: initialize the variable 'data' to silence this warning
  256 |         const u32 *data;
      |                        ^
      |                         = NULL
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179571594356.162775.14762570358001870919@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
- tags: next-20261126

# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6b086842286e1965ecc2f2e6

#regzbot introduced: 9437046953b2fb3bf55b36582450ea0267df82a7..a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
#regzbot link: https://d.kernelci.org/i/maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144

#kernelci issue maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
