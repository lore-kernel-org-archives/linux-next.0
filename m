Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A436D51B
	for <linux-next@vger.kernel.org>; Tue, 17 Feb 2026 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771347567; cv=none; b=SNB31+9IL167Ru8BZ6u8azL5EKUuaEyyf/amN+UEYMEQM4yAHMUaosD0Rsz1C6aCP4bIb4F3CLTaiK/drunFnG2g51WlDzrZ+1rjDFMavgC1n34SKmRONdw9B/E7XXEBs+WHHSI5tSB8C5L5KXRJ+bR9qgQrvhjkPGISSaGHJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771347567; c=relaxed/simple;
	bh=azt0uksr4PrR6NKtpbNSG4DCbXMSeyG7HBgz7msZ0vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvPpICWigpDrb4SMNu0Zd38Stn2IN8Ocmz/OJbnvOd8hLrrfXk4X6nPNQBpjp0C8t4bN/kKN6MCbxieVXO94zlPC+L1zGgdQA4UWNieufw3kVRuyw0imhq6zBSgR5O3oNYjzCfrEM8uN2bfy/jrlh6TcLB5++RoUatiLVs38y4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=A6/VeVRn; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="A6/VeVRn"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fFm8264qfz6D6N;
	Tue, 17 Feb 2026 17:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771347554;
	bh=azt0uksr4PrR6NKtpbNSG4DCbXMSeyG7HBgz7msZ0vI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A6/VeVRnSqgAk6VUJ4hhnTfSvUYsgINmNOik9ptaCKfJp6qxIFEULW912YT+Dcjwa
	 JUeM8sylQRUCMLtTPtxcLVEN0CLf1TcXf/11BsO+WPn+4AxwIiuzkxLlGIacBkVYek
	 HN1EQTsKwnCo3NEWXtI15XUWoEGsMyU0hwr7+o44UXQYI4ssfReDo2TYGHBy6VB7WX
	 5Zi4cvKIO0TefkO5XabdwdqZFLluibvZxZhbvQsW7TXCbARH69Noo62YOVZ1QSkGcK
	 n0jdlPFSA4ZkOGL4uKvJcpTwwhJAlazm3MAqfc3B7aCrfKMXZM3pHNnbcpGuunEB0r
	 AN3Mqv6p5Q1cw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fFm825Mljz4wjq;
	Tue, 17 Feb 2026 17:59:14 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fFm82352cz8sb8;
	Tue, 17 Feb 2026 17:59:14 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B47EA67481;
	Tue, 17 Feb 2026 17:59:13 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d6fc4151-c011-4c3f-a32c-50a57dbf2982@leemhuis.info>
Date: Tue, 17 Feb 2026 17:59:12 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Boot failure on NVMe multipath LVM root since
 6.19-rc8 (dracut cannot find root)
To: "Kumar, Sumit" <sumitkum@amd.com>
Cc: Narasimhan.V@amd.com, linux-next@vger.kernel.org
References: <4e10448b-2c29-4ddc-974c-63159549cc23@amd.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <4e10448b-2c29-4ddc-974c-63159549cc23@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177134755395.2156222.11311477411597674481@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B47EA67481
X-NC-CID: 6dWJytnKF7tr1exFoq7gundT822ZUpBOPLaLS8M7F/4wtjXZW7c=

Lo! Thx for reporting this!

On 2/16/26 17:50, Kumar, Sumit wrote:
> 
> I am observing a boot regression where the system fails to boot and
> drops into the dracut emergency shell because the LVM root device is
> not detected. The issue is reproducible with both linux-next and
> mainline kernels.

Then it's best to completely leave -next out of the picture, as it
confused things. The subject line is an example for that, as from the
commits you mentioned below the regression was introduced post 6.19 (and
not before -rc8).

> Mainline Results: The same issue is also observed with mainline
> kernels: Boot passes with 6.19.0-72c395024dac. Boot failure starts
> from 6.19.0-192c0159402e, where the system drops to the dracut
> emergency shell with   the same behavior described above.

Maybe someone will be able to find what's wrong using the problem
description you gave. But given that nobody replied yet that seems
unlikely, hence: you you maybe bisect between 72c395024dac and
192c0159402e? Then we know whom to contact.

https://docs.kernel.org/admin-guide/bug-bisect.html

Ciao, Thorsten

#regzbot report: ^
#regzbot introduced: 72c395024dac..192c0159402e
#regzbot title: Boot failure on NVMe multipath LVM
