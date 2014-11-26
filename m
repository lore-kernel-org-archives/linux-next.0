From: Christoffer Dall <christofferdall@christofferdall.dk>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Wed, 26 Nov 2014 12:39:14 +0100
Message-ID: <CAEDV+g+OmDVRsKwFQj0sgrdK2d6LEeHOiZUfk6RTnu8UN=v=yg@mail.gmail.com>
References: <20141126171914.19ad9151@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141126171914.19ad9151@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

Thanks Stephen, it was (obviously) the right fix.

-Christoffer

On Wed, Nov 26, 2014 at 7:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the kvm-arm tree got a conflict in
> arch/ia64/kvm/kvm-ia64.c between commit 003f7de62589 ("KVM: ia64:
> remove") from the kvm tree and commit bf4bea8e9a90 ("kvm: fix
> kvm_is_mmio_pfn() and rename to kvm_is_reserved_pfn()") from the
> kvm-arm tree.
>
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary (no action is required).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
