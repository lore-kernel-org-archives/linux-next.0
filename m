Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC235B622;
	Fri, 23 Jan 2026 01:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769130404; cv=none; b=f7WV1Ny9ijonvPyMVHPobIYxMjPPcw9tFfEavynt5feZIWYNPalWCxMKFUyL2lv4H+ogYcjSwPQzCX3Z4eVDOEHUCMXhk2wspYDuO41iddX40xiS8f2DaNhbTTUHDmu7iRKp5/6E0fmchzf1k2WwkmsIV7HVwDEjaS9cJ55+65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769130404; c=relaxed/simple;
	bh=QBcTcVzauM0dGAaJXbJWU+A/71vD7id1zjLFP95HL/c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=geZl/Zijhvb3RYS+LsjypVrv7yt3ArhepcdIrlsZLoBCI4ARtKR14peTHsL37BA3SdmFTiZIVr7bCnsk7C3zTaD6Bk+tLniJffvlsxkHfoWo7QCJHT+JRoEGimxZyIQA9T1zqwCc8GyE13g3LgBYprt/DioNPxWqZOxfu7HLiGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZfUAmlBe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZfUAmlBe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=77pRT3S9MFsRRHshG0h8xob3NLG8MgSPXtmssyGbKl0=; b=ZfUAmlBerN/KsQZDyXBl3y36+T
	WFiGLfbhVwMJ1oq2UxVuK5PvRqBPChkm08gLScLmP4CnvobOCdj+vfarO0xr4hgwV+EXtqc9kq5Hm
	sow2ZEvyx6QJ/0kX3FKijo9pRfUwUrXjQhmSENsl8YKl9fLWrMsI0oEoXoYPvRVJfTejUM/dkqxh2
	txXpdPLH3zBNpxtkfbALzA2gACzAkIixODJIoBHojiAuWblWCA3104dqdq67pumCFuG2JO/F/Fil2
	fXagdmaEldksBRqzlOK1Nnha8hLHYYgjObJtepIjPJYtIgabxcLsp/H8zCIIiKZSqlj3FpX6ph5MI
	seQLDADw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5d7-00000007ws4-106y;
	Fri, 23 Jan 2026 01:06:29 +0000
Message-ID: <91c5386a-2c1b-476a-b189-86d80c0d9e96@infradead.org>
Date: Thu, 22 Jan 2026 17:06:28 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: [DOCS] build warning after merge of the tip tree
From: Randy Dunlap <rdunlap@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Marco Elver <elver@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260107161548.45530e1c@canb.auug.org.au>
 <20260107215409.GB694817@noisy.programming.kicks-ass.net>
 <803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
Content-Language: en-US
In-Reply-To: <803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+ linux-doc + Jon

On 1/7/26 2:10 PM, Randy Dunlap wrote:
> 
> 
> On 1/7/26 1:54 PM, Peter Zijlstra wrote:
>> On Wed, Jan 07, 2026 at 04:15:48PM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the tip tree, today's linux-next build (htmldocs) produced
>>> this warning:
>>>
>>> Documentation/core-api/kref:328: include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
>>>   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), str
>>> uct mutex *mutex) __cond_acquires(true# mutex)
>>>   ------------------------------------------------------------------------------------------------^
>>> Documentation/core-api/kref:328: include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
>>>   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
>>>   --------------------------------------------------------------------------------------------^
>>>
>>> Introduced by commit
>>>
>>>   5e256db9325e ("kref: Add context-analysis annotations")
>>
>> I really have no clue what that thing is on about. The code is fine and
>> works as intended.
>>
>> My go-to fix for anything kdoc is to change '/**' into '/*' until it
>> goes away.
> 
> Yes, that works.
> 
> I think that kernel-doc is just confused by the trailing __cond_acquires(true# lock).
> 
> Mauro, would you take a look, please?
We can trivially ignore "__cond_acquires(.*)" in kernel-doc to
eliminate such build warnings.

Is that sufficient? Sure.
Is it the right thing to do? IDK.
Comments?

~Randy
---
 tools/lib/python/kdoc/kdoc_parser.py |    1 +
 1 file changed, 1 insertion(+)

--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -186,6 +186,7 @@ function_xforms  = [
     (KernRe(r"__sched +"), ""),
     (KernRe(r"_noprof"), ""),
     (KernRe(r"__always_unused *"), ""),
+    (KernRe(r"__cond_acquires\s*\(.*\)"), ""),
     (KernRe(r"__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +"), ""),
     (KernRe(r"__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +"), ""),
     (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),

