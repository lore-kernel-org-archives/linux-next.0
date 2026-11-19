Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107548;
	b=p4E5j3e7lTeJFzRKDVRHu/4VR7LT8PC9tbN2WggJAMgrcxKQRTz1mpS7vczypq8pcj7f
	 q2Q/8dtLRgqzlYVYrW7YZYZyeH3QskBr6v73KyXT4Sogr8EdSuhesRAEPx9odqWVDNua1
	 Ru1ttMhPtISrb3tQPNWKWCDxaf4qYjBbxYIAdKEzSeEhHrdsaQu9stDe/oYevRfM7D8X2
	 i0IsuovodhAuyruTUHl9Cr4SnqUBYyfaUsZFg4M/OAXDbLeg8EZ1FfPOExbmWU/d7dunw
	 voIUaltZZ+Cv8ZpOTd1YTapuHv6JQG9mYqgYRrREsUY1XamHyVcVnYzFcZcW0C2oWFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107548;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=/UYimvPRh3QLkhmXnNqmu6hWMEhXt6jQ1edgp3xl1hY=;
	b=TFfBiVDsjrPdNlItk1IHf8eEbe2UfID7V70PpebMiBXlM1SJ0HycHPNNBliGOk+wt878
	 FSXLwNgVwdqGq025VA1c2DubWtilhhofrReTsI2sLMQdjFHbVfL/G6B7QISarAUVxFaAY
	 4Gp5bVru12mmvf/33H5/pAlk0r0l80JxmV+375LthNsrSSfTHYNc/IL749ZUB60sfbGLM
	 UeJI8/ubXEky8+TYsEHGCiabOAJgZ44a9T4G/Ep6RPcHzJtZXE7nRjQFiByXTUItC+sPo
	 Y91X7WHJCQTTA+G1k1fcmQXVsM4zjTa5li673cc0Lgi3aCw1gg99pCg/g9DPy6n1hgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=dWXHpMXN;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B1B60A261D
	for <linux-next@vger.kernel.org>; Thu, 19 Nov 2026 16:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B1B60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=dWXHpMXN
DKIM2-Signature:  i=1; m=1; t=1795107545;
 mf=PGRlbGxlckBnbXguZGU+;
 rt=PGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:KTx1nkfqVZuhl9dCSrBItMYpjVIV
   1QFct/zuwN+ykJYMZa3JbGRe/hGFXz+mBp+ABf/ybNGdguYFmWp8ocbo4ms/bssaAzwMzJHYr3/
   WO87rMvCt1McPO7oJLMtC3p6AEk8NINhs8rbqGinYQ4esH7C/6R93MiOkGsATnVS0jp+RnlTFOk
   AqqWlUS7Thq/K0BUVocsELKRg9/YxDdXd1b/vTjAu2kPdPc+Op1civlQIJLeZE4Yamo0Nrp5z2y
   lj3o0X0H9kAefHik3wKdLED3zUYm1V3jUawSvEVfk6d8cQ2zy5eMDdOVMwn0sLaHNVW7CPmFtT1
   uQcnyGGmwSxIJQ==;
Message-Instance:  m=1;
 h=sha256:
   AWiJ38NXCpapcAtj/U+FnxIosNWOkE1FxcZw1sWxjEQ=:
   KmX2RahcLkvw9NgtlkWUZIA+JtLYcyGAhUoV6SNZ99Q=,
  sha512:
   lwvwDxYuRv8edx/xpx0CyZVxfKsNLdFotIS2u3VUca1nUvlqfBc5v/B0co8CK6+ldI5gu/q3jXAhLL51+trzSA==:
   eZKpOd+8LZ3jAlHRkkxt/S4r9TrLrw2MMuJTC91Supz4/mmTfa1lpJidqvSQ8ZK9bteU7zlV5EmmMuJ3EJBaCQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795107537; x=1795712337; i=deller@gmx.de;
	bh=/UYimvPRh3QLkhmXnNqmu6hWMEhXt6jQ1edgp3xl1hY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dWXHpMXN6mnKc0EHIa39IznMqTcIkANzX5u6vuZ4gFTjcyrVF5795Alj+Bzokn48
	 XECmEm64L7FDaehpGZg2+EeA4FVZ4k9v/0cibE5hYXHA6ZgRctFegWQrRr33hs+xS
	 ALCx9fR1Cxuc2CtbNi8y4VgcegYJyR0oSEUB2ONNUWL23wjTek3qvhcoPRNffpoBj
	 c0LNWM1tBPu/Ntd2weLLIJcafEE0CvAiTMQW2h0hD8wKyXOFvXrMbjtSeH0i45TuT
	 hXe+fcKKGXv4cyiFw3EKBjrjS49LLK5w9o9dFEc4PZKf/YHCCBCCH0YPg1kX7N3vs
	 16IB54T7ixLQA/MVEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsUC-1xLFmj1ixk-00AMko; Thu, 19
 Nov 2026 17:58:57 +0100
Message-ID: <cd8747d7-9f31-4686-8264-3c226cc3373b@gmx.de>
Date: Thu, 19 Nov 2026 17:58:55 +0100
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
Subject: Re: Missing signoff in the fbdev tree
To: Mark Brown <broonie@kernel.org>,
 YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <av8ZkEpTI8GdF20A@sirena.org.uk>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <av8ZkEpTI8GdF20A@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WmgWWtJhctJShUDJfYu27VGsWv8xtLpNjVf+5bAfF+aABoQ2SmI
 IcIuVDeopj8svhwYeMhVEhN8U6SOfzc3/dZaPEbISfEtD67XlU255uqfyrDFpxjCIKgxD8/
 HuykM4J5/scIulpnGJaMudJf6IjoLqxTkEEdSo+d2/0AzHseVsIfitPZILEZyL9R4O+svDv
 MRFrAJrCekK/xz3nmEJ7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gXiyhRvtCBQ=;OyU6oZ1wTd48cTHZgFYtpGI6m57
 Z0crY9A6/iTgD4F0s3tK/+z5poCtcu4Ug9efGbZr8uU915xrrXDmz7N9mB0ozEUJXzmM712+6
 7Ok9GXFSwlZCACz3hOl7RI/bwb8kazZestz+kWB8GvEbYBKQZrfkwySXYMbQ3EOFQc6VYf2ne
 lvuyRULVDcrkwDkzAMulpBkiEoGV+TB7JZzLcxvoDKBhPRH715MPADJrZNDeJP5IbcO4hwutO
 EUn2qTRUCDcuMwQcpjFn2YHiPWhpIGMbMXi6F0uXdKkO8fTHrdLsCX9BUnOUDi0/g+swVWOxy
 7cqyL7uFE0cGNoPIablBoX7YPFJP6LQJIQveIMfRnzTy4xM4vf8YRuKjMIKq/1XpXZC9ugIpO
 778ko9XdVNguN4QRFMKrbs9JoFJpT7Yv1lLSI00+Fuz48gGSdTFTKyhmxObPEyV8/jN3yVAsg
 Id+sDxERyfV1nKFlhNiok5HlcRTjzTvgBOLbTXgkm/7X0qqWU73wGsDarH4GIVKkDdvBiVAo3
 gds9kRUqg3pwSPmc38oaFul2P+Kc3nj1J4cQb+5DhoUCb+lcC7xUgjvxE+k66ZveZChV6HdHP
 nYKlHh89efmTofQ8l58UncN4I3mzrUvVH7x14lMMIhzFHsYV8RPJ0cZZp6C67isbFr0PE5zw1
 13nk0XCWTYiBu3wMpR4+G52IBDVAuLdTwJYur1H/HMqxDZuV8lDvlR4s+GpsgSQ2E617K1NBs
 F7z9Bxttam0jDJ609gmFW66tnvpHbt7Q5Q+5iZm06s/t7rXOU7JuwmqveKyooI7SKkSjRXEeQ
 xEQ33aJFaMcLb4tjfe3b/mpikRoIX4SVeE0qNQHiaLbESkq3tn6pNKEIHcXxtFjDgXQzster6
 b8g0M7NVyrk6qVgDANt3nyNV89mL/LcKNYPcS1+a4kQRC05bxbVbjBQ3wSCwh2Z0gAr2eoDsv
 Z4vgu4MnhvL0jIfN+JqGuBaqx+4hNMeGng2UXLzFLtS5ekcZ0GffWgF/jIKJszdnV9vItfh06
 bpf5nzJenZ6JO4wX+RcxBvwfIgOmxgOY1+52dp/OqkvvdzkwOWPXWRiVrOUcQ1ER/kibtCXmc
 GKb1MMHB8nrnYzhN1xuP27+kZRfDqNrRUsnYTYli9K3P9PDfSrPvOO7kBj0l8dqG2ZZV7xwzW
 VyRk5oieA5AqwwixE+IIurMHKBth/UBAEwJzscDvL7mztewJYAD4/ilZ2tfKr0rBYPuaY9q0b
 NIDBirn51CyaZswUrS7PR5yZYPoMH8qnQRBg7U7PPTjZjgVkaywXTs0HlHTR+A81BtZ3tAl2X
 88kHjcDn+aIw31kNt3VoCvdlYwlSEpan5KwSbhF7qmBczA+wmgT0rHWOlxU8ID+TRi5nfE5CJ
 j44qRzF3Ip+KzoXc+SejaLmiSXhHEVZ982RnvD6+0Ysik9vlkGI22foyaMvVKbdnQFwbJIJ4G
 4uLfp+HEwHHr5fd6YZ3Y69F088wybXx7KEdQfT2AD2py7JWlQd5u6cDp5O06OjRSzlxsuVgKl
 68VkiNpoai5YcR3VNzucKHEGz/MEcz70NrvUkhoZ6Rk7wb2bAdYS+x6ifs4N+FCql1/ZPhgpZ
 SSaRp/KM64sqrURoZWb26u1frStOryey0b9fIsAxvlsW4ZR4MVwRn9grCfTEwjF6HsoozA8yg
 db0nBYZp4lVu9ZXbc+DRtNLHhPxj+/OEW1gNrYUWH+E8yjBMs5uuu4OfHF+E4AGu3WSR2nTC/
 yeW7976SsfD3HVzPuMKrvW6m6LoEXsWshkDUcIG3+civ0tp/ToK8nbyqtQ/9GWmTZ9gcVxkXW
 89RN6azhhKqN4kkTLPDbmqJdq3i+wz3021pQEPbEaQDvW7MqQl5zc03gjkAtDsNG7fvwNzptE
 /EFn2z1tNcwUYYSE8suRS2lQ3ntcjop4AIP2M2o+KHcXajUtmTBq4L1fIAccdU2jwOjcUJmfb
 FQ1Tjowwy43u+5ZJabS1X4mZTPZ+e5T8Hls+j6HFYDe7gmCO/SWUdRwWY9rBZULZu4i1qI8Z2
 IvhsMpkX+2k2Si9sbi935sZ3hzGejioN4wYGQ8yDoT89J60fv59TOVX1kSaopYp15+04JnVCx
 KKvCw3s7n0l7a5BJANebsEZ8QnhJNQEz8wkL3L0gZUIQnu2mGhKlD3utzV13pwn1s1AgPZdb2
 cnuQBLm3IcdLPvtJeF+mLzW/SmWvHHFuL94fppfbCCfU+Gq/uPGpmeGK+AbAAQA6fzURSAnfP
 iRIANwQss/r0HzltPUf7nMJtoVvJ5ISQLWHSagFlBhwoS+skMdhpBL21U0/WJjIrOB2P/Gsni
 dcfxAppNweY3oEiLTH6YVXiQil1hV0NHk0vlLqRNZo0ikgnSHbrm8t+48htkop61M4bsXaoCz
 QGowzuL4chnBfdAr7f/OVgbdTGlKTDZzztnOy5ZRKwuI8IlKQrGn27ZrYplMW3/9SRfGEYITk
 oWDOPz9uGxmF5SQf+P7TWd1JYqzvZ1H2vnoc08E/s062D/t6EfXiqjAMz8zvF9sTQXSSHRuzq
 lRqOk/6Xq+zF5JMW0qxnzUYX/kfeWvwD43c6/mZtLoUTZ3K/NXp65Y5vMKXesiwDeghaH2rJW
 E00iZ/b3SkZJF3JxcoX1C7j1+rRpWXS3z5clBhmogfqjlYUwHZ6mbkKRn/CFrsokg+6XN4/+f
 zg8zv1IcgEZXBBdW3oKpvB8jf/VrRq5TZTxj/UcJO14PerK2ThJmvS3fL5j6L9YU2hVv8DlcH
 4exp18i7QO8dxe249FAyfGIuZh/lVQpuOBemwU2hEcNi2csVeSiNZpdJzmaRD4syAfHPVKw4C
 wB4/rBunScxCAiLsmqwa1Jt4vGTl8VrPt5HwkqSLemZJk5YmUmKUlLX7z631NxaaPapdY/nXE
 /guN07jjzdIa56qs2fbIwkYx68pfnUAz+BJQMWh4V5MvxTAQXKLgIqpeR4ywnHDNuY9V0g7qJ
 LqJRT7Rj3oJ/ZgZa4F7dRqKXv3XwMmlesNo7/O+7q37T5Jdo18lxkDdetHfysau5YeQYpmMey
 WftXHamPxgauf6brGgvaY0qf5Dko97179nmpmhRmsSPvsY1mrTtWZ0CrKoxVK3/zkCNJQhHFG
 2tzsP5b+3/hMC6XOVry9S+mL91q+8sjU/Z4f+48K1o852QDEZvecbjcs2axnPUhf/IMavkKJp
 gwt84UqbuieqUGqf/oVqnca8J7Ns6Nwf/RciEm5aH3DGofm1pgdKBt5RDgdPnPNjz0WmkNaQu
 F+VfH6m+RMekOhwoBQPGs+IJKt9h4PYseHuaOdGnGRTYWl3er1Z+NDte5nbMXRjwJES2w0QDu
 QTyZCuRS99ZJ5qxQ+8F+JAx7wC2ddsiVPdHx9ihnO5scyUEzsFagEbD7nXUQ5ORHuNUdFVVxB
 apFwRLCVMxoXsJ8ZBI7IxAmIBdGG1x44M3tQW82lI5qnkourlRv7o8iW1MpgrSMjcDYY4VXfh
 ZFkotgd8Df4KWBwR+0X5fBoI0k1/VS3bIojc/fj/GSzXHihr1qLrTc35N9ljo6H8BlTrftcU6
 ZfBv8cBaFE7dQZwKV2PcJqHbLWq+VJKpUgFV0JtciaAIeF7yUYm+qJsFhVAz89fwNIB0eZNSE
 OHoQRevQ1f4S2ng7TrPSpCMa72nOjObQKVKuOtDFkmmZGsrCRrrhwAijBTbV8ByNwi0iH4or2
 sE00iCEQzcy4YS6KGNFAdUNuB5MsaSGMs6A/b1lHw37DOxcahmmY5jjVjGGiS0sr57V13rxEB
 eTqL6slAWduHUIATls5gJ+djfkZoTgoWaIIrYSQZI0ljCpPZalKG+Rc/prlTIt4wFDXH+Eg+f
 m2Uo3XBeNTrBE01H4guyj4E0jxcxU6eEIKeic/AKO/CUdFD6BL844Q61h5yXEGCUW1Q9eGz7e
 zGSePIxBHPoX0xc8kvVqhE9fSkSrjG+N3L24Tq3eqPzjZwiTIHSDwSZFmnakv0OTzfk2hea4S
 RtnSmyOzQUXyjNtUPNP8/MNxSGvTNYjrvEowyJWTfBf0w4+jlhIKWNXUN0xe4vZha5Op/Tyue
 jXHSilRWuGkBZ5QpC5nHWfrntAxaygCYeYZVOHYq87O6/AcCMzT4KV2BbqkLSlHfZvhrjUvka
 ccm71VdKeziqO9DKPqgtYwKokVehLRkOWEj6rY5TpWmHBRSpemTqhYdVKo7uap9cmPzCdw+TW
 QAi4N5CXxXiv3hp/IG0cikzfQZ7IYaDs+3J+gTGvXsqQmLDzXsAf1M3tDqixHYO5YuneSNhIa
 1HNjFa+DU96RV2gvUVPENO6hkIs5k/2yl29ZyYHeoGKKfgNQDd6IRnzxFfmOa/4jFmWCQ4RH2
 WK21XUPqDyCq8Gc0FaHu1Y5X8UgszGKyvfzCiCvmtZWgOsVEi+qxBlT60DHKpmo44IYFHeK9+
 rbY8EgEI5NWM72BeZmG2SG3QZIOLck++ANw+5jBKF1I3gtQkgr9Vn12KesC4SCnokXWrMqc9D
 FHI7Fy+36NawyPalgex37YkGKpY2OUTw2JLjX1PA2E3nusPCQEMNYc1lHmQUyjcfTqFeGwSHa
 HgPdyNLVklupMRrGu644d71f/O0/DIRzz3qXec502FmWgVOtThBclB/fU89W4ocwrReVW3zVU
 UCcgbKNcmlgs7yaRAdBvG2ovo5eB7yg5bTWtUicVlQPoC6iy6eFf74f1cJS/jnqBjq+WXTi4f
 xFhWqlAn9Poex1dUPDedLqNSmVmBt4NvFSkW0MsCDZg6GOyZwVRRs8Y4GFNdSeU15GR/ItV3m
 avT63sg3KKX9Makn+UIxmgk0aVWgpk/emjfzk+ZOcYYI+vDJ/reBGPL4pUvwxkxaa3sa1SvUl
 SfYUf4JHeVPU/ONCj1hUmT1z903SPoHdvVuJfHK5kXBlJjn35Vf342ygwnqQNrfxr0VgV8Pk8
 wS7rncakchVajVSfxlG6Wlq8S6GbKgg8L5WcHwsjeiuNq/U1/Ix6AeBxRLtMOKnXLMTjOQ7gI
 mJOAzkXa8aWrtN88oTxNvHcwRSAenPgZizV6xGUdkpZSa5yTHgpfyBgBoeu7z0MOGrDmFUHoV
 gU6eatWzNjKENw+4sj9E401VQkLg2nQfDJHvY1uJuvKx27jQ6d3YqTIhVr2Ab/GUYgQlN5hND
 h6q5MSFk3vU8SUFeUu+HXWx93nv7hZTxeR5Mq7VSuosYhRaF1OSsCzjSpjPlfDkyFtm1fNWf+
 AlkWTx8U0oe/4dT4cKEel5FbHnJ3I44WeF7bPIiIuE++rTyMpmHvFXk+zVTYKKu4S78dBUmOB
 2aNABDEnsYPFri2i/wh1tNytamTL60n253vtfo0jT1A4BITOV5Kixqi2rXLf56rslWPehP3kp
 A7Xgmdj5u3+yau8nSDhCVXwo5kh5wIZ096AysQKQR9HZGrpQgd5c32ADzK2REYAt4GUo4VSqu
 4iqV7ynCcxO4VzvOPi8jDN6d7LX/OJE/MaD6fXiuk65xPwjl/cR/sirbwKY00zb/ySK3SXnFB
 JKyoqdz0zeu4VeXXYWEsk/rtSEBD8dlibFvC9DK/M3fgX4tKzd7Csb3tYOXJ115v3oudi4Ti/
 qyHLkpPYNQXryZ0gSIGBCWRFWI1Ya8fZdueyWjiS1hnjIRdO6Qfw4k5UBmwvzKzWma0qWFors
 rEuLWCPohcWA14nX0tPkCeH5Bn7PwJIs6UugbP+vSs2yavpmrJQGZ215R4LytlqWDoBDwQe3Q
 OJCpFygokE4zDzF54/uAi/LCh2p5z7X6ZazsPUNSYCE6YiKu990iN1eVOm6gCH4kiGutulymE
 LNYJg6VBU2putKneMWZh0lTUjnVTdX5Tr37AxJDZPFzxEkyAYZ5s6nll2eXsFXaR6yytPkv/L
 XJ7ICfMTskq0jFjiQXpN0sHmftlsmcZ8gOGRf22ydfnUHTgG651eTGqctWtmDwCbyR5bCOw22
 SomYGDT18eoLEmNZEAE9BAGJlQXTmXA2+aRbbrQ5X89f9iAzmZwVZBNPLH7PTPoquRSwVuYDG
 /qqNd21v2va7DH6Cira6Wvfgk1MMjXWQTIGdUB9t2OasuDXCcpmfIRDxWk/TGmSLp1AL/GTbs
 WiKWmHiX7kBsNZpTxWK/lmHFSE8rNIb6dO8+98YxrbV1PzfopU1B08auTTKqxpWK7VVEIosBP
 ql8Rcl42og+w66WT9o0hTJLz8y4BURe5Gr940/fIP3PpF1eC4dR7wfCGjW+sSoKVwjcI5JyhE
 KV3276veE4nozaiaSlkrGPuNZCIg1doIQYuWPTxQPL/yKCvOlUjrIBuiu4OhBKTR5rCNhT5Wj
 haQ/j9VQccj6EB9hvfYUQ4edFHLrI4AKvavMsjqp6S+7WvXEQirPFCBmLrm964slsUT7PMQBm
 DDR9iqQRWNRzG/nHdKqTlIt/zorCieyqVhevnHR0uIErSxe5RfauithNPpdsmgX3XUKAe9tcQ
 VNfPTzkCtC1Qrc/N36Vkm+MA70iPRPIfLgjMx6eMl3UwOSUMeBi8CJcg8rPEkltEyDkfy9Dr3
 AlpuVC6Zk7EsL2wcE9ZzNMVl/PwEya8ZMu16L/baxv+O3DDMoMnDNKVMSQHIw/hKK/f9ylOVm
 ay1aqYW2qH3AjQGrm5Qd60m6RMuYAPhbpsOtJKZjmYkl5+zirZ7dO+HwdseSD7e3llup+ojKk
 o7UTFq75cMoSXk4a0TWLoffYU0dOQUmmNrnxP4trSuB2DHRPqU5MgPWti9tNNYRCS5imKCuFk
 omWMyM+JaQoN2nFoqTaJq6m0eO+3pEAbqCKVcwMHbKT/rgI4+QYzd2MfAhbO96FaqVyHsBTsW
 DfsadOz8599kP138L/MzN4Ra3UX/NTOx92H5SLQmYYNAaARB5Ja3eWPUU7o6xOUo8JiYuc91C
 tRoME7vhSWzO15

On 11/19/26 16:45, Mark Brown wrote:
> Commits
>=20
>    82b3e4a350659 ("fbdev: smscufx: allocate the size advertised in smem_=
len")
>    40c6df95830de ("fbdev: smscufx: keep the usb_device alive while ufx_d=
ata is in use")
>    cc8f68ca28201 ("fbdev: smscufx: don't free registered framebuffer on =
probe error")
>=20
> are missing a Signed-off-by from their authors

I've added those:
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

@YuanZhe, please let me know if you don't agree on this....

Helge

