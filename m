Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30981337BAA
	for <linux-next@vger.kernel.org>; Tue, 27 Jan 2026 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540347; cv=none; b=Mu9OBuQ9pVVWJnhdw0NvA/af0fhIH7tNDQjMOUT/96oAX6bm8rkQTgoroIgMEXl3GcgxXWoCRiVAac5w1ZTlde9PZ7Q21oADG8EVnjdsk6mAcLe5ULJtabWZIX7uk03quOJeNHdFSehlPt/bOjicZDx39BmMr6cDo9OiSu3Xpn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540347; c=relaxed/simple;
	bh=YQ9B+d9vz6BS8BXOQXWGIm2eeuGD5ifUA/NkFiqQWxY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=bm699XtjTeWS+thKx7AROI0eO5yOR053pNQtQ2HNcn4l/2PmxbiI2WMxk1Z9dOQfOTU0xaOmtZe5bisXPC+h9gSzltUgHE5aGEzdqfOot2Xq57aUVWGmgJiHqqYDf8vqsL/PJzDSlwkqO/AZSp3Rb1HOAvVQDjEvDd6I+8jb3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fi/RfBl5; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fi/RfBl5"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so6323814eec.0
        for <linux-next@vger.kernel.org>; Tue, 27 Jan 2026 10:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769540345; x=1770145145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYJWuxALu6BfgLH1Tx1ISwIRVMv3VEfe+ER60Fmp5UA=;
        b=fi/RfBl5gj9fC6Vcq6DWCRAczAhzzYJ1+ecO5eOptFyEtvz8DkdvvRaPmuiZDwRbzz
         JmzU54Obu3JzGbotwbkGC/rnYBH2JvQZtDGfg+XN0VXgU2xKB11hrRSBvaTzNKOEpSrb
         X1uznx6pbnFSTBzoTEDuOYoq1kxSVXQRB0UbETS5fzaxSAS4bi7WlJSBqAeHJEr2Z+RD
         yJwekfrf4ZMJqSbQZgdgkQ8smP21BQRoJIkWioTBhUTv9ctgFdRWighQH7Df9XIxt+v+
         a0HJwp0krdHg/ji9eYtu9SB0bI7TjbjJdxZn2GV8WYyR+BJy4lT7oyNWm4jcnUuIBU56
         APyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540345; x=1770145145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYJWuxALu6BfgLH1Tx1ISwIRVMv3VEfe+ER60Fmp5UA=;
        b=DWM5YLJKMcdALhntJHZVSATWYnONSspiazdBoeAPwzlS64HjP9FSje2MfqNI/ZfZ8y
         nyVywIa1rNT/DkZC2BlUjQto7x2WHjE8/WA6nYbUWTT6YhIo95AHMhdWTow8EkAS2jYG
         rBNbwqzZra3wWeX1kepdN+Nre4g7N37kXo/lSDJ7Kj9IPgSxYw+5AYPJN+xUWBD6zg2n
         QnA5p/JiHYLuy5Bt+HJW3qlzk+exZIstyIxfRIJJSzm5EVNp1ZBo7UL8DnIGT9KeXXiL
         ESoO54n3plelktYQimDTFXO1E17EmhdfIxlLSG+fukcsyEEeu422myUVIuxgz7yOts5k
         3I6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKk6q9cTYsj9xSqv5yxkupCwiPf+uqiHI/+eC+DgQJPqivPCjhcKT6up/M+rV4P7eq4DZA4Pb+3/u7@vger.kernel.org
X-Gm-Message-State: AOJu0YyF35T2kJGHe/jXHi/j5qIsVeF73v0eKjzsSY4tJi0OSnTRgBl6
	S4N7jloxaVl07NYqGtp62YqxPWl5yImpqkTX/b/N6ZKi80ba17clCIHDLWYON8SVhMg=
X-Gm-Gg: AZuq6aJF4YybB7EAVNxY9LXRHPefyCO9zuw1JHISD0OXRfYK19Sq0a3hszToiWE6wlA
	XfUDMtH2JMgFpx8Gp2K8IGROTPK+LnR3lHiGPA7kHW7rxJcxq3+w0BhwTgdb562WAVqtLl4cygO
	su2MHkGtAeOZ0LxyjvZmw7gv5GDgjLNuoq1LIurXuMic4Zy2k/MfDhMhAQghGozaOjWo9/cJd0U
	sB5dKoWZKyMkciwYuSZ3PmMdCKapt7ySE0ALl0HPk6UjP6M6AQsYBGxxl4Fja2IrSW6GdkDCWb2
	Fd5J6L1TwgB2ixqy12cMNED1LqVonol/+9yifPoyxy5ajTTWXA7y79x73xT0v1z2zEM6I3SdscQ
	Gtar/w6xiwfu46dJEDndlXpC+vmGcAfOHcgOG8P99QYHjOwbmMfY1aa9WLX36ZnQbHktrsAUdUY
	q77ZSjCmd+Z5e7n30=
X-Received: by 2002:a05:7300:72c5:b0:2ae:5f28:eafc with SMTP id 5a478bee46e88-2b78d9fda55mr1903976eec.27.1769540345277;
        Tue, 27 Jan 2026 10:59:05 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c38714dsm446099eec.2.2026.01.27.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:59:04 -0800 (PST)
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
Date: Tue, 27 Jan 2026 18:59:04 -0000
Message-ID: <176954034417.3309.9733468761811868537@22d5995788c3>





Hello,

New build issue found on next/master:

---
 drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7b: can't find jump dest instruction at .text+0xcbf in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:6655b8550c87523fb99005c0e12cae13e112bffd
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4f938c7d3b25d87b356af4106c2682caf8c835a2
- tags: next-20260127

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7b: can't find jump dest instruction at .text+0xcbf

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-next-697901771908a6300d99fbb8/.config
- dashboard: https://d.kernelci.org/build/maestro:697901771908a6300d99fbb8


#kernelci issue maestro:6655b8550c87523fb99005c0e12cae13e112bffd

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
