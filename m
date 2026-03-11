Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A383B3C07;
	Wed, 11 Mar 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239960; cv=none; b=o8O7TDhUbx5fi39sx7OUtVkrN5qpBqUrff2/ocoqYlDlyHHsdHeFNuBADMTyFz1fv36QvBNdAm+UYASYF252uxVRuWqqiM+yxGDci9ckFL8JoOHVsxIAuph6ac9cSki6diFq9cXOm+EWKzVBxtMJi1BZfbI4k7t2qmCtkYMMUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239960; c=relaxed/simple;
	bh=C5rzDAySMPNTS8vh4zifFxUyHBFFhGFmm8FvKQA+6cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnTz3v9iK99GO7TcBJqD0ppZxAML8dgTivIK+fmqEkY7nG5f2dTCFSTNAD4QutBDbqo6dlaUSm8kJNmfAAiYxyFnZsjeijL36LRa/7tmJv/byFQIMoSj8bBvwO/5KiK74Ef8dvTV43OsjvF/gs8SsO6BwA4wA1TFIiHkBE0ZUEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=N/bhGxqO; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="N/bhGxqO"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7nO39155655;
	Wed, 11 Mar 2026 14:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=GrNXc5djB85hBXoSMu++iyDCGo0HhW
	rPAW7i8KabWBk=; b=N/bhGxqOvZdcIN1Zopw1RQMICTRQzPiN2L1LPKBAvqw1Is
	fOldtVDVeNeAatune/93IV2lfxXs0+yieW+9CSTW74xPW5Yua/bS/Wqz6CgYyW5L
	CibRVylMSe+uyO/FmGeWDV9QsmWrvN3L+77okrNG9IAV7n6ep4Ws9hOzQe9LYoSH
	quMjzmx0GArxixDeeZjlvXh8ATYjxf8mg3pQwho6PspUS2sUA/HBNd0KR1VRGkH/
	zBX69TnKX0Vtnci3kiAueurf1Ep3BBpWdpGgperDiF1OxK3Xnz8WODtZPUMoxCa9
	GSAyxNx/VNu7BoDiMvjz1/JXOI78sCVLL5CVXsgw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvmge89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 14:33:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62BCnepu015608;
	Wed, 11 Mar 2026 14:33:57 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4crybndtp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 14:33:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62BEXtIj49152434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 14:33:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BB5120067;
	Wed, 11 Mar 2026 14:33:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D51C920063;
	Wed, 11 Mar 2026 14:33:52 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.39.22.251])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 11 Mar 2026 14:33:52 +0000 (GMT)
Date: Wed, 11 Mar 2026 20:03:50 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        willy@infradead.org, yi.zhang@huawei.com, jack@suse.cz, tytso@mit.edu
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <abF9Ti4pTYnnsMdq@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <20260311103743.GK606826@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311103743.GK606826@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 46M7cR_wTRPx5DAk2vBiWE43wGOEyoH-
X-Proofpoint-ORIG-GUID: 46M7cR_wTRPx5DAk2vBiWE43wGOEyoH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyMyBTYWx0ZWRfX2YnxliWaYMnd
 qxitkv9d213sc+V+QJsYnjvK266mtSf8CrM7Ijqe2UTsjJBtX9ATADaGmlI4KcLMY1Wjd57mz0O
 lil5IxXL/pcEDDbobJy4y9kJAFe4z+ZEZNTKYCh7eS+hCFGyfw+fJMX1diXQnb50etw1es2nXGZ
 EIkBWmhXNCHzPvyhAHOLYgRXPdaJJJZnCogw49I86sTN5AmG7KQzXy1jZBtns49Wjfr5XeniY8f
 70GCuRA+U4PnIY8qFcHMQTXvxA2obKHvnfLOiSvk5b5wU7MjxRFSJu4ZPcr26HrgixhMsx6P4NJ
 w4iDwdskWno9ibCTSeP22RmRkd1Z5SnjQS3+NDvRg1SKUHV9M6jFtvxaKtsInlzySA0P5W8mzrn
 PICGA2/caFWq8pY1JCD/KRMqSkd9roOTJzFtlRn7N5AUjN9XK/k8M6y2nrO6DBOWyQkcS56QeV3
 VLjChNJ/QKdWUtBdwwA==
X-Authority-Analysis: v=2.4 cv=B5q0EetM c=1 sm=1 tr=0 ts=69b17d56 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=DmluyIqlrcd05CL_TVwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110123

On Wed, Mar 11, 2026 at 11:37:43AM +0100, Peter Zijlstra wrote:
> On Wed, Mar 11, 2026 at 12:00:20AM +0000, Mark Brown wrote:
> > On Tue, Mar 10, 2026 at 06:28:30PM +0000, Mark Brown wrote:
> > > Hi all,
> > > 
> > > After merging the tip tree, today's linux-next started crashing running
> > > arm64 KUnit like this:
> > > 
> > > [18:12:16] [PASSED] split unwrit extent to 3 extents and convert 2nd half writ (non-endio, zeroout) (highlevel)
> > > [18:12:16] =============== [PASSED] test_split_convert ================
> > > [18:12:16] ================ [PASSED] ext4_extents_test ================
> > > [18:12:16] ============== ext4_mballoc_test (7 subtests) ==============
> > > Command '['qemu-system-aarch64', '-nodefaults', '-m', '1024', '-kernel', '/tmp/next/arm64_kunit/arch/arm64/boot/Image.gz', '-append', 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-machine', 'virt', '-cpu', 'max']' timed out after 300 seconds
> > > 
> > > I didn't figure out what the source of the issue was, I merged the tip
> > > tree from 20260309 instead.
> > 
> > I tried to leave a bisect running but it got confused because a lot of
> > the branches are based on v7.0-rc1 which has a separate bug that causes
> > KUnit to lock up so the results are nonsense.  I did confirm an issue
> > with just tip/master.  My KUnit command line running on current Debian
> > stable is:
> > 
> >     ./tools/testing/kunit/kunit.py run --alltests --arch arm64 --cross_compile=aarch64-linux-gnu-
> > 
> > and I also tried:
> > 
> >     ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 --cross_compile=x86_64-linux-gnu-
> > 
> > and got:
> > 
> > [23:51:03] [PASSED] split unwrit extent to 3 extents and convert 2nd half writ (non-endio, zeroout) (highlevel)
> > [23:51:03] =============== [PASSED] test_split_convert ================
> > [23:51:03] ================ [PASSED] ext4_extents_test ================
> > [23:51:03] ============== ext4_mballoc_test (7 subtests) ==============
> > [23:51:03] ================= test_new_blocks_simple  ==================
> > [23:51:03] [FAILED] block_bits=10 cluster_bits=3 blocks_per_group=8192 group_count=4 desc_size=64
> 
> 
> Right, so I bisected this using:
> 
>   ./tools/testing/kunit/kunit.py run --alltests --build_dir=$PWD/kunit-build/ --arch=x86_64 ext4_*
> 
> and hit:
> 
>   25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")
> 
> After much staring, I couldn't find anything wrong with it, and decided
> to add a few DEBUG options on. And it magically started working.
> 
> Then I did a KASAN run of the above, and that got me the below.
> There seems to have been some recent commits in this area, Cc'ed
> relevant people.
> 
> [11:17:27] ==================================================================
> [11:17:27] BUG: KASAN: slab-use-after-free in __percpu_counter_init_many+0x21b/0x2f0
> [11:17:27] Write of size 8 at addr ffff8880029425a8 by task kunit_try_catch/37

Hi Peter,

I believe this issue is resolved with [1]. However, I think this might
not be the same as the issue reported originally as we the original
issue seems to be in mballoc-tests rather than extent-tests. I'll try to
look into it a bit more.

[1] https://lore.kernel.org/linux-ext4/5bb9041471dab8ce870c191c19cbe4df57473be8.1772381213.git.ritesh.list@gmail.com/

Regards,
ojaswin

> [11:17:27]
> [11:17:27] CPU: 0 UID: 0 PID: 37 Comm: kunit_try_catch Tainted: G                 N  7.0.0-rc1-00023-g25500ba7e77c #3 PREEMPT(lazy)
> [11:17:27] Tainted: [N]=TEST
> [11:17:27] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019
> [11:17:27] Call Trace:
> [11:17:27]  <TASK>
> [11:17:27]  dump_stack_lvl+0x4e/0x70
> [11:17:27]  print_report+0x152/0x4b0
> [11:17:27]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [11:17:27]  ? __pfx_mutex_unlock+0x10/0x10
> [11:17:27]  ? __percpu_counter_init_many+0x21b/0x2f0
> [11:17:27]  kasan_report+0xe0/0x110
> [11:17:27]  ? __percpu_counter_init_many+0x21b/0x2f0
> [11:17:27]  __percpu_counter_init_many+0x21b/0x2f0
> [11:17:27]  ext4_es_register_shrinker+0x115/0x3e0
> [11:17:27]  ? kasan_save_track+0x14/0x30
> [11:17:27]  extents_kunit_init+0x1d1/0x890
> [11:17:27]  kunit_try_run_case+0x170/0x2d0
> [11:17:27]  ? __pfx_kunit_try_run_case+0x10/0x10
> [11:17:27]  ? kthread_affine_node+0x1b3/0x250
> [11:17:27]  ? __pfx_kthread_affine_node+0x10/0x10
> [11:17:27]  ? __pfx_kunit_try_run_case+0x10/0x10
> [11:17:27]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> [11:17:27]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
> [11:17:27]  kthread+0x2dc/0x3c0
> [11:17:27]  ? recalc_sigpending+0x15d/0x1e0
> [11:17:27]  ? __pfx_kthread+0x10/0x10
> [11:17:27]  ret_from_fork+0x445/0x610
> [11:17:27]  ? __pfx_ret_from_fork+0x10/0x10
> [11:17:27]  ? __switch_to+0x31/0xd60
> [11:17:27]  ? __switch_to_asm+0x39/0x70
> [11:17:27]  ? __switch_to_asm+0x33/0x70
> [11:17:27]  ? __pfx_kthread+0x10/0x10
> [11:17:27]  ret_from_fork_asm+0x1a/0x30
> [11:17:27]  </TASK>
> [11:17:27]
> [11:17:27] Allocated by task 35:
> [11:17:27]  kasan_save_stack+0x30/0x50
> [11:17:27]  kasan_save_track+0x14/0x30
> [11:17:27]  __kasan_kmalloc+0x8f/0xa0
> [11:17:27]  extents_kunit_init+0xf0/0x890
> [11:17:27]  kunit_try_run_case+0x170/0x2d0
> [11:17:27]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
> [11:17:27]  kthread+0x2dc/0x3c0
> [11:17:27]  ret_from_fork+0x445/0x610
> [11:17:27]  ret_from_fork_asm+0x1a/0x30
> [11:17:27]
> [11:17:27] Freed by task 36:
> [11:17:27]  kasan_save_stack+0x30/0x50
> [11:17:27]  kasan_save_track+0x14/0x30
> [11:17:27]  kasan_save_free_info+0x3b/0x60
> [11:17:27]  __kasan_slab_free+0x43/0x70
> [11:17:27]  kfree+0x130/0x330
> [11:17:27]  extents_kunit_exit+0x5b/0x90
> [11:17:27]  kunit_try_run_case_cleanup+0xad/0xe0
> [11:17:27]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
> [11:17:27]  kthread+0x2dc/0x3c0
> [11:17:27]  ret_from_fork+0x445/0x610
> [11:17:27]  ret_from_fork_asm+0x1a/0x30
> [11:17:27]
> [11:17:27] The buggy address belongs to the object at ffff888002942000
> [11:17:27]  which belongs to the cache kmalloc-4k of size 4096
> [11:17:27] The buggy address is located 1448 bytes inside of
> [11:17:27]  freed 4096-byte region [ffff888002942000, ffff888002943000)
> [11:17:27]
> [11:17:27] The buggy address belongs to the physical page:
> [11:17:27] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2940
> [11:17:27] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> [11:17:27] flags: 0x4000000000000040(head|zone=1)
> [11:17:27] page_type: f5(slab)
> [11:17:27] raw: 4000000000000040 ffff888001041d00 dead000000000100 dead000000000122
> [11:17:27] raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
> [11:17:27] head: 4000000000000040 ffff888001041d00 dead000000000100 dead000000000122
> [11:17:27] head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
> [11:17:27] head: 4000000000000003 ffffea00000a5001 00000000ffffffff 00000000ffffffff
> [11:17:27] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> [11:17:27] page dumped because: kasan: bad access detected
> [11:17:27]
> [11:17:27] Memory state around the buggy address:
> [11:17:27]  ffff888002942480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [11:17:27]  ffff888002942500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [11:17:27] >ffff888002942580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [11:17:27]                                   ^
> [11:17:27]  ffff888002942600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [11:17:27]  ffff888002942680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [11:17:27] ==================================================================
> [11:17:27] Disabling lock debugging due to kernel taint
> [11:17:27] # [extent 0] exp: lblk:10 len:1 unwrit:1
> [11:17:27] # [extent 0] got: lblk:10 len:1 unwrit:1
> [11:17:27] ------------------
> [11:17:27] # [extent 1] exp: lblk:11 len:2 unwrit:0
> [11:17:27] # [extent 1] got: lblk:11 len:2 unwrit:0
> [11:17:27] ------------------
> [11:17:27] [FAILED] split unwrit extent to 2 extents and convert 2nd half writ
> 


