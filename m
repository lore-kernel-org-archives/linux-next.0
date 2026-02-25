Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B82E3397
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043096; cv=pass; b=V8Ukl5tGPWvcBVhtvpiuf8FsQ0gle4bmNcRXdSwfvL/F441WrcaiyOaVNseYGIqLYfu3znHpmCg1yAFzEjTMhfahcBvULrcB4hUIuymrOXy6nB+WNDU2MxxOdkuCGZPNQT7VsebVgv4yQ1KY1iAommuLdmiyZGRN+rc+uHv0fIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043096; c=relaxed/simple;
	bh=VODeCAA7L4/+rm2yvNrOsORXUXuiprP+Neece5B4Jug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m311qMrC+7bBYwT6V0DetGCgHG3eTUTnkx4zqzYnqH++k5eZFOlR5lol9uKJAZRblCFX60OxQ0eniHXERZQFQ0lnakp0rsimhn8wxnNAQrDud26XP/XkCiirpC2hMIgnyzm0OK68n9mOLGPn+jYaRSsZAO/k75JYXiGefFAGyjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9W9XUPu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLuw/1Zv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9W9XUPu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLuw/1Zv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PEkag33041205
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 18:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d5YtWiW9WK0Lp3iYryop2+6F
	n9ZmnB7RP+OEKPL69YE=; b=Q9W9XUPuKWRhy/NyW7K5V8ypBO8VToP1KjaKUrTf
	Vhh3/g9e/SQlSWyIR6QLevIWTT2vgUJ9mtIET1HnuOW9uO8TM/KjtoBXRrCRjBlr
	dSbDPRB7+5FB7I8nV+AQgUDbzM094zOjKFnvn792dtIUN2Q5MlBNPIwMXJG3VzGH
	KZKaI2pB+oiiDTcBn9izcV9l2PVZzQaLaFieX7EyOkl00H6UkBh7myRNX/d2pypt
	e+6HQ7bYzHjdwFVDoSroaax7zG7miBLWdxzc3oKJ6yy0eKi4susq7QCUVvTSv1AE
	7viXB9KV4VvUsFeRICvv/MT3QZGdnZEa0OJeZvj6M0G+Rg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350grsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 18:11:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c72d23dfso40941847a91.2
        for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 10:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772043093; cv=none;
        d=google.com; s=arc-20240605;
        b=efyU9TcPnvTWTC+h6g1cUw0bMV+IY1OcLvZ5FT4Sq537KlJJfvxNFejwFKUXTn7rW3
         5ZtcuLViwITQglGzX/FxFY+5exXesp4XhTu8wtzE5GRe8zwyLJjUn4Y8wVUeIeTJFsTK
         K6O+TLVuavGPKuWsOefuhWNhsY1abv041/MxDWT86kHQpKeWnSZXWT1Zmc4SY66j37Ef
         IU4BdBvdo6xVBDUfP9Ev5S3QPmlIKb30yzCAoISBvZc7L9dxspURlnX0ZHqsVBU7uhcA
         oMSDIv6Pv/wydgchBDaEJTnnDb6VlJS5hAyE+MsaexwoeQ5azknrzHephMYBn0Qmn5mF
         JrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d5YtWiW9WK0Lp3iYryop2+6Fn9ZmnB7RP+OEKPL69YE=;
        fh=2rHUEErkK9GweIUOQxYTzIg3oLqo6F3NMeXReDHP7Vs=;
        b=KsHGKGhmmyA2lFXwWYiIWsaUan9t/rv1PQLq37AHiBrIYXLxrcgSHKG4MKxzucqtVx
         O4U7+F5lvge9dSS+qzhn9nbQ/mTn0YZzlCwhYl29in/fLgQU3wsJ1AHgeDmD34jJy+1G
         4wuMNoqvVH/kV8A6i9LAtBUdtDBsI8XFBldnDfwZWH2XKaMaYt8RnMG2w155oiI3DhqJ
         HBKn7VIl5OigxjBA0ADhPqJnNfhHtrKxo2dL2SWiZEva9tK5E+hsOUszLPDlkSxOApBa
         1ou4OiDAKw0iTHf+LPodtDp3BsNmTcihMfGoRHPIrQau+z6aAYkDSZRoAqVVNsY8aW1u
         LEyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772043093; x=1772647893; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5YtWiW9WK0Lp3iYryop2+6Fn9ZmnB7RP+OEKPL69YE=;
        b=JLuw/1ZvLWaybSDBQY0pa5BhQ2CxURNGkEYwCSfBCcJ3FEGmv04mRQrWnQjstX5qvt
         UqeIbX+YLtch7hOovzAOPGLRXwOG/FIXLyFkQK6Sa+jKvTsTUQw6EcrWxPjhhYNx4kl2
         OlADQwBPAYfg5snwlOtzxODNkmfxg/v2/OcJTSfRfyFqmVyD1D5P75j44wMAzsWbcaTL
         L+xnSxd7ua4IxIbOcT77zFWP8enSsiqrxiE06+wsncAp3f/2+mkhcSYVZL5RH7mHk9qk
         r1Z1phhiTWCvPt500lhB1O3sTbtBub6KRNUOlxXYMT47M6DsRT1bkHTBLxy1YgzF9t/6
         egLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043093; x=1772647893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5YtWiW9WK0Lp3iYryop2+6Fn9ZmnB7RP+OEKPL69YE=;
        b=c8pkltycNC0R8eemNTzuC/uD//nzEAFRzLptpRpxtEmbD3JW5Asi/qfY6x11lvKFaq
         gJhR53DqMhABAbho/iup+DHGqV0uSoH+b6HRcVIx2WWvQFDg7EGvZ202RFNL6kyC+asE
         rZ32UcTWUB+InT03eRyZx37SwUpkziHowVDgJ3c+5u6fiVle2eneIhxXoXJ2sMRQGfuC
         TNhXRnT9ox88YvVdFNRK7ql5EX35kmuOQR2tU45c6X8F5odaQ54jHCprxaSgXb8ImJ93
         xkIUwkOKbRDIO9prrVaFBtFX+cejGpMXk43nLkzmwsCp5RTLpPOGTZGM2v2adMbZL/uW
         T7BA==
X-Forwarded-Encrypted: i=1; AJvYcCXpVeGZCbGjXrivGf6PyqvY5LtA97KyOwQZguUxmzb/wbPJF+d+6NYtFFJBAgMK6PBwKcNvQ9KrUIXp@vger.kernel.org
X-Gm-Message-State: AOJu0YxMpO0M42lj+EB+avEap3z/3FDrC4nPpXoB2mqYMJc6fAWT1/em
	jiaNOTFhbQvXuWI/5qzMmruIQTQE1KW//xn4o3Vmv29iAC1A1MaDLqBaz8FwqmUxV0+L3TubOkr
	RhnouFfgG6Rq4DNXQSR7m0RyP7bzaRTIkxsosy8hM1fSDQGnBrik4q1GMYhuHSHm9lYc409QDf8
	mlCyA8U5kCczaYdHm4OL11CfMSAeqicdtcr4AedUo=
X-Gm-Gg: ATEYQzw53KP63LujS5Yzt2MIxbYpYZ4XMoOjimu/yMWxyXRMqnNQClaZB6qHbyitIws
	CRV6WXTwa5kOlbMWwtVXOZ2hioCtz9E9YEfrOOtWP2wLXkevlxtrd7IkLmRanDSEDSoCeQXVgHS
	Uvncc4R0m5Ok+VglUdKz59gAXnvpYX0Vt9Ckboqvcg+Nloa6m4FipgSg/KCn5SBwjoNsYMf+GZs
	MZewTb8apJLcc45hbxRGk7gCuvpalWN0+j8/A==
X-Received: by 2002:a17:90b:2d43:b0:354:a780:6667 with SMTP id 98e67ed59e1d1-358ae7e9168mr14547651a91.3.1772043093461;
        Wed, 25 Feb 2026 10:11:33 -0800 (PST)
X-Received: by 2002:a17:90b:2d43:b0:354:a780:6667 with SMTP id
 98e67ed59e1d1-358ae7e9168mr14547621a91.3.1772043092946; Wed, 25 Feb 2026
 10:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZ73gWMLc_kMCIrA@sirena.org.uk> <CAO9ioeUM6ypgSLfZYj41LcjjENVpCuJ6ffk7f5yybdmd8UGJ3Q@mail.gmail.com>
 <202602250951.FBB79714E@keescook>
In-Reply-To: <202602250951.FBB79714E@keescook>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 20:11:21 +0200
X-Gm-Features: AaiRm51lU25nZYK1T0G8SYhARffFptNOzcbTVzr9GBQuREAVb3ZDix2hF3fBLdI
Message-ID: <CAO9ioeW__4fBAFM=dLKkKiyGNXJsZUNKbTSzywHhK=oNtKQk+g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-msm-fixes tree with the
 origin tree
To: Kees Cook <kees@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: sM9nvrZ3EPJbCoYMG_4a7mAbfDzSJVUf
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699f3b56 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kz4-KFSQ7HH0njDw:21 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=vRy3hu1YK7KIElNXC2MA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE3NCBTYWx0ZWRfXwU6atjSONuoR
 /3HqU03BR9KocagJBeFVWIrpVRtxRC/iScNHLJbV7Onw6d6CAXDhu4XcorgCr1T821BfHIh6NJw
 +jdfWrvc2xRtgjreq4Pw4jbg6Gaq4GIpRyJgT8ScfgngJxAkXt4zkgJGc8whXCVNNCKTsEtlusO
 lFu9RLKw8FAnhK9+bTIvtptkQSwyuWlNnzkd9vSOn9hM9JUOhHCch6sqQP/V2RyOB/iUmyIUfgx
 xmFgyP0HOvZF0eARFbRgCz741BcH9+M6RwSs7Gj9d6B7JvpiPB23w9rv1OSe2aJZs1qd55rAD9S
 jawG2Cx8o/kgEWOVq+PdVrOhOzQJ7NnUkHEQ1Je+xvI6WC2o4tiSJ03bo3komHiQTD8UsODTliB
 rn7+0o1PdwHbzkHZUxsSPUlE54m7a1gBbCTcEgTFeMtedX/eD5uze2DluZYYPpXpV88KE3xUylR
 wWkCAnvdrJ69nZBI+sQ==
X-Proofpoint-ORIG-GUID: sM9nvrZ3EPJbCoYMG_4a7mAbfDzSJVUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250174

On Wed, 25 Feb 2026 at 19:56, Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Feb 25, 2026 at 07:42:12PM +0200, Dmitry Baryshkov wrote:
> > On Wed, 25 Feb 2026 at 15:22, Mark Brown <broonie@kernel.org> wrote:
> > >
> > > Hi all,
> > >
> > > Today's linux-next merge of the drm-msm-fixes tree got a conflict in:
> > >
> > >   drivers/gpu/drm/msm/msm_iommu.c
> > >
> > > between commits:
> > >
> > >   48634a9ea06a4 ("drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type")
> >
> > Kees, why was it landed? And how? It was not Ack'ed (nor was it
> > requested) to go through the non-drm-msm tree. There was no note that
> > it got applied. What is going on?
>
> It was a prerequisite for the tree-wide changes, so I had to send it to
> Linus ahead of the -rc1 release. Sorry for the collision there! I waited
> as long as I could, but the msm-fixes tree wasn't sent for -rc1, so I
> had to include the patch in the prep patches:
> https://lore.kernel.org/lkml/202602191029.2F0E7F01@keescook/

Was it coordinated with drm/msm maintainers? Not with me at least. Did
we hear anything from you, like `Would you ack merging it through the
XYZ tree`? Did we at least get the `b4 ty` or `picked up, sorry, I was
in a rush to merge my changes which were tested in linux-next`? Nope.
Is it how the community is expected to work? Not really.

-- 
With best wishes
Dmitry
