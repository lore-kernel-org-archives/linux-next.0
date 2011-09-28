From: Ming Lei <ming.lei@canonical.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Wed, 28 Sep 2011 22:47:03 +0800
Message-ID: <CACVXFVMLBHu+CY1pgQnY04S_3iLN1z5S2vPiMdN6rsW=gBdWog@mail.gmail.com>
References: <20110928145144.3d074db9aa9b6f858e0dc4fb@canb.auug.org.au>
	<CACVXFVMrPNZupCQnBMBXsSA1OH=15m9QBKhXT1Of+LghZbKn0Q@mail.gmail.com>
	<201109281558.05289.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201109281558.05289.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

2011/9/28 Rafael J. Wysocki <rjw@sisk.pl>:
> On Wednesday, September 28, 2011, Ming Lei wrote:
>> Hi Stephen and Rafael,
>>
>> Sorry, the attachment patch can fix the build failure, which is
>> caused by unset CONFIG_RUNTIME_PM.
>
> First off, that's CONFIG_PM_RUNTIME. =A0Second, why do you want to bu=
ild
> rpm-traces.c at all if CONFIG_PM_RUNTIME is unset?
>

Yes, you are right,  follows the correct fix:

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 56bdab5..f49405f 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -53,7 +53,9 @@ endif
 obj-$(CONFIG_EVENT_TRACING) +=3D trace_events_filter.o
 obj-$(CONFIG_KPROBE_EVENT) +=3D trace_kprobe.o
 obj-$(CONFIG_TRACEPOINTS) +=3D power-traces.o
+ifeq ($(CONFIG_PM_RUNTIME),y)
 obj-$(CONFIG_TRACEPOINTS) +=3D rpm-traces.o
+endif
 ifeq ($(CONFIG_TRACING),y)
 obj-$(CONFIG_KGDB_KDB) +=3D trace_kdb.o
 endif

thanks,
--
Ming Lei
