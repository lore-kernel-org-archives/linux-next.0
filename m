Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242733112B2
	for <linux-next@vger.kernel.org>; Mon,  2 Mar 2026 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473968; cv=none; b=PR2dlpFAtGFQgyPz2TTm+2I6FKs/JXq7hlszuY5c3f4DthRuTBTeFFlh0r6KGXd7SD1rdd4k5lW9bE31UrZCz+abPE/E9wQVJAGAu1YjZc4CchG9tU2OeNM4LOpor4JZBFNyYP+7wT3uVZuTxXFi1fifyMCjEhUoqhEkR+MwK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473968; c=relaxed/simple;
	bh=QwUoPyUq2Vk5zbe7Pi7aEy9RX589Kchl1ysX3zGl4Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQlvzXFqtGhnmEM1OXtzdWS3OuGEqLglwqDzj1ea+Su+Iwy08OK4s1ZaVDUlGxdWx3hFtnm2WGq+XOSiLCcjux2nzOLuqofxHOljMOPgBbzyA60xvl3J4ws6R7RIRGuY3W3SbzFyg2TIaVu4nHwDQOqnF8IAbcMCTqN6BxIEjKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qv77+T3i; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qv77+T3i"
Message-ID: <2b186b8c-c0e9-44d9-ba40-9eeef69e4391@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772473965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=miSdc7UZtShGKkd0/fkG9DBdBFJQbgtY+fpB4IA83zM=;
	b=Qv77+T3iS4NYwgEDBdt7fUlLdTRshZaTQA/N7mSB4GrS5WomAEZL8hSYr6pOgMP01GmXvy
	NtuZnXDUtfS3FkmnYBGlKBvySfEzfaAp9kHhFrrG2qACQiQZE/OO15EltoorNTjkNU9HgK
	JbIjn8QJERpSfmK/uxaeriuopzwXghY=
Date: Mon, 2 Mar 2026 18:52:33 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: build failure after merge of the hid tree
To: Benjamin Tissoires <bentiss@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aaWXFVxygHFpKNxv@sirena.org.uk> <aaWzSAThxAb7nEuw@beelink>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <aaWzSAThxAb7nEuw@beelink>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/2/26 16:58, Benjamin Tissoires wrote:
> On Mar 02 2026, Mark Brown wrote:
>> Hi all,
>>
>> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> /tmp/next/build/drivers/hid/hid-asus.c: In function 'asus_has_report_id':
>> /tmp/next/build/drivers/hid/hid-asus.c:732:22: error: unused variable 'err' [-Werror=unused-variable]
>>   732 |         int t, f, u, err = 0;
>>       |                      ^~~
>> /tmp/next/build/drivers/hid/hid-asus.c:732:19: error: unused variable 'u' [-Werror=unused-variable]
>>   732 |         int t, f, u, err = 0;
>>       |                   ^
>> /tmp/next/build/drivers/hid/hid-asus.c:732:16: error: unused variable 'f' [-Werror=unused-variable]
>>   732 |         int t, f, u, err = 0;
>>       |                ^
>> cc1: all warnings being treated as errors
>>
>>
>> Caused by commit
>>
>>   Fixes: 0919db9f35832 (HID: asus: always fully initialize devices)
>>
>> I have used the tree from next-20260226 instead.
> Thanks for the report.
>
> I've queued a fix on top of the current for-7.1/asus branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-7.1/asus&id=7b2f88cc9dd4c2b9f3d6f5377b45ed9c90fd2fe9
>
> Denis, if you disagree with the fix, please shout.
Hi,

Thank you for that, but I think we are duplicating work here: I spotted it and sent a fix already inside this:
https://lore.kernel.org/all/20260228144626.1661530-1-denis.benato@linux.dev/ the fix is is 3/7.
> Cheers,
> Benjamin
>
>
