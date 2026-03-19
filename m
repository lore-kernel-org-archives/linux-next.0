Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D0372692
	for <linux-next@vger.kernel.org>; Thu, 19 Mar 2026 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930284; cv=none; b=seQGyWxoIdOxYGfzXDvu0aOJCFqsIPRzusY/qop5Kc1SWDKJkZNNdVSuwoWiFp1MnyrkH6yYjeCs8h9eOgYZeoXdd5X7xINm3ZggvntBP+m/qKdG6WTsQvv/LPoKVRZKFET8C/T6TCytpB9Ex4XsXjHiXJM+pE/lc9tiTtKPB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930284; c=relaxed/simple;
	bh=EBDnfXo3mcxO0cTkgFLb/cSZiJCVroQxIaasDMmAhHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFU8Ku5M3e+1weEdJVNewAeW6dyOAcAxTmmojEScBqTA89J92saRa+KS4HIzK2COPTF8WFCYRer5js/M4sI8fdn7kBXgbOqvvseSumUSXQ14+elxbmdAoLpfl5YY7gecPWGO6w88bmUPW44pHpsF6eAmqb1LsN8Ck2gEhLrao7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEyv2PBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWxho0kH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEyv2PBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWxho0kH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73s3r1567058
	for <linux-next@vger.kernel.org>; Thu, 19 Mar 2026 14:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sA+146zFbw9F4w0Za+p26oOY
	VRn7u4SEFt5aaUsyZkU=; b=dEyv2PBBFmsktpCj+evMzmn7QENq8eTiSyg8c4Bu
	lkr686ycBurQ6rkcpYOt9+oYRZA9TP0kfaRVuRWOXnpVKna8mEKQbIqZ2JSja3RY
	we4RzvhMvVBYqOZ2+6DKPOoyG8yHRY0v3M2FdeBGkxJQcC7Xa25Lp1/lZm4It2EH
	15TpJEDHio9YKfT5rW/ZYZKeF4EYgkchnleIZILhi6Tr/Xtp26GdNq39juqMiomc
	rZb8Xh/DeMdUAARqhZKws83tH1BGN6Tk0bMY50zkBafjcc0XFuTsJ1+Ps+lkrt6h
	YvYnoOrI/3HyqFqOfr6R45xQ16DSAHVdFzD5ssZVGvvf7A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxhp56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Thu, 19 Mar 2026 14:24:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-950c91e200dso8322903241.2
        for <linux-next@vger.kernel.org>; Thu, 19 Mar 2026 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773930281; x=1774535081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sA+146zFbw9F4w0Za+p26oOYVRn7u4SEFt5aaUsyZkU=;
        b=RWxho0kHKKmA2AdRqNPda0DrKVUFHppoRFw83cA4b48rDylBhhyWeyQFQlcovZ/46Y
         QwJK+dGOC5uCNTHE0JdmPmaJKYS26iEI+8aIGp6HCHPFBANgup2Sld2KfOM0ccjS/u7c
         f1GTf2fuFbzoyKg2iHHj1lki2gehntwhEFHrpsb68AU9Sa5V9KgIyrgMjRGdWCXjNmeX
         OE7FRmnsVQyw/Ol56R7jksxABWJK28aO7V9oyseVwGW1XjPBg7c2MaZX6d/8Ovv5V4Ez
         P4L+4j2e7cdp3Z6XFJwixZO7ZGmvK+7Sq0qQBd7OyIE/aYcMn4V4C76O7tej+kudcWRT
         HcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930281; x=1774535081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sA+146zFbw9F4w0Za+p26oOYVRn7u4SEFt5aaUsyZkU=;
        b=htgqqiR2Gcjba9aIronwu+T6tUFplt+m2JawXHqACD4ZUztK172GcXaKrcHc39V8F9
         +e4fWOl0L1hMXQew15BdFk76ATzbGJjyh6krlE0CfV4xb5IIqJJkCWBeZ0nz/L7WW4FC
         RASQHvX180Ib8PGoRrWdrEQBK6pTHCQk+QKrIl3AwxGl8g3ovxyUcJA5lXsYDgoh78Vt
         951+FzOYbClPNY59PzafrgBHKUPoT9J1R70SxD278ITg760DIcJ9mabrGtnsWr6QaBAH
         xjtpuaTIOo7roJPHmYoX/VDWYsiW2bojx+rd25SXj1waMwbwBY786UG8ewjLkKT2T3Ie
         oDdA==
X-Forwarded-Encrypted: i=1; AJvYcCX3jNmI5yUlQxfxC1IUxlwYra/Q/t4ORr4ph0WN2yOSc40xPjf+tUI7rVvKyK1JsNqEHIEKhXcFxTa7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8CBjIy3sRDUVn8rrispzS32OhAYymJnS14ffHYDyWoQfQ6FS
	Wt31Ft4C1Nzo2wa3FKko2Ns9vKKnIMNjCjxVOwsZhuWWh1zxziX7Ipe6HafutcMzeA3BtR8c+AA
	4y0InWAAKqIiYCnoi1sCyedSNxsKHv3AEvUdx3O/mQjmpYrhpGlWKrZKz+OBMfhvStGziWUDd
X-Gm-Gg: ATEYQzyMIu3YOa/WwlznXc2rBGHzWBV6nfc5PyPTjhYIjlOavZLBWMBfPh9hsrBOu/M
	1jbEuhtqd0CDWD4YapR12kJ3olHSweD0hKgSD6dVQy/rSZ44hu+KWTbmPDkd+o2f1BGTalWI364
	TU24Cazch9zr9HuptwOkB9HHBk0UICkQ08Ri3egmnHhWuuR8XYygmbkJqUrKUDMOsHlNQQnXa+U
	ijl8ieXcEdQreUuXOa42ZLQHSsOgdzowClmmLByJr0L0s4MMqe/Xn/bkP36Rtl776orSOlWvqcO
	W0DplsRyFXfWkNkSGZ8I0hxcm0OmAawIpTolJLZpyg3wcMLl4yBsfYMSIAXdzerDpKTJ4Uteeq5
	qwZ4ckLhvBTrU1k+v7orMynXY7bozYUz1nw==
X-Received: by 2002:a05:6102:1611:b0:602:7627:6c4f with SMTP id ada2fe7eead31-6027d2b2f4amr3968801137.17.1773930281076;
        Thu, 19 Mar 2026 07:24:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:602:7627:6c4f with SMTP id ada2fe7eead31-6027d2b2f4amr3968783137.17.1773930280451;
        Thu, 19 Mar 2026 07:24:40 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c350aesm66713115e9.4.2026.03.19.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:24:39 -0700 (PDT)
Date: Thu, 19 Mar 2026 16:24:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: Missing signoff in the clk-imx tree
Message-ID: <tawqp2mkgpqzpyvelpzf2s6keq22hi5vjehyvnjcxacfkswwr5@kxt5wok5xpqp>
References: <abv-EiiKz0ZpmhJZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abv-EiiKz0ZpmhJZ@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExMyBTYWx0ZWRfX5LOVtaTjACh8
 Ryju5GH4ct9z1FYS44eBXSRuFmddybjokJaT+9xmfP9RV0+RsFvIIhe4yanw5AiBoc/jf+XvS+4
 y4yhyqnh/Q1yZQS0+7/BtZelHdLwhwb2HGevDFO1GwvPu5FmYQUDV2vdxMC+IvIK55kGAfIVTfQ
 w2X7VPPdSJIDCjzc5yS/mpZCF6O7ki1iwe2x6Rg0H+OjDS7j6oztkaz2w3/45/m5nhnFcbJsuZa
 etY+daOt8SbsyA38rwWQNFu34d2JpDIw0JuHq4DX6ENlzQlr9R5y5VGOwZC4T+560ySfrxMSS9H
 E4HHdqserRjoOrOblxfDviFKMCFGyqWFAfHFrkdgahaBLd1/syr1PYHoJv9LVk4DNxcPGSbf4cD
 jHmMCvX4YEdX7YxlCghc75uHWNYQQhn8eSOINw2haBB2RXMCEpPUUh7dkMBr2TMf/Gn//WLNGfV
 +jXt8lOaD6jMwYMXhEQ==
X-Proofpoint-GUID: GeysnF113ISUofAL6QRBMX81K2GFIU-m
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bc0729 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=B9gMt3HSeTy7V9-alo8A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: GeysnF113ISUofAL6QRBMX81K2GFIU-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190113

On 26-03-19 13:45:54, Mark Brown wrote:
> Commits
> 
>   0463762fa001c ("clk: imx: fracn-gppll: Add 477.4MHz support")
>   3cbcf93329c0d ("clk: imx: fracn-gppll: Add 333.333333 MHz support")
> 
> are missing a Signed-off-by from their committers

Fixed.

Thanks for reporting it.
