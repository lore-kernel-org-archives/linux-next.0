From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: manual merge of the lblnet tree with Linus' tree
Date: Tue, 10 Mar 2009 11:00:36 -0400
Message-ID: <200903101100.36903.paul.moore@hp.com>
References: <20090310171334.bd6d51fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0007.atlanta.hp.com ([15.192.0.44]:31754 "EHLO
	g5t0007.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770AbZCJPBK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2009 11:01:10 -0400
In-Reply-To: <20090310171334.bd6d51fb.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dave Jones <davej@redhat.com>, Matthew Garrett <mjg@redhat.com>

On Tuesday 10 March 2009 02:13:34 am Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next merge of the lblnet tree got a conflict in
> Documentation/feature-removal-schedule.txt between commit
> 753b7aea8e4611433c13ac157f944d8b4bf42482 ("[CPUFREQ] Add p4-clockmod
> sysfs-ui removal to feature-removal schedule") from Linus' tree and
> commit 4c7098cc3b1ccf2930bfb866e108e6cd10f4b2f3 ("selinux: Remove the
> "compat_net" compatibility code") from the lblnet tree.
>
> Just overlapping additions/removal.  I fixed it up (see below) and can
> carry the fix for a while.

Thanks Stephen, I just updated the lblnet tree so there should be no conflict 
here come tomorrow.

-- 
paul moore
linux @ hp
