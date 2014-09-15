From: Behan Webster <behanw@converseincode.com>
Subject: Re: linux-next: manual merge of the llvmlinux tree with the  tree
Date: Mon, 15 Sep 2014 07:24:28 -0700
Message-ID: <5416F69C.8040905@converseincode.com>
References: <20140915163813.490886b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:63097 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbaIOOZE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Sep 2014 10:25:04 -0400
Received: by mail-pa0-f44.google.com with SMTP id kx10so6516304pab.17
        for <linux-next@vger.kernel.org>; Mon, 15 Sep 2014 07:25:03 -0700 (PDT)
In-Reply-To: <20140915163813.490886b4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, llvmlinux@lists.linuxfoundation.org, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Charlebois <charlebm@gmail.com>, Rob Clark <robdclark@gmail.com>

On 09/14/14 23:38, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the llvmlinux tree got a conflict in
> drivers/gpu/drm/msm/hdmi/hdmi.c between commit fc886107c556 ("drm/msm:
> Change nested function to static function") from the watchdog tree and
> commit 8f2c494adad0 ("msm, hdmi: LLVMLinux: Remove nested function from
> HDMI driver") from the llvmlinux tree.
>
> I fixed it up (these patches are doing the same thing, so I used the
> version in the watchdog tree) and can carry the fix as necessary (no
> action is required).
>
> P.S. Behan, I noticed that the llvmlinux patch has no Signed-off-by
> from you even though you committed it ...
Drat. That patch wasn't supposed to be in there. Sorry about that.

Yeah. That one was accepted upstream already. I was carrying it in my 
repos so we could still build until it made it to mainline. I should not 
have put that in linux-next. I actually just had to pull it out of my 
own builds due to the same merge issue.

Hmm. Seems I put a couple of patches into the for-next branch late last 
night which shouldn't have been. Fixed.

Apologies,

Behan

-- 
Behan Webster
behanw@converseincode.com
