From: Peter Foley <pefoley2@pefoley.com>
Subject: Re: linux-next: build failure after merge of the rd-docs tree
Date: Tue, 16 Sep 2014 19:18:42 -0400
Message-ID: <CAOFdcFOXQRmxFQV_ei3xcdRLaCxEa4yjc=s=xjNM6R3SQBySgg@mail.gmail.com>
References: <20140916171102.61509be5@canb.auug.org.au> <CAOFdcFMDnR50cS-Geb0S1S2VRPzZqDr9zzqUp-DpMYLfF0qtvQ@mail.gmail.com>
 <20140917090020.1f3c2c30@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:56699 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752870AbaIPXTE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Sep 2014 19:19:04 -0400
Received: by mail-vc0-f170.google.com with SMTP id hy4so592199vcb.15
        for <linux-next@vger.kernel.org>; Tue, 16 Sep 2014 16:19:02 -0700 (PDT)
In-Reply-To: <20140917090020.1f3c2c30@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 16, 2014 at 7:00 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Peter,
>
> My build machine runs Debian stable which only has libc6 version 2.13.

Ok, depending on a specific glibc version seems kinda hacky.
Maybe we should just disable auto-building vdso_test?

Randy?
