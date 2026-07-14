Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD63BD651
	for <linux-next@vger.kernel.org>; Tue, 14 Jul 2026 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009213; cv=none; b=QlcyaQbc2YUlFZJRT7VpNOSEi8QrzWl8iWp/TmQk95JlIFkyT/DsWdjpkiJokTB3+3rbMOLQbUFbDJnytzWMZtQhsVex1aCNMClJkR2XlumnxBYea09nm8I6CpxSlPkIm0lW/E+oCJf0+chJcMw4YZyehDYnD6aAIhhqQpRPtNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009213; c=relaxed/simple;
	bh=O+0nv2SNB3i82TNVTY7zAME2W7vaTAnKUolRVo6bfis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LU7JLJtRK9+uNWX3uvyeAH64jL2ieKXpkrWPmI6HrXX4KnCaf/WCTfDiiutzCvd1gGP6Y1dhS8+JopofwqJrXPuSBS5vd+IqGulbCRlnCOPrUieN+ZWUiwlf6jVylaiHeQlCy1S4VWC2ilVp8deZ5XvcncQdK++OK2yMWWOoL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEySbt5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6xzBoWF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEySbt5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6xzBoWF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Wmw3417742
	for <linux-next@vger.kernel.org>; Tue, 14 Jul 2026 06:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IwYCUxVhmQoaUyTBUlvmESwl0MfXao1gk2tbc9LWRaQ=; b=FEySbt5orRmW/5+M
	zv11LrOb2l3AgNMVhv23ZB7i+fUCt7NMnlnwQKukUSsPhv/LJm1EuiyecvpM2ChR
	v6eyLRsQlbAgyi9tNsODuaC+EoH/jJOMkE6TbmnXmAf+z3KW1d5ClrHSvirD55UO
	XAACl6kUk0pS2D5nSAZQ2oRGQhiLxVHf0aX3V+Hpx3ekeNW8hzmWbp7PwpWpNjeL
	ngQ1YHIoRyJFzPq+L67POeMy3fNuKH3gmgplE6WQTMa+tz7X00MwEvoI3wuPVg9v
	0l9uNxxXpGkIC9UXvEbulUBG1eW0TKiLmrCIufuzRsq3p2ByBymKzasqYOjGnWnf
	lm47Ew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j28he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 14 Jul 2026 06:06:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8894570b58so543666a12.3
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2026 23:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784009210; x=1784614010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwYCUxVhmQoaUyTBUlvmESwl0MfXao1gk2tbc9LWRaQ=;
        b=N6xzBoWFzXTXkgpCz4bLLLn9c2K1d492xK68QqPpLoiI+6F6+oZj/ygCN0aXY/9BMg
         9234qG6ZcU6/O419t/+EmhpdiunJuhTeHDKpcEAywO3QaVTHMH8dOqjTndhCuBDXt76I
         MDxbdJ01FQ/Pl09kAgZ0EMbu4UcSOvDrV2cPd+9+3jBAhBWt9YdxQUJ9MpIRJsI/1fqg
         O9UCAEG17oLhXPrnxRANwHyhLXX8rceqIYFEZrPXzriVMvvEm1pL66SnmAjfxfb6cYGR
         byE/1oGl7NxP6vI9MOp9wbhqDs+rocSUaICf+WKoJ/QYKy6TKI2ty3PnWsz64LlGKk7b
         EKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784009210; x=1784614010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwYCUxVhmQoaUyTBUlvmESwl0MfXao1gk2tbc9LWRaQ=;
        b=mLBaYeu3Bm+EC7vvWj7hnjdZ9ZaqbOHMZO+Sh2B3D1UiWO+hX/vJtpZfakL1ZeKes5
         v37OxFqQxv3Wflh06T7zYm7dnlJzynn5yLWZk00Na2JZCd/jQmmsH3BOU/nBWNB+WEEM
         DvLpAd2Cg+MGS0pN7ebV2mwnP3N9R9CqMg2ug7U1PYy6WOAux0qMri8jNtgiATTXwPKM
         pbNTZUZW8nPhL0CkAVoLG8b07OC6t5UnvcNaV0y7TMo26GINfyN3DhrlKAySlwNbtA07
         +/1/1k4K3L6OAkOhsv2B94TQN12XN7kG42PQJlapH17H9xcdmRJ3invywwvExI1sDfvJ
         SMjw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1LSmy210pZs6bDqKQLqq9mi7WlupIPbg6H6Bl6mtJUs5lUdjtGdJD62dBAB27k7+5xaqt8HUffGJP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qVGKqsewlQ1zXp1M5VThojgJzztrrRLGa0lMdk5z7WtSmQzM
	Ygy+Tr2XMFYwQBUcH2/OkvOiQqW1hprR/TYUK6WtcbDYO5cbTrAVmKTt/aV+cnKPJqLQ9z//l3+
	hoAOar0VVTsGhvlfEn4E+U4b4g6R3O3D2Fdb2opLgcetXgx4y7AZnxcQ3uuNpRT/4GiCepLL3
X-Gm-Gg: AfdE7cmbnqvGoGi+9Nmn9m3/rTHthYq7iT0PpQhUTF0gGPsBWpGJUeTEqNZDUoWSPx5
	s+D+Vx2C1gWH458wpyfw0h54bKQKOVb2hQL65JJ8OjBl93mD4wgV91np2CoffA7D3GNs9aESVsW
	jA436DPNfuw7pRtTjGvaIX4FP3zUy5b9SvRESOs40hV4wkX4fdXcob8U8/ZRsLlwIi29zqMAD7z
	BaqOwlepg7atKHY3orsR/ryUyJ1YBQHQErujZpNQveBPqqvuizvGIqkdEP9CT8ComN4EOEoO6ow
	3YfDFzoqAEEi9MYZjoVCKGMXCj0sbtJL3ydBS0ucm+AFy6vy/rbqWtpOqtnO7zTbXQLE9QyMb58
	PAX8hfkbSIcxn1qqDTj9c+1dj/ZWm/2ipx8EgVXxftA==
X-Received: by 2002:a17:902:d98b:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2ce9e5a55c5mr115466935ad.2.1784009210002;
        Mon, 13 Jul 2026 23:06:50 -0700 (PDT)
X-Received: by 2002:a17:902:d98b:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2ce9e5a55c5mr115466535ad.2.1784009209304;
        Mon, 13 Jul 2026 23:06:49 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce95e001b1sm54110715ad.66.2026.07.13.23.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:06:48 -0700 (PDT)
Message-ID: <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:36:44 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tty tree
To: Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <alT5UdRqcfFmadZT@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <alT5UdRqcfFmadZT@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX6TWpz44RGMj8
 iZmX0J8ghauKchpZhMcdgD7nMUuOXrxaVMPKHlGWkhVgSU4Pbi/+dEDRARPTAqGidD6WUnGQ8tt
 Z6kjzC5hzojmQ6GkpgMY6VNyOWBi8rg=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a55d1fa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=0hzE1TLS3jpHLTwOLyEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: pf7i7o65fPS-JI9dngDUk_7WgsyqmQpF
X-Proofpoint-ORIG-GUID: pf7i7o65fPS-JI9dngDUk_7WgsyqmQpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfXwLw4bWr5qgmg
 JvdxeR/jgyMMpZ7xiOQQqzScoJJL2tBynK78TMaFhkLn7hR/X8UiVbJeIvwa2s83PONyD6CNqi4
 3GuO/I67+/nnIWZADHRiNZFdQhEgyIPzOJvVIEoHcurN3Dc945wSNlYu40fDWX8S/v1nHW8eHce
 Qze71BAnbUSdFHS1laSLVhs0HeF0rBEe2rHzNNlBNNgYmK9pQLrHMmD/g8WeTuzHxvN7t16j+Ea
 B9uhxsqeo9QEK+9CO1KrFOKsHjcn3d72cK1bKT4ltiY7JKgDOR0QFy1R5Er0p8l9qvCOMT9BSfZ
 FK/1U55KeIAOK19v/i/eGcJc7N2Q5ubnaipiLFLKYjoEqsE8B0dAqay6/v+6RuMN/UyIBogcOWb
 8mcwzVmRv7UmgNm6DwclW63GWuy9uuymPft9dClXv+ck3UP5/UIGGqNgtGvwBp25qY4ROYaULio
 +uuO8Hjx6wWuBKlnQVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140061

Hi Mark,

On 13-07-2026 20:12, Mark Brown wrote:
> Hi all,
>
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1925:4: error:
> cannot jump from this goto statement to its label
>   1925 |                         goto error;
>        |                         ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1916:3: error:
> cannot jump from this goto statement to its label
>   1916 |                 goto error;
>        |                 ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1911:3: error:
> cannot jump from this goto statement to its label
>   1911 |                 goto error;
>        |                 ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1887:3: error:
> cannot jump from this goto statement to its label
>   1887 |                 goto error;
>        |                 ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1881:3: error:
> cannot jump from this goto statement to its label
>   1881 |                 goto error;
>        |                 ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1872:4: error:
> cannot jump from this goto statement to its label
>   1872 |                         goto error;
>        |                         ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1864:4: error:
> cannot jump from this goto statement to its label
>   1864 |                         goto error;
>        |                         ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1848:3: error:
> cannot jump from this goto statement to its label
>   1848 |                 goto error;
>        |                 ^
> /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> jump bypasses initialization of variable with __attribute__((cleanup))
>   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
>        |                                                   ^
> 8 errors generated.

I don't see these errors in my local build. Is there any specific way to 
build to see these errors?

Thanks,

Praveen Talari

>
> Caused by commit
>
>    3d71f8d7eeb37 (serial: qcom-geni: remove .pm callback, use runtime PM in startup/shutdown)
>
> I have used the tree from next-20260710 instead.
