From: Thomas Renninger <trenn@suse.de>
Subject: Re: linux-next: cpufreq tree build failure
Date: Tue, 4 Aug 2009 01:22:14 +0200
Message-ID: <200908040122.15733.trenn@suse.de>
References: <20090803122819.6b738cad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932347AbZHCXVj@vger.kernel.org>
In-Reply-To: <20090803122819.6b738cad.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Jones <davej@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Monday 03 August 2009 04:28:19 am Stephen Rothwell wrote:
> Hi Dave,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> ERROR: "cpufreq_global_kobject" [drivers/cpufreq/cpufreq_ondemand.ko]
> undefined!
>
> Caused by commit 35b104d88338e5eddb36c670fea4752f6c10c82f ("[CPUFREQ]
> ondemand - Use global sysfs dir for tuning settings").  Presumably
> cpufreq_global_kobject needs an EXPORT_SYMBOL.

Yep, that's it. Below is a fix.

Thanks a lot,

     Thomas

---------
CPUFREQ: fix build if ondemand is compiled as module

struct kobject *cpufreq_global_kobject must be exported

CC: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Dave Jones <davej@redhat.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 9bb2c4a..9d9251f 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -778,6 +778,7 @@ define_one_global_ro(scaling_driver);
 define_one_global_rw(scaling_governor);
 
 struct kobject *cpufreq_global_kobject;
+EXPORT_SYMBOL(cpufreq_global_kobject);
 
 #define to_policy(k) container_of(k, struct cpufreq_policy, kobj)
 #define to_attr(a) container_of(a, struct freq_attr, attr)
