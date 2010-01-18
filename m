From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: trivial tree build failure
Date: Mon, 18 Jan 2010 13:56:30 +0100
Message-ID: <20100118125630.GE8036@sortiz.org>
References: <20100118162412.9944c571.sfr@canb.auug.org.au>
 <63386a3d1001180036h2bad24cas8c407edde729678e@mail.gmail.com>
 <20100118200126.0176773d.sfr@canb.auug.org.au>
 <alpine.LNX.2.00.1001181115540.30977@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga10.intel.com ([192.55.52.92]:61142 "EHLO
	fmsmga102.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754509Ab0ARMy5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jan 2010 07:54:57 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1001181115540.30977@pobox.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.ml.walleij@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Egger <siccegge@stud.informatik.uni-erlangen.de>, Linus Walleij <linus.walleij@stericsson.com>

Hi Jiri,

On Mon, Jan 18, 2010 at 11:17:19AM +0100, Jiri Kosina wrote:
> On Mon, 18 Jan 2010, Stephen Rothwell wrote:
> 
> > Hi Jiri,
> > 
> > Today's linux-next build (x86_64_allmodconfig) failed like this:
> > 
> > drivers/mfd/ab3100-otp.c: In function 'show_otp':
> > drivers/mfd/ab3100-otp.c:101: error: dereferencing pointer to incomplete type
> > drivers/mfd/ab3100-otp.c:104: error: implicit declaration of function 'seq_printf'
> > drivers/mfd/ab3100-otp.c:102: warning: unused variable 'err'
> > drivers/mfd/ab3100-otp.c: In function 'ab3100_otp_open':
> > drivers/mfd/ab3100-otp.c:116: error: implicit declaration of function 'single_open'
> > drivers/mfd/ab3100-otp.c:116: error: 'ab3100_otp_show' undeclared (first use in this function)
> > drivers/mfd/ab3100-otp.c: At top level:
> > drivers/mfd/ab3100-otp.c:121: error: 'seq_read' undeclared here (not in a function)
> > drivers/mfd/ab3100-otp.c:122: error: 'seq_lseek' undeclared here (not in a function)
> > drivers/mfd/ab3100-otp.c:123: error: 'single_release' undeclared here (not in a function)
> > drivers/mfd/ab3100-otp.c: In function 'ab3100_otp_init_debugfs':
> > drivers/mfd/ab3100-otp.c:134: error: 'err' undeclared (first use in this function)
> > drivers/mfd/ab3100-otp.c: In function 'ab3100_otp_exit_debugfs':
> > drivers/mfd/ab3100-otp.c:140: error: implicit declaration of function 'debugfs_remove_file'
> > 
> > Exposed by commit 8dcafdf0475eb4633401d1f0bf0e0d35e4ebb9d5
> > "CONFIG_DEBUG_FS wrongly written as CONFIG_DEBUGFS".
> 
> Hmm, mea culpa. I have noticed the build failure myself and notified patch 
> author about that, but forgot to drop the patch from my tree afterwards. 
> Sorry.
> 
> On Mon, 18 Jan 2010, Linus Walleij wrote:
> 
> > 2010/1/18 Stephen Rothwell <sfr@canb.auug.org.au>:
> > 
> > > Exposed by commit 8dcafdf0475eb4633401d1f0bf0e0d35e4ebb9d5
> > > "CONFIG_DEBUG_FS wrongly written as CONFIG_DEBUGFS".
> > > I have reverted that commit for today.
> > 
> > I have sent a proper patch to Sam last night, that fix the #ifdef and
> > makes the code work.
> 
> I have dropped the patch from my tree now, and I am not carrying any 
> replacement as of now.
I'm carrying Linus patch for it, thanks.

Cheers,
Samuel.


> -- 
> Jiri Kosina
> SUSE Labs, Novell Inc.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
