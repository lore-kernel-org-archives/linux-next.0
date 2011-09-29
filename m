From: Ming Lei <ming.lei@canonical.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Thu, 29 Sep 2011 09:32:39 +0800
Message-ID: <CACVXFVM6CjZacbbvn0VzM78SNDa6geHSw1dsrCL1bbTBU=pH1g@mail.gmail.com>
References: <20110928145144.3d074db9aa9b6f858e0dc4fb@canb.auug.org.au>
	<201109281558.05289.rjw@sisk.pl>
	<CACVXFVMLBHu+CY1pgQnY04S_3iLN1z5S2vPiMdN6rsW=gBdWog@mail.gmail.com>
	<201109282132.46887.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:42299 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753706Ab1I2Bcl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 21:32:41 -0400
In-Reply-To: <201109282132.46887.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 29, 2011 at 3:32 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Wednesday, September 28, 2011, Ming Lei wrote:
>> Hi,
>>
>> 2011/9/28 Rafael J. Wysocki <rjw@sisk.pl>:
>> > On Wednesday, September 28, 2011, Ming Lei wrote:
>> >> Hi Stephen and Rafael,
>> >>
>> >> Sorry, the attachment patch can fix the build failure, which is
>> >> caused by unset CONFIG_RUNTIME_PM.
>> >
>> > First off, that's CONFIG_PM_RUNTIME. =A0Second, why do you want to=
 build
>> > rpm-traces.c at all if CONFIG_PM_RUNTIME is unset?
>> >
>>
>> Yes, you are right, =A0follows the correct fix:
>>
>> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
>> index 56bdab5..f49405f 100644
>> --- a/kernel/trace/Makefile
>> +++ b/kernel/trace/Makefile
>> @@ -53,7 +53,9 @@ endif
>> =A0obj-$(CONFIG_EVENT_TRACING) +=3D trace_events_filter.o
>> =A0obj-$(CONFIG_KPROBE_EVENT) +=3D trace_kprobe.o
>> =A0obj-$(CONFIG_TRACEPOINTS) +=3D power-traces.o
>> +ifeq ($(CONFIG_PM_RUNTIME),y)
>> =A0obj-$(CONFIG_TRACEPOINTS) +=3D rpm-traces.o
>> +endif
>> =A0ifeq ($(CONFIG_TRACING),y)
>> =A0obj-$(CONFIG_KGDB_KDB) +=3D trace_kdb.o
>> =A0endif
>
> Well, this still is kind of ugly. =A0I'd prefer my patch sent in this=
 thread.

Both are doable, :-)

But I don't think it is ugly, and this way is taken by BLOCK/PERF_EVENT=
S/
KGDB_KDB in kernel/trace/Makefile. Also this one is a simple fix and
don't introduce any new config option, which is unnecessary.


thanks,
--
Ming Lei
