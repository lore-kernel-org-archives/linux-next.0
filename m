From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 14 (mips qemu failure bisected)
Date: Thu, 17 Mar 2016 05:43:50 -0700
Message-ID: <56EAA686.5010300@roeck-us.net>
References: <20160314174037.0097df55@canb.auug.org.au>
 <20160314143729.GA31845@roeck-us.net> <20160315052659.GA9320@roeck-us.net>
 <56E884BA.5050103@gmail.com> <20160316001713.GA4412@roeck-us.net>
 <20160316132210.GA21918@roeck-us.net> <56E9C1CA.7050208@gmail.com>
 <56E9DB85.9090405@gmail.com> <56EA1839.8010807@roeck-us.net>
 <CA+mqd+5AUfGSh1WvLa5bOt-HQM=eA+BmLeb7_xZo+-tswLcqiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from forward.webhostbox.net ([162.251.85.138]:50207 "EHLO
	forward.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932832AbcCQMnz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Mar 2016 08:43:55 -0400
In-Reply-To: <CA+mqd+5AUfGSh1WvLa5bOt-HQM=eA+BmLeb7_xZo+-tswLcqiQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Qais Yousef <qsyousef@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, linux-mips@linux-mips.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org

On 03/16/2016 10:25 PM, Qais Yousef wrote:
[ ... ]
>
> Yeah it is assumed that a Malta should always have a GIC and no one got around to fix this in qemu yet.
>
> I can only improve on the patch to do
>
>    if (!ipidomain && nr_cpu_ids == 1)
>            return 0;
>
> Which is more generic way to do it. I think a WARN_ON () would still be useful as SMP without ipis will not work really.
>
> I can send a proper patch if Ralf is OK with that.
>
> I got the console output from qemu by the way. I didn't use your script though.
>

What command line did you use ?

Thanks,
Guenter
