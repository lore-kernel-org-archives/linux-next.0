From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Wed, 21 Jun 2017 11:25:20 +1000
Message-ID: <20170621112520.1ffc0709@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-next.vger.kernel.org

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "qcom_scm_is_available" [drivers/media/platform/qcom/venus/venus-core.ko] undefined!
ERROR: "qcom_scm_pas_shutdown" [drivers/media/platform/qcom/venus/venus-core.ko] undefined!
ERROR: "qcom_scm_set_remote_state" [drivers/media/platform/qcom/venus/venus-core.ko] undefined!

Caused by commits

  af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
  d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
  703528005e58 ("[media] media: venus: enable building of Venus video driver")

I have merged the 4vl-dvb tree from next-20170620 for today.

-- 
Cheers,
Stephen Rothwell
