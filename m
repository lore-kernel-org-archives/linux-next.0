From: Evan Green <evgreen@chromium.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
Date: Thu, 26 Apr 2018 03:39:25 +0000
Message-ID: <CAE=gft6e6wo1nj+Rw5=f+UXxhx3Hof7Nt=E9+-OAzvvv8Gct1g@mail.gmail.com>
References: <20180426084041.5cf81918@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426084041.5cf81918@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: agross@codeaurora.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>, groeck@chromium.org
List-Id: linux-next.vger.kernel.org

On Wed, Apr 25, 2018 at 3:42 PM Stephen Rothwell <sfr@canb.auug.org.au>
wrote:

> Hi Andy,

> After merging the qcom tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

> ERROR: "geni_se_select_mode" [drivers/tty/serial/qcom_geni_serial.ko]
undefined!
> ERROR: "geni_se_init" [drivers/tty/serial/qcom_geni_serial.ko] undefined!
> ERROR: "geni_se_config_packing" [drivers/tty/serial/qcom_geni_serial.ko]
undefined!
> ERROR: "geni_se_resources_off" [drivers/tty/serial/qcom_geni_serial.ko]
undefined!
> ERROR: "geni_se_resources_on" [drivers/tty/serial/qcom_geni_serial.ko]
undefined!

> Probably caused by commit

>    eddac5af0654 ("soc: qcom: Add GENI based QUP Wrapper driver")

> I have used the qcom tree from next-20180424 for today.

> --
> Cheers,
> Stephen Rothwell

Guenter and I had a fix for compile test here, which had failures that
looked similar:

https://lkml.org/lkml/2018/4/18/752

I was hoping to verify myself whether or not this fixed allmodconfig, but
my machine at home is not so fast, and I must be missing something, either
in the configuration or the tree. Which tree exactly are you building?
-Evan
