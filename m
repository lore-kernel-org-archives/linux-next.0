Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162AE1A5B9E;
	Wed, 11 Mar 2026 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246619; cv=none; b=TtD1hWPSnjn5wj9ee6E5BPUtimnwHA5LLXDbluwjr6p5FAU8cfP5T+SSB6DJxQkQhzuNw8TsvicQAtxKTaBhUMPJbKO1hKd0Y05XA+kVGYV9V6gkXJPGBVUWwifbBBwImpIY0bgTdblbI4uwnnlBMP4BGowO6fhuHdNJl1ygQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246619; c=relaxed/simple;
	bh=hupwu4yaioqlVp10S5xo703qb/QypTH8xQ3lb6+Phgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0fc7XJbYO4IlZILSWOjqz0As0w9aGFtDmMdzx+YAhl3Fg4C202Bm7YrDGwYVVXFvoQRgoPOfBBDSyXHLBm55IsMC95YIAxVb2RRAlccH1NSz4rBCZnqKaWHlI58YGl68NzI/sW9EWbbc/v98XbOceHY8NiSmTdWwnXYFDiuNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=o7fO29BC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="o7fO29BC"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFcCQa1913204;
	Wed, 11 Mar 2026 16:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=sNgc1FgTCmFpcP0bgsKNsD02KTBmPi
	kye5ErpfvnkHY=; b=o7fO29BCYaSEqWSteBGfM/fGddAJm2FXxl/keQBB0oyNw5
	Vze+Ri+bI4PhcbE1cRVaRGBg+059RqJvaTtcUJBgaRaywMPPn6ayry1nEYHklBnl
	b2A+5UwYsyK2CZYZd3C5fkYnRZJi9DIv6U1j8aliFKwnatfN8iwFEGaQlO+5Tem4
	7xSZb7uoxwChNrAR4MIqjhS1G45I3gQ6SvVxgqV9CeLPR2JaL8rzpTsB/59sZmCW
	UhHaiEjMDwjjMHr7yxqABscnx3C2y7nchpilRQldJKdvMEkGhJUBdM048bkQhYoO
	xzu06SnYdmqotW2FvyPvL4EaOA5UPw0bKqqEYEnQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcungasw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:30:10 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62BC6eWJ015652;
	Wed, 11 Mar 2026 16:30:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4crybne727-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:30:09 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62BGU7nb53477726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 16:30:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3B0020043;
	Wed, 11 Mar 2026 16:30:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3078A20040;
	Wed, 11 Mar 2026 16:30:06 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.39.22.251])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 11 Mar 2026 16:30:05 +0000 (GMT)
Date: Wed, 11 Mar 2026 22:00:03 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <abGYiyHJHWOgH65W@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <abGBhmJ7827npf4D@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
 <feb7b428-eab3-4cec-a004-6067e621398f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feb7b428-eab3-4cec-a004-6067e621398f@sirena.org.uk>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HiPFUM-tkHmQTDOhVw0YwFtEqEyZ2oqo
X-Authority-Analysis: v=2.4 cv=Hp172kTS c=1 sm=1 tr=0 ts=69b19892 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=2J0290HSAiu-1hiOYkgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX7BzI1L6qnAzY
 kAsVQFfUM7+HcTZRxZXWISjfyKYWoAAO80+TKEZNzFIkZyX1yM8aZ7wFBUxzYPsL3INC6JWRmbo
 zyIIZEticJFIXkKTYTb3AkjtQuSRy88N7RJ8yL+rduapOp2YtDuXimC/KjidR9c1L9238gGnsS5
 uGYkofN5bFnvKMdBWmwnT/G9WbNJNPnw5kzfsj73hiQ7xa3P9ANuUZDo14RK0pi+afVgSiXFg3R
 9TLYb/eoV8/sGcsJFt9M+mRLZf8RIjiZr8DKsahIjlkCqVYdjc1seged+zWUExaPivq50w3z5vC
 yddeRSi51jNRhOIEIHKB4AwqWZFC6ELJS4lKKnJEEXxrocd51hoO/vN6A7/XbWZ1WSWCDcV/rAx
 XX+2xYrGl3BllXeHp4dVjugE+4I2pqEjQArF3vt4KP1n0lOeWu3cZnjxFkJqJ/xjdlQ5h8dYCZV
 ZAGoPTwamX0qeBVgiuQ==
X-Proofpoint-ORIG-GUID: HiPFUM-tkHmQTDOhVw0YwFtEqEyZ2oqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

On Wed, Mar 11, 2026 at 03:20:00PM +0000, Mark Brown wrote:
> On Wed, Mar 11, 2026 at 08:21:50PM +0530, Ojaswin Mujoo wrote:
> > On Wed, Mar 11, 2026 at 12:00:20AM +0000, Mark Brown wrote:
> > > On Tue, Mar 10, 2026 at 06:28:30PM +0000, Mark Brown wrote:
> 
> > > > I didn't figure out what the source of the issue was, I merged the tip
> > > > tree from 20260309 instead.
> 
> > > with just tip/master.  My KUnit command line running on current Debian
> > > stable is:
> 
> > >     ./tools/testing/kunit/kunit.py run --alltests --arch arm64 --cross_compile=aarch64-linux-gnu-
> 
> > >     ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 --cross_compile=x86_64-linux-gnu-
> 
> > Hi Mark, I'm unable to hit this bug with the 20260310 branch [1]. Am I
> > on the wrong branch? I'm using the following command on x86 machine:
> 
> See above, because of this test failure I did not merge the current
> version of the tip tree which triggers the issue, you need to fetch the
> tip tree:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master

Ahh I see. I didn't know about this tree. Thanks I'll check it.
> 
> > Also IIUC there's another deadlock issue you are
> > facing other than the one here? Would you be able to try out this
> > patchset [2], it fixes some of the cleanup related functions which might
> > fix this issue.
> 
> There was a delightful issue which is already fixed in current mainline:
> 
>    https://lore.kernel.org/r/20260224-mittlerweile-besessen-2738831ae7f6@brauner
> 
> but which was present in -rc1.  I've not seen anything specifically
> about any ext4 issues.

Got it, thanks
Ojaswin
