From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the edac
 tree
Date: Thu, 1 Dec 2016 10:06:17 -0200
Message-ID: <20161201100617.511d8aae@vento.lan>
References: <20161128143726.7fda1849@canb.auug.org.au>
        <20161128082734.bdl4dhothemm7ja5@pd.tnic>
        <20161130085013.4798b4a7@vento.lan>
        <20161201104846.kjvuy5tj475oxzke@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:57088
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750708AbcLAMGY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2016 07:06:24 -0500
In-Reply-To: <20161201104846.kjvuy5tj475oxzke@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Yazen Ghannam <Yazen.Ghannam@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em Thu, 1 Dec 2016 11:48:46 +0100
Borislav Petkov <bp@alien8.de> escreveu:

> On Wed, Nov 30, 2016 at 08:50:13AM -0200, Mauro Carvalho Chehab wrote:
> > Fixed. If you have a stable branch, I can rebase it on the top
> > of your patches, in order to avoid the confict at linux-next.
> 
> http://git.kernel.org/cgit/linux/kernel/git/bp/bp.git/log/?h=for-next

Thanks!

> but with that fixed, shouldn't the merge work without a conflict?

Well, we're removing some lines from one file and adding them on another
one. Git is not smart enough to solve such conflicts automatically:

	CONFLICT (content): Merge conflict in drivers/edac/edac_mc.c
	Recorded preimage for 'drivers/edac/edac_mc.c'
	Automatic merge failed; fix conflicts and then commit the result.

Anyway, I rebased my work on the top of your branch. The conflict
is now gone:

	https://git.kernel.org/cgit/linux/kernel/git/mchehab/linux-edac.git/log/?h=linux_next

You can see the generated documentation at:
	https://mchehab.fedorapeople.org/kernel_docs/admin-guide/ras.html
	(user and admin guide)
and:
	https://mchehab.fedorapeople.org/kernel_docs/driver-api/edac.html
	(kernel API)

However, rebasing over your tree showed a new documentation gap:
	./include/linux/edac.h:144: warning: Enum value 'HW_EVENT_ERR_DEFERRED' not described in enum 'hw_event_mc_err_type'

With was introduced by this commit:

  commit d12a969ebbfcfc25853c4147d42b388f758e8784
  Author: Yazen Ghannam <Yazen.Ghannam@amd.com>
  Date:   Thu Nov 17 17:57:32 2016 -0500

    EDAC, amd64: Add Deferred Error type
    
    Currently, deferred errors are classified as correctable in EDAC. Add a
    new error type for deferred errors so that they are correctly reported
    to the user.
    
    Signed-off-by: Yazen Ghannam <Yazen.Ghannam@amd.com>
    Cc: Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>
    Cc: linux-edac <linux-edac@vger.kernel.org>
    Link: http://lkml.kernel.org/r/1479423463-8536-7-git-send-email-Yazen.Ghannam@amd.com
    Signed-off-by: Borislav Petkov <bp@suse.de>


Yazen introduced a "deferred error" code (whatever it means), but didn't
document what's that. Unfortunately, the patch description is also
not clear enough about what a "deferred error" means or how userspace
is supposed to handle it.

Yazen,

Could you please send us a patch adding a proper description for this
new error code?

Thanks!
Mauro
