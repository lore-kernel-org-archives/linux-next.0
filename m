Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510224;
	b=Ica3u4LRj+2eyM2UmPaFmvfUKieS5ic89p3iVyvLytXRGd9D7GOsoRVdmpJtZJUQlAhf
	 ugYWv2sonDfg5FP8glfatxu0ST9VGSNWOkNyOcdS72horL9R90qz9Q2Ybvxor6mLKfNiq
	 H1R+JYcjjItze8RZOBu6p1zfDzQOLkLjN7ZE7DakSfYWQK4965Nsq/zQPULIWsNcmZ5HD
	 5mT4J5kKLTymceqYL5uSEjbWBMElAUSuuxQlICJBhMMYR3LCyv24RXAphosN3eNt9p0F4
	 /S8s0O6oNzIe8Z+VUEdHVwHZGMX0JZDlgxeKNldp4elSeBNpFrPr4lDU2tmbMu/jL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=S/U4JzwehEMfHHHvpjoH2FZe7sSxuLvt2HA+3e+lY/o=;
	b=0nmu8GeLdwYW+bwlA+FSjnaIaRX1Y9bzleRMsrYD3TU8929VjSnCm0dB8nV8DUXNIQ5W
	 XzJ68D6xHinamldxxAsWaGkRv18UCu1Iw0PZpCRmMDvLyzzWUtcJnCA8Zv95x8GGIsbWl
	 t9J2/Td0lujPxpTkdkRPseBxsI5ifgzXT1zD402cSapGybSwTafFMI4jYRFOqT0qfJhfQ
	 D2c3uW+98NIHMZ3tiZobDhv73HoEgCmlRBVXf8Y/cEwEAUlzJ8H6xuegJG1HwhmrQ6IF6
	 AzD9t2/WSeQ7UB19c4o8xrBLJ8Gfb2TZGy+AcqGINhE3t7u+aIxOmzTCEUxplkt7iOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=F5fiIOM5;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4A606A32F
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 15:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=F5fiIOM5
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4j8GZH4vMcz6J5H;
	Tue, 20 Oct 2026 17:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792510215;
	bh=K3s6UFxK4aWHUkKinYaPkMGw3skwtI6Rt2//TEvbxh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F5fiIOM52+qZdN2+S5o1XYroAJiDQsPzxCWk8Udta/L9Cx3mnEpT6wmCZaOZdnA9L
	 jGZp41rGnWvExMJhBm7wpsBM2lr7OrAZdWoLN3gsYn5UogaqwemH5LlUdPArVS/jaC
	 V6vUDELKQgCrc0lFExaV42R2BBUEy8E647FWhTcYDVbDmOXj1tjFYHAsDyal0lloe2
	 sTbhYPEJhLJMvjQUm7tqPiPfWfHn9yGvKCWe7mf6l3FoDsCCmS6iA7e5qKatR1bjid
	 gxYeAGYoRMzFxHiZ5wYhfgUB/OFscM8DySX9It4UjyNBes/dpaa8pw0kGe/qkIst8I
	 XhAwY+FqyZHvg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4j8GZH49K5z4xKw;
	Tue, 20 Oct 2026 17:30:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j8GZH0DFzz8trp;
	Tue, 20 Oct 2026 17:30:13 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 15E425F9C8;
	Tue, 20 Oct 2026 17:30:09 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ba44dffc-0f1e-4cfc-9c7b-7d41f89bc71d@leemhuis.info>
Date: Tue, 20 Oct 2026 17:30:07 +0200
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_next/master=3A_=28build=29/tmp/kci?=
 =?UTF-8?Q?/linux/kernel/sched/ext/ext=2Ec=3A5690=3A68=3A_error=3A_=E2=80=98?=
 =?UTF-8?B?c3RydWN0IHNjeF9kLi4u?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <179243994358.157792.10951804910694087418@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <179243994358.157792.10951804910694087418@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179251020937.1552927.12618068910420241148@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 15E425F9C8
X-NC-CID: lB18sksa1V8RC++5hU/os0h4DvRkn/8sgykZqeTC3g77XUVG6a8=

On 10/19/26 21:59, KernelCI bot wrote:
> New build issue found on next/master:
> 
> ---
> /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]

This afaics was caused my a mishap in a merge conflict resolution or
something like that -- and gone today.

#regzbot dup:
https://lore.kernel.org/regressions/179243994625.157792.5761151975328981641@kernelci.org/
#regzbot dup:
https://lore.kernel.org/regressions/179243994757.157792.6578749550685907930@kernelci.org/
#regzbot dup:

