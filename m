From: James Morris <jmorris@namei.org>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Mon, 11 Aug 2008 10:44:06 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808111043240.3889@tundra.namei.org>
References: <20080810113044.19143b0a@worthy.swandive.local> <1218322518.3268.0.camel@luna.unix.geek.nz> <1218287473.3155.13.camel@dhcppc0> <1218281190.3155.5.camel@dhcppc0> <1218214935.3146.5.camel@dhcppc0> <alpine.LRH.1.10.0808090747150.29079@tundra.namei.org>
 <14476.1218286327@redhat.com> <15386.1218290826@redhat.com> <10251.1218361539@redhat.com>  <22475.1218414070@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754583AbYHKAon@vger.kernel.org>
In-Reply-To: <22475.1218414070@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Grant Wilson <grant.wilson@zen.co.uk>, Jasper Bryant-Greene <jasper@amiton.co.nz>, Thomas Meyer <thomas@m3y3r.de>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 11 Aug 2008, David Howells wrote:

> Grant Wilson <grant.wilson@zen.co.uk> wrote:
> 
> > [  223.039938] Rlimit EAGAIN (-1 >= 16375, uid 1000)
> > [  223.044744] copy_process() = -11
> > [  226.660319] Rlimit EAGAIN (-1 >= 16375, uid 1000)
> > [  226.664166] copy_process() = -11
> 
> Can you try the attached patch please?

This is working for me.  I'll push it to next-creds so it (hopefully) gets 
into the next linux-next for wider testing.


> 
> David
> ---
> CRED: Inc the user processes count on cred share return from copy_creds()
> 
> From: David Howells <dhowells@redhat.com>
> 
> Increment the user processes count in the case where copy_creds() returns after
> sharing the parent's credentials instead of allocating new ones.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  kernel/cred.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> 
> diff --git a/kernel/cred.c b/kernel/cred.c
> index f89c5e5..056ec90 100644
> --- a/kernel/cred.c
> +++ b/kernel/cred.c
> @@ -299,6 +299,7 @@ int copy_creds(struct task_struct *p, unsigned long clone_flags)
>  #endif
>  		p->real_cred = get_cred(p->cred);
>  		get_cred(p->cred);
> +		atomic_inc(&p->cred->user->processes);
>  		return 0;
>  	}
>  
> 

-- 
James Morris
<jmorris@namei.org>
