Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9DD82866;
	Sat, 24 Jan 2026 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215032; cv=none; b=FoGNInuN3G78VvoKICPhSVt30mjp6s4hYkOQEdB5v8SABpI8kG6elR5qS75UNeTqpHCFMUI9wbRhSHcw6WShsI6BQBUGHZ9y0/omT/DVRxmUTc0LvNv9sIRQsi1FKxsglclqhljt6DWG0jn6+I8zl48/xKoNdp9R76NfqxWumfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215032; c=relaxed/simple;
	bh=wAXTvH1maN85hr3RfdeH9UsxVN0a60QJqdMB4yISpkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYTv0g7gC7Xu0cgQPzDHmcet5dTSO/NW5+A+yIfTor/c8SvVTN5E8hdFJ/fgTksy9o9JFq3WMNnks6ufBcKtn8/N1ZSgjTlXDeew18kMJpbi78PgGY3aMV1+dHkHToipWDufgl7a9oELO6+z/Mhg2FSG/jVTB5fLJSp2yKcXN3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yN2Q9Eh1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yN2Q9Eh1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZF3w+bfdsuVIG4y2ZxlqSkJ5Ys1l78zUshnxHSf11Og=; b=yN2Q9Eh1OuUIAiLrg0JA7kRHuk
	0dwqAPzU7JXlYLuIhXabSnsXNgdSkzQXwXXVNQ/0XLEiPhMwWpYPZmvRvVM1nfYiuHi7bHWRN3SuJ
	yHKMYhEj1BChK6nzlVSKZyWg5HALkz0bgC1FOerQIk7UqqI42vemTFOHsS/3oNL16U0TGs/sUUqIr
	I9KhUf3ngGDv33WwUise0g44QE89ZuAqfTSwpExA8qpJ+kUG1RSNuABVY5wG7lLrPXsmrLdA/woTx
	QkuqYabGqKTRGx0VEqYTIE8OLgE5Nfek0KMk4jOHml5QTpwQjkfw9E5epD2E7aEICa8Vf8uHzcyCw
	QPhaUNuQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRe9-00000009dok-2xnO;
	Sat, 24 Jan 2026 00:37:01 +0000
Message-ID: <1ac1c25f-9f4a-45ea-8ce5-c4a381941d60@infradead.org>
Date: Fri, 23 Jan 2026 16:37:01 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: [DOCS] build warning after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
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
 <20260123112856.GS166857@noisy.programming.kicks-ass.net>
 <20260123132054.2d46fb97@foz.lan>
 <20260123151856.GT166857@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260123151856.GT166857@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/23/26 7:18 AM, Peter Zijlstra wrote:
> On Fri, Jan 23, 2026 at 01:20:54PM +0100, Mauro Carvalho Chehab wrote:
> 
>>> I have of course no idea what so ever how any of this works, but it
>>> occurs to me that __acquires() and __releases() are not in that same
>>> list, what happens to them?
>>
>> You mean in functions like those, for instance:
>>
>> 	int device_links_read_lock(void) __acquires(&device_links_srcu)
>> 	{
>> 	        return srcu_read_lock(&device_links_srcu);
>> 	}
>>
>> 	void device_links_read_unlock(int idx) __releases(&device_links_srcu)
>> 	{
>> 	        srcu_read_unlock(&device_links_srcu, idx);
>> 	}
>>
>> Yeah, we need to add something for those as well.
> 
> Yes those. They are pre-existing sparse annotations that have been
> co-opted and morphed into the clang thread-safety-analysis.
> 
>>> Also, there will 'soon' be an equivalent: __cond_releases():
>>>
>>>   https://lkml.kernel.org/r/20260121111213.634625032@infradead.org
>>
>> The table "function_xforms" is a set of regular expressions to replace 
>> macros into something that will be a pure C function declaration.
>> It should be able to handle most macros (*).
>>
>> Each line in the table has two arguments:
>>
>> 	- a regex
>> 	- a replace expression
>>
>> In this specific case, if we remove __cond_acquires(.*) from the
>> function prototype, the remaining function will be a pure C 
>> prototype.
>>
>> So, I'd say we need to have all 4 macros there:
>>
>> 	(KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),
>> 	(KernRe(r"__cond_releases\s*\([^\)]*\)"), ""),
>> 	(KernRe(r"__acquires\s*\([^\)]*\)"), ""),
>> 	(KernRe(r"__releases\s*\([^\)]*\)"), ""),
>>
>> to avoid any warnings related to such annotations.
> 
> There's also:
> 
> 	__must_hold()
> 	__must_not_hold()
> 	__must_hold_shared()
> 
> 	__acquires_shared()
> 	__cond_acquires_shared()
> 	__releases_shared()
> 
> 	__no_context_analysis
> 
> On top of that, structure members can be annotated with:
> 
> 	__guarded_by()
> 	__pt_guarded_by()

I was aware of some of these but not all of them.
Thanks for the list.
I'll update my patch for one regex to include all of these.

-- 
~Randy

