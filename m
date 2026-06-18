Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5C37DEAA;
	Thu, 18 Jun 2026 05:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781759538; cv=none; b=SDbvFYrRdF0v6RXs2vL14ypHldEr/lz2cmd7zAiXNSkbOIqVLsZXy7a7avjvNNw4BmausI7XvyEHt+rIPqiY3STgCF1s7zTzwkOuImY2cSA7F0324f0fhym5tYSxJFJTuKg0/w38qHBVOuuS8xCfMI2DJQxFcQlHo3BrrrajW8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781759538; c=relaxed/simple;
	bh=xq7N7zfuOs/vrKAHMbzwpVv29b6bm3U1F93CTEKibiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bH2felteLfQnu+KaxC9gfpf2ujw7wtAndY3dW1ObKpe3yhBAkfSq0oZ5WwPcZkAMO78PN2Ubzo27vqgYmnazNDSZD8e5hbmAvxyI+IQzfLtG9ZUK5Ujoc2FqvffeHuRz3PkThUkw1d7ceaqiABydJdmrei5FcNtuCB8EdNgKQjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PcmT73u2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PcmT73u2"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHmFEZ1250799;
	Thu, 18 Jun 2026 05:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xzVk8BtOkUEin8x6+GEhQoxhToslMq
	+LW/RqElatXjM=; b=PcmT73u2F3X9Enp/cMLoEavYVrTKDgmMf+HqcOACFBg9pT
	1vathXRzQOXCHmgudOncinKK1xJDhrsorQRe8Wi8znh+5FEeisUUFnj4ofaWzPpS
	xsuf0Xs/epYwi2NZAcUstFOGfyqTMDgrObtZ5A/CICDZXpbE1ZqI8mZOkFkwpMJ9
	L+Pl/r1jr63R6FPbyRTfeilhx+8Z557HYc0S3dq+uxQD3Mw+81cq6fRikeirEwHS
	U3WKwtXynW3CeYBFZsojDwhNF5Ujbluo1jM0AqfVPKczqIQpquLTanuBmBneBQNR
	v/IAqOP2/8MIGg2CGr0C5y4Ye2rC2gpnLjl3bSRg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4euequ6dyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 05:12:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65I54e2d020520;
	Thu, 18 Jun 2026 05:12:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ev17223er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 05:12:14 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65I5CDRV28967276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jun 2026 05:12:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F4BD20043;
	Thu, 18 Jun 2026 05:12:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED1852004E;
	Thu, 18 Jun 2026 05:12:12 +0000 (GMT)
Received: from osiris (unknown [9.224.90.220])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 18 Jun 2026 05:12:12 +0000 (GMT)
Date: Thu, 18 Jun 2026 07:12:11 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 17
Message-ID: <20260618051211.11310Bd9-hca@linux.ibm.com>
References: <ajK3HJdAhHJ85wYq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajK3HJdAhHJ85wYq@sirena.org.uk>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA0MCBTYWx0ZWRfX8xVJSbGxYz/z
 WjosQr9qut4q5wfABqS0pq2kPBkT8XTPq+LaGEKxbEFMR/6x863Hon9WhQTLcW1N7GI+WTCQayG
 u+7ZG93Eq2vRbjxSHR2voGwoWVe+Lss=
X-Proofpoint-ORIG-GUID: blYqc22SfmjwqWDk6kY8dTIGm6R4ISnA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA0MCBTYWx0ZWRfX1PSaleJLhBRf
 +ujRzR4FvQIW8unpKFzwMJoQGAAodQoC/vXO1mvUAdjwA3hmapXSuny/KEqpBzPr56k6xu+MBqb
 WWSd8/xN5cizA87j5uOPdzR01rgVLxCvaGE0c8LIGLvscBc6tr2cKU2Fc6/hgspfS4oKFK8ibx+
 R9mLA8iD4d56QrODRn+oiTpZmLvoDdyFjjUBaF+hEhD69HxY63K/j5vcvSFHzKC/hQYgK3kBrza
 4Xq0Nx+nEwmN4NgktvF8uB5tjUBYPAQR77QXxa8xhj8R5y0Um2ovYpgBnq6nXybfbF9lS+3J4qX
 npkVmbA/vmp2rZwYXDc5ZsnK9dj3CQSa+20ZcIyekel4bfCcae0Hb2QESMRKOQmGRbV7Ff+U4Jm
 Z2XZRwAwbMM4kTNDqwq0WPV+jpMgrHvxt8Fs7EptXeakheLRAWh8CPwypudmVg1mVy6ZW2SSOw4
 uLNirbwWkJtJCAHkDaw==
X-Proofpoint-GUID: blYqc22SfmjwqWDk6kY8dTIGm6R4ISnA
X-Authority-Analysis: v=2.4 cv=L9gtheT8 c=1 sm=1 tr=0 ts=6a337e2f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=oDeimqkm5d29qoZsCbcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180040

On Wed, Jun 17, 2026 at 04:02:52PM +0100, Mark Brown wrote:
> Hi all,
> 
> The merge window is open, so please to not addd any v7.2 material
> to your linux-next included branches until after the merge window closes.
> 
> Changes since 20260615:
> 
> The origin tree acquired a build failure for which I applied a fixup.
> 
> Non-merge commits (relative to Linus' tree): 6079
>  5884 files changed, 298566 insertions(+), 109672 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Any chance you forgot to push next-20260617 to git.kernel.org?
At least I can see only next-20260616, including the corresponding
master branch.
