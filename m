From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Tue, 06 Oct 2015 13:21:14 -0400
Message-ID: <1479357.JFI07qj0hM@sifl>
References: <20151006135501.2d8bbb5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:36484 "EHLO
	mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204AbbJFRVQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2015 13:21:16 -0400
Received: by qkht68 with SMTP id t68so4473080qkh.3
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2015 10:21:15 -0700 (PDT)
In-Reply-To: <20151006135501.2d8bbb5b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Vander Stoep <jeffv@google.com>, linux-audit@redhat.com

On Tuesday, October 06, 2015 01:55:01 PM Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the audit tree got a conflict in:
> 
>   include/linux/lsm_audit.h
> 
> between commit:
> 
>   671a2781ff01 ("security: add ioctl specific auditing to lsm_audit")
> 
> from Linus' tree and commit:
> 
>   43cfd5e38587 ("audit: constify parts of common_audit_data and
> lsm_network_audit")
> 
> from the audit tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks, that patch looks correct, although I'm going to drop the patch causing 
this problem for the time being as there are some oddities with the build 
warning that you posted which aren't immediately obvious to me.  Something 
weird is causing it to work in audit#next but throw a warning when applied on 
top of Linus' current ... I'll reapply the patch once I've resolved the issue.

-- 
paul moore
www.paul-moore.com
