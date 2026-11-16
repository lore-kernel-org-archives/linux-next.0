Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863994;
	b=q9otkgqd/PhjWh/MNtJMU3Y3SojGe5pN+pw62mAB0kxOzl6+XeuJJGlKk84h9A/w6F+o
	 NgB2ccoFkmZqs83YeZgAYUfLGYq8cvAeOaEnSDjX0WR1IIpGdaoDt6iZnIUKHhFv57Fce
	 i/AzHbN6Su8VqJIlb4xISWcQt4+BvNpHdApdzpDGzM1FZk3SxcZqalTlC54+pt72cd0Ux
	 ulEuUk5SpAA3F7wIHimbAgZxOxVkq/qHO3vL6D1gesZozV8qCd7C2E6oWQfRCfn9Z0qkE
	 YCPl097dkDn1KaHj5WmEgA27G60YVXe6KqITI7VMVPMkSve223H6x9ivH3/KjxaHyrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863994;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=1eDiVlZ70ezrJ/IxeEHH4R+DqWl/53xVPO8ez/D05kg=;
	b=eDb3InV8Lp8AR7J5ez8KbvjlWri6CefKhlwMAmUfQ4XreQaEckZWxfwOdUz1GzrB92tM
	 uwnAQ7+RAFE+g2rPid3V3w5c+dnRJsTJzrHRcGnKKXdWaN1YlWFmmnm356OI9mclzA8SW
	 +GkbUoNx7m1t+s6SloqGO5m3Qh/RVyU1Ysv4+JYRv+CkL3jRyBDOwqEvoifcOnrBiP3mS
	 Jvsw6joNI36vQs/3yONLZSbcqrts5IFBS/8gN8/3i8t5yEQOE5ns3+C2zBMCHm4gHL+jd
	 x3b3oRRYLbalxN9YiuipplmEnRFt5r5PBS1J/HhPuTA3S+R825rWHsTKfLNXkIBLKJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XbuxHFCx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tCXVP1SD;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079F606A322
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 21:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B079F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XbuxHFCx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tCXVP1SD
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CCF8A1400071
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 16:19:52 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 16:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794863991;
	 x=1794950391; bh=1eDiVlZ70ezrJ/IxeEHH4R+DqWl/53xVPO8ez/D05kg=; b=
	XbuxHFCxEhvfga+tn7RC12tIOsc1RTpAzK1nbSD+BUktYc6savyTC/I1RpD5C0xy
	t8hzEV+AZ/N+cT5iDuxn+/oI4sjRs8U53tE09jS41slv5/wyvFgEryHfTK0KN9LE
	J2AyrwruUHkPq/jHkle6hlTA1BE72eGUyFhe67NbDPsrL8EyE9vHdrtE2ugTulCu
	zj2UvjyZZI3x4SOgK8Nr6L7oxppWPYoCoV5LHAHlLdTNoD3vWNQLGQPgTyODABNI
	NDt5erjh8+614DJBg1BmDXpmS4Fy9bPPxoL3N2JDCsf2EaFWRLdN+4DUYnVSofUE
	uD0SE2wt3TIbqliu8lM10w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794863991; x=
	1794950391; bh=1eDiVlZ70ezrJ/IxeEHH4R+DqWl/53xVPO8ez/D05kg=; b=t
	CXVP1SDcoN1hF4caCzSpkClekG9KKleXv84d82AfOYORuSAYaa5jfMUOpbozJ1K6
	91O3/dZDAy46PtK5RWj973kOUFx1quv+RBjKL0cl5Hh7sHkm8V/T/WKqxVyr1hA+
	7CtgeCxTxHIuqkOfGhm0Dsq5wq8pdKcSk/s8DAILAsmIN2qqK+TW4E1EG0VYJOUq
	WF+28Cx/2ZM7MuM5KWc7BhefpvCI7TW210z+FiYe6TrO00fw2U8umZe13PItQ9AW
	oQr8D97AsPazCUB4++CEtIbeTDb/iO1uV7j2lrYwcxgK+I4MfC1kKwCUK+7YHEkA
	j+4qSD+KanXoSdJny1jQg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794863991; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:Jv6zUuiApAUYxct3ZFyyNSwKibPDq9AGmxjS6NUpywFInLc
	L/0T9vvJvLXXwEiJLWPv9E2AtgLkGQAgFwO16t1MFiImf1bqo4QFI1AsrNJjuJZj
	jw8pXQtL5M5Pk7JEVkifgi9KeR0xEyTB03Qi5C3XhzM5n0PpWepHIpldiITlb+FU
	PMcfsiQyZ60Mtzsm390v2X0k4y6wrNL7HZYuHTLz5mnCwVLWGrqKQAls3XJn88ul
	lCnifYETCQgrnLPgBOQM/8VBoRMwEYhUOpACKxYHiiuhJKzcQmuuQ9VyIbqN48Xi
	X3LMUBHgxtVDK5U2QfgpsNrKbXYzq7Jp/+qg0LA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:I56aw7NAAEWxnBdMg8EfZdSKcG1mUQQTPDXxZLeA0AI=:fQjzsk9q/dKvw7rVCN4vxz17Sv4UPA/e7h6kPkKazLM=;
X-ME-Sender: <xms:dXP7aqgtZg06iDzxJmbacZdxRYXNkVIuOBxYxONuRvN3YBTXTEg-zw>
    <xme:dXP7al009SMb_KwIDs3n-687GYsUl7Ollw0OamU62NuewC4MmceeBEm7FAzoO1Dj3
    k7MQDmZNUBWPfqBVQIaZGaW-6GpanzQl6M2_O1J1Jus11Y2Ff4OH_hQ>
X-ME-Proxy-Cause: dmFkZTFTc/ITTJLW9TujsXMlV1iHeOcjWSJNO5pO5q472n23DHGTEOXdDO8swpLAZk5TLe
    EHCU4+HLIgK4s2YHkEf69ep28t4iZRjy/00TmdTDpKaNx4hg4HaK+1JCWXJ0SkOHFpwe1w
    HzrDl+7CXuZb9BIsY7P9PDIdi3gbVPF2MrMiFrJt7p4wx1zhU20yKpv7oCf4KiYff5V792
    //FfmLJlUB0k+YtuYPqlSC8H91Q1mB4iMsRAQoM3o3cGVNL9iW057dxq1cY4PBfUgoG1oi
    L2FNBXd+X+6FeOAKXgdHgysjMDoEG4PHnbZn2O7Izo5euC0cC6jf7Iel3XXFu2mGEL8snp
    pcweeX5oBGCJ7m/UQ3SdEwUlQfKLqf1xQdxtO43WR6Qf0dqQaI/DsKKx457ucEUu2cJVkp
    BgYk70lEqLIUybksUQGa6UCQUtdg95LtLXlS3rZfU77Vg94uJzZigFScZzUg3u5H5z8W3v
    aPMDOJ2l/eCcIC00V70glos5mrVU4ROi9pMPIJnD/RxUJm/zEBpHw9PZIPXSOaBM7Z209m
    9QEEF6aEUmahWKRbTgvUIR8QYzMsFm9D9WCm4Wp8y9VkZdDJLc1O394HUC/hX4jkpme/0D
    hVRRjakrjucsdOJD61hTvBj+dY+6DVtIBwKRheeN1tHIWaKzxRhz+vrmDwGg
X-ME-Proxy: <xmx:dnP7asFTWsncbnnoi1ApNeALTqp4k2uUAPOYALHE3M-vI9xvaumL6w>
    <xmx:dnP7aleQMoHyN6iCteIL5-5uE1hbsrd3peNGevfKM7luIZU34HopDQ>
    <xmx:dnP7auGoPGCxJITqTX-X97xr3xswURkh-557USD5jUbcNIDrxtxNsA>
    <xmx:dnP7amXOKKor6FIai6JxbLh30EWzEwO3YlLUp71RImUeJ4_EImnB1Q>
    <xmx:d3P7ajzy8j0Fho-Q_6XgjqWSb7RcuQlDav1NGVWp4Wr9wzl96FgEAN8e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4223632A0099; Mon, 16 Nov 2026 16:19:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A5BwhhEKV0Ys
Date: Mon, 16 Nov 2026 22:19:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next <linux-next@vger.kernel.org>
Message-Id: <eb397d2e-a6c7-4838-8240-b3f8854e6109@app.fastmail.com>
In-Reply-To: <avsfuW1MUYp0jI_I@sirena.org.uk>
References: <avsfuW1MUYp0jI_I@sirena.org.uk>
Subject: Re: Missing signoff in the asm-generic tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2026, at 16:22, Mark Brown wrote:
> Commit
>
>   5dfaff16e8b90 ("selftests: vDSO: Fix header search list for 
> vgetrandom-chacha.S")
>
> is missing a Signed-off-by from its committer

Fixed now, thanks for letting me know.

     Arnd
