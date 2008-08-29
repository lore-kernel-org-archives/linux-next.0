From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 29 Aug 2008 18:56:17 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808291855370.30002@tundra.namei.org>
References: <20080829181442.e00b23ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:35846 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751295AbYH2I5Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 04:57:24 -0400
In-Reply-To: <20080829181442.e00b23ea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, KaiGai Kohei <kaigai@ak.jp.nec.com>, Stephen Smalley <sds@tycho.nsa.gov>

On Fri, 29 Aug 2008, Stephen Rothwell wrote:

> Hi David,
> 
> Today's linux-next merge of the creds tree got a conflict in
> security/selinux/hooks.c between commit
> d9250dea3f89fe808a525f08888016b495240ed4 ("SELinux: add boundary support
> and thread context assignment") from the security-testing tree and commit
> 89be244cbb79a6c4a6d73730a1f042fc04d30967 ("CRED: Inaugurate COW
> credentials") from the creds tree.
> 
> I fixed it up as best I could (see below) and can carry the fix.

Thanks -- hopefully there'll be a new creds branch available soon.


> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc security/selinux/hooks.c
> index 89f446d,b6ae264..0000000
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@@ -5206,49 -5312,30 +5312,37 @@@ static int selinux_setprocattr(struct t
>   	/* Permission checking based on the specified context is
>   	   performed during the actual operation (execve,
>   	   open/mkdir/...), when we know the full context of the
> - 	   operation.  See selinux_bprm_set_security for the execve
> + 	   operation.  See selinux_bprm_set_creds for the execve
>   	   checks and may_create for the file creation checks. The
>   	   operation will then fail if the context is not permitted. */
> - 	tsec = p->security;
> - 	if (!strcmp(name, "exec"))
> + 	tsec = new->security;
> + 	if (!strcmp(name, "exec")) {
>   		tsec->exec_sid = sid;
> - 	else if (!strcmp(name, "fscreate"))
> + 	} else if (!strcmp(name, "fscreate")) {
>   		tsec->create_sid = sid;
> - 	else if (!strcmp(name, "keycreate")) {
> + 	} else if (!strcmp(name, "keycreate")) {
>   		error = may_create_key(sid, p);
>   		if (error)
> - 			return error;
> + 			goto abort_change;
>   		tsec->keycreate_sid = sid;
> - 	} else if (!strcmp(name, "sockcreate"))
> + 	} else if (!strcmp(name, "sockcreate")) {
>   		tsec->sockcreate_sid = sid;
> - 	else if (!strcmp(name, "current")) {
> - 		struct av_decision avd;
> - 
> + 	} else if (!strcmp(name, "current")) {
> + 		error = -EINVAL;
>   		if (sid == 0)
> - 			return -EINVAL;
> + 			goto abort_change;
> + 
>  -		/* Only allow single threaded processes to change context */
>  -		error = -EPERM;
>  -		if (!is_single_threaded(p))
>  -			goto abort_change;
>  +		/*
>  +		 * SELinux allows to change context in the following case only.
>  +		 *  - Single threaded processes.
>  +		 *  - Multi threaded processes intend to change its context into
>  +		 *    more restricted domain (defined by TYPEBOUNDS statement).
>  +		 */
> - 		if (atomic_read(&p->mm->mm_users) != 1) {
> - 			struct task_struct *g, *t;
> - 			struct mm_struct *mm = p->mm;
> - 			read_lock(&tasklist_lock);
> - 			do_each_thread(g, t) {
> - 				if (t->mm == mm && t != p) {
> - 					read_unlock(&tasklist_lock);
> - 					error = security_bounded_transition(tsec->sid, sid);
> - 					if (!error)
> - 						goto boundary_ok;
> - 
> - 					return error;
> - 				}
> - 			} while_each_thread(g, t);
> - 			read_unlock(&tasklist_lock);
> ++		if (!is_single_threaded(p)) {
> ++			error = security_bounded_transition(tsec->sid, sid);
> ++			if (error)
> ++				goto abort_change;
>  +		}
> - boundary_ok:
>   
>   		/* Check permissions for the transition. */
>   		error = avc_has_perm(tsec->sid, sid, SECCLASS_PROCESS,
> 

-- 
James Morris
<jmorris@namei.org>
