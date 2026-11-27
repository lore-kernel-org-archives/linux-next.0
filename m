Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769323;
	b=1/G6mr3TRkMPXBWEk8HDhQXJFcSFf948ekOtVHQgjCF8snLvrF/w/O951wYmyCaA+5Ak
	 RVO85Iz9KXJnQP4iYta1goncz3ACvP1Tgjng3o6E/6+F1qLJ/UyOpycboMcNgYN7dHb2C
	 n9xs47Oi9QjWDA9v4gp6+3s830IzNO/uOoqLNOBDJVU9re6kGzdLehnJ+70rs5V/QAXXv
	 bp86xb5Tsb8vFYOAhoTC4iK9KtHVhuPy6zh3T+LN/SbUv1oGLwo/WoSXcaJMw8Mbybwbm
	 7Eb8KQ0vCMVgso9TH09jdSGmlxY9gqQbdonYhYSp6Fsmudp9JGe7H6za6vUv1pcn0RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
	b=Pv5XbuqWPV+z4qKDer+WyJ55hn2w1Pb54F+OLDkQv/FK+K9su3G8GAPMes5nqfNfobQ6
	 ccu61bcbUEjyLac6WXD4HAeUkJRPFCwyClrkUrs/I8bJKtS+MW2XFO7pe3bBzDMAIXTR3
	 AzePz6BlXSBPwMbqZLDfY6uppo8mYAeQvHmCN1lriCS88bMeplLwyUSXSQlPKjDGhu/UU
	 JyHe4QwZ44NJAbU9hTsROraBaOhcKaL2nuouGTFTRZGiyuDhbcp/dOiXOU2nM+JlLl3Qo
	 a+yw0hTeIX/VZtrjJXhW6JLiNIaQ1QODfGLrz6kcR7fKBaDYMAXIuhQ8LY9wKbue4TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDWie45z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpn51e5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DCA606A32A
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 08:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DCA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDWie45z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpn51e5y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GeDe905194
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 08:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=; b=nDWie45z+VgVQqd4
	nUeWEVlwdo5nsqhqz95Gtsyi2rMbw6vXTbP6nIxtj5TV+6e9YZLtZY9gHyPoHPEO
	KbfEvWjQlpueeOtFTNH2alYytLersTNi1+DoEYtFbZtbXCT0fkB88sFna4env2DI
	SMsFfWlwxR2F4IX/AK9zyntjqCHZelREmztQq/QxN7nz6kFC6gykEM8CG4jeXd2M
	JrENzts8iiLBXQQ0NYURdNB6SAYzr3Zbe2e6xmPXKY91PrL+wHQzPQjwDFq5LZIv
	GRnGv3hOX1UUbKVhWL1J6ODzya33rqbL4dWJCTBvCrlnNmWF8EBDkkxeRCJ7WRRC
	uv09Mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39quh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 08:48:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so1103826285a.2
        for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769318; x=1796374118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
        b=dpn51e5yozIWHhXw8iVTYLW9vYNyw7pFOkPMEqcsXupjYBZ//1Tc0z65XzatxTjRsX
         phgJuyZ0Lzfb3/W/ZY+tt/6cQ4cFpHaypeIUQ0F8ekIt1uQ33we+CoK9SGLFNGD5aIrY
         VxK3sooS9uUFR0TSG4jrkZPn/Gao+clfCy0c3FmkvSgdX3Cgi1Hy3gjYnvjRr3Dr/A5c
         DuAOCVh8RAn82ZYUpfla4wszLBFv63ZCFBJiQdDurtMYoJkcL8J2tqemRxE3ZWubQxpw
         chJy2s0KjqW/V3OVtHj7lSoErGjp1HeAiZl5wRscLx/iNJt0gEcyvgOwlMO00roWRdAN
         giHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769318; x=1796374118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
        b=uhJlRHq4UYQkaYBlqmxnK4Yz9yR6Nmn1bg/pEKHm1k96fUisOKG6pfTkqQnUrgpZaI
         bRNCqu0eiwm1INWLu/q/zFgXpyel29jq+BeSSqEUsL49ntWnvwcuZixl7oFKYA9WxWTC
         bjWJYKkBqRCTgTcF2ldCvQ0UraA4yLrwF+A0WGaY3tYhd3IkWf/KsppSQKyIn9WftefB
         W/GV0/3R4efLMzHk2b+tI583qqZ0c9APVGqCspjr86zrxI7FMWb49b8mA25vOxgYzUVI
         RZWS2Ac40ZGEDaBbnBvzGQ4Usyf7otLaGtyN66lzYmKxyUzit5dGCxwqjCaznWwLL872
         kfng==
X-Forwarded-Encrypted: i=1; AL+hErHOf+eYbXrP3TFqSbkuOQiKuLdBmTnSpg8nH5x3qQS0d6feB2w3LV5mbWassf0O33GG35NAANBSs2i8@vger.kernel.org
X-Gm-Message-State: APuU4Z8xerrt7bj3z9A4DWNSGAVMoRonxtELdJ5E5NJ+nZVPJteJBd/4
	btHAZrRvUuci3xmDbeZdrGYctuB+4QhSp4Zcu3Lh4CFwtbnp9jo0EkQ6Nn9Iwtc5iF+FZce40F3
	/uzB3sI9hcvB01hVMgpY/HTpCWcQ9Nqk5rIAMBXqYgjffUrsxVRjOdoZl76EoYhqT
X-Gm-Gg: AZFdTZeXIDDept5cTptLe2z9iDikSmNvTXMBz57K4p34EKS2iFkemrQdiI1l/ZpzOam
	58Pvoer3Zv0YnaCBHRYJEzaBs0MvrvaSk+Yr0JMbH/tjAISlVN8MO5t3Y4uz0m17ZATi+5OE4ia
	8nTuxv8oXFhDoGJ0JPEBSZ6A41zRSY2LcgOtlka36kZZ5KQhWTxBcV9hdw1nHtkW+AAOwbyVTVJ
	myzYu++sAJKJ9D6ur32NJRCmwFz8D7EW5dTBS8hIaW+kJFi6mv/SlKwGJMiWiSBGjfZRSU1ATSH
	zr0mKQyeEaT5XEGxk4oy4mxPMrbJ9Y94J93MOqJvklWxhUbgNZn2BsHR3UvHkXVgguPeOOsFkGu
	BizEpnfjmRLX06ensM2u/dPhbwbsAHY91PbrHb6P/rroeeo6BUSFAxRtJqNz4V8NnDmsPOv5yLI
	WRa1nWanezvflUGC6/j0rYTOPtSAjvdRqw7k8Ch0Ru0gIHB0n2tkCtaZa17AFntw==
X-Received: by 2002:a05:620a:1329:b0:949:8119:6702 with SMTP id af79cd13be357-949ba8236e3mr3942710485a.10.1795769318331;
        Fri, 27 Nov 2026 00:48:38 -0800 (PST)
X-Received: by 2002:a05:620a:1329:b0:949:8119:6702 with SMTP id af79cd13be357-949ba8236e3mr3942708185a.10.1795769317869;
        Fri, 27 Nov 2026 00:48:37 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm698492095e9.3.2026.11.27.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:48:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: restore the atomic set_bit() lost in a merge
Date: Fri, 27 Nov 2026 09:48:34 +0100
Message-ID: <179576929354.17776.11182158061067630768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126231704.1303448-1-sashal@kernel.org>
References: <20261126231704.1303448-1-sashal@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b0943e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dHVLDEzWKCGuJUyMAcoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kGVSPF809CI4L8JWoPz0ktGpa2O4S3Ec
X-Proofpoint-ORIG-GUID: kGVSPF809CI4L8JWoPz0ktGpa2O4S3Ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0NYdKVnmlObr
 zWq2O+NcQ+/4PPZyUghjqN/48FzSb3tmTk7iMyUShV/AUvoa85qOfMeK8me1W3a+5aZg83klQ2Q
 tzHce/OAdcX34RkKtKbVAv8o2QlIGNNhkKmWk/uvBMHi6qnZEc6cLSy8fBDB1fkb3lXSNa7/8On
 76AWP2vv9bZsyKl7rYNs8W1KxZ+y1q3lHs0zH2y27T5a3jcyhBfJZr2YMqop3DQcYfERT+eA4HT
 a3giRVhuyUnixKOTMA/Jvr7NAsaW8uuG4q5f+ZJ+ZskwSQaJL0DOq/0YswB6Y9+n44pEzt6UYU8
 MiqAz0AAzg8pyBrkoiXh6SsSLKxyjoItiDT2Oap4Ku9lxBr5ZneB7nlkkNhBIEIoE+izy5YRIZ+
 hC0zwW8sjrz1rgXiSuVDl25z55PdjvNOMxPCwCVoa/ANUDdh4cSsLg1ElfH7/ikD3fUxKd+yoJm
 KlRYEAUtBC1KkKIu1Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX2ICF/+7sbRv2
 TytQQ+05vztlkntFyauLRqvsJtLsaOiVWuARzEFEHme19bRYmGdC09OHtlH6XWi1xb5mbkhwK0v
 uWYMN2gKLXoNW0BjEfs794YjQNLOgwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034


On Thu, 26 Nov 2026 18:17:04 -0500, Sasha Levin wrote:
> The v7.4-rc4 merge into gpio/for-next took the for-next version of
> gpio_shared_setup_entry(), which commit cda42ff53c4b ("gpio: shared:
> factor out per-entry setup helper") had moved out of
> gpiochip_setup_shared(). That dropped the change from
> commit 7d1d799d6251 ("gpio: shared: use atomic set_bit() for descriptor
> flags"), so GPIOD_FLAG_SHARED is set with __set_bit() again, and merging
> gpio/for-next into mainline would undo it.
> 
> [...]

My bad, thanks for spotting it!

Applied, thanks!

[1/1] gpio: shared: restore the atomic set_bit() lost in a merge
      https://git.kernel.org/brgl/c/838e2af4fde3f180abdd0e4755be078be7e132a1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
