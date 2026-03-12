Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11C390203;
	Thu, 12 Mar 2026 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297387; cv=none; b=E7N7A0Ju51GF/iVroNALnTBsT9BudamjMolp1NETnwe/PgirQcyyN6aHn3G1hFhF2r0Dvh/SJyFKzsVk395dqXXCaXYwUOeD/HDwDb+bjPIKUrNZ/dHROvaNBFY19zAWq0utZ5gX82RcIFjHcrX2Nvp22aKkQbTp7KWv5e8cqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297387; c=relaxed/simple;
	bh=asrV2jxNu/HzOjvHOYArnxtsVFExrQCtspWmPT5AIMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnjmXIvrFYwX7V/LOxFsYcgfShWsCcrQxRU76FItZJ4nhNlaxSrzYIYkwBffp2DKd+DNtVME39clGIyGqb7/YcGc9n72H2bo+lXRQfUTcVwaPLRUb5FTcj0w6PTJdUBpawhDWRHm5Bq73WjgnNoCYzuldK7mLgtAMgcd03v/Vp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=k2+MXUdC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="k2+MXUdC"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C4ToPf3001809;
	Thu, 12 Mar 2026 06:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=yHvDjdVxJcrJqXO3GZUOK8YdKTLhjw
	zImxdtHZXNxNQ=; b=k2+MXUdCXhi55L8/0qc2luJf8YaXjV79Rkq8u31E4gGzyr
	cs2k+e6YAxSVhhngo1cBokYrqFOLWpqUg5nI20dZOe+G+rmIbQdOKP0QC4y3jPLC
	GwuwbsqKZ3lr5LKaAXcWFQLcUNxXleyHNCwMy/pkbogVX9qNczV97YIxa75+252y
	TxSMyuuxhyjHQ/4eoQPvlfTsfcu5kGkycg/ELEYU5yPT0wjjNT+7GzJkcWUkclC6
	7ZBepBnp0h7oGNbTYw+qDBebs91cLmQU3JCOexMz1GRsDwcE7+s7KO2n6fuY58ot
	dn1KVYmI/RcMKaAnYKrNQfy/QFjHnwT0fmEvNkTw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh9699gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 06:36:10 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62C4EHD7025750;
	Thu, 12 Mar 2026 06:36:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cuha898p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 06:36:09 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62C6a8Tk49676644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 06:36:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15F312004B;
	Thu, 12 Mar 2026 06:36:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B4572004E;
	Thu, 12 Mar 2026 06:36:06 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.109.219.158])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Mar 2026 06:36:06 +0000 (GMT)
Date: Thu, 12 Mar 2026 12:06:04 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <abJe1PAf4JbwGGRI@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <abGBhmJ7827npf4D@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
 <feb7b428-eab3-4cec-a004-6067e621398f@sirena.org.uk>
 <abGYiyHJHWOgH65W@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abGYiyHJHWOgH65W@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA1MCBTYWx0ZWRfX0nY8DwyIXbJW
 PvrGaGIhtXfhKlWXaQ2PxBXi96memIRxriYVtYvXZkJK0c2AcjH0NUj6LfgXNS7hmQnWX4gqj2T
 B3EAjvJtEIejBI07cKkmS19XfB3+XlgvX4Nmdyn186eOXvJUXA1TpG/ea79Lm052v7OIsixSEOf
 iuyveDwQrxMbLJjOvbYLM0kdNEH0EAx2UAku7KkM8hYNt732tgUnNHOQAfjnPVwBOmVEOSmiiCl
 UlhRbPhUUVtE9ddaNOIzLiEGTz48HZiKKnHFh7cIcZL59XYWi2Cf8/XKdSiILqmhly+8WpZuxtv
 BEEueTdH9OeXDxF2jsJFnLLeEtvJsyfL6/oNVePC4ggbvhUqm6P0tNcJWqpPELEnzR85kSCYRuB
 1GUGA1nsvJYbIqkj0qq5WWz1InuZAtV/vKhW4RcMpo2GxWZATJcKFuHyXHU+giBN3ybYZj5z+5c
 0sTybyDpzJ80X3WC/4Q==
X-Proofpoint-ORIG-GUID: rxV27HwNDdIf3-KL4z5gT-94lfjaBoj5
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=69b25eda cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=iS35I0SvZNzDHkadvWEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: rxV27HwNDdIf3-KL4z5gT-94lfjaBoj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120050

On Wed, Mar 11, 2026 at 10:00:03PM +0530, Ojaswin Mujoo wrote:
> On Wed, Mar 11, 2026 at 03:20:00PM +0000, Mark Brown wrote:
> > On Wed, Mar 11, 2026 at 08:21:50PM +0530, Ojaswin Mujoo wrote:
> > > On Wed, Mar 11, 2026 at 12:00:20AM +0000, Mark Brown wrote:
> > > > On Tue, Mar 10, 2026 at 06:28:30PM +0000, Mark Brown wrote:
> > 
> > > > > I didn't figure out what the source of the issue was, I merged the tip
> > > > > tree from 20260309 instead.
> > 
> > > > with just tip/master.  My KUnit command line running on current Debian
> > > > stable is:
> > 
> > > >     ./tools/testing/kunit/kunit.py run --alltests --arch arm64 --cross_compile=aarch64-linux-gnu-
> > 
> > > >     ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 --cross_compile=x86_64-linux-gnu-
> > 
> > > Hi Mark, I'm unable to hit this bug with the 20260310 branch [1]. Am I
> > > on the wrong branch? I'm using the following command on x86 machine:
> > 
> > See above, because of this test failure I did not merge the current
> > version of the tip tree which triggers the issue, you need to fetch the
> > tip tree:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> 
> Ahh I see. I didn't know about this tree. Thanks I'll check it.

Hi Mark,

Im able to replicate and confirm the following patch fixes it:

  https://lore.kernel.org/linux-ext4/5bb9041471dab8ce870c191c19cbe4df57473be8.1772381213.git.ritesh.list@gmail.com/

I believe the previous test's cleanup is not going through properly
causing the mballoc test to fault.

Thanks,
ojaswin
