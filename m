Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05791D6187;
	Fri, 27 Feb 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176590; cv=none; b=PJWdYt3NZdqJxq9CM/FErMcP7F2yPou4sCAHyUmIRwukN/k7FU2jPccMFBQtc6eCcOwpXCxyyEYraVQiOYLevMI1fh+m7d8YSqU+EWGygMjfD73kbUbC6e2zEebxh6ctQLKHkh79Y+XcVMokXccEJj4efx7qqusEwyjuBTGaGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176590; c=relaxed/simple;
	bh=wHj2y5ew45HfVKi2euSTCuHkpzI3ucqvYU76g69tx8Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=s6l+fRSg9bzW/GDbumMXIfx0ai0E++9j+jPhNmRWKvAWrPDsaJ1cmgS7v92hZ3ehVvqTNtUbr6yC4Ao3DwFjEv72WvFLww9Kx78UUJzWSR3IF0KNLfSZsavf/H/IXV31EVi4oxrgesWr7USIJlzeCLgkENO6JpPdmj1AXJxmtrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LzkrFMbi; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LzkrFMbi"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QKuixC2733894;
	Fri, 27 Feb 2026 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=wHj2y5ew45HfVKi2euSTCuHkpzI3
	ucqvYU76g69tx8Y=; b=LzkrFMbi2cBb1Q2Pphs1XEPzoke9TrwCHJbkJWQDtkiq
	E8jt7UO1V/ZtYUHrzC3YwGDxdF5FBu5l6y8eBbkQkijaJ0Z690mhGzYuJ9Uc7KMh
	yk/XCDpiX7HUODTGrvXKW7JYVw0VErq0qfT04yXWM9+xOnEVTcMaHi8W4wWbk7tB
	8pxFxB6+JYI2L62mIWC5HljNjKgFPgdXk7R8Yyl9ygWO0MxQnHeY+7FA41YmbVfA
	YYg25Y6uDXWSW1AEuXvi/z3e+SFxNVRIsePJukKt/w8v8aTyEkhS42ZwQpKyj2GF
	iha+/+d6FevV2gzMtrED8FMCAhuQcOlOXJxjGGKakg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4crbayv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:16:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61R76xgg001653;
	Fri, 27 Feb 2026 07:16:17 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1ngtpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:16:17 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61R7GHnZ26739410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 07:16:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08CD758071;
	Fri, 27 Feb 2026 07:16:17 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC86F58076;
	Fri, 27 Feb 2026 07:16:14 +0000 (GMT)
Received: from [9.61.248.160] (unknown [9.61.248.160])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 07:16:14 +0000 (GMT)
Message-ID: <2b5eda65-a1dd-4858-a6e1-ac2f183ec410@linux.ibm.com>
Date: Fri, 27 Feb 2026 12:46:13 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [next-20260226] static assertion failure in amdgv_sriovmsg.h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MBAWqL_58FqcIbUn9-pRyLugzUL7io88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2MCBTYWx0ZWRfX0J1tS8LUaMac
 ROLomPjLBf5SkWdZ23QSRNoFp0LHJoh3Z/R4UjKPSpZkBc+ou9/BDsqhUbuBRto7k/brQtl93pH
 lzxJB/fW3sfz2kUccu2FQVqUGvZunel8Z1P8QdlukwuWYL7Zo9WCnOkjid0LoEf9AGIkcA8NkvP
 qnkZnhiHkCR/TeKNybuccJiTSwX+LA2KiZTfDJYpqU2eQgsGem0TXw+xONsZYNW/SnZxKgf7AZK
 FwuhMIsnNdb/HfDvXXhP7+uSQYhXJKoXzy6DuXCaBw6wjJdbAkFL2zmofmPzTOIJIrkEyMxnJNB
 Za1jS3etz/urupIeW6baTiw6U+zoc3FMpY/PLwBkI86H7iM4qFfTKk3t9GVoYyjeRh8SX517zLz
 zSjHdzdrDbEKBOVl+oBnt+hVqAZRRQlo6afEKg+GisUXsJI/6W8ya3SOJbjYlEUTC5agtLdykw4
 HuvcVbIuFYo05hDFEdA==
X-Proofpoint-GUID: MBAWqL_58FqcIbUn9-pRyLugzUL7io88
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69a144c2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=w9wf-1yiSp_RLEyCJ0MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270060

Greetings!!!

IBM CI has reported a build failure on latest linux-next repo.

Build Failure:

drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:521:1:

error: static assertion failed: "amdsriov_ras_telemetry must be 64 KB"


If you happen to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


