Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615317;
	b=uiYWH7fe3wDk0jXnpDc8KKJn5UIWjiZD+cR1gIHqTf5acE6Zo4Nl5U2vZLj6XaWg964b
	 +d2FxAL6KUfk9H10ULLWqgrvlKb2x60jggKkdFXZZd7v41SdVH3YsQQRQh0C+sgnOwQgv
	 tlMOO5G6CxDRt7OUwfJ1ClPEQyJdLrlhYNIQQX2OTLCcLuaBKfoaaA7tlPnkcNFasXMMR
	 YNOUDGCgmtLULLYok35npHX7zY0F5/t7fpKNpnE1EHvY5okIhPjD8vNF2DnG6WkWSJi+Z
	 GIYxbn3IGBf7lz56D20vYsLc3UyauNrFP5C5KMcWeB+fK7sBr19m4ScrgpzTYaoVj7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=xvCJBPZenVfqXsBZx5KRJCX0pfhC+BYCMbiy0O2sKDo=;
	b=KDXHFVYoDpjEKuWjgJ3cjfO4QqVQRRKoEEIVE3IWHJWKy622YMTfupCbVIOEOmWSrC7w
	 t3mm+1JVlaMEeO0jrASIQa2wIiF5PQE5Mgy1lg448dchkm+pGU9XifpRD1DPWjcMWMZUy
	 ntmWQd716n8e+/MYitvx+BRwGoX3orMOk91xfImDRZ+dHUViMoEpi2RNbr3pragGAtS1j
	 TSAQZPVFOunKSh4KIoavl7GGIuUXJXF6yhrvl0e0eWYHU0l4RFDKWCK9xJ0IOw1nkicT/
	 auxQVwCQYH8Cp3AWQu1YkLvc6aTFtxnYBfLF+IqhzbFGQTvDfoXLALKmdH0qUdiqxbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XEqkdwmO;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D847606A327
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 10:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D847606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XEqkdwmO
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jJ7G50zB5z6Kwn;
	Mon,  2 Nov 2026 11:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793615309;
	bh=PBSoHz1TmN2IHfZWj0YkK0WlPPGEyTe8zg+zoWvVA/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XEqkdwmOBP6JbrktFcz42jYphPtaMIJRhD1sc0mF6MI2eUkeXyXK3xaivp6OeXqHf
	 mOCQSpOEWP/faq8K9kGypvywUnIOkXQ2jL9c1kqFL3VZdeHgn72aconGmhG1ujcum4
	 gGip71iqPjxqpTVfFCZke/2uC8jrmjShPFkyCm+xXtatAjw9ryhe95KbKYQJlUopLE
	 0KbqjfMsDZSpGcA0BbWk2l2db5/ulRd6xnRArQ6Lf8HsflULQxaGKi0s+I/s7B3WsT
	 wGWWldYbySA6mW+lVdpfkxtIobFZNhQ4miJVUidzifb7BmJ9buCtu7HG0uqiyOynxE
	 Kbbo1O5ZHtQcA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jJ7G50GVRz4ykr;
	Mon,  2 Nov 2026 11:28:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jJ7G42MJMz8v20;
	Mon,  2 Nov 2026 11:28:28 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 43F7C5FA02;
	Mon,  2 Nov 2026 11:28:23 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7825d8a1-83cb-47b1-9df6-96892d25c4ae@leemhuis.info>
Date: Mon, 2 Nov 2026 11:28:22 +0100
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
Subject: Re: [REGRESSION] next/master: (build)arch/riscv/kvm/kvm.ko: symbol
 'kvm_arch_pre_fault_allowed' undefine...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <179267754360.302120.2153520610797426540@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <179267754360.302120.2153520610797426540@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179361530358.1131926.12318118078042161870@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 43F7C5FA02
X-NC-CID: kwUt/bvY6Bh5KxvUQwDN/axRzzuu0c5/DvWLbdu+P1ZjcZ+dyRg=



On 10/22/26 15:59, KernelCI bot wrote:
> New build issue found on next/master:
> 
> ---
> arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
> ---
> 
> Log excerpt:
> =====================================================
> ERROR: modpost: arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined!
> 
> =====================================================
> 
> When fixing this issue, please attribute this report according to the
> patch submission rules:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/
> all/179267754360.302120.2153520610797426540@kernelci.org/
> 
> For complete logs and details about the environment used, see the issue
> on the KernelCI dashboard:
> 
> - dashboard: https://d.kernelci.org/i/maestro:9c12526508454935ec55c5be5b9699f5296ee63b


