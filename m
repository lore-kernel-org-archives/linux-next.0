Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7C63A1CD
	for <linux-next@vger.kernel.org>; Tue, 27 Jan 2026 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540346; cv=none; b=pEZefY/0NqIzjwBXLJ8MM1YO6BvpjDHbxWAMZXy7+LrpFvUr9KotQBniAQmbjgqOG7lvpwZ5f23do/wgZrX+8mtK7t2FdWJPUHk1OLN/SCevtgdmwN5xquhuFKwn6RrZV4QBRCPZWoPqoiMjr59BKQBLnuZs0P0uBXNjMK9Hhek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540346; c=relaxed/simple;
	bh=5IzPdojvBgPrpJZwphzsim8SMgwmkPRRtnBFqrO/msk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=QU6t2SCVZz91TNl+TJY9S1WnpS4qHgLvqjyZLt0HbTHK0451Ok5Pda8sC5/z/Z5Qo6D0u90THHvkOPbtdoUhy72Yb/EOYJ7dPzxddAyPXd0f/A+9AaaiAuFjo4aLNUeBXiybhi1luYkGUUxC1psbc95oSxIFUBulcaXwjMaZZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=yD10ObvH; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yD10ObvH"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-124a1b4dd40so420969c88.0
        for <linux-next@vger.kernel.org>; Tue, 27 Jan 2026 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769540344; x=1770145144; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSGXJedx7qR79VfRusvQyIhsig7RD38T9b2+vtFHaMo=;
        b=yD10ObvHqdsgqBuupEaYQVO/RcAl+PacmU1fzb0zQQMmoIPW5cg3igrLlNXwlkzr8Y
         YuEREzJAjEk0W3svuNabhyJtlyjSoae+eZ86uyzZ1F65fjbUxsVh39opW8jjrVf3BOG9
         qeZNxr7LPPy78t7HoHHb12L2sUOi8JcT/dzQ1oG0cjoJl6VP27VFPnugVYn/PMEMZ6Vl
         MCemzI/uZJ2MGwnG+fwNrzfkiqm7kWKsnPdY6JtGoUj6yP0fvR1898cj2pojhVILVkVf
         rcS+JweHF1A4iWHJpKt/riD0ZkCcbb564Ztd4VMn3WZEbQhmCByJFRHsn4bs4o+Vp/ap
         j4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540344; x=1770145144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cSGXJedx7qR79VfRusvQyIhsig7RD38T9b2+vtFHaMo=;
        b=IGWa6o5pJFhpB9t5PvvoazObGIlPgc3DJ9DTAgHtMsygC+BkBse6YdidaqgzU3m3tP
         6CAnBVOxPVO0oMFtk8mXgcERvikZ0qe+85PHXy4O+ONnG4mm6tQlhWYBnC8KJk9XY9/a
         TD+v6hL3PYHxp8ASXNfkC8Rkj2uMX+Up76ARc1srt7jfj1Wf5qE7Dq8WxDFd1fg5Un+k
         PezgpeMCttXTJIHPKtBn4vUj9/O/pc+mai5svcvuO7G7414JhfEVfrqJJolKNVqbT71S
         /tkcL7SXbfYI0O6hrItfOTj/WkS5m8Q5//ZUm7BZodT2MrdjP+CMgUevcUMrCd/dliCN
         2KSA==
X-Forwarded-Encrypted: i=1; AJvYcCV8FZh41lJTZE4SGPYBlgYDpo7wnRy60P5ToTctjQDtIJS08VdwcVvOkrMRBF6Nk5a/g8z4E/D+QGY2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3SCSY1EQulHgtK+CjpaUWyC0GQyb3NGqBL54r5GX4Q1J37ko8
	6jyBmZgroffSBHDhdtvBiTJNY1nOwkFzgvi1jzo9EQFtJb+kiQRY/krkRgabDzp8bZM=
X-Gm-Gg: AZuq6aInSrewXAB5BWtWCV2TtlFAGQvm3Xd/ad/C/FLvNdlhVOMpubKrMA6d+J8hTns
	EzXGe3rA1KeAH2Mb+4Wgypevmilbucu3zjhmWAzq+MIFEiXPWueECsac85y6+Q7R6OXtZYI5n2Q
	W++CjG8OAhm0pgu3uriXe5VREeV9R2tD+C9mf1UfaXAX8uTvFOTjRXJs2QYcFXjZKZ9gN3R9L/L
	uNKihNBjHfqVviyN278YnuKJ6Q+VvuvcdYHV8X2kkssIY5/mhziK9QU/ZTHFtVus1OKgIXGbkSX
	xB5+exHEmJoOBKMIjpsjnCI7BU5EfYpooVqQSK9bI4MiZW83q1sQW5OjJaV7Ilj1BQjbeBHSwG4
	nkbOIOAoh3piTxA2SeZOnTa0yzjCDqho1adiB53g3+OgsC3PTRNrDnIShU9yPHvPzeCds1vOQYy
	TF4hOl
X-Received: by 2002:a05:7022:6609:b0:11b:8161:5cfc with SMTP id a92af1059eb24-124a00c4cbamr1696781c88.36.1769540343935;
        Tue, 27 Jan 2026 10:59:03 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a7bd05b1sm786545c88.3.2026.01.27.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) drivers/hwmon/cros_ec_hwmon.o:
 warning:
 objtool: cros_ec_hwmon_rea...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 27 Jan 2026 18:59:03 -0000
Message-ID: <176954034280.3309.3334972019456076511@22d5995788c3>





Hello,

New build issue found on next/master:

---
 drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xc40 in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:9be47da80cfd017764d8a2750178c200bba3ef54
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4f938c7d3b25d87b356af4106c2682caf8c835a2
- tags: next-20260127

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xc40

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-amd-6979019c1908a6300d99fbd5/.config
- dashboard: https://d.kernelci.org/build/maestro:6979019c1908a6300d99fbd5


#kernelci issue maestro:9be47da80cfd017764d8a2750178c200bba3ef54

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
