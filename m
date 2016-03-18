From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: linux-next: Crash in arm_pmu_device_probe() due to 'drivers/perf:
 arm_pmu: make info messages more verbose'
Date: Fri, 18 Mar 2016 10:18:36 +0100
Message-ID: <56EBC7EC.6000907@de.bosch.com>
References: <56EBA3C3.10907@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:38208 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754122AbcCRJSk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Mar 2016 05:18:40 -0400
In-Reply-To: <56EBA3C3.10907@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <private@roeck-us.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Will Deacon <will.deacon@arm.com>

Hi Guenter,

On 18.03.2016 07:44, Guenter Roeck wrote:
> Hi,
>
> I am seeing the attached crash when running a realview-pb-a8 image with
> realview_defconfig in qemu.
> bisect wasn't successful, but a commit analysis identified commit
> 'drivers/perf: arm_pmu: make info
> messages more verbose' as the culprit. Reverting this commit fixes the
> problem.
>
> The code roughly looks as follows.
>
> int arm_pmu_device_probe()
> {
>      ...
>      if (node && ..) {
>      } else {
>      }
>
>      if (ret) {
>                  pr_info("%s: failed to probe PMU! Error %i\n",
>                          node->full_name, ret);
>                  goto out_free;
>      }
>      ....
> out_free:
>      pr_info("%s: failed to register PMU devices! Error %i\n",
>                  node->full_name, ret);
>      ....
> }
>
> Note that 'node' is dereferenced even though it was previously checked
> if it is NULL.
> The configuration I am testing does not use devicetree.
>
> Can you use dev_info() instead ?


Does anything like below [1] does work for you?

If so, could you please share the output? I.e. what it prints in your 
non-devicetree non-pmu case?

Best regards

Dirk

[1]

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 11bacc7..bda3502 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -1002,8 +1002,7 @@ int arm_pmu_device_probe(struct platform_device *pdev,
         }

         if (ret) {
-               pr_info("%s: failed to probe PMU! Error %i\n",
-                       node->full_name, ret);
+               dev_info(&pdev->dev, "failed to probe PMU! Error %i\n", 
ret);
                 goto out_free;
         }

@@ -1023,8 +1022,7 @@ int arm_pmu_device_probe(struct platform_device *pdev,
  out_destroy:
         cpu_pmu_destroy(pmu);
  out_free:
-       pr_info("%s: failed to register PMU devices! Error %i\n",
-               node->full_name, ret);
+       dev_info(&pdev->dev, "failed to register PMU devices! Error 
%i\n", ret);
         kfree(pmu);
         return ret;
  }
