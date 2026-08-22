Received: from latitanza.investici.org (latitanza.investici.org [185.218.207.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A32C11CA;
	Sat, 22 Aug 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.218.207.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420250; cv=none; b=RIRuoWJ+RQq5NfwqIKvwaFHVe5QHphiqGd/yq6YN1x7gMfe9EZWG2EOfhCajysy26BHwww/Z30iLolkkXP60umUOthIC0VBcq5hLdoEaT1srmZDRZI0CV3vOSkEmmOWHBdBgQQqgddv3q339I3XkOQVbtXnqEtoSeYFtTHJzoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420250; c=relaxed/simple;
	bh=Q3uuJ/RFrjE6Lg7u7r50e4s4sh+7k173dIGVQbus0k8=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=hF+ZpShNq+OMrBlTfLwj6VW3r3RuJGt66IiJfPtonQLe8xyUKpvWcD6bpTfDGT67hm9t4xhT/NswM0LsqcWpBtqCa7II2QVHFRvoz0sk47FiTVlcbBtFOBLZVdb5ZkDQxzJ/YyX1TB6VN03aARBpmcY7/asT7lwKLRJRwQXgsyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=grrlz.net; dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b=muFrv4Wn; arc=none smtp.client-ip=185.218.207.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grrlz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b="muFrv4Wn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1787420244;
	bh=M4gUnE+3vszmWag4HQ91TLvwrlgK5uPffnqbceHVcbY=;
	h=Date:From:To:CC:Subject:In-Reply-To:From;
	b=muFrv4WnQkuzLrfBjbGoR9SbHbDnfHHV2NJI0SPU4Ym3CTXgUjnn9NOkkvCpfFH3q
	 8PopYMp6dkE4wuoMPsvmmuVp1CDtfJEKNZ/lZ3NvNArrqZmcbRYpSQk5/2BfEaW8YP
	 /4EtP+a3N8JnS5ItU0EzzDZhvkl6SV+AVlhOgaKw=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4hS4BD4tf6zGp9s;
	Sat, 22 Aug 2026 17:37:24 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4hS4BD1nX6zGp9q;
	Sat, 22 Aug 2026 17:37:24 +0000 (UTC)
Date: Sat, 22 Aug 2026 18:37:24 +0100
From: Bradley Morgan <include@grrlz.net>
To: rdunlap@infradead.org
CC: broonie@kernel.org, corbet@lwn.net, gourry@gourry.net,
 joel.granados@kernel.org, kees@kernel.org, kmehltretter@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, luto@kernel.org, oleg@redhat.com,
 peterz@infradead.org, sfr@canb.auug.org.au, skhan@linuxfoundation.org,
 tglx@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_syscall=5Fuser=5Fdispatch?=
 =?US-ASCII?Q?=3A_Use_CONFIG=5FSYSCTL_for_sysctl_guard?=
In-Reply-To: <1842ee57-ff3b-42df-b6c7-c93d395a3944@infradead.org>
Message-ID: <CDF0DEFD-3136-48AD-BEE6-B01C709E5739@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 22 August 2026 18:35:14 BST, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>On 8/22/26 12:23 AM, Karl Mehltretter wrote:
>> Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
>> CONFIG_SYSCTL") removed CONFIG_PROC_SYSCTL, but the sysctl added by
>> commit 5b6e32ba7b59 ("syscall_user_dispatch: Add
>> kernel.syscall_user_dispatch sysctl") is still guarded by it. Now that
>> both commits are merged, kernel.syscall_user_dispatch is no longer
>> registered.
>> 
>> syscall_user_dispatch_allowed defaults to true. SUD therefore remains
>> available, but administrators cannot disable new activations.
>> 
>> Use CONFIG_SYSCTL for the guard and documentation.
>> 
>> Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add
>kernel.syscall_user_dispatch sysctl")
>> Assisted-by: Codex:gpt-5.6-sol
>> Acked-by: Oleg Nesterov <oleg@redhat.com>
>> Reviewed-by: Joel Granados <joel.granados@kernel.org>

Reviewed-by: Bradley Morgan <include@grrlz.net>


>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>
>Acked-by: Randy Dunlap <rdunlap@infradead.org>
>Thanks.
>
>> ---
>> Changes in v2:
>>   - Reword changelog and rebase onto mainline now that both commits
>>     are merged there (v7.2 is unaffected, it has neither commit).
>>   - Collected Acked-by/Reviewed-by tags from v1. No code change.
>> 
>> v1:
>https://lore.kernel.org/all/20260813062039.14567-1-kmehltretter@gmail.com/
>> 
>>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>>  kernel/entry/syscall_user_dispatch.c        | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst
>b/Documentation/admin-guide/sysctl/kernel.rst
>> index b6328cd0f43e..ffea61d448eb 100644
>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>> @@ -1416,7 +1416,7 @@ Controls whether userspace may arm Syscall User
>Dispatch via
>>    == 
>===================================================================
>>  
>>  Only present when the kernel is built with
>``CONFIG_SYSCALL_USER_DISPATCH``
>> -and ``CONFIG_PROC_SYSCTL``.
>> +and ``CONFIG_SYSCTL``.

Ack.

>>  
>>  
>>  sysctl_writes_strict
>> diff --git a/kernel/entry/syscall_user_dispatch.c
>b/kernel/entry/syscall_user_dispatch.c
>> index 2002c7aae435..59c861866941 100644
>> --- a/kernel/entry/syscall_user_dispatch.c
>> +++ b/kernel/entry/syscall_user_dispatch.c
>> @@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct
>task_struct *task, unsigned long siz
>>  					      (char __user *)(uintptr_t)cfg.selector);
>>  }
>>  
>> -#ifdef CONFIG_PROC_SYSCTL
>> +#ifdef CONFIG_SYSCTL

Ack.

>>  static const struct ctl_table syscall_user_dispatch_sysctls[] = {
>>  	{
>>  		.procname	= "syscall_user_dispatch",
>> @@ -195,4 +195,4 @@ static int __init
>syscall_user_dispatch_sysctl_init(void)
>>  	return 0;
>>  }
>>  late_initcall(syscall_user_dispatch_sysctl_init);
>> -#endif /* CONFIG_PROC_SYSCTL */
>> +#endif /* CONFIG_SYSCTL */
>> 
>> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
>
>

Thanks!
