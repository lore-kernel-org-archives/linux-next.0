From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Kernel crash on startup - bisected to commit 3b24d854cb35
Date: Mon, 11 Apr 2016 15:40:38 +0300
Message-ID: <87inzoz5bt.fsf@purkki.adurom.net>
References: <570892F9.9030700@lwfinger.net>
	<CANn89iJ6sfeNgB4BBmAw5SewqSHe_50+6POLJn=fhTDnNcY6kQ@mail.gmail.com>
	<570934C9.5020008@lwfinger.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <570934C9.5020008@lwfinger.net> (Larry Finger's message of "Sat,
	9 Apr 2016 11:58:49 -0500")
Sender: linux-kernel-owner@vger.kernel.org
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, linux-next <linux-next@vger.kernel.org>, linux-netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Larry Finger <Larry.Finger@lwfinger.net> writes:

>> Can you double check you have this fix ?
>>
>> commit 8501786929de4616b10b8059ad97abd304a7dddf
>> Author: Eric Dumazet <edumazet@google.com>
>> Date:   Wed Apr 6 22:07:34 2016 -0700
>>
>>      tcp/dccp: fix inet_reuseport_add_sock()
>>
>>      David Ahern reported panics in __inet_hash() caused by my recent commit.
>>
>>      The reason is inet_reuseport_add_sock() was still using
>>      sk_nulls_for_each_rcu() instead of sk_for_each_rcu().
>>      SO_REUSEPORT enabled listeners were causing an instant crash.
>>
>>      While chasing this bug, I found that I forgot to clear SOCK_RCU_FREE
>>      flag, as it is inherited from the parent at clone time.
>>
>>      Fixes: 3b24d854cb35 ("tcp/dccp: do not touch listener sk_refcnt
>> under synflood")
>>      Signed-off-by: Eric Dumazet <edumazet@google.com>
>>      Reported-by: David Ahern <dsa@cumulusnetworks.com>
>>      Tested-by: David Ahern <dsa@cumulusnetworks.com>
>>      Signed-off-by: David S. Miller <davem@davemloft.net>
>
> No, I did not have that patch. After pulling from net-next to get it,
> my system no longer panics.
>
> Note to linux-wireless readers. At the moment, a system built from
> wireless-drivers-next will have this problem.

I'm currently writing a pull request to Dave and once he pulls it I'll
fast forward wireless-drivers-next to latest net-next. Usually this take
two days or so.

-- 
Kalle Valo
