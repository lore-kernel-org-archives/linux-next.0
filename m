From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: build failure after merge of the rpmsg tree
Date: Thu, 31 Aug 2017 10:47:37 -0700
Message-ID: <20170831174737.GS29306@minitux>
References: <20170831165447.064fab6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170831165447.064fab6f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed 30 Aug 23:54 PDT 2017, Stephen Rothwell wrote:

> Hi Bjorn,
> 
> After merging the rpmsg tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "qcom_glink_native_probe" [drivers/rpmsg/qcom_glink_rpm.ko] undefined!
> ERROR: "qcom_glink_native_remove" [drivers/rpmsg/qcom_glink_rpm.ko] undefined!
> 
> Maybe caused by commit
> 
>   6799c434c27b ("rpmsg: glink: Split rpm_probe to reuse the common code")
> 

Thanks for letting me know Stephen, those functions should have been
exported and I've corrected it.

> I have used the rpmsg tree from next-20170829 for today.
> 

Thanks,
Bjorn
