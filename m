From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Subject: Re: linux-next: manual merge of the akpm with Linus' tree
Date: Tue, 30 Aug 2011 23:24:32 +0800
Message-ID: <CAM_iQpXmwb3DhwJ3WbojKUWmbmVL3Qxkx8w8oLnOKYC+=hWO4Q@mail.gmail.com>
References: <20110829152250.d6427f6ecee4dbd59718cc4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:62092 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755033Ab1H3PYd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Aug 2011 11:24:33 -0400
In-Reply-To: <20110829152250.d6427f6ecee4dbd59718cc4f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 29, 2011 at 1:22 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> Today's linux-next merge of the scsi-post-merge tree got a conflict in
> arch/cris/include/asm/serial.h between commit 02016bc0381c ("cris: add
> arch/cris/include/asm/serial.h") from Linus' tree and commit f8b20ed71f1b
> ("Fix the following build errors:") from the akpm tree.
>
> There former appears to be a later version of the latter, so I dropped
> the latter.

Yeah, thanks Stephen!
