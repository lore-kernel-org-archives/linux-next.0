From: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Fri, 7 Aug 2015 02:33:02 -0400
Message-ID: <20150807063302.GA23800@madcap2.tricolour.ca>
References: <20150807141541.772edd2f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40665 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753215AbbHGGdG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Aug 2015 02:33:06 -0400
Content-Disposition: inline
In-Reply-To: <20150807141541.772edd2f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ameen Ali <ameenali023@gmail.com>

On 15/08/07, Stephen Rothwell wrote:
> Hi Paul,

Hi Stephen,

> Today's linux-next merge of the audit tree got a conflict in:
> 
>   kernel/audit.c
> 
> between commit:
> 
>   5985de6754a6 ("audit: code clean up")
> 
> from Linus' tree and commit:
> 
>   84cb777e6781 ("audit: use macros for unset inode and device values")
> 
> from the audit tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Yup, looks good, thanks!  :)

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc kernel/audit.c
> index f9e6065346db,060153dc47d4..000000000000
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@@ -1761,7 -1759,7 +1761,7 @@@ void audit_log_name(struct audit_contex
>   	} else
>   		audit_log_format(ab, " name=(null)");
>   
> - 	if (n->ino != (unsigned long)-1)
>  -	if (n->ino != AUDIT_INO_UNSET) {
> ++	if (n->ino != AUDIT_INO_UNSET)
>   		audit_log_format(ab, " inode=%lu"
>   				 " dev=%02x:%02x mode=%#ho"
>   				 " ouid=%u ogid=%u rdev=%02x:%02x",

- RGB

--
Richard Guy Briggs <rbriggs@redhat.com>
Senior Software Engineer, Kernel Security, AMER ENG Base Operating Systems, Red Hat
Remote, Ottawa, Canada
Voice: +1.647.777.2635, Internal: (81) 32635, Alt: +1.613.693.0684x3545
