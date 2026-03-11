Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8DF3DA7D7;
	Wed, 11 Mar 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240731; cv=none; b=KH/WfmtrYCig7sOIHORM4oeyfGaIvpGxOYoCW35jx1O/zUk7gDvtrjue1ih/2o/gOlhwZIAKmLC1S8ZDyYH8L2oNyilMZigv+J3w7vTZGfby2SctinG2cLrlachTMC9vlh1mo0AELlDpqaJoMiDqZAuE+Vd7VfrS1MTLXPwXIf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240731; c=relaxed/simple;
	bh=KNBpsnAO76kmapjJWCOFGkXpqJKskgSdYoKGQwWGbFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN7gkNf1ShwPqcPSD5uHY9tP1BMcE+tcAioUbCBokBjidq5QyIicdBrwFbt44ncA+Z9OO2hUywHOvx+7Dmxx6W2S0w3y9HWkcPt61xl6XK81GchO2sRMAKdbUYCF/dYPU4Qq0irdRtrlS2+xzaX/zj9aEntYeE2X0OpwFI1i/DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FGOrugCs; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FGOrugCs"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1JVd01709369;
	Wed, 11 Mar 2026 14:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=6UI/l5AgYoqDgdOo2BNPZ4P/z6IOkO
	ba99fqPKloMc0=; b=FGOrugCs7kh8lADCm93c5NsreJx3bEHWUZvY71eFkENp0+
	xpS3U5RFUDY4Fp+jqBnjRnkOyqFsQuB7fgmb+1zaxLdI2GiWKgtmFNcnZfsdAgwW
	x8G9J9Pj142zlxloevz8ycp798jLschrfMnAesZ2ricK4TivFYGYCMbWYu0R9VO/
	FzrIim6Xd3bcdc0jfdALrrDv39kX5jkP1xQ4+xi4xamMNn8AGqeE22mouAHOyRb/
	Qe3xMYLgNBc1zwckQVsJpmqxejP6JchJ2XVsHHA+eth74KuCPboSPdv8zHZlvWix
	8MTVcxY36mvLq+45sT3br46vkqSM4NC84HuMPaXg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crd1mqv93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 14:51:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62BDCrCi015725;
	Wed, 11 Mar 2026 14:51:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs1225kx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 14:51:55 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62BEpsfh55902634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 14:51:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C8772004B;
	Wed, 11 Mar 2026 14:51:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DCA420043;
	Wed, 11 Mar 2026 14:51:52 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.39.22.251])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 11 Mar 2026 14:51:52 +0000 (GMT)
Date: Wed, 11 Mar 2026 20:21:50 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <abGBhmJ7827npf4D@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=ds3Wylg4 c=1 sm=1 tr=0 ts=69b1818c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=AiHppB-aAAAA:8 a=iZAy0XA5UAJ6L5l90ZYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyMyBTYWx0ZWRfXzkNxnFAWF76P
 FEf9zMnxWdA7he3WIEZZMtSNaP7QDVj71IOIkjPXItbbhwWWxajc+4Gd3vBTiOJn3zOQFtPWTDf
 gdfgZ6qQNKyyoD50q9nn+oIophfgBT8s0zSniy6055FJFlZhBbrc1pXcbklAeppzrGqqZ/+k9nY
 fY3iq6AM+aMgmJK6TqXFm5oipucl9EGJf3OqlU5nkG02klAwEdrbVUpEHl8g+lJerDBZZ1FGXI2
 Qw5yODewU2XA/2sHFUJk7p5TojqvzOvTfLLoOzcfatJqP9c3wBK3j9x0Tfobii9ttmoPH6yjVr5
 ZtQnZqF+ZPG8TbmLDWEMmj2b7lhRqtKv8I5tjrynt+BNcC1OBw89HpZGGLAtvFHG378BYPbC5Lt
 1BCr+CnnvOw/nTKuwo6Q9mSwoMWEQboJQPwAIwHGYC/0fWYyIqPOmJKFpQnBqw9aQXOE7GTfw24
 Jj72aiRbZrtfm+GPGuA==
X-Proofpoint-GUID: Jew5uyxEHKpiH-9iKDGRt-itf26ZAWDn
X-Proofpoint-ORIG-GUID: Jew5uyxEHKpiH-9iKDGRt-itf26ZAWDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110123

On Wed, Mar 11, 2026 at 12:00:20AM +0000, Mark Brown wrote:
> On Tue, Mar 10, 2026 at 06:28:30PM +0000, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next started crashing running
> > arm64 KUnit like this:
> > 
> > [18:12:16] [PASSED] split unwrit extent to 3 extents and convert 2nd half writ (non-endio, zeroout) (highlevel)
> > [18:12:16] =============== [PASSED] test_split_convert ================
> > [18:12:16] ================ [PASSED] ext4_extents_test ================
> > [18:12:16] ============== ext4_mballoc_test (7 subtests) ==============
> > Command '['qemu-system-aarch64', '-nodefaults', '-m', '1024', '-kernel', '/tmp/next/arm64_kunit/arch/arm64/boot/Image.gz', '-append', 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-machine', 'virt', '-cpu', 'max']' timed out after 300 seconds
> > 
> > I didn't figure out what the source of the issue was, I merged the tip
> > tree from 20260309 instead.
> 
> I tried to leave a bisect running but it got confused because a lot of
> the branches are based on v7.0-rc1 which has a separate bug that causes
> KUnit to lock up so the results are nonsense.  I did confirm an issue
> with just tip/master.  My KUnit command line running on current Debian
> stable is:
> 
>     ./tools/testing/kunit/kunit.py run --alltests --arch arm64 --cross_compile=aarch64-linux-gnu-
> 
> and I also tried:
> 
>     ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 --cross_compile=x86_64-linux-gnu-
> 
> and got:
> 
> [23:51:03] [PASSED] split unwrit extent to 3 extents and convert 2nd half writ (non-endio, zeroout) (highlevel)
> [23:51:03] =============== [PASSED] test_split_convert ================
> [23:51:03] ================ [PASSED] ext4_extents_test ================
> [23:51:03] ============== ext4_mballoc_test (7 subtests) ==============
> [23:51:03] ================= test_new_blocks_simple  ==================
> [23:51:03] [FAILED] block_bits=10 cluster_bits=3 blocks_per_group=8192 group_count=4 desc_size=64
> 
> before the deadlock which looks awfully similar, though it does make a
> bit more progress and gives a crash:
> 
> [23:55:51] [ERROR] Test: test_new_blocks_simple: missing subtest result line!
> [23:55:51] BUG: unable to handle page fault for address: 00000008bcf958c7
> [23:55:51] #PF: supervisor write access in kernel mode
> [23:55:51] #PF: error_code(0x0002) - not-present page
> 
> ...
> 
> [23:58:45] Call Trace:
> [23:58:45] <TASK>
> [23:58:45] ext4_mb_release (??:?)
> [23:58:45] mbt_kunit_exit (mballoc.c:?)
> [23:58:45] ? __pfx_kunit_generic_run_threadfn_adapter (try-catch.c:?)
> [23:58:45] kunit_try_run_case_cleanup (test.c:?)
> [23:58:45] kunit_generic_run_threadfn_adapter (try-catch.c:?)
> [23:58:45] kthread (kthread.c:?)
> [23:58:45] ? __pfx_kthread (kthread.c:?)
> [23:58:45] ret_from_fork (??:?)
> [23:58:45] ? __pfx_kthread (kthread.c:?)
> [23:58:45] ret_from_fork_asm (??:?)
> 
> plus subsequent things that look like aftereffects of the same thing.

Hi Mark, I'm unable to hit this bug with the 20260310 branch [1]. Am I
on the wrong branch? I'm using the following command on x86 machine:

 tools/testing/kunit/kunit.py run --alltests --arch x86_64

Also IIUC there's another deadlock issue you are
facing other than the one here? Would you be able to try out this
patchset [2], it fixes some of the cleanup related functions which might
fix this issue.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20260310
[2] https://lore.kernel.org/linux-ext4/20260310130412.3156753-1-yebin@huaweicloud.com/T/#t

Regards,
ojaswin



