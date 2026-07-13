Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79157346A14;
	Mon, 13 Jul 2026 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968385; cv=none; b=jIyng179x1a0rDFqBk84oAL3thtbnAVb2E+eqXf64xCaYYl/rTfcFCb/DjyWfr8FVYxd0Mq4we2ICIVznS8TpXmEe0HJhAehR+VTWXqHLD+S26Sahsj597UBGlRXTkEZBNzJLtGwTrM8Kfv8DX0jiq1gqsn8AORSumSfl3yyLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968385; c=relaxed/simple;
	bh=wuB97KRRoYgexJsUnIwI4no3SS0yys0Ni7i2F95Wp4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ql1QpTF33QJtybxlFLU/vjHaRXlw7Wn2cgFYaJ3h9WRPM5/+u0kxe6X8lUW3aRLKNQuMb2G95hPR2rf1Qns0XK/reXsWtRmFIOR3YLlwjZMr+cIbVgAYDPX3SHn4KRqT6KOjsQahHqqnNpI2dUAyeT8l0RiyT6qWXZ1H9+U5l2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iXtPC9qc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iXtPC9qc"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DFEO5V2835979;
	Mon, 13 Jul 2026 18:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Utw+P8
	3V0gV9KYP+hrt6/cHVkber39CUhZYlxlF5I+A=; b=iXtPC9qc1iJ8i5TXRN55fw
	r5/CVUmemyEMHnBCO+Q5Ju/eKX1CL5NPHA8hYrm8LVr2CzoKXwFrGy+QRl1yfl/d
	rYVpJbju/sdisXtUkVBHY+Urm6/8LyXE0Feg2E1LB9gFVNbzup8U649qQeaKW0vY
	ImFDbpSQ63GQx2I6OUkxjiQsWXtDBaivdIPEwK2+GbUDRvwmz/77u1KlZH7XNgN0
	V7MYlRlM9BLfNzOWiEfNIQFGEW9M9lB+0S3ACgiIhRxuRgOC2KNT7HI7jjgBEQm0
	JDtIyvi+MaQwrnU3T0P3kV5ZWl8yJHAvZdLvmbiNRIvft26NpCZgE9/ibVH2nmdA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbepxa97v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:46:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DIYcux029861;
	Mon, 13 Jul 2026 18:46:20 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc05pyb86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:46:20 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66DIkJaV29295210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jul 2026 18:46:19 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CB7E58052;
	Mon, 13 Jul 2026 18:46:19 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1873758056;
	Mon, 13 Jul 2026 18:46:19 +0000 (GMT)
Received: from [9.61.45.33] (unknown [9.61.45.33])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jul 2026 18:46:18 +0000 (GMT)
Message-ID: <ae09fc06-ce41-424f-9643-5051f6256fdb@linux.ibm.com>
Date: Mon, 13 Jul 2026 11:46:18 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure in final build
To: Mark Brown <broonie@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <alUWw0b334Y1AiRa@sirena.org.uk>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <alUWw0b334Y1AiRa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pCYod_wa8MgGb0JbKnsslOZHSYbZP8An
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfX1XHEv5cmYcev
 S0sgmoMRxCa9EHUl5QVjrQpKCqd5P/88Rq5QFBBAI8gJ4qhhcKFVv7EABh4/CLlZ8a8RtImH7HI
 9CAm8hHR13k/dTpotDceGHTgsEKff48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfXyvHTadJC1ljm
 IOd5TGf7LAIJkKPkSef6/7lLH1twlb7JZCIWstvacFxGKVd0rLvBg0+4PUIQmKaBJCyzO2IWtmX
 ujR6czvCA1/G3sfthRXyMDQ9f/SsLLwnDvuSy2fyVWLjc6ZPjh4ErxjF+p0/YZzfPd04eOSLJO7
 1Ha1Y9k1JuRHvFn7g57GyA2HbSVdpYnS792Dn89zGJm3MDqN04+y4GLDbMiCrL/5PChkGDRb0hM
 Y4ZTWwCVXzhrKpvT7bg2VZFWOgxKJwJXu/zWWKinJIOwqE4NPuyvZBvBDwhNuLzCnifPRi/Z0H+
 NnyEmeCHwT1zCDLqEuOSKb7OOIOLoPxb5/qnbWPxpNUXkFUiEeHiv/OGpMsjQFMSgIhvkZRE//f
 nolpqtNIQQNwFEyuYPlcJhsDM9Qx4TGV4q8FoYSvV5Xc4XzDbSyPXbyN/yYOXM17FSTyzahSASK
 m2UAUhxBRWmzdSFNdlQ==
X-Authority-Analysis: v=2.4 cv=XbS5Co55 c=1 sm=1 tr=0 ts=6a55327d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=bWSV3VBeTOtE9Txica0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pCYod_wa8MgGb0JbKnsslOZHSYbZP8An
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130194

On 7/13/26 9:48 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the kthread tree, today's linux-next build
> (powerpc pseries_le_defconfig) failed like this:
> 
> ERROR: modpost: "nvme_fc_rescan_remoteport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
> ERROR: modpost: "nvme_fc_unregister_remoteport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
> ERROR: modpost: "nvme_fc_unregister_localport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
> ERROR: modpost: "nvme_fc_register_remoteport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
> ERROR: modpost: "nvme_fc_register_localport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
> 
> Caused by commit
> 
>    ddbcf78e8d230 (scsi: ibmvfc: Process NVMe/FC rports in work thread)
> 
> I have used the version from next-20260710 instead (equivalent to
> dropping the tree since everything seems to be new today).

This is from the NVMf ibmvfc patch series. I've asked Martin to drop it from
scsi-staging as I already had a respin in process to send out, plus I clearly
forgot to gate the NVMf functionality on NVMf support being configured.

-Tyrel
