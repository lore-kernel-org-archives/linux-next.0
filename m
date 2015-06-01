From: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Mon, 1 Jun 2015 11:59:11 -0400
Message-ID: <20150601155911.GA5894@madcap2.tricolour.ca>
References: <20150601163001.01003d92@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60333 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751479AbbFAP7P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 11:59:15 -0400
Content-Disposition: inline
In-Reply-To: <20150601163001.01003d92@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morris <james.l.morris@oracle.com>

On 15/06/01, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the audit tree got a conflict in
> security/lsm_audit.c between commit 5deeb5cece3f ("lsm: copy comm
> before calling audit_log to avoid race in string printing") from Linus'
> tree and commit 5c5bc97e2fc8 ("lsm: rename duplicate labels in
> LSM_AUDIT_DATA_TASK audit message type") from the audit tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Perfect, thanks, fix looks right.  Cheers!

> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc security/lsm_audit.c
> index 1d34277dc402,07fc99724d41..000000000000
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@@ -281,10 -281,8 +281,10 @@@ static void dump_common_audit_data(stru
>   		if (tsk) {
>   			pid_t pid = task_pid_nr(tsk);
>   			if (pid) {
>  +				char comm[sizeof(tsk->comm)];
> - 				audit_log_format(ab, " pid=%d comm=", pid);
> + 				audit_log_format(ab, " opid=%d ocomm=", pid);
>  -				audit_log_untrustedstring(ab, tsk->comm);
>  +				audit_log_untrustedstring(ab,
>  +				    memcpy(comm, tsk->comm, sizeof(comm)));
>   			}
>   		}
>   		break;



- RGB

--
Richard Guy Briggs <rbriggs@redhat.com>
Senior Software Engineer, Kernel Security, AMER ENG Base Operating Systems, Red Hat
Remote, Ottawa, Canada
Voice: +1.647.777.2635, Internal: (81) 32635, Alt: +1.613.693.0684x3545
