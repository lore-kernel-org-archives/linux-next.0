From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Dec 20
Date: Tue, 20 Dec 2016 15:44:30 -0500
Message-ID: <CAP=VYLpBn=d0U_GXY-BjN=c=CQsCObE2_DqXEws9BHwbMnYGFw@mail.gmail.com>
References: <20161220125547.72820ddf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:36325 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756123AbcLTUpv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Dec 2016 15:45:51 -0500
In-Reply-To: <20161220125547.72820ddf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "ralf@linux-mips.org" <ralf@linux-mips.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Dec 19, 2016 at 8:55 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Please do not add any material for v4.11 to your linux-next included
> branches until after v4.10-rc1 has been released.

Some recent MIPS build fails showed up, mindless bisect run says:

ad1ccae78b7d7508b39f742631e210407033e8e6 is the first bad commit
commit ad1ccae78b7d7508b39f742631e210407033e8e6
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Thu Dec 15 12:39:22 2016 +0100

    MIPS: IP22: Fix build error due to binutils 2.25 uselessnes.

Seems the fix upsets other older junk ; locally I have:

 $ mips-linux-ld -v
GNU ld (GNU Binutils) 2.22

Appears on "allnoconfig" and several other mips builds.

I gave Ralf a heads up on IRC as well..

Paul.
--



>
> Changes since 20161219:
>
> The kvm tree lost its build failure.
>
> Non-merge commits (relative to Linus' tree): 566
>  1073 files changed, 26213 insertions(+), 8676 deletions(-)
>
