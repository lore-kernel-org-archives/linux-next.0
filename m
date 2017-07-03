From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Mon, 3 Jul 2017 11:55:42 +1000
Message-ID: <20170703115542.4b95127f@canb.auug.org.au>
References: <20170622125928.76918255@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622125928.76918255@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

[cc'ing kvm tree maintainers]

Withe the merge window opening, just a reminder that this conflict
still exists.

On Thu, 22 Jun 2017 12:59:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the kvms390 tree got a conflict in:
> 
>   arch/s390/kvm/gaccess.c
> 
> between commit:
> 
>   a75259825401 ("s390: rename struct psw_bits members")
> 
> from the s390 tree and commit:
> 
>   8993df124642 ("KVM: s390: implement instruction execution protection for emulated")
> 
> from the kvms390 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/s390/kvm/gaccess.c
> index e0f7d5fc7efd,6fda095f1a99..000000000000
> --- a/arch/s390/kvm/gaccess.c
> +++ b/arch/s390/kvm/gaccess.c
> @@@ -790,8 -808,8 +808,8 @@@ static int guest_page_range(struct kvm_
>   			return trans_exc(vcpu, PGM_PROTECTION, ga, ar, mode,
>   					 PROT_TYPE_LA);
>   		ga &= PAGE_MASK;
>  -		if (psw_bits(*psw).t) {
>  +		if (psw_bits(*psw).dat) {
> - 			rc = guest_translate(vcpu, ga, pages, asce, mode);
> + 			rc = guest_translate(vcpu, ga, pages, asce, mode, &prot);
>   			if (rc < 0)
>   				return rc;
>   		} else {
> @@@ -899,10 -918,10 +918,10 @@@ int guest_translate_address(struct kvm_
>   					 mode, PROT_TYPE_LA);
>   	}
>   
>  -	if (psw_bits(*psw).t && !asce.r) {	/* Use DAT? */
>  +	if (psw_bits(*psw).dat && !asce.r) {	/* Use DAT? */
> - 		rc = guest_translate(vcpu, gva, gpa, asce, mode);
> + 		rc = guest_translate(vcpu, gva, gpa, asce, mode, &prot);
>   		if (rc > 0)
> - 			return trans_exc(vcpu, rc, gva, 0, mode, PROT_TYPE_DAT);
> + 			return trans_exc(vcpu, rc, gva, 0, mode, prot);
>   	} else {
>   		*gpa = kvm_s390_real_to_abs(vcpu, gva);
>   		if (kvm_is_error_gpa(vcpu->kvm, *gpa))

-- 
Cheers,
Stephen Rothwell
