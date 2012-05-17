From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the akpm with the  tree
Date: Thu, 17 May 2012 11:28:08 -0600
Message-ID: <871umizphz.fsf@xmission.com>
References: <20120516193052.4af4ee85feb4a36b936b74df@canb.auug.org.au>
	<20120516164323.GA15140@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:55223 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754273Ab2EQR2W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 May 2012 13:28:22 -0400
In-Reply-To: <20120516164323.GA15140@redhat.com> (Oleg Nesterov's message of
	"Wed, 16 May 2012 18:43:24 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Oleg Nesterov <oleg@redhat.com> writes:

> On 05/16, Stephen Rothwell wrote:
>>
>> --- a/kernel/exit.c
>> +++ b/kernel/exit.c
>> @@@ -1218,7 -1218,7 +1218,7 @@@ static int wait_task_zombie(struct wait
>>   	unsigned long state;
>>   	int retval, status, traced;
>>   	pid_t pid = task_pid_vnr(p);
>> - 	uid_t uid = from_kuid_munged(current_user_ns(), __task_cred(p)->uid);
>>  -	uid_t uid = task_uid(p);
>> ++	uid_t uid = from_kuid_munged(current_user_ns(), task_uid(p));
>>   	struct siginfo __user *infop;
>
> Thanks Stephen, the fix looks correct.
>
> Oleg.

Yes.  That looks good.

I'm not quite certain of my thinking there was.  The two idioms are
equivalent.  I suspect I confused task_uid(p) which is fine with
task_user_ns(p) which is only safe under the rtnl lock and should
probably be removed as a helper function because it isn't used that way.

Eric
