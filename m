From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: -next build failure with gcc 5.2.1
Date: Thu, 8 Dec 2016 11:57:25 +0530
Message-ID: <5CF53903-E68A-42C5-93B9-767F417EE837@linux.vnet.ibm.com>
References: <8BC02969-0A0D-4C59-8E5E-31F5FC2B1391@linux.vnet.ibm.com>
 <798a8079-6d96-6a9c-b413-21e46f0fcbb0@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51973 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750822AbcLHG1h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Dec 2016 01:27:37 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uB86Ocua002423
        for <linux-next@vger.kernel.org>; Thu, 8 Dec 2016 01:27:37 -0500
Received: from e28smtp03.in.ibm.com (e28smtp03.in.ibm.com [125.16.236.3])
        by mx0b-001b2d01.pphosted.com with ESMTP id 276xfc56q5-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 08 Dec 2016 01:27:36 -0500
Received: from localhost
        by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Thu, 8 Dec 2016 11:57:33 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
        by d28dlp02.in.ibm.com (Postfix) with ESMTP id 8CE543940066
        for <linux-next@vger.kernel.org>; Thu,  8 Dec 2016 11:57:30 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
        by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id uB86RUDu33685512
        for <linux-next@vger.kernel.org>; Thu, 8 Dec 2016 11:57:30 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
        by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id uB86RQkF006129
        for <linux-next@vger.kernel.org>; Thu, 8 Dec 2016 11:57:29 +0530
In-Reply-To: <798a8079-6d96-6a9c-b413-21e46f0fcbb0@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>
Cc: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org


> On 08-Dec-2016, at 7:39 AM, Balbir Singh <bsingharora@gmail.com> wrote:
> 
> On 12/07/2016 07:26 PM, Sachin Sant wrote:
>> next tree fails to build on a ppc64le box with following message
>> 
>>  LD      init/built-in.o
>>  LD      vmlinux.o
>>  MODPOST vmlinux.o
>> WARNING: modpost: Found 3 section mismatch(es).
>> To see full details build your kernel with:
>> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
>>  KSYM    .tmp_kallsyms1.o
>> kallsyms failure: relative symbol value 0xc000000000000000 out of range in relative mode
>> Makefile:969: recipe for target 'vmlinux' failed
>> make: *** [vmlinux] Error 1
>> 
>> GCC version is : gcc version 5.2.1 20151010 (Ubuntu 5.2.1-22ubuntu2)
>> 
>> Have attached kernel config file.
>> 
> 
> Thanks, would you be in a position to bisect?

Yes. It seems Stephen has already found the commit causing this. 

Thanks
-Sachin
