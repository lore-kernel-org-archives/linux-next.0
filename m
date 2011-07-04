From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 04 Jul 2011 09:30:40 +0800
Message-ID: <4E1117C0.4020500@redhat.com>
References: <20110701151931.4c2d78b5.sfr@canb.auug.org.au>	<4E0D5BD4.6080403@redhat.com>	<20110701170843.bd60e326.sfr@canb.auug.org.au>	<4E0D9D16.7020508@redhat.com> <20110701203702.a15ecf19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:3291 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752588Ab1GDBax (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Jul 2011 21:30:53 -0400
In-Reply-To: <20110701203702.a15ecf19.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

=E4=BA=8E 2011=E5=B9=B407=E6=9C=8801=E6=97=A5 18:37, Stephen Rothwell =E5=
=86=99=E9=81=93:
> Hi,
>
> On Fri, 01 Jul 2011 18:10:30 +0800 Cong Wang<amwang@redhat.com>  wrot=
e:
>>
>> =E4=BA=8E 2011=E5=B9=B407=E6=9C=8801=E6=97=A5 15:08, Stephen Rothwel=
l =E5=86=99=E9=81=93:
>>>
>>> On Fri, 01 Jul 2011 13:32:04 +0800 Cong Wang<amwang@redhat.com>   w=
rote:
>>>>
>>>> =E4=BA=8E 2011=E5=B9=B407=E6=9C=8801=E6=97=A5 13:19, Stephen Rothw=
ell =E5=86=99=E9=81=93:
>>>>>
>>>>> After merging the akpm tree, today's linux-next build (powerpc
>>>>> ppc64_defconfig) failed like this:
>>>>>
>>>>> arch/powerpc/kernel/rtas.c: In function 'rtas_restart':
>>>>> arch/powerpc/kernel/rtas.c:655:24: error: 'SYS_RESTART' undeclare=
d (first use in this function)
>>>>> arch/powerpc/kernel/rtas.c: In function 'rtas_power_off':
>>>>> arch/powerpc/kernel/rtas.c:664:24: error: 'SYS_POWER_OFF' undecla=
red (first use in this function)
>>>>> arch/powerpc/kernel/rtas.c: In function 'rtas_halt':
>>>>> arch/powerpc/kernel/rtas.c:674:24: error: 'SYS_HALT' undeclared (=
first use in this function)
>>>>>
>>>>> Caused by commit ac050ff2a176 ("It is not necessary to share the =
same
>>>>> notifier.h").
>>>>
>>>> I think the following patch will fix this.
>>>
>>> Please find all the other files that need that include as well (the=
re is
>>> at least one more).
>>>
>>
>> Ok, I will do a cross-compilation.
>
> Well, really any file that references any of those defines should be
> including linux/reboot.h, now - whether a compilation gets errors or
> not.  A change in CONFIG options or different platforms/architectures=
 can
> change what file get implictly included.
>
> See Rule 1 in Documentation/SubmitChecklist.

Yeah, I did allyesconfig test on x86. Fortunately there are few
files that needs to be fixed since they include reboot.h implicitly.

Thanks.
