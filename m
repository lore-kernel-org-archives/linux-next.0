Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A7361DB0;
	Fri, 27 Feb 2026 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178234; cv=none; b=EYpc45CBRwJi5X7rVj2FqzGEOQCAE4A35z6HdWURepCqScQklcg4tB66PHrIbXRqW1hCkS9NY/T/KeUbobeD0kfw/DTKbMJzp7LgaB7ENw066jUJF+VPw9uSckjd49zhY3RZAkhCHUo0R025pVLKH7zDw3bHkDmvxiWOQQDLHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178234; c=relaxed/simple;
	bh=oChyQz8KBxZ9fWcR0rEsfA00ytDDvLdIXjKK+uzVkek=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=K3xuRCb7YETsc8YRV3YLga1MAcMe+Jp/dMt2g5KDiBUVktWypl3yP/+/2zM9CWagOivjwu4LzRbCTkUssf9PS3JTYhxp0PqxKHdCkcM6stZoqZxw23j4hwTl/R5pykdeAwY565aKEQSoCv+8zTLi63N8mUXd4Ts+Oaou9geeKqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=f8N7hLLe; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f8N7hLLe"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R6Tq8s2750096;
	Fri, 27 Feb 2026 07:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YZAmYV
	KAHaKfhJJk0dIamuGMsroeax4aMbFavjE10yQ=; b=f8N7hLLe9hlmNt8dsWfhB6
	BtgvJh+lX/Z9lYJeWY58JTKbQUpPg0c3mX6aM3N1l7XT5EzohdZEJaS8TWWHYU8A
	IiOD4v8ECgIRVy14DnRRt7bidhdqiyQd8wc6yu6tnuUoeIqEQg6Qve5SCzbZQe5R
	2N3JTn7dTNhLXXODm8AFv5FNm92VpGvIReXfDAtgBFZWWwOO/UlRZHq/dx2wFExP
	Lp0l6aI2bE5S4r1ii/nNJYpz2VluPpG0XWqTqff0xpXJSyaSVMFBrGSLPRJRr689
	8gl6fFSpv6ayzHQ66k41+/9hrhtXSf6rnUfks6kikZGKN78uhsPNrcg2ir4mj0dQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf472bjmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:43:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61R5CmUK027812;
	Fri, 27 Feb 2026 07:43:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfsr28nwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:43:46 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61R7hk0K33620676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 07:43:46 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F7E258051;
	Fri, 27 Feb 2026 07:43:46 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F1855805A;
	Fri, 27 Feb 2026 07:43:43 +0000 (GMT)
Received: from [9.61.248.160] (unknown [9.61.248.160])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 07:43:42 +0000 (GMT)
Message-ID: <21e1fd09-66e3-46b5-b0d7-cee096691267@linux.ibm.com>
Date: Fri, 27 Feb 2026 13:13:41 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20260226] static assertion failure in amdgv_sriovmsg.h
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, YiPeng.Chai@amd.com,
        jinzhou.su@amd.com, alexander.deucher@amd.com
References: <2b5eda65-a1dd-4858-a6e1-ac2f183ec410@linux.ibm.com>
In-Reply-To: <2b5eda65-a1dd-4858-a6e1-ac2f183ec410@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O-tYqmp1tIoy7vUYYCBZYU3xteEvwWOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2NCBTYWx0ZWRfXzGNorrmWhP4h
 KaiMPTchFsT5uYO28Po8u33cguv5IIt5jCyBc6U8C4NJH6f/Bm37hOk8rPlVd78mUNWkHBd6WDD
 FH76GycEKRZCjdQoqR9RFrQrGILgt0E3rTvI/YSsj15ijmtEStgqiuKruUS1EjtoBs6lDhNcyYd
 6eooReZC7IjUXQ1dJxdg+eLw51wJZ2W9xjriyi1Cg9RdcFfPoctlUT1kCI5ZPXrAum/Ni1S1rAj
 CYoI815LGFoUlruNCNwZR7yFCoQlLoOS/VPkSlAFMqg/a0Bsb6RtI4leb7PHXs4GiSWVR5jQK4M
 MkV0qfcMrj0S6v0UEqoH48buWp8DFsZQ7tb0zCTlMy7cyNqlRAwhf6WTcPdLCV/oLM03owFkcnC
 yUKfFiL+eotEdVjs/dkxfaxDjJRlXZQkS7vODp1C/SOLn71laZEC2zbKwNMsNShPfykiYLQg3qP
 E0VTnfM+CQzUVqnlxbA==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=69a14b33 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=-mW5i7DV_e8FodwH3HIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: O-tYqmp1tIoy7vUYYCBZYU3xteEvwWOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270064


On 27/02/26 12:46 pm, Venkat Rao Bagalkote wrote:
> Greetings!!!
>
> IBM CI has reported a build failure on latest linux-next repo.
>
> Build Failure:
>
> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:521:1:
>
> error: static assertion failed: "amdsriov_ras_telemetry must be 64 KB"
>
>
> If you happen to fix this, please add below tag.
>
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


After reverting below patch, build is successful

cb48a6b2b61d7ebf2f1099041067800ffd8a5c2d: "drm/amd/ras: use dedicated 
memory as vf ras command buffer"
>
>
> Regards,
>
> Venkat.
>
>
>
