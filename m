From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unsigned commits in the kvm tree
Date: Thu, 30 Mar 2017 22:01:06 +1100
Message-ID: <20170330220106.5e96f825@canb.auug.org.au>
References: <20170330092142.4ec22c6a@canb.auug.org.au>
        <e118215b-0a44-e1d7-c665-41112a44df0a@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50587 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932541AbdC3LBK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Mar 2017 07:01:10 -0400
In-Reply-To: <e118215b-0a44-e1d7-c665-41112a44df0a@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>

Hi Paolo,

On Thu, 30 Mar 2017 11:40:41 +0200 Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 30/03/2017 00:21, Stephen Rothwell wrote:
> > 
> > I noticed that several commits in the kvm tree
> > (git://git.kernel.org/pub/scm/virt/kvm/kvm.git#linux-next) today have
> > no Signed-off-by for their committer :-(  
> 
> Hmm, that must have happened because I rebased them before (testing and)
> pushing to kvm/next; kvm/next does not rebase but kvm/queue does.
> 
> Still, it's weird because I have done that many times and it's the first
> time you noticed.  Do you have scripts for that or did you just happen
> to notice?  Or maybe there is a difference in what "git rebase" vs. "git
> rebase -i" does to the committer email, or something obscure like that.

I should write a script, but at the moment I just notice sometimes.  I
have a quick look at what is new in each tree each morning and
sometimes things stick out :-)
-- 
Cheers,
Stephen Rothwell
