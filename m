Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F62BF3CC;
	Fri, 23 Jan 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152657; cv=none; b=FdVrZRKEilYAboCtDPckJwdKC+YrqKdNMUi3ms6gWa0JnLTf3ZS/wR1zAxXYeZuoqvO0OoDspTAEOTjs+QhqOy880ZQFj/X3QJRwg/F7hQP960XW3W1/hIzuJF1dZSMc1sYNz4WVw579HgFEToVm0pWy5DXifzzn3VR8sT25d7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152657; c=relaxed/simple;
	bh=a38drFmA0Hvib91v7zq75qIwckqignGUA3VMdggGS3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnNSg7s+uiKNIVdjt6YNGIPywHOCywnqgGVd4F4llk0CTj9V/BvWzOCKqp7uFkzobK0XrsCsi2koLbzgK39HDxD+1RGXNA4uSFq5r1uDo739Ysu0IvTtvPedfDtHDAY0UXplq2h3Z+Q3BQF89tXqz7EGChQfuzsP0FJait2YaDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1hVFwKJa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1hVFwKJa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=CQpypqUs3BAHwq2iiOsXXWPWX2ZEKr8pAx9acgSPUxM=; b=1hVFwKJab2vxMaJ/HlIlMlnLly
	g/u3VGetOgw6h7z+PTx4lqqOu94Ayo5+hJ2Ka63X+3/eqsa06Bb/c8+bLWpHggysQTFrorvAeIAZ+
	14eODwQsZh5o52Jjjzkkx1Q76z5XZ9w4G6KlxgEUmw4u4iDFLGQiGsvr5aR3EjGje9/KYl1sUkLOX
	Ih4UXqewDw0Wr/oM6ZD41pFmtLfm1NM0m5Jt2bOFtwpWnkWgCuS2aw0o/21t/z/EXTDD3vVaUngCL
	7bN+L6WxTtVuIEtMVL4im60pwWVayYMkymnZNQU3Sci3w9NobjJNgS4/hpnrin2C+dcDf8r0XQZnD
	JKbGekIg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBQ8-00000008MWa-42Iq;
	Fri, 23 Jan 2026 07:17:29 +0000
Message-ID: <a80bf1c1-a878-43dc-9bce-0b1cf9c059a3@infradead.org>
Date: Thu, 22 Jan 2026 23:17:27 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: [DOCS] build warning after merge of the tip tree
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Marco Elver <elver@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260107161548.45530e1c@canb.auug.org.au>
 <20260107215409.GB694817@noisy.programming.kicks-ass.net>
 <803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
 <91c5386a-2c1b-476a-b189-86d80c0d9e96@infradead.org>
 <20260123081126.3f0f152c@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260123081126.3f0f152c@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 1/22/26 11:11 PM, Mauro Carvalho Chehab wrote:
> On Thu, 22 Jan 2026 17:06:28 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> + linux-doc + Jon
>>
>> On 1/7/26 2:10 PM, Randy Dunlap wrote:
>>>
>>>
>>> On 1/7/26 1:54 PM, Peter Zijlstra wrote:  
>>>> On Wed, Jan 07, 2026 at 04:15:48PM +1100, Stephen Rothwell wrote:  
>>>>> Hi all,
>>>>>
>>>>> After merging the tip tree, today's linux-next build (htmldocs) produced
>>>>> this warning:
>>>>>
>>>>> Documentation/core-api/kref:328: include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
>>>>>   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), str
>>>>> uct mutex *mutex) __cond_acquires(true# mutex)
>>>>>   ------------------------------------------------------------------------------------------------^
>>>>> Documentation/core-api/kref:328: include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
>>>>>   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
>>>>>   --------------------------------------------------------------------------------------------^
>>>>>
>>>>> Introduced by commit
>>>>>
>>>>>   5e256db9325e ("kref: Add context-analysis annotations")  
>>>>
>>>> I really have no clue what that thing is on about. The code is fine and
>>>> works as intended.
>>>>
>>>> My go-to fix for anything kdoc is to change '/**' into '/*' until it
>>>> goes away.  
>>>
>>> Yes, that works.
>>>
>>> I think that kernel-doc is just confused by the trailing __cond_acquires(true# lock).
>>>
>>> Mauro, would you take a look, please?  
>> We can trivially ignore "__cond_acquires(.*)" in kernel-doc to
>> eliminate such build warnings.
>>
>> Is that sufficient? Sure.
>> Is it the right thing to do? IDK.
>> Comments?
> 
> This fix sounds right to me. If not there at the patch,
> I would improve the include/linux/kref.h documentation to 
> describe __cond_requires() inside the kernel-doc documentation
> (or at kref.rst).

It's there in include/linux/compiler-context-analysis.h.

> 
>>
>> ~Randy
>> ---
>>  tools/lib/python/kdoc/kdoc_parser.py |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- a/tools/lib/python/kdoc/kdoc_parser.py
>> +++ b/tools/lib/python/kdoc/kdoc_parser.py
>> @@ -186,6 +186,7 @@ function_xforms  = [
>>      (KernRe(r"__sched +"), ""),
>>      (KernRe(r"_noprof"), ""),
>>      (KernRe(r"__always_unused *"), ""),
>> +    (KernRe(r"__cond_acquires\s*\(.*\)"), ""),
> 
> Regex here is too broad, as it is greedy: it may drop more
> than expected. Perhaps:
> 
>     (KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),

Ah, thanks.

> With that, feel free to add:
> 
> 	Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
>>      (KernRe(r"__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +"), ""),
>>      (KernRe(r"__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +"), ""),
>>      (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),
>>
> 
> 
> Thanks,
> Mauro

-- 
~Randy

