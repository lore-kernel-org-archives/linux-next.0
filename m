Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45330F925
	for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108357; cv=none; b=dRvXO0JjNcCrJXWqXXq60DpYtzBURb13LJpEdmm7+DDT+uTZaZvqMn44CUWKxaRCMec3+SIjGej+oqsjRyHIW8+CKHpjM0RK5luH5bkdDRY1q0oRXkSOci6TgwYzJEw3gjbkK/KZ+hEgnNfOB+bTeWgAPRjJd2oPOIiFdwCYWwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108357; c=relaxed/simple;
	bh=4hu1g6v6fa86edOO4CtgsbDn0dI/VTmtx7rVd9sxHOk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=NanPJbvK9QPNRKFbMeulpuFoCF82el4X0V2354Gm7CG/m2w/UnE56wEF8qwzmN8GWexg8lx8Hg/szCRQ/VTZyNxogEGa7VHn1RJeTn7r9F8Ac4ejhe6HPyENsO4o6Wu7sv8xh1hOqEzk49j24X5Ux0JwCs6t09PSzLfroWcTdaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o3q/9Rhu; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o3q/9Rhu"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1232d9f25e9so586081c88.0
        for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 10:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769108346; x=1769713146; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrIzk2/xJmwFk/zbADXcPOxmFVVXMdsJP8L/1g75haU=;
        b=o3q/9Rhub6UFaL7LmEi4BKBkS9SS7vH5c9MVWTnuqKlZbuqfV4T4Z0obUnxlupUENX
         kbQl9lkKYTv2iz2clTTPKDHFBLx/Mv5DDhiEbSJ/XUaz8aWpTlxcDem9r9T/VWy9YCnZ
         qOeFsdGjvHfjqOvK5FX9+UVlSaNZ+LPc9Txv0Ns3UzTYQMcU3LlBLjxowF6BR1QUVK+g
         tovPKzu6rORfy7Ifgner05iCPgh593Vn+TwNa3xhR2dSHkrYM+opdGOAKwB3aFQQOKSr
         6r1JKadSKeEIin2ZcApKcLRpeuqXqbFu6vv1H8sK6zp5cNqm/rBT02t9Dth/ZoDyBlwA
         nRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769108346; x=1769713146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrIzk2/xJmwFk/zbADXcPOxmFVVXMdsJP8L/1g75haU=;
        b=g23fpetPIUhd5KGkfQ3hzLZV8Jy5JVbJcBPwVcbDf8CkvgW4tbnts8XgT6fcFYHoZr
         D6sFKQnNS3DomNi+l/DHZt2waJHFKH8ssh7ngpli39hB+cjXjuvLfgjQ31f8MramwbX+
         YdZciKSKJWZlGxRhek7Z5EBhGNWgB/UlRNhnpEC96KtShqpaQn08dIlImVYv6GX6z3Rh
         Pd9Up4HVsltP9443fMgG41/qaKQnPWGOukto+wGHm3NR2uQnwBrNxxHgfOjKvs162qpj
         ypYPu7iyws0qjpuHXJIpEFXwT2AZjp1sykvyIZ87LyYoNsGfasQ0Gb+tlUAb04G130p7
         rR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbZaA+zjcfJYUYC+L46MviNlzEoqrlxfreJ+LGy0oxiFe2zRtjBxJvKQaAWujY0lxeluSfFTRHS12p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6+ORB6Fkyk+T4h/CUV+syHZ3KbPrLjzJvv0objINVk3De/FjB
	iYzAzxPq0DkML3l76cZrLSxKFiN3cN91Gco87vQCmPz9RokPBviN134jPQwOadkaNNI=
X-Gm-Gg: AZuq6aK2Q6i+XAhlbZ4kcvcWbAtLUDc8PArJKtn2kHOH720K96p8GqdBksdXT8KBlxE
	7x7N8wQZc2C9GYB8iC8AMbF3tQfDCA9ZUX2kSeIQqqm5IKTyRE3nPqp3kmCz/ZuI0urGhDwx7k6
	V1ZpNVQ/58zzsYlVZKHyaAN8zFQjEJcJyJfDCYo2N+xTTJosVKlABS9QWG7suqZ1s4W8AbOFkpA
	f4x0Iq8jpI+jXYhzkeQXWmCDSLfqfcSwhvhfinhtG7SSfuRkn0jZvcGYFfnEIneDbOfnaVhr/v7
	x8hIe5jLnMpV3Kh+wJn1RuFNs/ve0Dl0ZP7tmHnxP8Jxk2UvOK9dbQcTobwX4DavcrlpglY9EH6
	lHiO8c3O0fw0oaYEU3spXpyaLy5EwTh3e1P/U/S+3lZzn6jsTFxlYAnUue/cds0HQ9LhuSj322C
	ct2BrJ
X-Received: by 2002:a05:7022:e1d:b0:11b:9386:8260 with SMTP id a92af1059eb24-1247dc161d9mr172847c88.45.1769108345973;
        Thu, 22 Jan 2026 10:59:05 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm484390c88.4.2026.01.22.10.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:59:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)
 ./include/trace/define_trace.h:118:42: fatal
 error: ./panthor_trac...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Jan 2026 18:59:05 -0000
Message-ID: <176910834460.1005.16968493744924197735@22d5995788c3>





Hello,

New build issue found on next/master:

---
 ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
- tags: next-20260122

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
                 from drivers/gpu/drm/panthor/panthor_gpu.c:26:
./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory
  118 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
      |                                          ^
compilation terminated.

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-mainline-big_endian-697269601908a6300d90db79/.config
- dashboard: https://d.kernelci.org/build/maestro:697269601908a6300d90db79

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-kcidebug-697269581908a6300d90db73/.config
- dashboard: https://d.kernelci.org/build/maestro:697269581908a6300d90db73

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-build-only-697269541908a6300d90db70/.config
- dashboard: https://d.kernelci.org/build/maestro:697269541908a6300d90db70

## defconfig+netdev+nfs-root-boot+kselftest on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-nfsboot-697269371908a6300d90db59/.config
- dashboard: https://d.kernelci.org/build/maestro:697269371908a6300d90db59


#kernelci issue maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
