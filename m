From: "Jon Smirl" <jonsmirl@gmail.com>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Thu, 3 Jul 2008 08:22:18 -0400
Message-ID: <9e4733910807030522h1aa0bl1801ecc5fc877c25@mail.gmail.com>
References: <20080703133905.7b6f058f.sfr@canb.auug.org.au>
	 <20080703054739.GA643@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:25084 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758671AbYGCMWT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 08:22:19 -0400
Received: by yx-out-2324.google.com with SMTP id 8so219838yxm.1
        for <linux-next@vger.kernel.org>; Thu, 03 Jul 2008 05:22:18 -0700 (PDT)
In-Reply-To: <20080703054739.GA643@secretlab.ca>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, galak@kernel.crashing.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Jean Delvare <khali@linux-fr.org>, linux-next@vger.kernel.org, Timur Tabi <timur@freescale.com>

On 7/3/08, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Thu, Jul 03, 2008 at 01:39:05PM +1000, Stephen Rothwell wrote:
>  > Hi Paul,
>  >
>  > Today's linux-next merge of the powerpc tree got a conflict in
>  > arch/powerpc/sysdev/fsl_soc.c between commit
>  > 4eac6a8b17ce5ebe66eb94b6a0b43aa3a2bf7ea6 ("i2c-mpc: Convert to an
>  > of_platform driver") from the i2c tree and commits
>
>
> It probably would have been better for this patch to go in via the
>  PowerPC tree.  It only touches powerpc-specific i2c code, not any i2c
>  core code.  There are quite a few MPCxxxx ports which use this driver,
>  I'd be happier to see it dropped from the i2c tree and merged in via
>  either Kumar or myself.
>
>  I'd also like to see some acks from people who have tested this patch
>  before it goes in.  (I'm just as guilty here; I'll apply it and test it
>  to my tree tomorrow).

I'm using it in my system. It doesn't change the function of the i2c
controller, only how drivers get loaded. So if you boot and your
devices are there it is working.

Testing was good when the patch was initially posted in January. In
the last six months the initial patch set has been sliced and diced
into a bunch of different pieces but the contents of this patch are
essentially unchanged.

I don't care which tree it uses to get to mainline, I'd just like to
see it get merged.


>
>
>  g.
>
>


-- 
Jon Smirl
jonsmirl@gmail.com
