Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EF5352FBE
	for <linux-next@vger.kernel.org>; Wed, 28 Jan 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605149; cv=none; b=lGS0ltz6aHP7qBqFR+yREm7KgOVRU7tt7MIXFJjBKF7KxvGQX1HDxSu1gBkMA/1kEtce3oPZZBFz64ZA6volgmuOaK4p8AhArU5i8Yjn3vMcJJQHJQiFLv6GH+4t5G3NjrRXkX57HXzN1/IjYffnSh06WD3UuRagW/zaJLc0pyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605149; c=relaxed/simple;
	bh=hYTN6x2CzNg+OcWx9A7f7Mclg6facCaDFJJF7F0Gy8M=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=L2+Xk8gtrqrhxewCKxzdbIHmmYV3Gl7AtScMrKQ+JI7APnDjSoc9xb6aYM4gF9OH/2++vkDr/teaUYe8TyHLPFNoD7txGB+fSv8Znp3v66ek7wTLu5ToQgS/PRHyeLUPt+Jr93+Lbb07xst0y/nPhXa+dZB9kwcTbvF5he+KYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=UT9YBrXW; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UT9YBrXW"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-124a677c9afso1079671c88.1
        for <linux-next@vger.kernel.org>; Wed, 28 Jan 2026 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769605146; x=1770209946; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCggTXK7JIKSfBDUO+yl+DUgOLIMqwfFmjiwcYlX4qk=;
        b=UT9YBrXWdD7vFgJjdgxVzzLNyQKqfgMUc53HcRibArdQDU9/QzNn5d+qvdj5tUmELi
         Cw81aPMilYEy78S2w45oM/+mDN29sVMCldR0vgkP3QX0CmirlIjLiH5Jaq0BaIcvSj5n
         44g8ZG2oNro20eGGqNqzHxgr5jPSsUzRNhcbR1dNr49+yZahkKWB35m+v/8QXntkgdvr
         9Al8R64qlqCuDRlFfPcHu4MT0tdmMjlbVNMoedR66wnWX1fifLGrzK5wQGdCAa4vD+3t
         YJqP7VKcgfayvu8YNQBKSwdApAR0zxgZiksGeFrvUpMSz1zYPD+XL8E/aAwRUliz+4nJ
         Y/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605146; x=1770209946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCggTXK7JIKSfBDUO+yl+DUgOLIMqwfFmjiwcYlX4qk=;
        b=gdq1oRT5FZ5kCNX8oyukjzZqBBFfeMnYHMSC5G3lLOn8LA0axRabrHf0Ml33o9A4UR
         vWwkWCRbozkc6ZFPZIb3r/ZNXp+/KC0feav1Q3efSx2kyVT50NQKOfxeTtTWTKYN+vKL
         D80lbx+fNhnMMY6hPBw4rpIMEIZzKYuT62lPVIiBUXqTd/VrpktLZbs90eR81nKGG91V
         gBrMSzLNkMHfcAwiaNoncPTI3sAsq1NHGol0Rj/6XWoDE1IU0iHX44xX/ex9yAXylBCa
         7puOswr5Wi5mfSib3fGk2jCs+TTRMm/zIn37eZdCJvCBndeympiPC0oW0NJD/SkUqnqo
         d56A==
X-Forwarded-Encrypted: i=1; AJvYcCXHKq7KOGQ0kko9mTzAwavoyIXmPbConwMKN213KytIAwDGW+HsttwrlQTUVzZa9RcBvLLhPTWbGzgP@vger.kernel.org
X-Gm-Message-State: AOJu0YwNcOAkjk2SUFqnvQosBLGvfa6B8OaqWAXVkK600X8/lIgrLNo1
	WtEvGTRgmkJMeDWi4G/V/LQASZBC1QurxSlRRXH3tiCmdcu76sVhEBH9gukeU0Gywzs=
X-Gm-Gg: AZuq6aK6HHLhInFRB/MyDA/dAv/OrMv/3UzEs6FHJp62a83onnfQfvcRQwpeMx4r+rF
	4X5YjFnN1YYvMcNuoOOKqIOyvLR+wzmU95ZFXZ4/OeRrRoYbyRYhTSf9IRWUti7P92t0Viic0lR
	M+3ufb89RRt6A718XwLg+kJeNmJbRNf5f7DKwHm0oH/OgAqfN7M/CrR5So7O/rjktITcm78V49c
	5wKNLJV7oVAg4EhGQREvCbzDjQalQ1OMuvXOpXdYCAfyTCLrUeSVLdZOv9e3PLjZXAMUhqNh2kd
	f0uf+3k+SMnxOru0CQ6Ds5bfHrmZP6qoxqxjV+3Ru1uXE+E0iLzJZU4wdxELVoogOms0TNpbDGD
	OcuyYJW+vkb83oMXbdvCqAK5mpa7B4jFywbrUzBG9S7Peb66ypTkMuNuQ+xbpVXYvxBHet6OyzI
	mX9/90
X-Received: by 2002:a05:7022:e2a:b0:123:2ee9:d1b3 with SMTP id a92af1059eb24-124a008b0f3mr3025787c88.2.1769605145521;
        Wed, 28 Jan 2026 04:59:05 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef3b3sm2450605eec.12.2026.01.28.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:59:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvcGVuZGluZy1maXhlczogKGJ1aWxkKSAuL2luY2x1?=
 =?utf-8?b?ZGUvbGludXgvY21hLmg6NjM6MTM6IGVycm9yOiDigJhjbWFfc2tpcF9kdF9kZWZh?=
 =?utf-8?b?dWx0X3Jlc2VydmVkXy4uLg==?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 28 Jan 2026 12:59:04 -0000
Message-ID: <176960514428.3654.593941965169897463@22d5995788c3>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/cma.h:63:13: error: ‘cma_skip_dt_default_reserved_mem’ defined but not used [-Werror=unused-function] in mm/mm_init.o (mm/mm_init.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8254f44be28c555bd563efce1a70336059fca879
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  0fd19300e770b50ad9fc43026f5e148e185ddae1


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from mm/mm_init.c:29:
./include/linux/cma.h:63:13: error: ‘cma_skip_dt_default_reserved_mem’ defined but not used [-Werror=unused-function]
   63 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC      security/selinux/netnode.o
  CC      security/selinux/netport.o
  CC      crypto/hmac.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/arm64/chromiumos-mediatek.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromeos-mediatek-6979fba71908a6300d9b7134/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fba71908a6300d9b7134

## cros://chromeos-6.12/arm64/chromiumos-qualcomm.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromeos-qualcomm-6979fbab1908a6300d9b7137/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fbab1908a6300d9b7137

## cros://chromeos-6.12/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-intel-6979fbb31908a6300d9b713d/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fbb31908a6300d9b713d

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-6979fb8e1908a6300d9b711e/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb8e1908a6300d9b711e

## defconfig+preempt_rt on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-preempt_rt-6979fb9a1908a6300d9b7128/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb9a1908a6300d9b7128

## defconfig+preempt_rt+x86-board on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-preempt_rt_x86_board-6979fb9e1908a6300d9b712b/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb9e1908a6300d9b712b

## i386_defconfig on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-6979fb641908a6300d9b7100/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb641908a6300d9b7100

## x86_64_defconfig+kselftest on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-build-only-6979fb891908a6300d9b711b/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb891908a6300d9b711b

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-next-6979fb911908a6300d9b7121/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb911908a6300d9b7121

## x86_64_defconfig+lab-setup+x86-board+kselftest on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-6979fb851908a6300d9b7118/.config
- dashboard: https://d.kernelci.org/build/maestro:6979fb851908a6300d9b7118


#kernelci issue maestro:8254f44be28c555bd563efce1a70336059fca879

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
