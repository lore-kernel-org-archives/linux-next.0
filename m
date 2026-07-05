Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE5376A12
	for <linux-next@vger.kernel.org>; Sun,  5 Jul 2026 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783249535; cv=none; b=snB3QzEyTyfQw7XSGf/+T2cINAeJXaJikBNJrjupe3XkokAF9+113F3WLFL6ePZey4pTwhHUxyOfzhaYhDty1HIDSEU0KwiQLq/y99bBrdR767TTyoGAnEoVhgAlI/LidFDmldmVRC+15ItL9BTxIK7NOdcQH3KWMy0Lv/lmkVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783249535; c=relaxed/simple;
	bh=aAUlVgayNj+QFv8Ujkjc4YdovgvLN6vuMol0hCeBv7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFmvgwwBW2zQ3KH1lIKk7J33H9RZdcF+VhzUbCji0P4KDXKPhqy3ekDwJBax5EVfZHyGJNZhzoVgcEGAVUZCxtWVDc11iAQwUazmtZ2W9CvTIWgbmPIBZrl/RYFVx626FGWKEtW4gTz5NmJDMyaW0CjLtCMRUqX+7VqhKrAxS0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 665B5POw030960;
	Sun, 5 Jul 2026 20:05:25 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 665B5OdE030957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 5 Jul 2026 20:05:25 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <2f7513c6-42e1-413b-8bd5-fa5abefe4b99@I-love.SAKURA.ne.jp>
Date: Sun, 5 Jul 2026 20:05:23 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lockdep: Enable the printing of held locks of running
 non-current tasks
To: Ingo Molnar <mingo@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, gregkh@linuxfoundation.org,
        syzkaller <syzkaller@googlegroups.com>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <akoeSIQGwqd9cZwd@gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <akoeSIQGwqd9cZwd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav101.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/07/05 18:05, Ingo Molnar wrote:
> TL;DR: it should be fine to print the held locks of running
> tasks too, as long as we print out a warning when we print
> such a task, so that users are aware of any racy output.
> 
> The (lightly tested) patch below implements this.
> 
> Note that this way there's no need to gate this on the Syzkaller
> config option, and you wouldn't have to carry it in -next either,
> it's a useful mainline kernel debuggability enhancement in its
> own right.
> 
> Would this work for you?

Yes, this will be a helpful change. Thank you very much.
I can drop "locking/lockdep: make lockdep_print_held_locks() always print
if CONFIG_DEBUG_AID_FOR_SYZBOT=y" change from linux-next tree.

Please avoid emitting "BUG:" or "WARNING:", for syzkaller stops upon
encountering these strings. Also, since printk() is a slow operation,
please reduce number of characters to print where reasonable.

-		msg_running = " (WARNING: task running)";
+		msg_running = " (running)";

If we can safely calculate on which CPU that thread is running (or waiting
to run), printing CPU number might be also helpful.

	char msg_running[14] = "";

	if (task_is_running(p)) {
		int cpu_id = which_cpu_task_is_on(p); // If possible...

		if (cpu_id >= 0)
			scnprintf(msg_running, sizeof(msg_running), "(C%u)", cpu_id);
		else
			scnprintf(msg_running, sizeof(msg_running), "(running)");
	}

