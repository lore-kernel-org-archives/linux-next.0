Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794398657;
	b=NHHFn2obLhtGLYFEsmUgh0e0tjb65zIleHuhsE/mo19aO2bIZOauUBPcZT8tIQUwAPgk
	 /EZGiuw5CRj8rEAWfFop323dJhOxN2C9HdnQrnxkcGMMBpBIb/k+YkCJlAW6GqkRKZZcY
	 fN430fw+d0vF+ZR0+1K/+7a9uhTtqzJEbYbegzekv750Aq/IKjxYk8ENgvm/EqxPub1b/
	 K3EqgmUy9YRbRJVoLgDBbHyUKNXxg1UqsdT+ql9MKu+eKDigTZxnS9wOFqrj8Du3HLuvq
	 Qje7HUYvmejQQLrOtLMTGdtrGExNIkW6QU4FBJCGQlcDP9ZJdQ6tgNLGTSzRrdwkOMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
	b=UyKhE7OPsi2yJ68W2ar/disfSUErcmQtF5JUJ+4vqSAhiBqlpEm99P/JbKwwJn0Y0ZDE
	 bGP6hRiqWvdX2KByVt2B1OfoN2P9d4Fkjmtjz7oqoTGSzlAjQSQ9UeEdSuVOVBv8DlxDG
	 Jg3q1WcGugOMaTLoRqvSLKkyf/lPFvYBWniYA6tpq2oFiM9XwTfKA5W8G0ap0pwRlgqSs
	 5mzHR097JXSrLTA5F1YNuyjONIjtihK3gTroDjzhYYccRgZdZcREGJB3Z63/9RMNyVwPV
	 HgUPHNNYLfD3jRnBi0NzqBnPiWW13XlpvB+4TDtJYyd3UTRsCy2zd6q30sfZkynyBbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlF7V0pk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJIYfsna;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5E606A330
	for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 12:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF5E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlF7V0pk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJIYfsna
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABBe1IJ1409616
	for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 12:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=; b=hlF7V0pkEwNptY6I
	k2qXpgfx4SV+EbsQQ9Lp2+M448er1GPThyxTMxu1Hvn9wzwZwxUAz9uID0YSAYKi
	H0IHQtNgUjB67AGWSXNT8UoqMGcvYo3HtLThXMVI1l+KiRPR/8dMg2p8p8mdotxY
	Ud60S9JdjuJLfb8xesADWi1W0HC+4qYKzZD4iVN+gTn1dIYI7nOxy/gL949s24cI
	HrCdSEk4aificEBQDtmBc8rJBEG9wO151qOTo4clJzhbEp+Yiwmg0B6QyiA+GKo2
	7rfKmcDvaBdg3c1tMGbVB3HrTyIs9Bu1Ap6B2UOs2vAX15bv0xiI1WNelN1aSa2K
	K6cjrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhqq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 12:04:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so2463652a91.1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 04:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794398655; cv=none;
        d=google.com; s=arc-20260327;
        b=MUk18rJxTfMHXtNJg0DqPImwt7i6m4qE3NApzb+L5Y+zPe051BV4yVl7cWySH1N5e7
         /W7xYu8dJvvWyaGqHVBW4bYTUdqNtfnAq6SKNnPSS5xn0G8cxTM92Ut2/4bVX8ZRqsh1
         Orw9KsMYjkDI1coxAablETkTRkZZcbFS2Y2sltJBia/8YVLW0sPbxI5/X/JK0e1Xzf2z
         f0p+1Pm9j/ZkzdR0x5K2THoXPXhsQJnY8gdT9ZVh/sfnQTsAbC05OYGyGkZIGLYOm8Pl
         Ro0d8TpRCwMu96+g+8UTPqK0Bw/Oc211qHY5AQE2ytvluDMoziHf2/aXERxdbGLTR003
         0Tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
        fh=tBuQuidt2P+doPcJ04R8phjxJB+9qqr+lZUCVQy3cbA=;
        b=AR3+JRPYTSUYbW4XdEdJbwHkUkHcr6f/CzLwYHKD9zOtm50s9Y7WP9nIOE85/Cx9l1
         TV3UGOsjx0jaPhC1fZJadomMHLBeO8R6w06eP7N9mpuhBV60g1xauPxTzWwtF+q0BiQ5
         O7sKMxfB1sBdUa68o3pVWxXv/ZJ5pzeWXaOBV+foI4fcuWyAv4h94q2WSKvjsPFgyJAT
         7s3S0aN6mNwkcK8xdqcv64WthUPz9E4/estZm70KxnLu4t2DDgHZx+8gFjdqI5FEgCYe
         EVxT4FnDQ6SEyFbXUTouTStvSK6aWMGRw76IUjdMu3R74ZYEjoZWZYRPacxh+nd1IH5V
         HyqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794398655; x=1795003455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
        b=fJIYfsnaMJ7W2uS5zL5++SusZCyP5EncgY8brkQ72VQjS3/i1Z0vYn3YkK3WzV4vMd
         jvzTqgR5n0uQJ7C/vCM94/7V8pMfr70gdBdbsHSEAjUZX9ZxiB04ICAiWV5rX18nCgAn
         NOH4xDTUWUNUKpGWnl8BMO0MoEvFZTY66u3s5Im2YdDnVRbhdYOffeJtdWLCN+EG63Nr
         nWxTRcin1vT4P1eiBH5gwndbvoFt2p9FuI2QQePyItV+u0Y0MmwT/pyLLR8b6zkKKmfN
         5tF9PpZVPfglKRWpVhlhhfDIiLsF6H0XyUPRN16cXEsPjBHm1v1NAS42lZ45EVND7+XK
         eMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398655; x=1795003455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
        b=GwLw7TTpbyurRkervToP9Yg4FjF8Y/jNqKQv/XWpbdH534KvEbbhizxBINzpHNhnoi
         RVENQTuYdl520MsyFyxpDIoMwVBDREbALQ4deZqvdSGRfuHlqu5tJb+6rhqpw1BCfcLS
         z6ulbOgSMItB2CfYTFEwTxnc+WB3zgkWfFllpx20tsMFZsv7V6tVATwFg9PGYQ/2cjbC
         oRX1JfYYz9FN0vezfdYM8DOR+rQkoegn+mQwpTmOqMe9VKZKqsdxPj8eKfsAyler/tFl
         p9ETX+UH1q4oTWYwDkrraZUtF9KRyTySnF+LmeIHtQkgzx+Y0h5S7DszhFqgwPo+62ne
         gOlA==
X-Forwarded-Encrypted: i=1; AL+hErEg13oT2wZOgkRSpVY75xuk2n3IOl5mnmCiSamzFIT0kwXzqJupskXv04c5LbOmL22Gu+hXtugrEegu@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yh16g8OEf5H+StMxtZ5FaxEPNU8hyZTAqPs50x46Npo5QyZxV
	XUq+9hsqsWtCcE7F24iFkSKOsKs6P0CZ+ypgL1ibcoust6sPTS2HJGDJdlCZ622b1N+mQgJ/tmr
	PsfFeyzBpIcERmiI4BGJYlHpOtk/vL94VWS47rAV3WVN7WegAXiLRztKCYhJllE40uqN3Oq6jNp
	rHJQsyv9RpkgspXs8qcuQGOfJ7TVri6z/pPI0J9aU=
X-Gm-Gg: AYBFou0a8obhj5QuxlKvw1L4Az4K6JLp5rhaNRuHukjGK8V+Ttfx6VsXM283lOWOt0+
	YI1u7w6zSmYcLYzySeeLOHWXP2BPYuZcr4sbbe4iTQxJEh+fAdJZlSwlQNHQDAde+gxFNcx9BnC
	C4JqPHmbZCItwsOsEaW/1KDafFgPjUw62/cxD07gcIgizXliFa76thvcbNJA==
X-Received: by 2002:a17:90b:1b01:b0:3b0:92b2:2e73 with SMTP id 98e67ed59e1d1-3b167b067a7mr4571670a91.28.1794398655144;
        Wed, 11 Nov 2026 04:04:15 -0800 (PST)
X-Received: by 2002:a17:90b:1b01:b0:3b0:92b2:2e73 with SMTP id
 98e67ed59e1d1-3b167b067a7mr4571647a91.28.1794398654542; Wed, 11 Nov 2026
 04:04:14 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avNHazNbGtMQJ5pV@sirena.org.uk> <60f76f85-8a5f-4b3e-afec-ab4e69315ff5@sirena.org.uk>
In-Reply-To: <60f76f85-8a5f-4b3e-afec-ab4e69315ff5@sirena.org.uk>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:04:02 +0100
X-Gm-Features: AclHuK92GSy_gMaTKyxzETTYIzUWMCxU52fK90bi8tHK7knblyXvPBzpxSsGGMY
Message-ID: <CAPx+jO8CsTTXY3G_EKgrHR4N0td7QUinM4gA8=_odckjb0p4WQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af459bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=ToB9MXPV58jh7MJZ1wAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 3Hd-RUjtMgVDmDdzDSN5gkE9YkkqYgG1
X-Proofpoint-GUID: 3Hd-RUjtMgVDmDdzDSN5gkE9YkkqYgG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfXzLI75vxMd7tl
 EvTBMaUzj0Gr/kyVBGnh/+g+qliwnQsjlidBuABx1ZzX+XpeJBvwWFbQ0Ae20Bi2ef1mgXLksXB
 +gqgfC1upGU+LKdVOu5M9JMwje/t22yqFUfqgGWQC2CZWzxJTwLI92hvUMjDZ9qHYNFh7vd3EfN
 rGcVuo5R5n28IJMID7ydDKB1rNG78ML1859/Z4Kv0ThbliKViOk9twbTArbZ/TL+WsRVQ8kg0BR
 YKckUOVcwPBV3SmiijE57vuDXyzBvljJe3i7kDcMA58q4q2NmSQvEmRHfGWqIiYpFXYaQfgtJNr
 6tiItGdX97m02/2nphgAuR5k5PHpA1ICa77msPCs/SbHRH5F/OcgfEGs01ymFapzk4YfXcjE8GK
 M4MrdDknMX7OOcLgDacWQp+qDA9tyCjPHGqTwpBEaxMEiZ+Ys3K3iGoQXmaxLGVqMfhspOv0CGD
 szNwtLa4gVwNFOB/6IQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfX/vozVd2gM1E+
 jvR1kQ+oETAKTpIFBHaNwRF1kSQVfV7NanL/JqM1rIWl8GmkHmYgC9SqfVcizxaBZ83nuWziUr+
 1Dj7fenkY7v1lA+qt1HF4AL6DJgRhyI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110047

On Tue, Nov 10, 2026 at 7:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 04:33:51PM +0000, Mark Brown wrote:
> > Hi all,
> >
> > After merging the pmdomain-fixes tree, today's linux-next build
> > (arm multi_v7_defconfig) failed like this:
>
> This also affects the pmdomain tree.  Also, I still had your Linaro
> address as a contact for all your trees - I've updated this to your
> kernel.org one since the Linaro one started bouncing.

Thanks!

The next and fixes branch should be updated now.

Kind regards
Uffe


>
> > In file included from /tmp/next/build/include/linux/device.h:32,
> >                  from /tmp/next/build/include/linux/platform_device.h:1=
3,
> >                  from /tmp/next/build/drivers/pmdomain/imx/gpc.c:11:
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove=
':
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: invalid stora=
ge class for function 'imx_gpc_driver_init'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       |                         ^~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/device/driver.h:294:19: note: in definiti=
on of macro 'builtin_driver'
> >   294 | static int __init __driver##_init(void) \
> >       |                   ^~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of=
 macro 'builtin_platform_driver'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> > In file included from /tmp/next/build/include/linux/printk.h:6,
> >                  from /tmp/next/build/include/asm-generic/bug.h:31,
> >                  from /tmp/next/build/arch/arm/include/asm/bug.h:60,
> >                  from /tmp/next/build/include/linux/bug.h:5,
> >                  from /tmp/next/build/include/linux/instrumented.h:10,
> >                  from /tmp/next/build/include/linux/atomic/atomic-instr=
umented.h:17,
> >                  from /tmp/next/build/include/linux/atomic.h:82,
> >                  from /tmp/next/build/include/asm-generic/bitops/lock.h=
:5,
> >                  from /tmp/next/build/arch/arm/include/asm/bitops.h:245=
,
> >                  from /tmp/next/build/include/linux/bitops.h:67,
> >                  from /tmp/next/build/include/linux/kernel.h:23,
> >                  from /tmp/next/build/include/linux/clk.h:13,
> >                  from /tmp/next/build/drivers/pmdomain/imx/gpc.c:7:
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: initializer e=
lement is not constant
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       |                         ^~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:265:55: note: in definition of mac=
ro '____define_initcall'
> >   265 |                 __attribute__((__section__(__sec))) =3D fn;
> >       |                                                       ^~
> > /tmp/next/build/include/linux/init.h:275:9: note: in expansion of macro=
 '__unique_initcall'
> >   275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
> >       |         ^~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:277:35: note: in expansion of macr=
o '___define_initcall'
> >   277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .i=
nitcall##id)
> >       |                                   ^~~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:306:41: note: in expansion of macr=
o '__define_initcall'
> >   306 | #define device_initcall(fn)             __define_initcall(fn, 6=
)
> >       |                                         ^~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/device/driver.h:298:1: note: in expansion=
 of macro 'device_initcall'
> >   298 | device_initcall(__driver##_init);
> >       | ^~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/platform_device.h:345:9: note: in expansi=
on of macro 'builtin_driver'
> >   345 |         builtin_driver(__platform_driver, platform_driver_regis=
ter)
> >       |         ^~~~~~~~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of=
 macro 'builtin_platform_driver'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:176:30: error: expected declaratio=
n or statement at end of input
> >   176 | #define THIS_MODULE ((struct module *)0)
> >       |                              ^~~~~~
> > /tmp/next/build/include/linux/platform_device.h:304:41: note: in expans=
ion of macro 'THIS_MODULE'
> >   304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MOD=
NAME)
> >       |                                         ^~~~~~~~~~~
> > /tmp/next/build/include/linux/device/driver.h:296:16: note: in expansio=
n of macro 'platform_driver_register'
> >   296 |         return __register(&(__driver) , ##__VA_ARGS__); \
> >       |                ^~~~~~~~~~
> > /tmp/next/build/include/linux/platform_device.h:345:9: note: in expansi=
on of macro 'builtin_driver'
> >   345 |         builtin_driver(__platform_driver, platform_driver_regis=
ter)
> >       |         ^~~~~~~~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of=
 macro 'builtin_platform_driver'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c: At top level:
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_re=
move' defined but not used [-Wunused-function]
> >   503 | static void imx_gpc_remove(struct platform_device *pdev)
> >       |             ^~~~~~~~~~~~~~
> >
> > AFAICT this is caused by commit
> >
> >    d7262971a2acc (pmdomain: imx: gpc: remove all initialized power doma=
ins)
> >
> > though I don't really see how.  I have used the tree from next-20261109
> > instead.
>
>
