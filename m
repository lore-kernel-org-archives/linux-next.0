From: Chris Zankel <chris@zankel.net>
Subject: Re: linux-next: manual merge of the xtensa tree with Linus' tree
Date: Sun, 21 Oct 2012 16:57:00 -0700
Message-ID: <50848BCC.9030208@zankel.net>
References: <20121022104056.d157f09f9c71052ecc1f64a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53121 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752930Ab2JUX5D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 21 Oct 2012 19:57:03 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr4so1580279pbb.19
        for <linux-next@vger.kernel.org>; Sun, 21 Oct 2012 16:57:01 -0700 (PDT)
In-Reply-To: <20121022104056.d157f09f9c71052ecc1f64a5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

Sorry, I accidentally pushed this patch up; should be fixed the next 
next time you pull.

Thanks,
-Chris



On 10/21/2012 04:40 PM, Stephen Rothwell wrote:
> Hi Chris,
>
> Today's linux-next merge of the xtensa tree got a conflict in
> arch/xtensa/include/uapi/asm/unistd.h between commit 7216cabfff51
> ("xtensa: add missing system calls to the syscall table") from Linus'
> tree and commit daff2ab722aa ("xtensa: add missing system calls to the
> syscall table") from the xtensa tree.
>
> These clearly were meant to be the same patch but the on in Linus' tree
> has a later date, so I used it and can carry the fix as necessary (no
> action is required).
>
> Also, the top most commit in the xtensa tree has no signed-off-by line or
> any real commit message.  Please fix that up.
>
