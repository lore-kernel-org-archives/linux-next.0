Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C86480943;
	Wed, 29 Jul 2026 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329342; cv=pass; b=qeI4kQ9Ol3EYjd7AbcR7NujFhP2u12YD4DHOLe45SNb96XTPVYFERIhDrxbgUIG441laGiVeX/VZcRLQgwPSldsbaoiGVAd5KBugXw6bolRRjyjJ0MvT7cGMLmPfWzv6WiL3r3wIQzC+e0izxHA8WpNWtPh4NI/JSryyhHH75n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329342; c=relaxed/simple;
	bh=K6/3kU8+PyP2xUrEwLEWq6fy9+6Z8w5y2gToAP/crv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skBitxKb6iRE7cfE78V/UEGHeICAD83bBqKq+hBAhzu0oASPyFTVcqXlArqy7kyn8LTan0mPTMPJUtriZZblVeQ/H9rzkeKwMd0QG/iLRUSeWYnQLGszgv5mzvBaUImFD41LYVZkQSN9KWOMeJeAfaX8pXXsxdd6DcZDWhwS4JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=leandro.ribeiro@collabora.com header.b=DFnsJ9Uj; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=leandro.ribeiro@collabora.com header.b="DFnsJ9Uj"
ARC-Seal: i=1; a=rsa-sha256; t=1785329312; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bujx/lJqLxcSrFvDgB8sLzLAxzVNAYML8stfeYcXTpkJQ7GJ0eF9ZqjK326bN0mvf5lfIcl9Up2E7dedD55pVY2w0g7hKJhWu8g/E64z7/en/9NPIF5dc83fD4qHuXEymZspuqtKvOgGTGACdLMqmG6aKmir1DqCd6qeMmIf1uk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785329312; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mBlfFTZEC5TmDbfDkYkor8AyQ5BZ1sJ44q+KZ1cZS1A=; 
	b=hPGekkEgQ/KbZ1oChaMtEt2xSL+7u9I12qK4U6FPJmxD1wU8Q3ujnxgMlDCMEjJd09IL4YUDklt7RenIEje9TKn0vnpRJ3Iy5iTx7iQRwfadmSZgs4VlynK1CJIBNzyea+YzUIcdiu54DKrJ8iNlFu5Jm6ak0W8HDE53W55pFJc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=leandro.ribeiro@collabora.com;
	dmarc=pass header.from=<leandro.ribeiro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785329312;
	s=zohomail; d=collabora.com; i=leandro.ribeiro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mBlfFTZEC5TmDbfDkYkor8AyQ5BZ1sJ44q+KZ1cZS1A=;
	b=DFnsJ9UjAdjCMoA+gAC4AR2jbYLCSUuPmAWJXewZ/evi6DjsbF6yz9K+dBwzmbtC
	zBDiY0766nN736vW2EJT79duVMSBYP/63p3KndyfvcPJOZtJzg7HBtT1DnXbR0tHpwP
	uTgDcq8VttZiCMkq30jic792e97VOATadAW0fBvc=
Received: by mx.zohomail.com with SMTPS id 1785329309162762.3161254320859;
	Wed, 29 Jul 2026 05:48:29 -0700 (PDT)
Message-ID: <55f614e1-a016-48ef-b4ec-fe472cb6ed69@collabora.com>
Date: Wed, 29 Jul 2026 09:48:22 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Theodore Tso <tytso@mit.edu>,
 Alexander Potapenko <glider@google.com>,
 Christoph Hellwig <hch@infradead.org>, Aleksandr Nogikh <nogikh@google.com>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
 will@kernel.org, longman@redhat.com, mingo@kernel.org,
 gregkh@linuxfoundation.org
References: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
 <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk>
 <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
 <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
 <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
In-Reply-To: <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 7/28/26 20:46, Tetsuo Handa wrote:
> On 2026/07/29 7:11, Miguel Ojeda wrote:
>> On Tue, Jul 28, 2026 at 4:46 PM Tetsuo Handa
>> <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>>
>>> syzbot stops upon encountering "BUG:" or "WARNING:" within printk() output.
>>
>> Out of curiosity, is that a fundamental property or something that
>> could be optionally be relaxed (for certain linux-next runs only,
>> perhaps) so that you can continue testing in certain cases where the
>> "WARNING:" may be harmless (i.e. irrelevant for your particular
>> fuzzing)?
>>
>> i.e. I was wondering whether the system could ignore the "WARNING:"s
>> (and avoid the kernel panicking on them etc.) until after boot, i.e.
>> when the fuzzing starts.
> 
> syzbot uses kernel.panic_on_warn=1, for most of WARN*() users are reporting
> problems that should not be ignored. Therefore, WARN*() must not be used for
> reporting recoverable mistakes like -EINVAL. Abusing WARN*() like
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/workqueue.c?id=6e845bcb78c95af935094040bd4edc3c2b6dd784#n5855
> is a fatal barrier for continuous testing systems like syzbot.
> 
> Quoting from https://lkml.kernel.org/r/5b2dea50-2850-4876-b6e8-ba94b9a85034@I-love.SAKURA.ne.jp :
> 
>   Please never try to emit WARNING: or BUG: message just for letting developers
>   update their code. If you can't use panic() instead of WARN*() or BUG*(), you
>   should not use WARN*() or BUG*(). The patch author who changes the behavior of
>   in-tree code is responsible for updating all in-tree code.
> 
> Commit 860e748bddcc ("drm: ensure blend mode supported if pixel format
> with alpha exposed") must be reverted or updated not to emit "WARNING:" string.
> Until authors of that commit respond, that commit had better be excluded from
> the linux-next tree.
> 

Hello,

First of all, sorry for all the trouble with this warning. I'll propose
a patch replacing the warning with printk() or pr_info(), if that
doesn't cause similar issues for fuzzers.

Thanks,
Leandro
