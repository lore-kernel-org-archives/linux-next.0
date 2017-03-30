From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: unsigned commits in the kvm tree
Date: Thu, 30 Mar 2017 11:40:41 +0200
Message-ID: <e118215b-0a44-e1d7-c665-41112a44df0a@redhat.com>
References: <20170330092142.4ec22c6a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20170330092142.4ec22c6a@canb.auug.org.au>
Sender: kvm-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
List-Id: linux-next.vger.kernel.org



On 30/03/2017 00:21, Stephen Rothwell wrote:
> 
> I noticed that several commits in the kvm tree
> (git://git.kernel.org/pub/scm/virt/kvm/kvm.git#linux-next) today have
> no Signed-off-by for their committer :-(

Hmm, that must have happened because I rebased them before (testing and)
pushing to kvm/next; kvm/next does not rebase but kvm/queue does.

Still, it's weird because I have done that many times and it's the first
time you noticed.  Do you have scripts for that or did you just happen
to notice?  Or maybe there is a difference in what "git rebase" vs. "git
rebase -i" does to the committer email, or something obscure like that.

Paolo
