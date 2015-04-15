From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on
 score/paris/..
Date: Wed, 15 Apr 2015 23:19:56 +0200
Message-ID: <20150415211956.GA6703@chrystal.uk.oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
 <552E6722.1080507@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:51492 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951AbbDOVRp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2015 17:17:45 -0400
Content-Disposition: inline
In-Reply-To: <552E6722.1080507@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2015 at 06:26:58AM -0700, Guenter Roeck wrote:
> On 04/15/2015 01:54 AM, Quentin Casasnovas wrote:
> > The following two patches might (hopefully) fix the build breakage on score
> > and some other architectures.  I've checked the new __ex_table checker
> > still works on x86-64 with them (it still detects an entry pointing to
> > .altinstr_rplacement) and they should apply cleanly on top of Rusty's
> > module-next branch.
> >
> > Thanks to Guenter for the bug analysis and sorry again for the breakage.
> >
> > Let me know if this makes things better..
> >
> 
> the crash is fixed, but now I get
> 
> FATAL: The relocation at __ex_table+0x4 references
> section "" which is not executable, IOW
> the kernel will fault if it ever tries to
> jump to it.  Something is seriously wrong
> and should be fixed.
> 
> for parisc:defconfig,
> 
> FATAL: The relocation at __ex_table+0x634 references
> section "__ex_table" which is not executable, IOW
> the kernel will fault if it ever tries to
> jump to it.  Something is seriously wrong
> and should be fixed.
> 
> for score:allnoconfig, and
> 
> FATAL: The relocation at __ex_table+0x8 references
> section "" which is not executable, IOW
> it is not possible for the kernel to fault
> at that address.  Something is seriously wrong
> and should be fixed.
> 
> for mn10300:defconfig.
> 
> While I agree that those should get fixed (if they are real problems,
> especially the ones for parisc and mn10300), I don't think it is
> a good idea to fail the build because of it.
> 
> Note that I did find the problem in the score build; that was a real bug.
> I don't know what may be wrong with the others.
> 

The attached patch fixes the build failures on parisc and mn10300 on my
defconfig build and should apply cleanly on top of the previous two.

I'm not able to download the score cross toolchain for the moment but will
do tomorrow. Guenter, may I ask if there were any other problems than the
one you fixed in string.S there?

Quentin

--VS++wcV0S1rZb1Fb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-modpost-do-not-try-to-match-the-SHT_NUL-section.patch"

>From 2e9abac9cbde18af48951c54d52c9c515f9883a7 Mon Sep 17 00:00:00 2001
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Date: Wed, 15 Apr 2015 22:39:50 +0200
Subject: [PATCH] modpost: do not try to match the SHT_NUL section.

Trying to match the SHT_NUL section isn't useful and causes build failures
on parisc and mn10300 since the addition of section strict white-listing
and __ex_table sanitizing.

Signed-off-by: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
CC: Rusty Russell <rusty@rustcorp.com.au>
Fixes: 050e57fd5936 ("modpost: add strict white-listing when referencing....")
Fixes: 52dc0595d540 ("modpost: handle relocations mismatch in __ex_table.")
---
 scripts/mod/modpost.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index fd94977..45e4027 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1064,6 +1064,15 @@ static const struct sectioncheck *section_mismatch(
 	int elems = sizeof(sectioncheck) / sizeof(struct sectioncheck);
 	const struct sectioncheck *check = &sectioncheck[0];
 
+	/*
+	 * The target section could be the SHT_NUL section when we're
+	 * handling relocations to un-resolved symbols, trying to match it
+	 * doesn't make much sense and causes build failures on parisc and
+	 * mn10300 architectures.
+	 */
+	if (*tosec == '\0')
+		return NULL;
+
 	for (i = 0; i < elems; i++) {
 		if (match(fromsec, check->fromsec)) {
 			if (check->bad_tosec[0] && match(tosec, check->bad_tosec))
-- 
2.0.5


--VS++wcV0S1rZb1Fb--
