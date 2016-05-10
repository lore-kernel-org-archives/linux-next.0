From: Andy Gross <andy.gross@linaro.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Mon, 9 May 2016 20:52:12 -0500
Message-ID: <CAPBZ5QcRiG0w4WsU7rDGSNogH1PSONWSjrZ6fXWb4kdc+BH3JQ@mail.gmail.com>
References: <20160510112905.5bffcad8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f171.google.com ([209.85.161.171]:36116 "EHLO
	mail-yw0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753013AbcEJBwN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 May 2016 21:52:13 -0400
Received: by mail-yw0-f171.google.com with SMTP id o66so305255906ywc.3
        for <linux-next@vger.kernel.org>; Mon, 09 May 2016 18:52:13 -0700 (PDT)
In-Reply-To: <20160510112905.5bffcad8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>

On 9 May 2016 at 20:29, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> net/qrtr/smd.c:106:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .callback = qcom_smd_qrtr_callback,
>               ^
> net/qrtr/smd.c:106:14: note: (near initialization for 'qcom_smd_qrtr_driver.callback')
>
> Caused by commit
>
>   bdabad3e363d ("net: Add Qualcomm IPC router")
>
> interacting with commit
>
>   b853cb9628bf ("soc: qcom: smd: Make callback pass channel reference")
>
> from the arm-soc tree.
>
> I added the following merge fix patch (and it turned out I needed the
> new stubs).

Thanks for fixing this up.  I'll work with Bjorn to get this resolved.
I'll have something up for tomorrow's next pull.


Regards,

Andy Gross
