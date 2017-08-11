From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm tree
Date: Fri, 11 Aug 2017 14:36:24 +0200
Message-ID: <20170811123623.GA28649@flask>
References: <20170811092816.01875df0@canb.auug.org.au>
 <31a4ba52-fc76-7844-841c-5f15142d473d@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31a4ba52-fc76-7844-841c-5f15142d473d@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Hildenbrand <david@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

2017-08-11 08:29+0200, David Hildenbrand:
> On 11.08.2017 01:28, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   53a70daf3cfd ("KVM: nVMX: get rid of nested_release_page*")
> > 
> > is missing a Signed-off-by from its committer.
> > 
> 
> Thanks,
> 
> Paolo's signed-off is missing.

Yes, it is a result of our workflow and there are many more patches like
that.  In this case, I originally committed the patch on 08-03 and Paolo
rebased the branch on 08-07.

We rebase when testing discovers bugs and for the first few release
candidates (when there are not enough changes to put into next).

Should all rebases be done with the --signoff option?

Thanks.
