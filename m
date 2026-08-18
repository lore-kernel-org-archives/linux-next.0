Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF7837CD53
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052363; cv=none; b=KX3SojQhv65agP1HAWhvoWlyYc/KvNHnQTwh1s7RllvlQDxyjqs+URYq9cdUVAwmL15+G8hpf1xeVF8pYyCJgDrYtYtBlVzQucOldJgW6oSjdVn7Xz0E4XemQ3HI42HS3clKrleDORpwGWamOzLtAb5uhSIGk9408bPzJGkp4ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052363; c=relaxed/simple;
	bh=GQQXO7XScCCOs7uBrNdPw1spKFb7SYy5zPwNtkiTW64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dchlMiOTWYbRWM1nY5Om7GdruFN4ySO9KccnlYTumxbO2jEGb6QybemEfqpujfZFVyEuMWhq03uCvT0OJlmrQk8C+6Q6vm+8budc8U1e2QSZs6IVRXgDCxAOiTW7674AfKjRYqAz7rOLc3wds2Y68VpZgDFzQxb2ZpCnXUdK55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoWmg9zH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8r7gpdA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoWmg9zH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8r7gpdA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABhAr820185
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUGeji9h/C70tNHC0fVzov0mSpqBCd+sgX0pI5pSN40=; b=EoWmg9zHq5iDyAA+
	s5tW03R8XZe4R3xoNiPg+HdhMPeeWaIJnLY6zW078w+AmHU+4owre14Y3CBgdpkJ
	iiam2LyWzQHrGu0+v+zoqSUybxA5zfI9tTCObUJUcgo2PzJcbfXTrm37QSnICPKI
	FEu/KA/pQa7bXscOwONofJVssRS7JN0jv8v4tdGZ+Rrrwfu1HO4Ftqv9+n1OZIzZ
	cQjB7liUeleqmuNze7yVWafsH6/5dZpH/9DptxXRnPYW1EAsP2TyrWvLlUQI/0h3
	FlPpHOycT4ydSkFOjD/9+wQQnhm4dh26H+q0gIFqemeo8VI11xpPZML+y9nS73Lm
	QnrDQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1qw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 11:25:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so44028911cf.3
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052354; x=1787657154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUGeji9h/C70tNHC0fVzov0mSpqBCd+sgX0pI5pSN40=;
        b=J8r7gpdA+6nutVQdZagqyg1n90eyLVNRAkN8Or9ltXl/ZJJdC5SKOlInZYnbnwdL8V
         +pgmWlracaS5xoZ0f8pP5I4Aw7lr5x+5uv11XAGFgc75wqOxHksFrfY+GgKGi6rnNaXG
         osozkmeYwd1jTz9PCq3x/7K6gt6lk21IU5yeKdfV6+eFiesjIluuKyQPpwqCJ+DzhX5h
         byCTCiawIFVJ2jrW03jiiV4mwv4Q1j6+rARJcLBO0gUN5MjvgD5CIFJt4HmTZsB5JnJz
         KxbhsIw1/3doZv0Hcg1oJoCstb3NrlmQXLMuWuLGZv44xPTtwRX7n+Yx0n4LqF76iqeb
         UIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052354; x=1787657154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUGeji9h/C70tNHC0fVzov0mSpqBCd+sgX0pI5pSN40=;
        b=sn1NWIdJcMildNK9qyQ1LtX092PCVfss5vJG10quHy2oGUB0Q4IoOcxURtYf20vfaZ
         hwmkZ5HGPbLw0Y4pLUS7PpD/MlJd15TzUb0/xmdwutoYZj9gmcuEjyhCv/8BuOgsUp7F
         c8P7TcuYs8RSYI8FhKntJvOX08pIu+Ek/4dfXsX4t93OdSATo6R6jvZJ5zfCsQ+juX5S
         x0Fz6Na3cjlUAbVdnfP8uOwbK3dSnKErtCg4JpCOjCnN8bGcEwIA1xQ1WD1mZCJ7951f
         +33rhCpkbICiNgKVexFrihlHjMEr6qwgTSNI04s/DbO3JGlZ/Ng1eqe9qyH3EQJ5jD/i
         ZpTg==
X-Forwarded-Encrypted: i=1; AHgh+RpYWUFci795Sq7vTiXZiNpa2aQVtGHpFRoAaa+EABAF7W2vWshODCdXRuljHzAKtPUdS/IHhHUtuIIr@vger.kernel.org
X-Gm-Message-State: AOJu0YwC04Fhe6gEfM69jw7Sm+V6fq3v2zWTmquK5sn9a3PDg2Mv93CU
	bV6K3dgvdhV6yhHmS2qKhBnd/jVZ9qMT7paCyBk5VkVMZ3bKq2X+sok5pkSGq7dJLK7ALnZCuA6
	uHtOaqk+kQrrlfxvHQDUkCTi7QGGfHhckTX9dUW2Ix28zF1PcWrJBJQr3BTvDFA1HFymoQ090
X-Gm-Gg: AR+sD11GxY35fgu65y9SHylmhmp1YhG+MrcZMCKMKO/SdX9O3BULJTy5GOfGhsqCmD8
	PDA9vEoXiNfqNchfWRx2cXQ94Ew22YIIM77PrHN/W4g7EnOBJJWYib6yaKKZhUxIpjbrj7NPYEk
	eBdW2IRW5Feds1WOcxkLhCO/ais0iWx1LLmbhpLGN7HjL4zpstVtNdc/UV1hhr2hJD7y/3anaOd
	GIMT8IwW3M/T84uAfAt9OWzluoIkoe8OWFczLOLp3KUFlbk4qEkb+p7fgTS3i3/AN6FfVUDmAKh
	RPBp2cmZbNi317yZYBOqNWZQWZZszG2znhzVF6idVc79T+Z26Z2WVvvJqN4reZfcGEe48V0/PlG
	F7KQ7oESCEeUL1vlxNtWTTHUqYADARbcVVV7Vc8dSHAdc5EG7DAQWtJrFohRX
X-Received: by 2002:a05:622a:1c11:b0:51c:4dc:287b with SMTP id d75a77b69052e-52dbd5fce46mr77437361cf.7.1787052354108;
        Tue, 18 Aug 2026 04:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1c11:b0:51c:4dc:287b with SMTP id d75a77b69052e-52dbd5fce46mr77437071cf.7.1787052353637;
        Tue, 18 Aug 2026 04:25:53 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7469:ae7:2b43:7ef3? ([2a05:6e02:1041:c10:7469:ae7:2b43:7ef3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm250514805e9.0.2026.08.18.04.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:25:52 -0700 (PDT)
Message-ID: <142db995-8952-4488-b521-240361639e12@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes tags need work in the pm tree
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Linux PM <linux-pm@vger.kernel.org>
References: <aoMBM9KoZItu0aNb@sirena.org.uk>
 <CAJZ5v0gvxu6dzToOhh-xsP539Mjtczz7oTLiMXFeMvA+U=3Zgw@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0gvxu6dzToOhh-xsP539Mjtczz7oTLiMXFeMvA+U=3Zgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uZBGCk09lesfeWReXW8pKkqK7HGJEtsy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4MyBTYWx0ZWRfXxQsGjAQHcgtD
 45KIwP7LXgf9fqKM71Jm7+wnXqYhdrLUfV3iyifWj/2Lzcw6DCIxSVAnOmfVvvzuE1WiyeFAWgd
 dnGqAzfD3i4tCILU+LQktiklbOSvN2Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4MyBTYWx0ZWRfX92j/oCwcHwE4
 1oqTf8gwRe29Xv9unBLbiqbV43gTV/XmLAYV4p6QG2vplF6mqathjjlAMEbEEdDW98e/6V3wVO8
 lZh7e248VT4i4O7NVGQFSnWsKUXLl14MZJdi6coUii/JKDb7CIIsx/UCBQcnOr9kfJhLLrips5l
 0wZo9DMPWmYCGQvnBmye7TjQA1qbGT4mvEs6uoA7czLB7+txj2+OzjQiNpk3iGrf7XTmnEJVqVr
 7mOsYn0ie6s53mP6tkIXTV+Q+6gr3prjVdPtiMz7arkfcVYqbostkqfk1kzH+YpZ5mdOsWesBNp
 raRAE4gakle36I8WcdRsVyNNnnkfRxPHUPqFe+JBpTKVdlmDnmmO+0cncYXDKf33MRsjbzOjNtK
 TYuPN+7fs8ZEXVRo3jFqybQRY8gWWVEdnOe8e65XDPDtw8JbrSYl5SfwXDsL9Jag6NMMOFBzLR4
 ubwFcNDPgIijy+UYH+Q==
X-Proofpoint-ORIG-GUID: uZBGCk09lesfeWReXW8pKkqK7HGJEtsy
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a844142 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RryicRyxWyhHSrDq1IgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180083


Hi Rafael,


On 8/17/26 18:31, Rafael J. Wysocki (Intel) wrote:
> On Mon, Aug 17, 2026 at 2:40 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> In commit
>>
>>    68e3c5d8c128e ("thermal/drivers/qcom/spm mbg tm: Fix missing bitfield header")
>>
>> Fixes tag
>>
>>    Fixes: c3dce117333c ( "thermal/drivers/qcom: Add support for Qualcomm MBG thermal monitoring")
>>
>> has these problem(s):
>>
>>    - Subject does not match target commit subject
>>      Just use
>>          git log -1 --format='Fixes: %h ("%s")'
> 
> Thanks for the report!
> 
> Daniel, there are two of these in linux-next now and both have been
> pulled from you.
> 
> Unfortunately, this cannot be fixed without changing commit IDs which
> would require resetting my thermal branch (which I had wanted to
> avoid).
> 
> You may either resend the last pull request
> (https://lore.kernel.org/linux-pm/468d3bf3-fbdb-4548-bde8-1c94ad6f15da@oss.qualcomm.com/)
> with the Fixes: tags fixed, in which case I'll replace the top-most

I'll do this one

> merge in linux-pm.git/thermal with a new merge, or resend the previous
> pull request (https://lore.kernel.org/linux-pm/91946ecf-05a2-4479-bade-3d0803bdcba2@oss.qualcomm.com/)
> with the fixes folded in.
> 
> Whichever you prefer, but please let me know which one you will be doing.
