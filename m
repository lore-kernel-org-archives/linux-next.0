Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541732D0C84
	for <linux-next@vger.kernel.org>; Fri, 12 Jun 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273100; cv=none; b=osz5HnsslK/V6fybYlZP+Hm7PQ9KQwr+vFWZQuwh/Dcv06MLHZRYo6NaiUlqSi39yZEMZQa7P6gz/PnGbv9PglNPCHCIM8D8ayprMXBTYMEqtmUwfjBxxEdVODy9heeaw2HIo9NYVhDkiUtkioPhXhI2yYtJMnr5SeT9HH+I4zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273100; c=relaxed/simple;
	bh=ynV7GyGHyDQ4hputPznhU81tfF4qp+DzLu4DZ3F+Q1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2JHjmw3cK7VWlZBD7779u/5UjxbcUTG+JMCRYQ2b+IaLlVFzH2wmJjLlHo6IMkoRPJl4T4xUXy7n8nAftX0U+Bhh+YMXzVN5cYaiLPVsUxGBNDix6jPhG1Vj0oyCD0r6vjTvF/E5CzwI7YO4Z7s5R+JEmyB474QpErY9VvGIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 65CDChZs010569;
	Fri, 12 Jun 2026 22:12:43 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 65CDCQom010500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 12 Jun 2026 22:12:43 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b9771d94-15e2-43ad-9326-81c20c75dfc5@I-love.SAKURA.ne.jp>
Date: Fri, 12 Jun 2026 22:12:25 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] workqueue: Add warnings and check WQ flags usage
To: Nathan Chancellor <nathan@kernel.org>, Tejun Heo <tj@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Crivellari <marco.crivellari@suse.com>,
        linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
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
 <bbca08c9-c6bc-4109-b734-14aedc10c93b@I-love.SAKURA.ne.jp>
 <20260610172823.GA804799@ax162>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20260610172823.GA804799@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav205.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/06/11 2:28, Nathan Chancellor wrote:
> FWIW, I sent a patch for the btrfs issue:
> 
>   https://lore.kernel.org/20260601-btrfs-fix-wq-warning-qgroup-rescan-v1-1-aff9a1128f27@kernel.org/

Then, please immediately add that patch and
https://lkml.kernel.org/r/20260611015545.111157-1-wuyankun@uniontech.com
to the wq tree.

> 
> With that applied to next-20260610, I don't see any other instances of
> this workqueue warning on any of my test machines. I do agree that
> enabling warnings prematurely is disruptive for testing and should be
> avoided but it seems like this one is close? That change should be
> applicable to the workqueue tree, it just needs to be taken at this
> point.
> 

