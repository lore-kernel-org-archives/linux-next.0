From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Wed, 21 Jun 2017 11:54:26 +0300
Message-ID: <73acaf57-e74a-ac40-a1f5-9f9aa358b4df@linaro.org>
References: <20170621112520.1ffc0709@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170621112520.1ffc0709@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 06/21/2017 04:25 AM, Stephen Rothwell wrote:
> Hi Mauro,
> 
> After merging the v4l-dvb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "qcom_scm_is_available" [drivers/media/platform/qcom/venus/venus-core.ko] undefined!
> ERROR: "qcom_scm_pas_shutdown" [drivers/media/platform/qcom/venus/venus-core.ko] undefined!
> ERROR: "qcom_scm_set_remote_state" [drivers/media/platform/qcom/venus/venus-core.ko] undefined!
> 
> Caused by commits
> 
>   af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
>   d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>   703528005e58 ("[media] media: venus: enable building of Venus video driver")
> 
> I have merged the 4vl-dvb tree from next-20170620 for today.
> 

I've investigated this and the issue comes from this commit:

d4348b43bbcadb6d5faee36024245944b6600d25 firmware: qcom_scm: Fix to
allow COMPILE_TEST-ing

which is from Andy's qcom git tree, I asked Andy to drop this patch
because it was rejected.

I also manually merged v4l-dvb:master and reverted above commit. After
that allmodconfig builds fine and the subject error from venus driver
disappeared.

Sorry for inconvenience.

-- 
regards,
Stan
