From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rpmsg tree
Date: Thu, 31 Aug 2017 16:54:47 +1000
Message-ID: <20170831165447.064fab6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Bjorn,

After merging the rpmsg tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "qcom_glink_native_probe" [drivers/rpmsg/qcom_glink_rpm.ko] undefined!
ERROR: "qcom_glink_native_remove" [drivers/rpmsg/qcom_glink_rpm.ko] undefined!

Maybe caused by commit

  6799c434c27b ("rpmsg: glink: Split rpm_probe to reuse the common code")

I have used the rpmsg tree from next-20170829 for today.

-- 
Cheers,
Stephen Rothwell
