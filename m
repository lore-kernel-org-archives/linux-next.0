Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4451408603
	for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095688; cv=none; b=cIXt5S2OKG4apw+WhsmD85E8esXtl3MtJlp9THzRRpg4FZiXDY+4pOP7CD0W3D4CPnD6XqmU3ENdfQz32VWYxRpQWSWx0ESQXk0Q+VijO7MqCvXZrxjXFu5crLfMKjmMbirlMka/Lf7gKy0tgzL6ckm5sHgKUceIWSFdNSlTpGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095688; c=relaxed/simple;
	bh=j0LRrWmB4OwPCuCS0PuGtUsqm+5NY2QkZOXpz88AzBo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OgCB/kboi9IwGOuSu6NfPwC2VLQ6TzyuzQ5MHzFma7WJ07IdyJawDkO670AGE+AG1FYn2aOSAPktN+hltxgqBXvNMdEb3BT7rWFhAECKxhk15TN5da4xgGKAzy2R2Hv6NcZjCF+6k4SgJ2Wf8hUzPbj9H1fgHd6Hrkrxtz/gSbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 65ACm51o047404;
	Wed, 10 Jun 2026 21:48:05 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 65ACm4Bh047391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 10 Jun 2026 21:48:04 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <bbca08c9-c6bc-4109-b734-14aedc10c93b@I-love.SAKURA.ne.jp>
Date: Wed, 10 Jun 2026 21:48:05 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] workqueue: Add warnings and check WQ flags usage
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Tejun Heo <tj@kernel.org>, Mark Brown <broonie@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
References: <20260529130640.220328-1-marco.crivellari@suse.com>
 <bdce3ef27e358b704541d403d28206fd@kernel.org>
 <a808c387-1087-4826-80de-16252ae315b2@I-love.SAKURA.ne.jp>
 <a85feb7a94ee487fb5b236d86b674c58@kernel.org>
 <5b2dea50-2850-4876-b6e8-ba94b9a85034@I-love.SAKURA.ne.jp>
 <ah2bd_V2QHQftm2o@slm.duckdns.org>
 <4d47c6aa-8ba5-4e17-87e5-bf1e5ecfbddf@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <4d47c6aa-8ba5-4e17-87e5-bf1e5ecfbddf@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav301.rs.sakura.ne.jp

On 2026/06/02 2:51, Tetsuo Handa wrote:
> On 2026/06/01 23:47, Tejun Heo wrote:
>> On Mon, Jun 01, 2026 at 07:12:28AM +0900, Tetsuo Handa wrote:
>>> I've spent more than one year for updating all in-tree users who are
>>> flushing kernel global workqueues. Please see a message from Linus at
>>> https://lkml.kernel.org/r/CAHk-=whWreGjEQ6yasspzBrNnS7EQiL+SknToWt=SzUh4XomyQ@mail.gmail.com .
>>>
>>> Please never try to emit WARNING: or BUG: message just for letting developers
>>> update their code. If you can't use panic() instead of WARN*() or BUG*(), you
>>> should not use WARN*() or BUG*(). The patch author who changes the behavior of
>>> in-tree code is responsible for updating all in-tree code.
>>
>> I don't think a statement this blanket makes sense. I scanned the existing
>> linux-next tree and there were a handful that were missed (I didn't find out
>> whether they are new ones in linux-next or ones that were misseds from
>> mainline tho). Let's just apply the nvme-tcp patch and move on.
> 
> Not all users are quickly accepting patches. Please apply all fixes *before* you start
> emitting WARNING: message. You are currently making linux-next tree untestable by syzbot.
> 
>>
>> Thanks.
>>
> 
> Mark Brown, please skip WQ changes from linux-next until all fixes are applied.
> 
> Linus, please be sure to skip WQ changes in the upcoming merge window if some fix
> does not get applied in time for the merge window. (Of course, applying all fixes
> before we start emitting WARNING: message is desirable for bisectability, even if
> all fixes are get applied in time for the merge window...)
> 

After 10 days of untestable period, the third breakage report came from btrfs
caused by commit 69635d7f4b34 ("fs: WQ_PERCPU added to alloc_workqueue users").
That commit added WQ_PERCPU to fs/btrfs/disk-io.c despite the "ordered_flags" is
passed to alloc_ordered_workqueue() which implicitly applies WQ_UNBOUND.

That commit says

  Both flags coexist for one release cycle to allow callers to transition
  their calls.

  Once migration is complete, WQ_UNBOUND can be removed and unbound will
  become the implicit default.

and you definitely started emitting WARNING: messages before allowing callers
to transition their calls. I consider that commit 21c05ca88a54 ("workqueue: Add
warnings and ensure one among WQ_PERCPU or WQ_UNBOUND is present") should be
excluded from the linux-next and the upcoming merge window. The next one or two
cycles for transition should be printk() without WARNING: string.

