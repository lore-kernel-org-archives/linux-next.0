Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596580;
	b=4/8kdgeeIkOYXZCA++8rTXPXtWdyeFbyZONI//OhNFvhwDjK9OItqvMKpXKv2epjLTr/
	 76lW5ng+T679/cSBfw8FUcbpAjcBh2czy+akm3hH6CB2N9SG/X9SMNBc9n8DVjxzsskxu
	 FT0tXgb4O1zqyKtHi1vWCCh7lj9aD6gbYSdyB/kwf/H1SkINrLi1z5buj05FbtcGqOgZX
	 Y7CDJmOEjT1HDZuW+3keofm1YpV+EjE9kEM+elOFbBqSYzJKkwBqXspVdVZialn5rpjB3
	 bFbQRf8eHsPVnESypwFFV/qBednJn1f3rQApdnB5HEFy/oBJiDUiIVCYrNst/0FRUsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:To:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H4t1EVtaXkcGtMu9xxuJNeL+QmrD84yyTILROqM3Zus=;
	b=dzjym0KesarROOkxm583vvu4IZCtpIClan49mcen8Am1ltA9HubXbxn8QeAyGrqoTC1P
	 m1ZPQ6EUMmtedGTT3EDrZPjV5d+5Pb72T0NWQ4040fBp9TZssdW+LbRGTyjsfQh7zU4Ms
	 7YdaO+08L2i000yVAwNB7uxlJPNv1CL220EPBbRW+lto2SqSKzoNR4eT0bF0jxjyc4tLG
	 EIaLJFhmw+WMZAAXj5UzaKOUbldq46l62qqo0YySnFqn0s00wMK4cWp3BRhD6iWYBjUtC
	 /UTphjxYB/PakkAnUCu7KAWNX0xktCDQE6tDXSy57GHKXKUwOciRw5Wl/9990sX9RmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izvwF+h3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYaxTjzB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D73606A334
	for <linux-next@vger.kernel.org>; Fri, 13 Nov 2026 19:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D73606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izvwF+h3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYaxTjzB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ1DYX1289269
	for <linux-next@vger.kernel.org>; Fri, 13 Nov 2026 19:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H4t1EVtaXkcGtMu9xxuJNe
	L+QmrD84yyTILROqM3Zus=; b=izvwF+h3BdZBnCxBKyyQJKy+xVCXIHrKQpG52E
	BJGtd244FSzExcneCkZPgTm+UpiBirycFWx6H873zuVoa3fOa4THDPfjh2tS7jD6
	xkH4FePI2HKI2Yaww7JHtQHGdzDmu73Pd9idjAuldOyUIF8JCZ3DnIIUIrSB/Zh/
	+Vd+Eq6E5vIUkRKz0REhw5/5OV9CePSge9bQ8AFnjoY8vd8e5HxmRHg0O1ESuEJJ
	WbcQatawONUTjitjVt75Wt7LTm+n6btGA+loJLc52NBxz6vnop+i1EbyepLthYUN
	iJ7l8UDWIsBpqmO4smaSIL3OFl4tbohTzoFXVdAn9/lcUe5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jwmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 13 Nov 2026 19:02:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f12cc95a0so29716136d6.3
        for <linux-next@vger.kernel.org>; Fri, 13 Nov 2026 11:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596578; x=1795201378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H4t1EVtaXkcGtMu9xxuJNeL+QmrD84yyTILROqM3Zus=;
        b=iYaxTjzBra8aKMYmzPDEp3HF4XPw8oU/fbteCYaQFv1Md0Gf+tUUajjqoJt9tiuGMY
         9/bGeuqMDNL9si6jACTc5L6f8rzIvw1Ll1xp7j5C1P2tR3nbZ4LEaR+zPM7LouxN3Qau
         HxSdbw4m8y5m100w07vOJfPSJxPFWZIoYvxln4+D5BPXX64YUN3w33+C5IWLGUglJBTZ
         Ocu1zZVK0f8O6x43IlHhXeJyNuc51vWUDFsHP5pCh9RuGvn3C307XJqxRBTLFB9/FaIL
         ny3CcsZMe78UfHLbb+NVpkg7Gf989AlkfpT/eWNCgGv+p6p718iitwCdHCWhjBA0JbD0
         HiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596578; x=1795201378;
        h=content-transfer-encoding:content-type:cc:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4t1EVtaXkcGtMu9xxuJNeL+QmrD84yyTILROqM3Zus=;
        b=aYkvdbi41ZQCjDKcc3/GPJZoEF54MP+hBlWarOOb2BaC0yO1nXoMMUBHfxwjxtSxQf
         DXOX9CFY3wZAq/0YyP3+C7UhNpzzuPuYF5SGMeS8BiqvgOQFd5eThhrw6Jl6L49Fj0Tx
         1P5DFkPFglubk7gIqyowb6vsoTG9L5i9SZ+bWBoqaKqARsSTmTdOmkb5slLjHvNK/wD8
         BawZnAyToiQVa1pY3FIwpmixeX/QY7fJ6dGrOeInrmFi5wR2KBoFoP9jaSdgEZo2+E7e
         Xl5ifoL00GhAC4/7FWmHK1arHGUO9L7HCly+6XPj5uYPLVZ4FPU4l0mcOqP4MyE8o3xN
         L5ig==
X-Gm-Message-State: APuU4Z8sPZTlumJJXSKFWrs7/Ews34QmsXaun0n1lBw4KBguYuME6Jna
	0h+3+BRrR0V06oGyZWyR1zSpJjRkcpiktwJ2D0HL92As7fasXSlsLcqFF8efvXm03Ehp8ud4j2G
	wjoaSxyZn6F7ysIUu3Ga1l54VZJVl+uXyztkM2JvsPe+wpdVJhaCGPlHJSaHzRe55LSsBpHKa
X-Gm-Gg: AYBFou2DL9z94p/4REXj2puuITHpy2kc+6FgGJ67q8C1IpIG/Tw2EKr6XBI8yOyGYc/
	3Ekez0Md6n6oAFWHxzSciKhSZgVnK0EXfkRNvDsrjdNXp04DedI6VEztHK3Vjp97/S9oMKTyhZh
	CnONpRRPbiD9UHJADwgrc8VVDcmX/uWQqdLB4dBw31M+1l6HMKoTu8dRZ6GQfE7WGrsXKj3n8t/
	t0COLtkEpwrSXgRdjTPzUbReMwE+Nh9Xmi6Jrl4xcpAaT24wrsSkOYp0qVwifK6chDGZJjZizdP
	wJxP80LOkONPmqKl3ZU/fKQAukBZIR5uuAGBGNHsCQizILn9OefF7VjpwbsZTgJInR/iz7nG+Xi
	SBbt5oN8vuR4hc2+Ato/DC7U6JE9GQud4iBkhKpXUz/FILDwE77+CV3agRbJzpFPfVD4sM/YVQv
	4H
X-Received: by 2002:a05:620a:2911:b0:947:774c:9170 with SMTP id af79cd13be357-9494bbdd042mr618536185a.14.1794596577831;
        Fri, 13 Nov 2026 11:02:57 -0800 (PST)
X-Received: by 2002:a05:620a:2911:b0:947:774c:9170 with SMTP id af79cd13be357-9494bbdd042mr618531585a.14.1794596577188;
        Fri, 13 Nov 2026 11:02:57 -0800 (PST)
Received: from [172.31.27.103] ([209.52.143.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm247463285a.39.2026.11.13.11.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:02:56 -0800 (PST)
Message-ID: <47317123-f03e-4031-ac4d-b1f06098e2fb@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:02:54 -0600
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
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: broonie@kernel.org
Subject: hexagon tree inclusion
Cc: linux-next@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7qInbrZOyE93
 GUr+2eBGWrZKxlt7IfX4ym9QV2Yq2IJlQsZwbW+yoFV5lZASgzs6kdKPF0rs7up7FShLxSJAwWb
 CDN3pYiGt6psP8XRJmc/Y/oAZGToQxc=
X-Proofpoint-ORIG-GUID: D9prAh2DNRa7rwRTdUqI3-qBz5Y7PTY8
X-Proofpoint-GUID: D9prAh2DNRa7rwRTdUqI3-qBz5Y7PTY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX8fUr3Nzvr0wB
 u88tDI540kjcMIiZkbE3zJc3tsNrgnQ0j2jRzmmOWb6Rcx9O8FXNFRnxZ5g1vQQADO8v4Zd5pAf
 nJDrjg7EmHL7f27sOPz7Ys0B7nujN+C+N/LLdRZYvuCnqsh+JR7lBGW77HuysHtMCdvgVvaTv5t
 ZFHXdGi9p6eRNlB+vQkWxSYl4wRhMZg9jtf7d6JupyJ0AL8ZLvHzOU14S99CvUgezutkEmOpOjk
 ESeT1pyw85xVDQoT+RRZX8HY4jbBDU9N/Q+VKSzsp8MEQzjgwBPpNCWdbM9PT+Nwed4FczQj0qB
 lTk4xfO23n6qjOVcag+OxrrgiWruzK5G4cAK2jlWNz95Klw8HQXNhJuRqHwsluxyCkv+zjVEy5K
 LSan9mNjx60vxD1GhyLJ2BWNq4nJbRWBoyyYydsikMwRF0/XcaEVnXBYNWRnDqVpIdcYNk0xBV4
 e4pi+vm80j2TG1D3zhA==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75ee2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=U2bLIKXb3u36GtQyNyP1yA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=94C0Y_HwiBsfgFWYkw8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Hi Mark,

Would you be willing to include my "for-next" branch in the scope of 
linux-next trees?

git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git

-Brian

