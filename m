Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C013C4332F
	for <linux-next@archiver.kernel.org>; Fri, 17 Dec 2021 16:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbhLQQkw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:40:52 -0500
Received: from out02.mta.xmission.com ([166.70.13.232]:35610 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhLQQkw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Dec 2021 11:40:52 -0500
Received: from in01.mta.xmission.com ([166.70.13.51]:44812)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1myGHq-00F1uD-8h; Fri, 17 Dec 2021 09:40:50 -0700
Received: from ip68-227-161-49.om.om.cox.net ([68.227.161.49]:39008 helo=email.froward.int.ebiederm.org.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1myGHo-003qpt-7Y; Fri, 17 Dec 2021 09:40:49 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211216193412.2441434-1-broonie@kernel.org>
        <YbugCP144uxXvRsk@sirena.org.uk>
        <20211217184725.6be885a1@canb.auug.org.au>
Date:   Fri, 17 Dec 2021 10:40:12 -0600
In-Reply-To: <20211217184725.6be885a1@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 17 Dec 2021 18:47:25 +1100")
Message-ID: <87wnk3famr.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1myGHo-003qpt-7Y;;;mid=<87wnk3famr.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.161.49;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX19162OWtwDNXaQAc8aDHBDGKWREios9+bk=
X-SA-Exim-Connect-IP: 68.227.161.49
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: linux-next: manual merge of the userns tree with the cel tree
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Mark,
>
> On Thu, 16 Dec 2021 20:22:32 +0000 Mark Brown <broonie@kernel.org> wrote:
>>
>> On Thu, Dec 16, 2021 at 07:34:12PM +0000, broonie@kernel.org wrote:
>> > Hi all,
>> > 
>> > Today's linux-next merge of the userns tree got a conflict in:
>> > 
>> >   fs/nfsd/nfssvc.c  
>> 
>> This is also causing further build errors including but not limited to:
>> 
>> /tmp/next/build/kernel/fork.c: In function 'copy_process':
>> /tmp/next/build/kernel/fork.c:2106:4: error: label 'bad_fork_cleanup_threadgroup_lock' used but not defined
>>  2106 |    goto bad_fork_cleanup_threadgroup_lock;
>>       |    ^~~~
>> 
>> Partly due to vaccine side effects and partly in the interest of time
>> I'm going to use the userns tree from yesterday.
>
> Caused by commit
>
>   40966e316f86 ("kthread: Ensure struct kthread is present for all kthreads")
>
> The label is guarded by CONFIG_NUMA, but the new goto is not.
>
> This is still failing, so I have used the userns tree from next-20211215
> for today.

Huh.  I thought I fixed that.

I will dig in later today.  I just got power back after a bad storm so I
have not see the emails until just now.

Eric
