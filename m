Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470569;
	b=c9QHFJw7UhW0vfZ/BuXDu8oMyRoitp0sjydTb6YBSms/DywTQGcw9SMQV7BJtINbsrGq
	 A59nTRHFNjd9fR88RseRFG7Of0S/XUKjW+CzfT2Hz/gqFpzQrYhj1YdqgoaLnHc2UZvsg
	 8TyAMbogcJkSbpgx0/38ioUbpjiwuCN8JBOqcPpXWiHJescZpW5rCbtlFgm/T0kcsGJxl
	 kZyeU20ViplESoq8P+vKXQurdGpOrcSYN+SGY0rlf/RQ50V8g5Ulo/BVlwU0vK/E6P6DE
	 XaCKjPZ+LRWWPQjLud36wwLV4fTAIjdziq7wZvtLdzFrsEEwvtg+idTR8QxxiV4HxXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=;
	b=OiQ0anzA2O7tq0HvLyBUoZWWv9guTBHm+EK9PUUhMz5CjPJgboPYCT1OEwxmomDUlOjs
	 xHcYUltlgf6cv6lsBCgo2fOQDDL6RVlSCvkptmichUFwNYiTOIt8v6oBVUFJ3f4AXrrd5
	 OcQXklnOuMutsoGxCelDv4/+l/rwrsm3YQKswv+clTur0yyQM/TtYZ2FLr3L5wVoBVkD/
	 3SoFEdCsfNwtIxx3S1Zk41jw0AsjTjKr2gOO3FAyYgyFj7ZbbikneQsBtcmeyS1o7YgBt
	 wbICoGMjQqdL6+43BfI1/Mo4c9PEuK1WRtvYQ3DqpSnxQ/HrHE+aCxr2++502LzDDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XFEMPgBv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhxkyPxj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91825606A321
	for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 21:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91825606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XFEMPgBv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhxkyPxj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRpK3255350
	for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 21:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=; b=XFEMPgBvu/e+tlYn
	FrvE+Y9TcI69AQc1mMsSOuh2ZZ4cl/kUqgt6M8NCaPw/sb0mcpLNSMLoHL1Rc+I7
	ohsLzKhGbewo1AFr/ZaLrx+r7p9BDr1kFwAc0atsbellGtAR509/HG7o8N2UWrGS
	HwJT0HpeYy8kMCex4ceZ6/Zuo8N44A8I0rJvQbvBvTvIEuFi7Ru5X6MBvLzmsqIQ
	Qk8AOMVUWC8918kebY9SXfe004UImtqicDrDPCEeJ5h40+6L+1e6qoX+4TctuMhZ
	u723KOEXej1DYH1JtLV7eqC64K9ac+DQUjEoab/ffR3W1m+XrZJ7XSm7f37lb1ao
	SAd7EQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbjjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 21:49:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so643081285a.3
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 13:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795470566; x=1796075366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=;
        b=RhxkyPxjvCUnDvFVe+ILFPksa0yJN9MeRh96aKl0kiOADU8qQv3DalUezF12wodf7H
         C18u/0Jf6ulfxQMceltUEJm2Us8lU/PnJErNM1nwwlpJpvGTNF/+ogDPJKEB8cMkv8KA
         1JZYfROLr84aFL2xlTdOTuMhEI7y5KeFg3LGzzwd1OeawP4SEvJZgbdNWI1D/25iTHpq
         bEiF9+5jTYrFG3Z0f4uyILIxrrGlpw8spx+QspD9FHmDBzVycBwPMRq0yuFFYQb5+cF/
         wJOdPmdOW0ROWahW3Rt2yJ1HxOfMuaZFz/B6W0UQ8mTYiwAsZN6XqeKk97hDZPg1+pE2
         w7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470566; x=1796075366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=;
        b=sk0Qe9l9H3S/pNDG94XpaAomN03TOVEXWnygWx6Tw9BgkOi9Muwc9A/hPiWdMXFvJa
         XFdDOSeO/FXlypNnIyeBRShIus8F8BeLOP0sNeT1Z5cuJrw4PcKbYLhBhI7H7vYShLMW
         sHhfsUipz63A8BhYG2hA4en4t6dEV/jH2VbO9CnDRd7fbBKT7ZrTMZ/0H5J/7B0NvdJ0
         D18venercp9cL2/P6c4VNprjS7oGF76WUI/IoqAwOkUpo89tmT78rctD1rYtWz3zK2Ug
         wirBEKDZeYYvZK5/0LTprC0xFSRfLvUxnezVkOiC2vAfAmdUN9e2/VtJuhcQbrWBFfDm
         H+KA==
X-Forwarded-Encrypted: i=1; AL+hErHTz5tkOaXsZZB8zggs++WLUrgMMndn9A2TEC6UiEg+jawmPGU+x7iXE+rXJESpXVvd3Tj6/JIL8SgN@vger.kernel.org
X-Gm-Message-State: APuU4Z/lRnmt40aktLbLhsCA88BKOG3LUlR6gnMlWb86VVT39Xz7ye6E
	/r/3M0uzU19eSjMWcTpY5iTD1nMS+gNJ0NMMuGEgtqsjK9YXjX503vQ1e/8igEfeSNCIo0GqHuJ
	jseDLQGkNPTmuRI9iIEtXH8fQ+mVJtqCp02u1Om8DfRGZY8EkTEImqT6efkWpV8q9
X-Gm-Gg: AZFdTZfDeZEZRmh9ZNEZspZfbqv7CF5emksNhjBdQdisqG5TqiDBSTmuobHk5bxoCRp
	1h+tG05UWaD9RerbzXOCqF+MDEnLMsR0CxIn2357sKdnvjKHq88672QLyewNSwhKCjjgROSxEMH
	wf/wCx2mEsuPhiOViqNjLNF9l8N3xC7oTG79tzVrWFmlXZGYOiCv+lI+gL3vCA68fQO67OzDxix
	6U18Vwpnof0zQotLE/G/Q6+hi0thd3SfJCyTsclpUdghbnHGz6pN061LN/Xyp0xkiYahRq5cpgC
	Cty8XQJRDVxirP6oe8DtOVzNJOlde5KUYwvRRM0lW0sOHQWblq8xgD1sqY7kZ/2mk2NiK246QpJ
	22CGT3Sg8W2ujuihPu8T3Y1ZhiN9+7aEnXXOJCiVKwGEHQ43Opep1WMinAMs5z+9k8Y1NHeiRoS
	m4eKJON1RdwT2RULu/UJDLaJ/bZCRgSrMItCo=
X-Received: by 2002:a05:620a:44d4:b0:944:a46:5c1f with SMTP id af79cd13be357-949ba9a3cddmr2079008885a.40.1795470566524;
        Mon, 23 Nov 2026 13:49:26 -0800 (PST)
X-Received: by 2002:a05:620a:44d4:b0:944:a46:5c1f with SMTP id af79cd13be357-949ba9a3cddmr2079007285a.40.1795470565991;
        Mon, 23 Nov 2026 13:49:25 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2904:b6b3:45df:9155? ([2a05:6e02:1041:c10:2904:b6b3:45df:9155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm340015395e9.2.2026.11.23.13.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:49:25 -0800 (PST)
Message-ID: <04471857-7d48-418b-bd9f-5c3ff3010e41@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:49:24 +0100
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
Subject: Re: Missing signoff in the thermal tree
To: Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <au4SKRePRjYBItxx@sirena.co.uk>
 <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
 <782a33af-566d-406e-9f4d-52d80cd3c756@sirena.org.uk>
 <70a066cf-533e-45c8-9db7-e79727dc6c44@sirena.org.uk>
 <03320894-97d4-46bc-b11e-5fec18146963@sirena.org.uk>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <03320894-97d4-46bc-b11e-5fec18146963@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX4bLwtnqohhXD
 NbvfsjG+gqlIoGSSvfZVlodswKWfAgFBwcWIdggP7wh7Au63GMVFFfcjMT0IIuzMQkhBYvZI2H0
 PIc3JIz3UkI5N5l7b5IlQ3rvXrEgyL3ED5V8zWOLBBGF9fdurd6/9sIo1tCHEym4sXX+p1yYCOS
 ZBEpKsdqJXJtx/GIdEpnwEjUswKCTOXXN3Ln1NCt4SaORsmOA+InUJOYPrsgrmdWRQbz+eQ4KIz
 vFMdBTuYPt+nv4PJHvXIqFhMMVYOIN0JsRCsftuBKuv9JLulx46n5s2AvXbRa0X0cAtaGsw/oLE
 I3M8ffgw7av5kRJkmQP7oEyTvkUgQeuPnLNNJAtKvK9ZvHSlfdvHpSCavQ7x2UunaVoBGQxFmvx
 e4DX6TbyoyLGcQwAoS9eQu0k83NE1Lwpswy0syoxdIV8wyGGtXm7fvwRMgkBmElslHnhVNPTCFz
 A32ri/MnPGOwuJtm/lA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04b4e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=1LtqeKAUxZIeCVZ3D7kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: T4dFbAw1TdI5bocRaCUEbTnYtymZHZpN
X-Proofpoint-ORIG-GUID: T4dFbAw1TdI5bocRaCUEbTnYtymZHZpN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX233LlUlXfWSJ
 FC6PID2g73sakUWnEi6ErmxCKTeSa5Oid0TkFmf6fHpOslV07oBECvVLfh94FV4xdEksdehF0ih
 mZ/pg/XzAsXI5y9ITg8/er6bLoKrqBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230086

On 11/23/26 19:22, Mark Brown wrote:
> On Mon, Nov 16, 2026 at 10:18:31PM +0000, Mark Brown wrote:
>> On Mon, Nov 16, 2026 at 10:17:14PM +0000, Mark Brown wrote:
>>> On Mon, Nov 16, 2026 at 09:51:27PM +0000, Mark Brown wrote:
>>>> On Fri, Nov 06, 2026 at 05:45:13PM +0000, Mark Brown wrote:
>>>>> Commit
>>>>>
>>>>>    115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 support")
>>>>>
>>>>> is missing a Signed-off-by from its committer
>>>>
>>>> This issue is still present today.
>>>
>>> ...and you've not told me about your new email address so you've
>>> probably been missing some of these mails :(
>>
>> Found another address to try.
> 
> This issue is still present today.

Noted, thanks
