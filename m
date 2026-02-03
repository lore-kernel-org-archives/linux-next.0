Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF09A396D09;
	Tue,  3 Feb 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111589; cv=none; b=a5AEtjDkL7WjRhEN8k39Qiyr0J9Kva2gfQxXVF70HXRMbXtYaJIfsfUT/BDQAnUZHwHYDgevmwzLnlo3aMZXFYYUhZfJYZhQgrougSVgS+nDBJgOASe3MMNTF7JOrAT/KQDIpmJkt9zvLqOYV+kBmkbT014CUAM4m0TXEaVlIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111589; c=relaxed/simple;
	bh=bj6wcH5XOkXjFT0N8pgBnVw5n77z+D7mHX81vSBerqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KG4U5NHRvTFv9TyzZsT4HhJs0DhoHAJU/rsRT47U+WHHjLr9K3KHwd/sFBuhP5cKAsIKg8W4UHiKEcFYOxTy2hG6eBPZepi9SwMP7lXbhTAfafOJaYGJWy2GUc3pY3OY8LOtGVR/NAh+GODZR9fnrFrcmq/rCIyY3FIE79fWlbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nfV/kYB9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nfV/kYB9"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 612L82rP004012;
	Tue, 3 Feb 2026 09:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nviGb0
	PfO8ho2ksD5sEuYJ5GXQovShNqzUmWXzkdElE=; b=nfV/kYB9pCs3QcFbJwULwD
	9iqeSG9CMSYl0zGlZKeK6iGzJOgclAA920eGSgQNEkYGjzYC57c/rtJMJbUHsShP
	ErUUd4IPojz4sMsWkG6vhLRf0x5QYBZTayMqNXlHPEhWAMhresnhBFdHT6I7Wa5I
	xYtTNJxZf02hbWRwgWUIWEQWAZ79fdUaYVtMQ+GTEr9tVTO9oQ8WysBQTHXR2/Ey
	cZ5jr+G6zscI73ZQz4J6v/2YDT8TsIC+pMgfJ1d9jPfhdQYK7p5A9M+opSaIBD5f
	YBGqAM17J9YaZQ4NMZqXe24EgGUQQLAtdzpJi/B9Wx8PcOZ22VX2mOHQcqLBDi5w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19f6cn5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 09:39:39 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6139ddI9001578;
	Tue, 3 Feb 2026 09:39:39 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19f6cn5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 09:39:39 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6134dtS1029068;
	Tue, 3 Feb 2026 09:39:38 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c1v2s8ns9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 09:39:38 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6139dHK423986878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Feb 2026 09:39:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4267158065;
	Tue,  3 Feb 2026 09:39:37 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32FC158056;
	Tue,  3 Feb 2026 09:39:34 +0000 (GMT)
Received: from [9.109.248.127] (unknown [9.109.248.127])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Feb 2026 09:39:33 +0000 (GMT)
Message-ID: <82be27bf-b6c0-44e9-8c09-7a5764f1db08@linux.ibm.com>
Date: Tue, 3 Feb 2026 15:09:32 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20260130] scripts/sign-file: build failure on OpenSSL <
 CMS_NO_SIGNING_TIME
Content-Language: en-GB
To: Miguel Ojeda <ojeda@kernel.org>, David Howells <dhowells@redhat.com>,
        Michael Kelley <mhklinux@outlook.com>
Cc: broonie@kernel.org, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        maddy@linux.ibm.com, petr.pavlu@suse.com, samitolvanen@google.com
References: <47fa2bc6-e137-4123-b00c-937a8fd82968@linux.ibm.com>
 <20260202130124.354758-1-ojeda@kernel.org>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260202130124.354758-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fhQGMATs5fInGxILt3i4B4K3kMyh2Y4V
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=6981c25b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=VnNF1IyMAAAA:8 a=NH0QSD6g-PdmOT69jSEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: sO4RY7f18Mb42fIpvgxy8BQkh1n4PHNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX9ENx4f0r9Pvl
 mJ4ishifcm1a7IHu7KYoHFpVWbqP4QC4o/IQviTMndpzMkIrURrXVfDTaRT845eVJKC0Jpk0keJ
 gIftkzXFkgr02PT73Q7dv4s8g3J5U9igB7hbdqkIaZr0h6p7jtI/cbel7gJn76zjsZqrlgHwzKr
 ig5aspCgRU20SQ0yxd4DKYohEKKupVc07KrLMQ4w8ZENLFTwovZGppJdC8z+2cYx7c6YJQUQDbS
 5ajASMUNgc4URPM6OKpF7lFqYgxOg+xlvlxB14zkyCsTJpzU4Cf/Up+mR/luGCAEIGgabivIQwg
 DS1a7apY9LDg3hax5gey06zZRp6jx2EhR6Sz0SIH3xoopLVpWdyr0X97/gayJ/xHEfiuV5Gz3FC
 8AIu1jOHzFf3EKSfl1xq2G1UisdT/Ze/3elBsIN9LsRO2CRXQg73Yh+ueGJhiF6Wpf4+o3Pkv/I
 JawoRHngb7N1vXBWFmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602030074


On 02/02/26 6:31 pm, Miguel Ojeda wrote:
> On Mon, 2 Feb 2026 10:06:41 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>> scripts/sign-file.c:282:25: error: ‘CMS_NO_SIGNING_TIME’ undeclared
>> (first use in this function)
>>     282 |                         CMS_NO_SIGNING_TIME |
> I have also been seeing the error this weekend -- this was already
> reported in:
>
>    https://lore.kernel.org/all/SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com/
>
> Could you please try the patch David suggests?


Thanks for pointing to this. Its working.

>
> Thanks!
>
> Cheers,
> Miguel
>
