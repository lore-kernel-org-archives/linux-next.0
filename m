From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the lblnet tree with Linus' tree
Date: Tue, 10 Mar 2009 17:13:34 +1100
Message-ID: <20090310171334.bd6d51fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60751 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751730AbZCJGNi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 02:13:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org, Dave Jones <davej@redhat.com>, Matthew Garrett <mjg@redhat.com>

Hi Paul,

Today's linux-next merge of the lblnet tree got a conflict in
Documentation/feature-removal-schedule.txt between commit
753b7aea8e4611433c13ac157f944d8b4bf42482 ("[CPUFREQ] Add p4-clockmod
sysfs-ui removal to feature-removal schedule") from Linus' tree and
commit 4c7098cc3b1ccf2930bfb866e108e6cd10f4b2f3 ("selinux: Remove the
"compat_net" compatibility code") from the lblnet tree.

Just overlapping additions/removal.  I fixed it up (see below) and can
carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/feature-removal-schedule.txt
index 72da982,d6b6dc07..0000000
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@@ -333,24 -323,3 +333,13 @@@ When:	June 200
  Why:	Deprecated by the new fschmd driver.
  Who:	Hans de Goede <hdegoede@redhat.com>
  	Jean Delvare <khali@linux-fr.org>
 +
 +---------------------------
 +
- What:	SELinux "compat_net" functionality
- When:	2.6.30 at the earliest
- Why:	In 2.6.18 the Secmark concept was introduced to replace the "compat_net"
- 	network access control functionality of SELinux.  Secmark offers both
- 	better performance and greater flexibility than the "compat_net"
- 	mechanism.  Now that the major Linux distributions have moved to
- 	Secmark, it is time to deprecate the older mechanism and start the
- 	process of removing the old code.
- Who:	Paul Moore <paul.moore@hp.com>
- ---------------------------
- 
 +What:	sysfs ui for changing p4-clockmod parameters
 +When:	September 2009
 +Why:	See commits 129f8ae9b1b5be94517da76009ea956e89104ce8 and
 +	e088e4c9cdb618675874becb91b2fd581ee707e6.
 +	Removal is subject to fixing any remaining bugs in ACPI which may
 +	cause the thermal throttling not to happen at the right time.
 +Who:	Dave Jones <davej@redhat.com>, Matthew Garrett <mjg@redhat.com>
