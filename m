Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B7B3DB333
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2026 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956355; cv=none; b=WYO8WhZxx1gDLF/o/ouuuyDbqsW77ag8w3odKibigf9UX6m7HpQWOXLvm4wk5MbGJ+ezbKdHgxYv1/H4r6yD4OoVE2nQzTWbQzXhS+gHrZdnmbFYT9X7DevJNgPRYIGeNVzspPOyf8uHPXu2biuosC5uTsvKqGgOSc0BMJU79JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956355; c=relaxed/simple;
	bh=t3uAI0g66IBQZNEh9gGMneR3Kc0eAOqCo4B0f1YXMSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAsb5Mk7EzomKksgs9hG2ZkAWZMCOjNLPZmn1tjahwPGH6xivpPrxwTVJ74vwroXH5TvFreFyzHf46uyVVsLpq4H6z2rv2XxNffJSMghmWHsWDjdAKu4caRIOay/EHYEdi2qPj0ZEtpZu3sKukc3tTHfkQVxv8ssrIuaJv0aByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmi9blcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUCMegNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmi9blcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUCMegNl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSKCZ3561178
	for <linux-next@vger.kernel.org>; Wed, 5 Aug 2026 18:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWlbg+M3XnhuwAxV/EwrS/qi9DccecvZqg+/FoKZWU8=; b=kmi9blcYllImGWuB
	SoNq9QDK0oWiUj1jIgqV/w2pAc1slIgMJy+f3CTQGMYYbLGXhZ95OIoGDTk5S75j
	73UpnEkQKmeS6uZXxUMig2ohn/0x3QnuDVwL4MaoFnYA7JVc/1q5Rb6ZBiCw8nTT
	879rgwRLyncsEUKF7q5b5WJWr7R3Ph1d4lsER+LSs3B6qtig6XtzwpVwc2dLbjUv
	JarVlfVfQAdcJYlJ7gP7VjCmjkog7sYW8wYZtsE5Z+V8kbkMcF9u4RAOh42Lh2jI
	tXbYxM4R3sd7HQ/BfbTgJjt2MbL2BbES3O8G6+7aaK/ZIGDfpHTl8zpopwFr98vs
	gnR6eQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5sncv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 05 Aug 2026 18:59:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so12461435ad.1
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2026 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785956345; x=1786561145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWlbg+M3XnhuwAxV/EwrS/qi9DccecvZqg+/FoKZWU8=;
        b=AUCMegNlYtzz7wzGtniOmqRDr4nhBJ11jPxUZxPU7vKNXvOOBtO5/JZOrukPyzZIZW
         Ix8P4APaEI3tmn4qUBzS3DdYSuerbx3bhkcuEH8VuhIRRcwKLz701ODGr2ZmR3jBLEda
         +mKbXtD4YlAdFeWC/2gX2fbkjozR+BBy6XfVBsOxrswgH6xJc3FWdvzFxAO/0zBRO2+9
         hs3iF1PtpdYkEUx7mvvHXkp/Xx4vwxofuLf4TWGGYQcVckkQ5HRUIdjHAbHkHOd5+b8G
         /7YSNaVhHjT66z1i9OjlydNg6YZrVEmYn7tkiRUj59h64hVPdGZd6+ILC5UvpjURwi15
         O6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956345; x=1786561145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWlbg+M3XnhuwAxV/EwrS/qi9DccecvZqg+/FoKZWU8=;
        b=Sm8hdfi908s5oSr/w8J++aSiZN4jN2CiJxE/pECSxmxjDm0BhWvqb1h5bPlIWd5q65
         4yKKUXcYm0Vf7wdSPH00PphBXl2yxmx21ses7NLP9L4f0YUjuSaZvg+GXn2mEvEilBnO
         ygsY0jD5Mwt1YCNBbLS7kenuyZto6cQ5I8OEfm0YkR8UXaOeistxWsvWSY1fa3o90E7L
         s/WBmokuBmV5u+H9ByTYdQaa90NBpx+fzz6Op9tdpIEXAa0PHjYYPsUBSqdbSI58W/Nr
         lVi7VkFwj3aXaPEfaIXeUStS/ovcQ56Ys4wuqSOpqBVX8+s4sbIgTodjI9fXQVY0ACkC
         jAlA==
X-Forwarded-Encrypted: i=1; AHgh+RqqhBPPMwAwWQ32jaoy8jVDdImMyXpjAaEHxs+ku3UdlhYGO950Tufk4rt3gv7wYDUFO1E5kmDz8jfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNdHYOUI5bZg0hEKSu0wBBVAQp++Q1FOYTllyaM6xP330DyHFd
	HMzs5Ktj7rCa0FX5NZU6QtKtsVAdBC7+I5ac65sZoHXS+ORC4rakG+prAs4Jt+K8dDvisonOVOW
	iPRRp/rgwMCUuMQsgklmKV0Psey4V+QF9JLi9/fcuRtAVl9dMWeafJofA0zMgxZ1Y
X-Gm-Gg: AR+sD13dRFokVH5E0JPEMRp3WxeaEnWjku+yOg+oEy41RILzBmrvJpa7JoyR74YGl67
	66FhP1/1ULe29zGMeG9Y3LvguWxRmg/ttyW7h3u1ZPO1VUd/FqdWjq1MqxJxblCe2WdamrNeoSW
	S1sV6ehO0wm48s/hn4qPXgCvk5QADOMmR0we7VcWjXIs/ElopDRUVuSZ8PovO6vl9S92To+0xWW
	o/kcETjaPN70b9L0y5LAXovM+NbGxxhcNyRm8+Q8d3u7s8s/Jr/BGFXqGZw3zOaCbqNpoMFW9E9
	u182IPm0kdohcu8vUmFKkLbNvs1/cYcFxJK2sVDlenobntEiOuC2aGgJWeGhTi9G8A1+ymd+CfD
	uG5dtC1zTsxo4Lsxc2nyym7cYnikg2A==
X-Received: by 2002:a17:90b:3f47:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-3903c68fcdemr9133777a91.20.1785956345349;
        Wed, 05 Aug 2026 11:59:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3f47:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-3903c68fcdemr9133720a91.20.1785956344838;
        Wed, 05 Aug 2026 11:59:04 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6576b7sm14887218c88.7.2026.08.05.11.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 11:59:04 -0700 (PDT)
Message-ID: <b7c0326d-0e36-46b9-adb8-5ae328d82c08@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 11:59:02 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 30 (usb/dwc3/)
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <amtnlbQl2KLongvo@sirena.org.uk>
 <a9dd53b3-0666-404a-99e0-76617ae3f944@infradead.org> <anKJB0fmgBNEPdtK@vbox>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <anKJB0fmgBNEPdtK@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V29aDXKUiq0ZO06MWN20WJDhwr6Jhl2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1NiBTYWx0ZWRfXwR1UwbcmKagh
 HvRFhnrvXS4TD0Vc3W4WqngqZdvXo1PZ/B2+rRlSOo/X0Xal6ei9S8KAvyW48SRwMGgnxtg116o
 Li1ieu8f4C7ZqenZ3vTKkNJC1akL11LVT1jGDC0Qkss4WYfCPw8wq7wP/krtPrGuiCHOxfY2pMA
 JfHQv+Ued3Jagy051VeNyiupqKPQe5evMs+0I1paAg74HCy2t3uMixNhYkesYxd7702Ftdys5TU
 rA8xc0vSWvKHCtZQrI1kUB7bwRJjNasHcuAHG0GUHllK2BI7QpOLQax1znLah3w3/2iRkyjMvuT
 vdwgKbXtHWfboIvsAEnNOq3kMUFI4gsz6Xn65p8mBwJVW/fxIafOY1XBwRI0dLBlun2Th3aVK3J
 O1jtA5W4nf0fz2nidgXQ/UtxPifuQbFe0+INu3Orzr/NZgmLt0V+Uw56ASkDs6+dXor+6J3ZodF
 ZeKT5IcxhCksufAWIiw==
X-Proofpoint-ORIG-GUID: V29aDXKUiq0ZO06MWN20WJDhwr6Jhl2F
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a7387ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x__JeEkXMsYg1Jg110kA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1NiBTYWx0ZWRfXzoQ94pEjOvFD
 heF19M1vRb2JiNXrudgoyYTm9mQw/lyTQogKI/YxM6QessEvDZuIGacJC522VuUoS5dH+CaqSw1
 xODeEZMIUKGkYAZj8/6bgXKUCQVW2fM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050156



On 8/4/2026 5:57 PM, Thinh Nguyen wrote:
> On Thu, Jul 30, 2026, Randy Dunlap wrote:
>>
>>
>> On 7/30/26 8:02 AM, Mark Brown wrote:
>>> Hi all,
>>>
>>> Changes since 20260729:
>>>
>>
>> on x86_64:
>> when # CONFIG_POWER_SUPPLY is not set
>>
>> ERROR: modpost: "power_supply_unreg_notifier" [drivers/usb/dwc3/dwc3.ko] undefined!
>> ERROR: modpost: "power_supply_reg_notifier" [drivers/usb/dwc3/dwc3.ko] undefined!
>>
>>
> 
> Thank you for the report.
> 
> Hi Elson,
> 
> Can you help review if this is related to your recent update:
> 7c87ef27af79 ("usb: dwc3: avoid probe deferral when USB power supply is not available")
> 
Hi Thinh,

Yes, this is a side effect of the above update.
I have posted the following patch to address it:

https://lore.kernel.org/all/20260805185401.3625514-1-elson.serrao@oss.qualcomm.com/

Thanks
Elson
