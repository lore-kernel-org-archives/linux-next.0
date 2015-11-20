From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm tree
Date: Fri, 20 Nov 2015 11:01:20 +0100
Message-ID: <564EEF70.5020205@de.ibm.com>
References: <20151120124717.4179e98b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151120124717.4179e98b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Cornelia Huck <cornelia.huck@de.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On 11/20/2015 02:47 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvms390 tree got a conflict in:
> 
>   include/linux/kvm_host.h
>   arch/s390/kvm/interrupt.c
>   arch/s390/kvm/sigp.c
> 
> between commits:
> 
>   db27a7a37aa0 ("KVM: Provide function for VCPU lookup by id")
>   b85de33a1a34 ("KVM: s390: avoid memory overwrites on emergency signal injection")
>   152e9f65d66f ("KVM: s390: fix wrong lookup of VCPUs by array index")
> 
> from the kvm tree and commit:
> 
>   a8ab7a5fd13b ("KVM: Provide function for VCPU lookup by id")
>   e896d1d08efc ("KVM: s390: avoid memory overwrites on emergency signal injection")
>   32d7bd98e799 ("KVM: s390: fix wrong lookup of VCPUs by array index")
> 
> from the kvms390 tree.
> 
> These patches used different names for the added function.  I used the
> name from the kvm tree (kvm_get_vcpu_by_id).

Yes, correct.


> This should probably all be cleaned up in the kvms390 tree.

Absolutely. Sorry for the hazzle. I had fixed that up but forgot to
push out. Should be fixed now.

Christian
