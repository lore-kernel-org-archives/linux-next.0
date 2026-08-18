Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28F41DE08;
	Tue, 18 Aug 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042521; cv=none; b=RCTIFM4NQrInq2p7UjoNveI/1BfaQS/CjR7iUh+9JPaw4CsvWIJdpsSWhM2qnB2pS6ntjtpecg28KhmNB6/6ynLG4vUhcozz80tLf9u6eDTulKnfbwuQYcfwwKyvkAQeUJx2SvO/uQR4bI4K3h2w3hhWCABcJoHadmQOnC9+DAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042521; c=relaxed/simple;
	bh=VMi0J+H8t+voydAe6rp87HtWf7Gs+bTjusc5abnKhtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnYBwS/Wz1brYWoKMU7TM/8aPTzq02YaWmPqLzFd/szQJbkA8Oy/L0VfvV6foyI/DOXRbUUz04L8IUyx6VE21bk/eHuivp6/jWy0ciyeCYqADOFGIhXB+Fl6br7Bj/dHhGT0ch9O6LuEOg30wO2QW5KDk7nvPLWnkzhARKNHiTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=sejRzAeW; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="sejRzAeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787042517; x=1787647317; i=deller@gmx.de;
	bh=aFs3sxA498xjDRhiycND4ufD2SnlOsAgfgDZPHev8KI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sejRzAeW2BdUwxv2/oFm9haGFJ38Re8b1dJqgjXG/4aCijtYDfGcX9Wv5P00ve/g
	 3hOTTCbz6WpSlFnzhAefx0uqK0o93UTC3zY8UhxOYatbPMNeWgBIQ3JaVnpLMxySc
	 4dyQG8LbBHw5eu5klXRy5PbcW3yF6MIffc9D8AfkIrzDyOW23PWn50dYqY+kN957F
	 Rvz258Bt04RDzCIboW60jWGmoIpJvJrzUNDFD93nB53ShYs9mkmr0GAZMoIDDIQZw
	 TxdZ6FR7GxLznKjxRVAUn5YRq77kSxPrMcnpsnktLMqaE3npnochcnrdoFRH1iOIt
	 0lSbysxgXymIArzSrg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1xCCdT1HGU-00963g; Tue, 18
 Aug 2026 10:41:57 +0200
Message-ID: <b0140080-c70c-49f6-98dc-6e1993eda2b3@gmx.de>
Date: Tue, 18 Aug 2026 10:41:55 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the fbdev tree
To: Shixiong Ou <oushixiong@kylinos.cn>, Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <an8-iMG1haqotufX@sirena.org.uk>
 <41962598-2237-4150-8c45-2436bf07efbd@gmx.de>
 <423e330a-31ec-4711-9ac8-0c9c195aba80@kylinos.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <423e330a-31ec-4711-9ac8-0c9c195aba80@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:odgSAD1qOBXxD03puJV4wRcwuYrRUUauI9iKhBx6cYkVafOzRdM
 HBRdScVIdU1tyHoIK4nFYxrd/PwX0T6E3Xvff8/nZEotxJ1Av9flcL9+ZQhpYuX0v5hB+Z0
 kZLZBS5MJo6UY+t0WDEczQ/xeokr+dOWuS1TBXpQGtNRbFAtxeroSMBf9qIbtCc38QBNZgN
 6StvnlgEi9wL5tpwLhuEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A2e7dUzkiqA=;DcSZZ2kK8Q9RqmGGd9SV2bqYB11
 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

Hello Shixiong,

On 8/18/26 08:24, Shixiong Ou wrote:
> Thanks for the quick feedback and for looking into this.
> I just checked the public for-next tree at
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/l=
og/?h=3Dfor-next <https://git.kernel.org/pub/scm/linux/kernel/git/deller/l=
inux-fbdev.git/log/?h=3Dfor-next>
> but couldn't spot the fix yet. Has it been pushed, or is it still local?
> If it hasn't been pushed yet, I'm happy to send a formal fix patch to th=
e list.

It's there already:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/com=
mit/?h=3Dfor-next&id=3De36aa3669e0f2981bce9be85d38c50d83bf5e1ff

-		goto err_free_fb;
+		return -ENODEV;

Helge

>=20
> Best regards
> Shixiong.
>=20
> On 2026/8/15 16:44, Helge Deller wrote:
>> On 8/14/26 18:12, Mark Brown wrote:
>>> After merging the fbdev tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> /tmp/next/build/drivers/video/fbdev/aty/aty128fb.c:2027:6: error:
>>> variable 'info' is used uninitialized whenever 'if' condition is true
>>> [-Werror,-Wsometimes-uninitialized]
>>> =C2=A0 2027 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pci=
m_request_region(pdev, 2, "aty128fb MMIO")) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
>>> ....
>>> Caused by commit
>>>
>>> =C2=A0=C2=A0 99c188b02c281 (fbdev: aty128fb: Convert to managed PCI an=
d ioremap API)
>> This is fixed now in the fbdev for-next tree.
>>
>> Helge

