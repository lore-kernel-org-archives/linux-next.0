From: Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the edac tree
Date: Thu, 1 Dec 2016 11:02:04 -0500
Message-ID: <20161201160203.hhm6w3iyrnvcukzu@yaz-fedora.dyhomenet>
References: <20161128143726.7fda1849@canb.auug.org.au>
 <20161128082734.bdl4dhothemm7ja5@pd.tnic>
 <20161130085013.4798b4a7@vento.lan>
 <20161201104846.kjvuy5tj475oxzke@pd.tnic>
 <20161201100617.511d8aae@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161201100617.511d8aae@vento.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Borislav Petkov <bp@alien8.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Dec 01, 2016 at 10:06:17AM -0200, Mauro Carvalho Chehab wrote:
> 
> However, rebasing over your tree showed a new documentation gap:
> 	./include/linux/edac.h:144: warning: Enum value 'HW_EVENT_ERR_DEFERRED' not described in enum 'hw_event_mc_err_type'
> 
> With was introduced by this commit:
> 
>   commit d12a969ebbfcfc25853c4147d42b388f758e8784
>   Author: Yazen Ghannam <Yazen.Ghannam@amd.com>
>   Date:   Thu Nov 17 17:57:32 2016 -0500
> 
>     EDAC, amd64: Add Deferred Error type
>     
>     Currently, deferred errors are classified as correctable in EDAC. Add a
>     new error type for deferred errors so that they are correctly reported
>     to the user.
>     
>     Signed-off-by: Yazen Ghannam <Yazen.Ghannam@amd.com>
>     Cc: Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>
>     Cc: linux-edac <linux-edac@vger.kernel.org>
>     Link: http://lkml.kernel.org/r/1479423463-8536-7-git-send-email-Yazen.Ghannam@amd.com
>     Signed-off-by: Borislav Petkov <bp@suse.de>
> 
> 
> Yazen introduced a "deferred error" code (whatever it means), but didn't
> document what's that. Unfortunately, the patch description is also
> not clear enough about what a "deferred error" means or how userspace
> is supposed to handle it.
> 
> Yazen,
> 
> Could you please send us a patch adding a proper description for this
> new error code?
>

Hi Mauro,
A deferred error is an uncorrectable error whose handling can be
deferred, i.e. it's not urgent. This affects the system behavior, but
I'm now thinking that this shouldn't affect users' behavior. I think it
would be simpler to just classify deferred errors as uncorrectable
errors so that users treat them as such.

Boris,
Can we drop or revert commit d12a969ebbfc?

And can we apply a fixup like this to commit 713ad54675fd?

---
From: Yazen Ghannam <Yazen.Ghannam@amd.com>
Date: Thu, 1 Dec 2016 08:54:49 -0600
Subject: [PATCH] fixup! EDAC, amd64: Define and register UMC error decode
 function

Signed-off-by: Yazen Ghannam <Yazen.Ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 991b36c..245b9a0 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2480,8 +2480,9 @@ static void decode_umc_error(int node_id, struct mce *m)
 
        memset(&err, 0, sizeof(err));
 
+       /* Log deferred errors as uncorrectable errors. */
        if (m->status & MCI_STATUS_DEFERRED)
-               ecc_type = 3;
+               ecc_type = 1;
 
        err.channel = find_umc_channel(pvt, m);
        if (err.channel < 0) {
-- 
2.7.4

---

Thanks,
Yazen
