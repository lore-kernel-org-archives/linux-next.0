Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22EE3CF663
	for <linux-next@vger.kernel.org>; Wed,  8 Apr 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658992; cv=none; b=Zx5xV9ImJYxzRVjsZof30tYeT+kab2b6rXckZBhV94yCn2nLhsmA2tKZuXTthduBV8Yhqu/h3USOKYWoPh1LKlAf78qa72nDmvWOmOv6vUvmbqEi2AYKCSJnn1DEzVjCMTOd/fGD2IlAu5jtf/Unfjt5DODnvIzl85RXdEP+Gyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658992; c=relaxed/simple;
	bh=f06Lc4cBWZ+IpTlUeGtSfVk1PKgNOEEKUS3lJmPbiIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5gnM5+9CQyuSP3JPhzqxNfGv78bVVIZ65h5NDA+R/nnhcOAo5yAZx4ccK+kdUkKvcgT9gTZlin5LKxkVtM2BhjzEdCusWd4GrKhcizoiNbXIFr7Q+9HRARwT6/xFF8fFc/3EcNGExKZADDmo7gbGY8jSdQlmaCVJ3lg/dKRiAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcV1QOXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9o/yvsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcV1QOXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9o/yvsn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638B3mSg1314452
	for <linux-next@vger.kernel.org>; Wed, 8 Apr 2026 14:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4THZ47SK4i9aGE1jgx9jZU0NoEoMpaJyKqtbNElvHw=; b=CcV1QOXYaexPGUpF
	dWoh0EzN6/RNWhBOnytRWAgInQsUAFdE4PuXa5zyjLNplYC4QwCn25oEo5fIwWcD
	/Rfj+8AoBaYD7QKHr7+rUEtTu+SCYNBwN1iceYibGG8pTv+Nnhum7hs5f2bjVbFl
	PhLk8IjL25OT5UMVlxE4oB7ZdLdLEQHQO+Hd+jYUxsZCzvsACIVFmAd2X1l/T1uv
	9pSZRhL2GVu7KB0f0Brg+xdCP5BoZ5XOnvUg0RUY0RsoBfor/itLJC+1f73R1KCc
	hcM6om49MtLrkeMsd1/S/8IgsvgJoQsOTZygD5akLxDdXgcNwrobccZpRUfwW9cK
	5oi5BQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8d6kmkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 08 Apr 2026 14:36:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953c427c1a4so1946981241.1
        for <linux-next@vger.kernel.org>; Wed, 08 Apr 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775658989; x=1776263789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c4THZ47SK4i9aGE1jgx9jZU0NoEoMpaJyKqtbNElvHw=;
        b=h9o/yvsndJhrD7WGNGwMlHthhPRF+05A/kdSUIm4lq3yFF5JrP44j9HnfX/sGLvmn/
         InMJ+yrB/0XwIGe6LZdhwKRA1qEFT2hfwe+Pb6GwRc4jC8vAWsQtQijXGGcgQ5dm1b1U
         pFCtlkFvh0Pa5b6EZymquygqttUTvlIRha2Fvv/nyt7jILPxgLi9mYKATO8RqFdlZBGY
         T0NNL9GBjF79LZfDQ/g1jqO6Pbk3Efoptatc8+rR9var7xD28G30UxU9+FBMj76AmwFZ
         BC36ZV2eFUKcD6baf7KzlS5Xxo44VXrNa/Bc5DrTU3wzb3Am8we5YgfMp1uTKrXiwwGB
         UDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658989; x=1776263789;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4THZ47SK4i9aGE1jgx9jZU0NoEoMpaJyKqtbNElvHw=;
        b=GDRfH+/p+ISVOscRt2yyt53V5LjwasBa63c0a3UEFbu8BnIajwiEIcAdOsnOA+dodU
         she/sIxQA2DZPYBhCoCYR3wukPPB20x3fC8JbJdgIeXXwRIedFh5WmictDoCdmO1YBoF
         xGAeLQroAUeRTdJPLz3Djc8wRp7Pdh1m1gj2Tdww6wN/PEXEi4aA2zRzCBm1sXK6POeD
         DMPm0aIBG172Nv09BJv3JfQQHy2pZ15uxCZzAsd7tOROSYQZDsN5cYZhp4y1N5sfxWJN
         dSYWHuafuUDwRbNSKfJWeNsRnkMUdhLLq+rtSaS7oPXLud0VgH8tk8n6eDHGhwgUu4zL
         yqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjiRpNMcIH4Y61e5SxkSd12fX1Pb17mQWR59JZlFx2DEmar+c5Zod48embrPHEhp327EVrEiNSE1SL@vger.kernel.org
X-Gm-Message-State: AOJu0YxhZ6x3VAc37lRQ//PhRnaNE0tTLK5z/4fTeVTII8lgFfF2k+V4
	8yNb48AOCrOrA7zVyG2gVCpYlrNX18QR+ajBz9FJ/i8ee6MG7CWL5YD9F8w5klyQpxAGglxxlfk
	m+HqWfh1gbvpUazfzL6xoo36H8MRP5G92Xk88rKVQxecnRj2O1XqRvnPfOi/0FKqD
X-Gm-Gg: AeBDieskgVfcoIsbVuDvW7NOwY9XRqR4wOxYi6+ZIEEJM2uKncEAeUPOdBDTETDZnx3
	7X8ZBf3KdJMX2ifRGjFBK82HvVXZJTvYYOKNl1jtc1iLQIn6+ksmYqEhROuOHu0CX8A4VVjcqaP
	x7plWHXr4t1LSbhMN92EhxDcaCsJHxEiv5T+LG0qWNvp2oz36SM+nvShyN8Ebs7CRPD7Pc012ew
	J5tqOsFJ9VOGlKrpBb1QyOtIxu49/FN8a9Nawm1GBARWGtKOdHVUyZS17Nvz3bCxZ3gMacDU8+o
	TZi1bgmUilxi5ooY0DF6IAtwG8u1rsW/KS/ECCPdURNU6bVMAJwsxNQd5VGd8X/vs4dN4+lWpSO
	4DOXRFCklV2fASgdQshd+/zxRYcQYSoBx+PmQgw7CKVOHAxp4
X-Received: by 2002:a05:6123:108:b0:56b:814e:d35a with SMTP id 71dfb90a1353d-56dab8f1d3cmr8547699e0c.8.1775658988937;
        Wed, 08 Apr 2026 07:36:28 -0700 (PDT)
X-Received: by 2002:a05:6123:108:b0:56b:814e:d35a with SMTP id 71dfb90a1353d-56dab8f1d3cmr8547637e0c.8.1775658988321;
        Wed, 08 Apr 2026 07:36:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm720707225e9.8.2026.04.08.07.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:36:27 -0700 (PDT)
Message-ID: <987525ee-b137-4c16-9d18-ee445703fe11@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 16:36:24 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the audit tree with the arm-soc tree
To: Mark Brown <broonie@kernel.org>, Paul Moore <paul@paul-moore.com>,
        Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Janne Grunau <j@jannau.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <adZi-3jHeX0UhURc@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <adZi-3jHeX0UhURc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UI-f3xRNPnRzrHFXkUN7Nm8Cr_d8qJ9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzNSBTYWx0ZWRfX2XnC5CgFos4K
 JxEYGSefZPLItUR/bAeijYr8EPMdq4OdaZEmgj7r3Qj7ui6+51tAcfqcSKH+5jZDWKg44GByiZN
 0Ddq8Y2hgYuA5xDcCW0dt/lSmxkUJf3kI5Lf9U9UgygWZOsm8r0qPBScALASXPJ6OaOSLteZRKl
 SgMvjKWYz4P+f+Db2G4uMmstnmGAJie0MrtL2vpaJlxLU1kY/72xr764wh0uxExBUNz98RfxIDT
 G9/5wQt2y+lo4//jGk/2EZzixtGPuHGeNwhCVvKNK2SpcNqGtUt/xIngrn3AR3nQ1SdGXb8u5AB
 +5lxEmnm7pcLpOk5VC8zOdaJHtK37NYZaFMCsnE4XUy5pvbU/6ThyuVXldbTjU8KY6mP3V5ywT3
 4+Q+j8xK7ENlCFtpyMM53m97H1qg9XsLxVhKjd7Tp3n/5tj9sB9AkjFYGpSagbqwFKiT8YhYqdC
 rMGVQhvgVWr0MkdO4Lw==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69d667ee cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bqq8TQyvwlmGWl78PfQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: UI-f3xRNPnRzrHFXkUN7Nm8Cr_d8qJ9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1011 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080135

On 08/04/2026 16:15, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the audit tree got a conflict in:
> 
>   Documentation/devicetree/bindings/arm/cpus.yaml
> 
> between commit:
> 
>   96e71f817b02c ("dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles")
> 
> from the arm-soc tree and commits:
> 
>   0220405d7e099 ("dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles")
>   d08082a872f08 ("dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles")
> 
> from the audit tree.

I think that's not audit tree, but Rob's DT tree (+Cc).

Best regards,
Krzysztof
