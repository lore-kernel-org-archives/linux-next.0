Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113F3B3899;
	Wed, 11 Mar 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246686; cv=none; b=g1q1cECcJe1S85i4XCCtZHvbm+BmGyz+YQsPp4+7nNqFHIuP9Nftr3cfVp4cMViWiN08GycvXI41i2GRyml5M0GfL2DHNjS6IgrRlI0BzWueUN1hcRhhk5f1P9KX7XkqdZFjNnKhja22nGWoeG3pzNcVZ3RdsooOAJ8/dObuSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246686; c=relaxed/simple;
	bh=qGzNPoZ5RkwegSO4Yw5VYxV7seTtAZdpEcxB9utVTro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyos8mIt7CT1PMssHerTP++YhUrG+V5QxvQLoxtT+YqOwvmk9tFXQua6XsAPusQ1FeVrLw5GgGap6hoO1sixLJcoFozLuw/6PcLgyJSpoa8gROT06qd4vgIJXnBBhNCRHOrtYwqjcR3JL/6qUejkb0Dt11EpxoTCTzVWquKd6KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dHlXkQVi; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dHlXkQVi"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BEWeGD1605875;
	Wed, 11 Mar 2026 16:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=dqoSer3D4tZpHZNytnz2ivYglh/wTk
	gEhediTVujrFo=; b=dHlXkQVinmPJ4nQF6jRC4LXjh0+BcBL2WT+o22n9kdis2a
	mZmRX6eF9vKwkpvugTnorZhxu3fX3NfJmq22h7MCUrXkiKZjkfqEl4Q2w2boTx3H
	CUl2+0czZnPlFkRa8fbLSE2xc4PI70E8rn53ZOJp/ewgxageAcBFUrHBCIIooGNU
	UaLyWS8PXxtOgxFECwxWuMoz4qrpK9fz6h2GUKckoMM2CkZfo8V76hNZ3ff0uSf2
	cfEqUvX+qntD/MQcPALRxV8oQtZ524WgUPpXN2I8hHaCki53CioYTr1zh5N3JZw3
	39OUsrLwu4D3/P0HDOCrKWtJJ8MuZDU42kCq8b6A==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcuygur2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:31:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62BGQwSk023041;
	Wed, 11 Mar 2026 16:31:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ct8ng74t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:31:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62BGV1TM27918836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 16:31:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FEB920043;
	Wed, 11 Mar 2026 16:31:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 385FB20040;
	Wed, 11 Mar 2026 16:30:59 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.39.22.251])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 11 Mar 2026 16:30:58 +0000 (GMT)
Date: Wed, 11 Mar 2026 22:00:56 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        willy@infradead.org, yi.zhang@huawei.com, jack@suse.cz, tytso@mit.edu
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <abGYwK6WsHKES-QL@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <20260311103743.GK606826@noisy.programming.kicks-ass.net>
 <abF9Ti4pTYnnsMdq@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
 <20260311160904.GP606826@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311160904.GP606826@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EK4LElZC c=1 sm=1 tr=0 ts=69b198c8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=pV1YeHk-_x8B4K0NyzsA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX/SM4dFXvvOyU
 cjcmX5kxSuBmVWHMrhIsUjun0TaDlJyy3yWA6wG2mU8A1EfgUVrYAP09HWO46288TuDKb0pzOtZ
 DjIZ7R9MhYsCVRfrnROliYth/2r4m6zFm6yV08I9Tn0akuEo81cyerdWRHFQ+Igtx58m8EhgJZ6
 Fwuhp9z1jWaxX/guyPz25v1sEeX2E2BdNHj6y5vN4U1qITtS6LJJ/Ed+jCv/QyDPXm9FtCOHCaX
 Z2tRbJvFAnb3g4rH5F5ta4uTtWNCwOF6g3Z6rcqT+GSuN2bMx2URrnC2Y8tjK4Yl0yu2l2Q4QKP
 OPdHhmYazpfGOaEG3EG5pRs2F09mIiCk9UlYr9Nx+IkxPWp6MsNHecIVEhVWbfpA+0gpyKpF/dy
 R4zvwWCH3b9/pfSuSprS6M9z9ugqYfnawxC+pn4bIuliFoqe4Gw9m9NnK8FbShoswjx62ZDZENU
 ckgrgH31SKk1YaHsSyw==
X-Proofpoint-GUID: wy0VnCP1_kZraRPUpW6NlvQltoW_irE0
X-Proofpoint-ORIG-GUID: wy0VnCP1_kZraRPUpW6NlvQltoW_irE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

On Wed, Mar 11, 2026 at 05:09:04PM +0100, Peter Zijlstra wrote:
> On Wed, Mar 11, 2026 at 08:03:50PM +0530, Ojaswin Mujoo wrote:
> > On Wed, Mar 11, 2026 at 11:37:43AM +0100, Peter Zijlstra wrote:
> 
> > > [11:17:27] ==================================================================
> > > [11:17:27] BUG: KASAN: slab-use-after-free in __percpu_counter_init_many+0x21b/0x2f0
> > > [11:17:27] Write of size 8 at addr ffff8880029425a8 by task kunit_try_catch/37
> > 
> > Hi Peter,
> > 
> > I believe this issue is resolved with [1]. However, I think this might
> > not be the same as the issue reported originally as we the original
> > issue seems to be in mballoc-tests rather than extent-tests. I'll try to
> > look into it a bit more.
> > 
> > [1] https://lore.kernel.org/linux-ext4/5bb9041471dab8ce870c191c19cbe4df57473be8.1772381213.git.ritesh.list@gmail.com/
> 
> I can confirm that solves the KASAN splat; it also cures the defconfig
> hang that was initially mis-attributed to the mutex patch, but turned
> out to be memory corruption due to that issue KASAN found.
> 
> FWIW:
> 
> Tested-by: Peter Zijlstra (Intel) <peterz@infradead.org> 

Awesome, thanks for testing.

Regards,
ojaswin
