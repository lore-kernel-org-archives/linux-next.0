From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: error fetching the devicetree tree
Date: Fri, 10 Oct 2014 22:15:47 +0100
Message-ID: <CACxGe6toD+rCS4eS1n4gtNj99o6mQxoB_MKVxBU-k-R9H-3wjA@mail.gmail.com>
References: <20141008094858.759d0597@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:47551 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751514AbaJJVQI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Oct 2014 17:16:08 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so4327728igb.14
        for <linux-next@vger.kernel.org>; Fri, 10 Oct 2014 14:16:08 -0700 (PDT)
In-Reply-To: <20141008094858.759d0597@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

Yes, the server is down and being worked on. I've moved my tree to
kernel.org. Here is the new URL:

git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git

g.


On Tue, Oct 7, 2014 at 11:48 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> Fetching the devicetree tree this morning produced this error:
>
> fatal: unable to connect to git.secretlab.ca:
> git.secretlab.ca[0: 208.123.74.12]: errno=Connection timed out
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
