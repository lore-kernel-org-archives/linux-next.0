Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469956;
	b=Hi+2PW0E+Xz5kOw6lxWpJlMxA/hxuHFeMa7VrsfdO3FSBNuLkpGOIgGbzSFmrdILbVLH
	 MSzPa8CRIL/PQJQeTIgTQxEioI7a/xh0GZPATgz8FU2WbUi1JIXipMncF5KbW+0HOwKPW
	 rgJr5pDG0QwTzMNE4e4As0qMF2MjuhTqx04+CMuMf2ueVhg4FAxE6w44k5twDgALH3mUj
	 miimGV1z+2rEfplndprVrrAZejgYQg1J1I56T6VI2NsvzoEM1KE9NZxilmsdr4T2WqUKJ
	 mGoyv/C+VMyr9zM80FR5PP/yYDJ6xCL2QeR5AjfimdMwGYOsdRKqoP4NwBoEZWsEXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=;
	b=eNRhne5tpsIlhfRpmMwG9D2/fwX1NO/rCYeHhMoXYqGlr9fN8cN7+WFwiyAX8BlyyxMF
	 DkHVBvlld4pQ+MAeDMmxLc8qaLj/5wNVpsqvkfezBBbGyGoX9QzwTqYytSuG74AqSePMT
	 k/2f0H/zb1n0lT+T/YiBKJ+u491NV8uhlqUDsJgOu28HjBPRn4yid5QTWBea8REVh7Phb
	 OJ3LXGQBzDMliYEjnfiJirLhRtOMJURZkZVhkFFz/M4LSyvEymjga92Lp7ueaggn3gmHO
	 8E7iH55FBinBdbbkArF5bdnbYzzO37kvKUxeSHLspvU7zLk+WI0X4f3sEASFN82V0yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuCIVmqF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmvhtRS1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC2B606A321
	for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 21:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC2B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuCIVmqF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmvhtRS1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuYd61579761
	for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 21:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=; b=BuCIVmqFVVcWBvbj
	U75IfGwYOc9E8tIA5koyD2zVDpqz74wzjU9m86s6N6FtlMdBiX+B/N3wA5TSFoR+
	3wJOstwI5c/t1GQGMxHs01I0KRzBvPML5+xFd/+Y6VIEGPXU7GzrVQ4MWQ17rl48
	09W4iw1jIyxV6o23Li3thFmvn0DT/OKXG+IYQaGU1SK7gV6l3TBVVxLLdCnq50Iv
	9i3dRfdmhCf+RfQ7SO0wigILQFACtShFMMe6KX3KU4fL+LzpkcrCMDTyocbDZDhe
	Fy/AXGhCAiqxbavPrR6ENrzluuXqq8HNNeFWW/sSp5jBx3jH3hrBKBTDTo+n93fG
	4CI73A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tgcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 21:39:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde9044a96aso1062217a12.3
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 13:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469954; x=1796074754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=;
        b=cmvhtRS14JbA4YT7foDBXu/0S1yC2TSPMvt9LeaPyzA8p7CWq4ZQuwOY7yp2fl9AZt
         8qT9rO3qJpme7rm1vxhp7G1ONfTfPo4rwtYxp1mCZD4ZREbGodZBsxOnnScostdnCpq4
         fJef4tig3hIRcSFAcGVEOkAgiiWBSEH8pLBaqrNolUp06qXydN+tYdjur5zro2BNeDm+
         nZmmxdSw7c05FkkvyPqFdo8kRtfSD+PWCrEwexFsCBAI5wKE2SrQvVe3iW9/O0sW+V3o
         h+eV6nQ9Pvb3+APHaBgFgJqceZklvlL+vXY3KgbHifsNYXp7JXQQyMuiPgnOJrFUKKzC
         JbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469954; x=1796074754;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=;
        b=TgRxcmuIqxoq9+aqDV5lS3SycPRztYHg34UUzFLCXUJQSK13EGbAjR01fuIcrkaIS0
         24UrZF1Tda54VLzk3tTcbH7Bztdahk4lPZLjRZrPI/nsLnstaOzY6t30CQ/39ED60Ry0
         QulOhk0bnPys6fXb7tYHbiP+SkPh7d55VsNB7cjgeijuu/4oUC9vGINCvuQqNoFf27ll
         fTLQB1eUFDks5X8XvQU9RWpUpgKFZ+9RelvU1FbVyKG9qIQ3XsTzB2X3uPA8A52urv4t
         MvxUlwVpVIVq52JGTnNV4Q4bzXgDgACUiOBoTEGR5SDEL9WwaS7F6QdLHoIme7206lj8
         L72g==
X-Forwarded-Encrypted: i=1; AL+hErH2CnVw/semRJW3vq2cfgwjAustkXsIVhZcOK/Sf/ViTUlT1LirBvTfhk3Tm1TBoZv21JlfdJG/T7YX@vger.kernel.org
X-Gm-Message-State: APuU4Z/LA2c/nHyG6E5tEaT5Ot8ue3qjCv6wUJ19pOaA8FfF8UG/QAeF
	dIJN6Yt7/OrR+KLbhhhNG7Rj3XKEF2utLEstbQj+kUSfjcmnZ/h0n/9D8fMWZHdHNy4ItAXTzXi
	UkunxYQcISKjCI/VTSgdZ5EztbZsmS5J5Noxc3YDooMg4KOmK0YIjK8kc9WPFOiM+
X-Gm-Gg: AZFdTZdSXIP8AdORq8CIslI+TX4LR98Myt+OQp8AQ6Xkendc7Gnw6qx03V9oCiRciXH
	gyhH2sz4WMITOINv+EoxcSRBc+aFyE6zy2KELWqog6RFJnVV7H6Y02KezTPGXPsu7llx0pWT+LF
	b/IHnmzMMfZRwTVajqdfAjr/Q/6JhfmVIPDF8Xd+cPcE+1C4apa9kf0AnQdMkp6uqD5Xt40jglF
	Q1lBiUXM3hY4D6TrZVD93mZUkiFe6DWN+X6Eom7NlyTy1zyhFD9T9hxwN4elpFXCbc8d4lPkhqG
	YdGAdosZQVOyUvvIKY20YIwa8U0dsDjgsuTGAMoP4dbaP+a3Xi3434LpgqR5V4LgsMkslVX01Cp
	v4ZOjUW2VOlP84Y5ldL4hvCDYpmKqjWKVun/Ay/jmPCnb0bolwr051FfMHxAf/z3kvTrDMfh+K/
	uswnabmq6XfH+C3Tt0+iI0ya530EOrb4I/sYJ4k5PW
X-Received: by 2002:a05:6a20:a103:b0:3f9:6c3:4c12 with SMTP id adf61e73a8af0-4014c25016amr14693283637.15.1795469953981;
        Mon, 23 Nov 2026 13:39:13 -0800 (PST)
X-Received: by 2002:a05:6a20:a103:b0:3f9:6c3:4c12 with SMTP id adf61e73a8af0-4014c25016amr14693250637.15.1795469953066;
        Mon, 23 Nov 2026 13:39:13 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b889sm6213767b3a.42.2026.11.23.13.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:39:12 -0800 (PST)
Message-ID: <680fcf4e-4e5f-41fd-868a-a0ce58ed77d5@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 03:08:49 +0530
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
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: linux-next: build failure in the final build
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
 <b7fda918-8355-46da-b7f4-40e1a104279b@sirena.org.uk>
 <2fd6f05a-6dfe-40c9-a7ad-44c28af8584b@kernel.org>
 <0af7abff-2c33-4920-835f-9c5abe73b143@sirena.org.uk>
 <7ee4f5c9-58cd-4238-be2e-f092acf3c137@kernel.org>
Content-Language: en-US
In-Reply-To: <7ee4f5c9-58cd-4238-be2e-f092acf3c137@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uOsWgiHjyp9W4NY15jdmV6iZlE2soxmZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX5qnFXJq93n9E
 hrpUlWuZdNUrP5UcI/groVh8uQJyykoT0BRJZLu34ZfBJAakNAdy/5vVPqpqNMgWoUSqg8PbF5J
 RR37D03fDc7rFB+8YmSv8yCUBycFEnA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX8lKgVhEb9o70
 1F0xO3xU0UVNu7FDmwC9dWFSt14NfG+x2o/OaMJfRPxTzRE/IodPYiIhXGf/QdRLOZHfGM6w4sY
 pPpLk1U2fG4crHzqVjTkRW1tbtKu+wBnao/h4OeD0Vms9Zv1jngwJ/4nfsq4a1QtAzXFWguwbyo
 OudAudUjJknLYt7j8RCLqPiSVOpwHIl9MsH8XxuFlOrR/bhslk9D05yzmH+uZRhVNagtvdyJ8MU
 vgQubGwV/55nYwYnKFQwTv4yOwxMI6YAn32zVMvTbOkhH2jKk/S5G+kmlf84vWfi6zL1atrmljY
 Hc7RltRF5f4Vv9Hw96doY0IPQ5L5XMPRcuRNY3VAmgVODIK3G1UnH9v7le9vSs5/tp18qAJ7m/l
 UZdg5Lz3mjEk8DfbVpeBflo4o87Oa/nlFwS97EAR8pQHpvpmwxUDzbZm93sMeSFEn5aAKZhTc6F
 BNWCdYuGqVK44thD9mQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04b282 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yr0mMJ_9gDnwHveZjjMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: uOsWgiHjyp9W4NY15jdmV6iZlE2soxmZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086



On Tue, Nov 24, 2026 at 12:31 AM Krzysztof Kozlowski <krzk@kernel.org> 
wrote:
>
> On 23/11/2026 19:58, Mark Brown wrote:
> > helpful to have better compile test coverage for these drivers to help
> > avoid such issues, the easier it is to get the code built the better.
>
> I'll fix the missing compile test for that driver.
>

Apologies. I didn't build it for allyesconfig. I did uncover this issue 
recently when testing on a different branch where the said driver was 
enabled. I was planning on sending a proper fix along with v9.  There 
were some fresh comments that came up from maintainer Vinod last week [1].

I was planning on doing two things:
1) Fix up the build error when sending v9.
2) Send on top of phy next [2].

I will take care not to let such things happen from next time from my 
end. Sorry for the inconvenience caused.

As per mixing phy and usb patches, I know that usb subsystem prefers not 
mixing up usb patches with others, but in this case, I thought that we 
must send a complete series instead of sending 4 phy patches and then 
sending a separate usb patch marking the dependency on phy patches. In 
that case, I would have had to send usb patch once phy patch was in 
linux next so that no build error would come up when Greg would have 
picked usb patch into his tree. Let me know what is preferable in this case.

In case Vinod is fine with the implementation and comments replied to on 
[1], then this series need not be reverted and the build error can be 
fixed by Sasha's patch sent today [3]. Else, Greg, please do help revert 
the series from usb tree. I will rebase v9 on top of phy next after 
addressing the comments from Vinod.

[1]: 
https://lore.kernel.org/all/6ed0793c-76ce-4d04-af5f-8987311c5c0f@oss.qualcomm.com/
[2]: 
https://lore.kernel.org/all/6851ca2b-775e-44d7-b437-d04fd4ea4f21@oss.qualcomm.com/
[3]: https://lore.kernel.org/all/20261122152857.1113943-1-sashal@kernel.org/

Regards,
Krishna
